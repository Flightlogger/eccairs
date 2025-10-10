# ECCAIRS Ruby Gem

[![Ruby](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml/badge.svg)](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml)

A Ruby gem for generating valid ECCAIRS (European Coordination Centre for Accident and Incident Reporting Systems) XML reports compliant with the ECCAIRS Aviation v5.1.0.0 taxonomy.

## Overview

ECCAIRS is the European standard for aviation safety reporting. This gem provides a clean, Rails-style DSL for building ECCAIRS XML reports that comply with the official schema and taxonomy.

**Key Features:**
- ✅ Full support for ECCAIRS Aviation v5.1.0.0 taxonomy (259 attributes, 23 entities)
- ✅ Rails-style DSL with `has_many`, `has_one`, `belongs_to` relationships
- ✅ Builder pattern API with nested blocks for intuitive report construction
- ✅ Typed attribute system (String, Decimal, Integer, Enum, Date, Time)
- ✅ Built-in XML schema validation against official XSD
- ✅ 100% test coverage (1,404 passing tests)

## Installation

```ruby
gem 'eccairs'
```

## Quick Start

```ruby
require 'eccairs'

# Create a report using the builder pattern
report = Eccairs.set

report.add_occurrence do |occurrence|
  # Add occurrence-level attributes
  occurrence.add_headline("Bird strike during takeoff")
  occurrence.add_utc_date("2024-03-15")
  occurrence.add_utc_time("14:30:00")
  occurrence.add_occurrence_category("100")

  # Add aircraft entity with nested attributes
  occurrence.add_aircraft do |aircraft|
    aircraft.add_aircraft_registration("N12345")
    aircraft.add_flight_phase("1")
    aircraft.add_number_of_engines("2")
  end

  # Add narrative
  occurrence.add_narrative do |narrative|
    narrative.add_narrative_text("Bird strike occurred during takeoff roll at V1.")
  end
end

# Validate and generate XML
errors = report.validate
if errors.empty?
  xml = report.to_xml
  puts xml
else
  puts "Validation errors: #{errors.map(&:message).join(', ')}"
end
```

## Architecture

### Builder Pattern with Rails-Style DSL

The gem uses a **builder pattern** with Rails-style DSL methods (`has_many`, `has_one`, `belongs_to`) for defining entity relationships. This provides an intuitive, nested block-based API for constructing reports.

**Key Concepts:**

1. **Flat Directory Structure**: All entities in `lib/eccairs/entities/`, all attributes in `lib/eccairs/attributes/`
2. **Rails-Style Relationships**: Entities declare their attributes and nested entities using `has_many`, `has_one`
3. **Builder Methods**: Each relationship automatically generates `add_*` methods for the builder API
4. **Automatic Nesting**: The builder pattern handles XML hierarchy automatically

### ECCAIRS XML Structure

```
SET (Root)
└── Occurrence
    ├── ATTRIBUTES (Direct occurrence attributes)
    │   ├── Headline
    │   ├── UTC_Date
    │   └── ...
    └── ENTITIES (Nested entities)
        ├── Aircraft
        │   ├── ATTRIBUTES
        │   │   ├── Aircraft_Registration
        │   │   └── Flight_Phase
        │   └── ENTITIES
        │       ├── Engine
        │       └── Incapacitation
        ├── Aerodrome_General
        │   └── ENTITIES
        │       └── Runway
        └── Narrative
```

### Class Organization

- **Entities** (`lib/eccairs/entities/*.rb`): Container classes that can have attributes and nested entities
  - Examples: `Aircraft`, `AerodromeGeneral`, `Engine`, `Runway`
  - Define relationships using `has_many :attribute_name` and `has_one :entity_name`

- **Attributes** (`lib/eccairs/attributes/*.rb`): Leaf nodes with values
  - Examples: `Headline`, `AircraftRegistration`, `FlightPhase`
  - Inherit from typed base classes: `StringAttribute`, `EnumAttribute`, `DecimalAttribute`, etc.

## Usage Examples

### Basic Occurrence Report

```ruby
report = Eccairs.set

report.add_occurrence do |occurrence|
  occurrence.add_headline("Runway incursion at London Heathrow")
  occurrence.add_location_name("London Heathrow")
  occurrence.add_utc_date("2024-01-15")
  occurrence.add_utc_time("09:45:00")
  occurrence.add_occurrence_category("100")
end
```

### Aircraft with Nested Entities

```ruby
report.add_occurrence do |occurrence|
  occurrence.add_headline("Engine failure during cruise")

  occurrence.add_aircraft do |aircraft|
    aircraft.add_aircraft_registration("G-ABCD")
    aircraft.add_aircraft_category("1")
    aircraft.add_number_of_engines("2")
    aircraft.add_flight_phase("1")

    # Nested engine entity
    aircraft.add_engine do |engine|
      engine.add_engine_position("2")
      engine.add_engine_serial_number("ENG-12345")
    end
  end
end
```

### Aerodrome with Runway

```ruby
report.add_occurrence do |occurrence|
  occurrence.add_aerodrome_general do |aerodrome|
    aerodrome.add_location_indicator("1000")
    aerodrome.add_aerodrome_latitude("51.4700")
    aerodrome.add_aerodrome_longitude("-0.4543")

    # Nested runway entity
    aerodrome.add_runway do |runway|
      runway.add_runway_identifier("09L")
      runway.add_runway_number("9")
    end
  end
end
```

### Complete Example with Multiple Entities

```ruby
report = Eccairs.set

report.add_occurrence do |occurrence|
  # Occurrence attributes
  occurrence.add_headline("Bird strike during takeoff")
  occurrence.add_utc_date("2024-03-15")
  occurrence.add_utc_time("14:30:00")
  occurrence.add_occurrence_category("100")

  # Weather conditions
  occurrence.add_air_temperature("18.0")
  occurrence.add_dew_point("12.0")
  occurrence.add_wind_speed("8.0")
  occurrence.add_wind_direction("270")

  # Aircraft
  occurrence.add_aircraft do |aircraft|
    aircraft.add_aircraft_registration("N12345")
    aircraft.add_flight_phase("1")
    aircraft.add_number_of_engines("2")
  end

  # Aerodrome
  occurrence.add_aerodrome_general do |aerodrome|
    aerodrome.add_location_indicator("1000")
  end

  # Narrative
  occurrence.add_narrative do |narrative|
    narrative.add_narrative_text("Bird strike occurred at V1 during takeoff roll.")
  end
end

# Validate and output
errors = report.validate
puts errors.empty? ? report.to_xml : errors.map(&:message)
```

## Validation

All reports are validated against the official ECCAIRS Aviation v5.1.0.0 XSD schema:

```ruby
report = Eccairs.set
# ... build report ...

errors = report.validate
if errors.empty?
  xml = report.to_xml
  File.write("report.xml", xml)
else
  errors.each { |error| puts error.message }
end
```

## Attribute Types

Attributes inherit from typed base classes that provide automatic validation:

- **`StringAttribute`** - Text values (e.g., `Headline`, `AircraftRegistration`)
- **`EnumAttribute`** - Enumerated values from ECCAIRS taxonomy (e.g., `FlightPhase`, `OccurrenceCategory`)
- **`DecimalAttribute`** - Decimal numbers (e.g., `AirTemperature`, `WindSpeed`)
- **`IntegerAttribute`** - Integer numbers (e.g., `NumberOfEngines`, `RunwayNumber`)
- **`DateAttribute`** - Date values (e.g., `UtcDate`)
- **`TimeAttribute`** - Time values (e.g., `UtcTime`)

### Defining Custom Attributes

```ruby
# String attribute
class Headline < Eccairs::Base::StringAttribute
  attribute_id 601
  xml_tag "Headline"
  sequence 1
end

# Enum attribute
class FlightPhase < Eccairs::Base::EnumAttribute
  attribute_id 390
  xml_tag "Flight_Phase"
  sequence 5
end

# Decimal attribute
class AirTemperature < Eccairs::Base::DecimalAttribute
  attribute_id 287
  xml_tag "Air_Temperature"
  sequence 10
end
```

### Defining Custom Entities

```ruby
class Aircraft < Eccairs::Base::Entity
  entity_id 4
  xml_tag "Aircraft"

  # Attributes
  has_many :aircraft_registration, class_name: "Eccairs::Attributes::AircraftRegistration"
  has_many :flight_phase, class_name: "Eccairs::Attributes::FlightPhase"

  # Nested entities
  has_many :engine, class_name: "Eccairs::Entities::Engine"
  has_many :incapacitation, class_name: "Eccairs::Entities::Incapacitation"
end
```

## Development

### Running Tests

```bash
# Run all tests (1,404 examples)
bundle exec rspec

# Run specific test
bundle exec rspec spec/eccairs/attributes/headline_spec.rb
```

### Test Coverage

- **1,404 tests** covering all 259 attributes and 23 entities
- **100% pass rate** - all tests validate against official XSD schema
- **Automated test generation** via `scripts/generate_tests.rb`

### Project Structure

**Flat directory structure** - all entities and attributes in single-level directories:

```
lib/eccairs/
├── base/
│   ├── entity.rb              # Base class for entities
│   ├── attribute.rb           # Base class for attributes
│   ├── string_attribute.rb    # Base for string attributes
│   ├── enum_attribute.rb      # Base for enum attributes
│   ├── decimal_attribute.rb   # Base for decimal attributes
│   ├── integer_attribute.rb   # Base for integer attributes
│   ├── date_attribute.rb      # Base for date attributes
│   └── time_attribute.rb      # Base for time attributes
├── entities/                   # All 23 entities (flat)
│   ├── aircraft.rb
│   ├── aerodrome_general.rb
│   ├── engine.rb
│   ├── runway.rb
│   ├── narrative.rb
│   └── ...
├── attributes/                 # All 259 attributes (flat)
│   ├── headline.rb
│   ├── aircraft_registration.rb
│   ├── flight_phase.rb
│   ├── utc_date.rb
│   └── ...
├── occurrence.rb               # Occurrence class with builder methods
└── set.rb                      # Main Set class
```

**Key Principle:** Flat structure with Rails-style DSL. Entity relationships define XML hierarchy, not directory structure.

## ECCAIRS Resources

- [ECCAIRS Portal](https://aviationreporting.eu/en/ElectronicReporting)
- [ECCAIRS Aviation Taxonomy v5.1.0.0](https://aviationreporting.eu/en/Taxonomy)
- Official documentation included in `docs/` directory

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Flightlogger/eccairs.

## License

MIT License - see LICENSE file for details.

## Acknowledgments

Built for compliance with ECCAIRS Aviation v5.1.0.0 taxonomy by [Flightlogger](https://github.com/Flightlogger).
