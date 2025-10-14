# ECCAIRS Ruby Gem

[![Ruby](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml/badge.svg)](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml)

A Ruby gem for generating ECCAIRS Aviation v5.1.0.0 XML reports with a Rails-style DSL.

## Features

- Full support for ECCAIRS Aviation v5.1.0.0 taxonomy (259 attributes, 23 entities)
- Builder pattern API with nested blocks
- Typed attributes (String, Decimal, Integer, Enum, Date, Time)
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

# Validate and generate XML
errors = report.validate
xml = report.to_xml if errors.empty?
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

```ruby
errors = report.validate
if errors.empty?
  File.write("report.xml", report.to_xml)
else
  errors.each { |error| puts error.message }
end
```

## Architecture

**Entities** (`lib/eccairs/entities/*.rb`) - Container classes with attributes and nested entities
**Attributes** (`lib/eccairs/attributes/*.rb`) - Typed leaf nodes (String, Enum, Decimal, Integer, Date, Time)

## Development

```bash
bundle exec rspec  # Run all 1,404 tests
```

## Resources

- [ECCAIRS Portal](https://aviationreporting.eu/en/ElectronicReporting)
- [ECCAIRS Aviation Taxonomy v5.1.0.0](https://aviationreporting.eu/en/Taxonomy)

## License

MIT License
