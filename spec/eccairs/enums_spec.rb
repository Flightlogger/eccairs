# frozen_string_literal: true

require "spec_helper"

RSpec.describe Eccairs::Enums do
  after { described_class.reset! }

  describe ".get" do
    it "loads an enum by name" do
      data = described_class.get(:wx_conditions)
      expect(data[:attribute_id]).to eq("127")
      expect(data[:xml_tag]).to eq("Wx_Conditions")
      expect(data[:values]).to include(1, 2, 99)
    end

    it "includes descriptions for dropdown display" do
      data = described_class.get(:wx_conditions)
      expect(data[:descriptions]).to be_a(Hash)
      expect(data[:descriptions][1]).to eq("VMC")
      expect(data[:descriptions][2]).to eq("IMC")
      expect(data[:descriptions][99]).to eq("Unknown")
    end

    it "accepts string keys" do
      data = described_class.get("wx_conditions")
      expect(data[:attribute_id]).to eq("127")
    end

    it "caches results" do
      first  = described_class.get(:wx_conditions)
      second = described_class.get(:wx_conditions)
      expect(first).to equal(second)
    end

    it "includes hierarchy for multi-level enums" do
      data = described_class.get(:event_type)
      expect(data[:hierarchy]).to be_an(Array)
      top = data[:hierarchy].first
      expect(top["id"]).to be_an(Integer)
      expect(top["description"]).to be_a(String)
      expect(top["children"]).to be_an(Array)
    end

    it "omits hierarchy for flat enums" do
      data = described_class.get(:wx_conditions)
      expect(data).not_to have_key(:hierarchy)
    end

    it "raises KeyError for missing enum" do
      expect { described_class.get(:nonexistent_enum) }.to raise_error(KeyError, /No enum definition found/)
    end
  end

  describe ".all" do
    it "returns a hash of all enums" do
      all = described_class.all
      expect(all).to be_a(Hash)
      expect(all.size).to be > 100
      expect(all).to have_key("wx_conditions")
      expect(all).to have_key("braking_action")
    end
  end

  describe ".reset!" do
    it "clears the cache" do
      described_class.get(:wx_conditions)
      described_class.reset!
      data = described_class.get(:wx_conditions)
      expect(data[:attribute_id]).to eq("127")
    end
  end

  describe ".load_path" do
    it "defaults to config/enums" do
      expect(described_class.load_path).to end_with("config/enums")
    end
  end

  describe ".load_path=" do
    it "allows overriding the load path" do
      original = described_class.load_path
      begin
        described_class.load_path = "/tmp/test_enums"
        expect(described_class.load_path).to eq("/tmp/test_enums")
      ensure
        described_class.load_path = original
      end
    end
  end
end
