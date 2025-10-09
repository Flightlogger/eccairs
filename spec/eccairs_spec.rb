# frozen_string_literal: true

RSpec.describe Eccairs do
  it "has a version number" do
    expect(Eccairs::VERSION).not_to be nil
  end

  it "creates a set" do
    set = Eccairs.set
    expect(set).to be_a(Eccairs::Set)
  end

  it "generates valid XML" do
    set = Eccairs.set
    entity = Eccairs::Occurrence::Attributes::DewPoint.new(15.5)
    set.add_entity(entity)

    expect(set.valid?).to be true
  end
end
