# frozen_string_literal: true

RSpec.describe Eccairs::Base::DecimalEntity do
  describe "inheritance" do
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe ".min" do
    it "sets and retrieves minimum value" do
      test_class = Class.new(described_class) do
        min(-100)
      end

      expect(test_class.min).to eq(-100)
    end

    it "returns nil when not set" do
      test_class = Class.new(described_class)
      expect(test_class.min).to be_nil
    end
  end

  describe ".max" do
    it "sets and retrieves maximum value" do
      test_class = Class.new(described_class) do
        max 100
      end

      expect(test_class.max).to eq(100)
    end

    it "returns nil when not set" do
      test_class = Class.new(described_class)
      expect(test_class.max).to be_nil
    end
  end

  describe "validation" do
    context "with no constraints" do
      let(:test_class) { Class.new(described_class) }

      it "accepts any numeric value" do
        expect { test_class.new(42) }.not_to raise_error
        expect { test_class.new(3.14) }.not_to raise_error
        expect { test_class.new(-999.99) }.not_to raise_error
      end

      it "accepts nil value" do
        expect { test_class.new(nil) }.not_to raise_error
      end

      it "raises error for non-numeric values" do
        expect { test_class.new("not a number") }.to raise_error(
          Eccairs::ValidationError,
          /value must be a number/
        )
      end
    end

    context "with min constraint" do
      let(:test_class) do
        Class.new(described_class) do
          min 0
        end
      end

      it "accepts values at or above minimum" do
        expect { test_class.new(0) }.not_to raise_error
        expect { test_class.new(50) }.not_to raise_error
        expect { test_class.new(100.5) }.not_to raise_error
      end

      it "raises error for values below minimum" do
        expect { test_class.new(-1) }.to raise_error(
          Eccairs::ValidationError,
          /value must be greater than or equal to 0 \(got -1\)/
        )
      end
    end

    context "with max constraint" do
      let(:test_class) do
        Class.new(described_class) do
          max 100
        end
      end

      it "accepts values at or below maximum" do
        expect { test_class.new(0) }.not_to raise_error
        expect { test_class.new(50) }.not_to raise_error
        expect { test_class.new(100) }.not_to raise_error
      end

      it "raises error for values above maximum" do
        expect { test_class.new(101) }.to raise_error(
          Eccairs::ValidationError,
          /value must be less than or equal to 100 \(got 101\)/
        )
      end
    end

    context "with both min and max constraints" do
      let(:test_class) do
        Class.new(described_class) do
          min(-50)
          max 50
        end
      end

      it "accepts values within range" do
        expect { test_class.new(-50) }.not_to raise_error
        expect { test_class.new(0) }.not_to raise_error
        expect { test_class.new(50) }.not_to raise_error
        expect { test_class.new(25.5) }.not_to raise_error
      end

      it "raises error for values below minimum" do
        expect { test_class.new(-51) }.to raise_error(
          Eccairs::ValidationError,
          /value must be greater than or equal to -50/
        )
      end

      it "raises error for values above maximum" do
        expect { test_class.new(51) }.to raise_error(
          Eccairs::ValidationError,
          /value must be less than or equal to 50/
        )
      end
    end

    context "value assignment after initialization" do
      let(:test_class) do
        Class.new(described_class) do
          min 0
          max 100
        end
      end

      it "validates on assignment" do
        entity = test_class.new(50)
        expect { entity.value = 75 }.not_to raise_error
        expect(entity.value).to eq(75)
      end

      it "raises error when assigning invalid value" do
        entity = test_class.new(50)
        expect { entity.value = 150 }.to raise_error(
          Eccairs::ValidationError,
          /value must be less than or equal to 100/
        )
      end

      it "allows correcting value after error" do
        entity = test_class.new(50)
        expect { entity.value = 150 }.to raise_error(Eccairs::ValidationError)
        expect { entity.value = 75 }.not_to raise_error
        expect(entity.value).to eq(75)
      end
    end

    context "decimal precision" do
      let(:test_class) do
        Class.new(described_class) do
          min(-100.5)
          max 100.5
        end
      end

      it "accepts decimal values" do
        expect { test_class.new(3.14159) }.not_to raise_error
        expect { test_class.new(-99.99) }.not_to raise_error
      end

      it "validates decimal boundaries correctly" do
        expect { test_class.new(100.5) }.not_to raise_error
        expect { test_class.new(100.50001) }.to raise_error(Eccairs::ValidationError)
      end
    end
  end
end
