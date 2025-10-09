# frozen_string_literal: true

require "date"

RSpec.describe Eccairs::Base::DateEntity do
  describe "inheritance" do
    it "inherits from Entity" do
      expect(described_class.superclass).to eq(Eccairs::Base::Entity)
    end
  end

  describe "validation" do
    let(:test_class) { Class.new(described_class) }

    it "accepts Date objects" do
      expect { test_class.new(Date.new(2024, 1, 15)) }.not_to raise_error
      expect { test_class.new(Date.today) }.not_to raise_error
    end

    it "accepts Time objects" do
      expect { test_class.new(Time.now) }.not_to raise_error
      expect { test_class.new(Time.new(2024, 1, 15, 10, 30, 0)) }.not_to raise_error
    end

    it "accepts string values" do
      expect { test_class.new("2024-01-15") }.not_to raise_error
      expect { test_class.new("15/01/2024") }.not_to raise_error
      expect { test_class.new("January 15, 2024") }.not_to raise_error
    end

    it "accepts nil value" do
      expect { test_class.new(nil) }.not_to raise_error
    end

    it "raises error for invalid types" do
      expect { test_class.new(123) }.to raise_error(
        Eccairs::ValidationError,
        /value must be a Date, Time, or String, got Integer/
      )
    end

    it "raises error for symbols" do
      expect { test_class.new(:date) }.to raise_error(
        Eccairs::ValidationError,
        /value must be a Date, Time, or String, got Symbol/
      )
    end

    it "raises error for arrays" do
      expect { test_class.new([2024, 1, 15]) }.to raise_error(
        Eccairs::ValidationError,
        /value must be a Date, Time, or String, got Array/
      )
    end
  end

  describe "value assignment after initialization" do
    let(:test_class) { Class.new(described_class) }

    it "validates on assignment with Date" do
      entity = test_class.new(Date.today)
      expect { entity.value = Date.new(2024, 12, 31) }.not_to raise_error
      expect(entity.value).to eq(Date.new(2024, 12, 31))
    end

    it "validates on assignment with Time" do
      entity = test_class.new(Date.today)
      new_time = Time.now
      expect { entity.value = new_time }.not_to raise_error
      expect(entity.value).to eq(new_time)
    end

    it "validates on assignment with String" do
      entity = test_class.new(Date.today)
      expect { entity.value = "2024-12-31" }.not_to raise_error
      expect(entity.value).to eq("2024-12-31")
    end

    it "raises error when assigning invalid value" do
      entity = test_class.new(Date.today)
      expect { entity.value = 123 }.to raise_error(
        Eccairs::ValidationError,
        /value must be a Date, Time, or String/
      )
    end

    it "allows correcting value after error" do
      entity = test_class.new(Date.today)
      expect { entity.value = 123 }.to raise_error(Eccairs::ValidationError)
      expect { entity.value = Date.new(2024, 1, 1) }.not_to raise_error
      expect(entity.value).to eq(Date.new(2024, 1, 1))
    end
  end
end
