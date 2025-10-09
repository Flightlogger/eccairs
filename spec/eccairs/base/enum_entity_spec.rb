# frozen_string_literal: true

RSpec.describe Eccairs::Base::EnumEntity do
  describe "inheritance" do
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe ".allowed_values with array" do
    it "sets and retrieves allowed values" do
      test_class = Class.new(described_class) do
        allowed_values [1, 2, 3]
      end

      expect(test_class.allowed_values).to eq([1, 2, 3])
    end

    it "returns empty array when not set" do
      test_class = Class.new(described_class)
      expect(test_class.allowed_values).to eq([])
    end
  end

  describe ".allowed_values with hash" do
    it "sets allowed values from hash values" do
      test_class = Class.new(described_class) do
        allowed_values({SMALL: 1, MEDIUM: 2, LARGE: 3})
      end

      expect(test_class.allowed_values).to eq([1, 2, 3])
    end

    it "defines constants from hash keys" do
      test_class = Class.new(described_class) do
        allowed_values({RED: 10, GREEN: 20, BLUE: 30})
      end

      expect(test_class::RED).to eq(10)
      expect(test_class::GREEN).to eq(20)
      expect(test_class::BLUE).to eq(30)
    end

    it "stores enum mapping" do
      test_class = Class.new(described_class) do
        allowed_values({YES: 1, NO: 2, UNKNOWN: 99})
      end

      expect(test_class.enum_mapping).to eq({YES: 1, NO: 2, UNKNOWN: 99})
    end
  end

  describe "validation with array" do
    let(:test_class) do
      Class.new(described_class) do
        allowed_values ["1", "2", "3"]
      end
    end

    it "accepts valid values" do
      expect { test_class.new("1") }.not_to raise_error
      expect { test_class.new("2") }.not_to raise_error
      expect { test_class.new("3") }.not_to raise_error
    end

    it "accepts nil value" do
      expect { test_class.new(nil) }.not_to raise_error
    end

    it "raises error for invalid values" do
      expect { test_class.new("4") }.to raise_error(
        Eccairs::ValidationError,
        /value must be one of: 1, 2, 3 \(got 4\)/
      )
    end
  end

  describe "validation with hash" do
    let(:test_class) do
      Class.new(described_class) do
        allowed_values({VMC: 1, IMC: 2, UNKNOWN: 99})
      end
    end

    it "accepts valid integer values" do
      expect { test_class.new(1) }.not_to raise_error
      expect { test_class.new(2) }.not_to raise_error
      expect { test_class.new(99) }.not_to raise_error
    end

    it "converts symbol keys to values" do
      entity = test_class.new(:VMC)
      expect(entity.value).to eq(1)

      entity = test_class.new(:IMC)
      expect(entity.value).to eq(2)

      entity = test_class.new(:UNKNOWN)
      expect(entity.value).to eq(99)
    end

    it "converts string keys to values" do
      entity = test_class.new("VMC")
      expect(entity.value).to eq(1)

      entity = test_class.new("IMC")
      expect(entity.value).to eq(2)
    end

    it "accepts constant values" do
      entity = test_class.new(test_class::VMC)
      expect(entity.value).to eq(1)
    end

    it "raises error for invalid symbols" do
      expect { test_class.new(:INVALID) }.to raise_error(
        Eccairs::ValidationError,
        /value must be one of: 1, 2, 99/
      )
    end

    it "raises error for invalid integer values" do
      expect { test_class.new(5) }.to raise_error(
        Eccairs::ValidationError,
        /value must be one of: 1, 2, 99 \(got 5\)/
      )
    end
  end

  describe "validation without constraints" do
    let(:test_class) { Class.new(described_class) }

    it "accepts any value when no allowed_values defined" do
      expect { test_class.new(1) }.not_to raise_error
      expect { test_class.new("anything") }.not_to raise_error
      expect { test_class.new(:symbol) }.not_to raise_error
    end
  end

  describe "value assignment after initialization" do
    let(:test_class) do
      Class.new(described_class) do
        allowed_values({SMALL: 1, MEDIUM: 2, LARGE: 3})
      end
    end

    it "validates on assignment with integer" do
      entity = test_class.new(1)
      expect { entity.value = 2 }.not_to raise_error
      expect(entity.value).to eq(2)
    end

    it "validates on assignment with symbol" do
      entity = test_class.new(1)
      expect { entity.value = :LARGE }.not_to raise_error
      expect(entity.value).to eq(3)
    end

    it "raises error when assigning invalid value" do
      entity = test_class.new(1)
      expect { entity.value = 99 }.to raise_error(
        Eccairs::ValidationError,
        /value must be one of: 1, 2, 3/
      )
    end

    it "allows correcting value after error" do
      entity = test_class.new(1)
      expect { entity.value = 99 }.to raise_error(Eccairs::ValidationError)
      expect { entity.value = :MEDIUM }.not_to raise_error
      expect(entity.value).to eq(2)
    end
  end

  describe "error messages" do
    let(:test_class) do
      Class.new(described_class) do
        allowed_values [1, 2, 3]
      end
    end

    it "provides helpful error message with actual value" do
      expect { test_class.new(5) }.to raise_error(
        Eccairs::ValidationError,
        /value must be one of: 1, 2, 3 \(got 5\)/
      )
    end
  end
end
