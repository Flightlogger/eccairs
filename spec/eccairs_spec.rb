# frozen_string_literal: true

RSpec.describe Eccairs do
  it "has a version number" do
    expect(Eccairs::VERSION).not_to be nil
  end

  it "creates a report" do
    report = Eccairs.report
    expect(report).to be_a(Eccairs::Report)
  end

  it "generates valid XML" do
    report = Eccairs.report
    entity = Eccairs::Occurrence::Entities::DewPoint.new(dew_point: 15.5)
    report.add_entity(entity)

    expect(report.valid?).to be true
  end
end
