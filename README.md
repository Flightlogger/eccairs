# ECCAIRS Ruby Gem

[![Ruby](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml/badge.svg)](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml)

A Ruby gem for generating ECCAIRS Aviation v5.1.0.0 XML reports with a Rails-style DSL.

## Features

- Full support for ECCAIRS Aviation v5.1.0.0 taxonomy (259 attributes, 23 entities)
- Builder pattern API with nested blocks
- Typed attributes (String, Decimal, Integer, Enum, Date, Time)
- Error collection validation (non-exception based)
- Built-in XSD validation
- 100% test coverage

## Installation

```ruby
gem 'eccairs'
```

## Quick Start

```ruby
require 'eccairs'

report = Eccairs.set

report.add_occurrence do |occurrence|
  occurrence.add_headline("Bird strike during takeoff")
  occurrence.add_utc_date("2024-03-15")
  occurrence.add_utc_time("14:30:00")
  occurrence.add_occurrence_category("100")

  occurrence.add_aircraft do |aircraft|
    aircraft.add_aircraft_registration("N12345")
    aircraft.add_flight_phase("1")
  end

  occurrence.add_narrative do |narrative|
    narrative.add_narrative_text("Bird strike occurred during takeoff roll at V1.")
  end
end

# Check for validation errors
if report.valid?
  xml = report.to_xml
else
  puts report.validation_summary
end
```

## Usage

### Nested Entities

```ruby
report.add_occurrence do |occurrence|
  occurrence.add_aircraft do |aircraft|
    aircraft.add_aircraft_registration("G-ABCD")

    # Nested engine entity
    aircraft.add_engine do |engine|
      engine.add_engine_position("2")
    end
  end
end
```

### Validation

The gem uses an error-collection validation model instead of raising exceptions. Invalid attributes are tracked but don't prevent XML generation - only valid attributes are included in the output.

```ruby
# Check if the report is valid
if report.valid?
  File.write("report.xml", report.to_xml)
else
  # Get all validation errors
  report.validation_errors.each do |error|
    puts error.to_s
    # => "UTC_Date (ID: 390): Invalid date format (provided: "invalid-date")"
  end

  # Get validation summary grouped by field
  puts report.validation_summary
  # => {"UTC_Date" => [#<Eccairs::ValidationError...>]}

  # Get list of invalid field names
  puts report.invalid_fields
  # => ["UTC_Date", "Air_Temperature"]

  # You can still generate XML - it will only include valid attributes
  xml = report.to_xml
end
```

#### Validation Error Structure

Each validation error contains:
- `field_name` - The attribute's XML tag name
- `attribute_id` - The ECCAIRS attribute ID
- `provided_value` - The invalid value that was provided
- `message` - Human-readable error message

```ruby
error = report.validation_errors.first
error.field_name      # => "UTC_Date"
error.attribute_id    # => "390"
error.provided_value  # => "invalid-date"
error.message         # => "Invalid date format"
error.to_s            # => "UTC_Date (ID: 390): Invalid date format (provided: "invalid-date")"
error.to_h            # => {field_name: "UTC_Date", attribute_id: "390", ...}
```

## Architecture

**Entities** (`lib/eccairs/entities/*.rb`) - Container classes with attributes and nested entities
**Attributes** (`lib/eccairs/attributes/*.rb`) - Typed leaf nodes (String, Enum, Decimal, Integer, Date, Time)

## Development

```bash
bundle exec rspec  # Run all 2,032 tests
```

## Resources

- [ECCAIRS Portal](https://aviationreporting.eu/en/ElectronicReporting)
- [ECCAIRS Aviation Taxonomy v5.1.0.0](https://aviationreporting.eu/en/Taxonomy)

## License

MIT License
