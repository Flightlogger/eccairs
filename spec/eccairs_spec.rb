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
    occurrence = Eccairs::Occurrence::DewPoint.new
    report.add_occurrence(occurrence)

    expect(report.valid?).to be true
  end
end
