# ECCAIRS Ruby Gem

[![Ruby](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml/badge.svg)](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml)

A Ruby gem for generating valid ECCAIRS (European Coordination Centre for Accident and Incident Reporting Systems) XML reports compliant with the ECCAIRS Aviation v5.1.0.0 taxonomy.

## Overview

ECCAIRS is the European standard for aviation safety reporting. This gem provides a clean, object-oriented Ruby interface for building ECCAIRS XML reports that comply with the official schema and taxonomy.

**Key Features:**
- ✅ Full support for ECCAIRS Aviation v5.1.0.0 taxonomy
- ✅ Built-in XML schema validation
- ✅ Type-safe attribute and entity classes with validation
- ✅ Hierarchical entity structure (Occurrence → Entities → Attributes)
- ✅ DSL-style API for clean, readable code
- ✅ Comprehensive test coverage

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eccairs'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install eccairs
```

## Quick Start

```ruby
require 'eccairs'

# Create a new report
report = Eccairs.report

# Add basic occurrence information directly to the report
report.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike during takeoff"))
report.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))
report.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("14:30:00"))

# Add aircraft information
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(3)) # Takeoff

# Validate the report
if report.valid?
  # Generate XML
  xml = report.to_xml
  puts xml
else
  puts "Validation errors: #{report.validate.join(", ")}"
end
```

## Architecture

### Report Structure

The gem follows the ECCAIRS XML structure. Each report contains a single occurrence with attributes and nested entities:

```
SET (Root)
└── Occurrence
    ├── ATTRIBUTES (Direct occurrence attributes)
    │   ├── Headline
    │   ├── UtcDate
    │   ├── UtcTime
    │   └── ...
    └── ENTITIES (Nested entities)
        ├── Aircraft
        │   └── ATTRIBUTES
        │       ├── AircraftRegistration
        │       ├── FlightPhase
        │       └── ...
        ├── AerodromeGeneral
        │   ├── ATTRIBUTES
        │   └── ENTITIES
        │       └── Runway
        └── Narrative
```

### Class Organization

The gem uses a simple, flat API where all entities are added directly to the report:

- **Report**: `Eccairs::Report`
    - Main entry point - manages all entities and generates XML
    - Use `Eccairs.report` to create a new report
    - Use `report.add_entity(entity)` to add any attribute or entity

- **Direct Attributes**: `Eccairs::Occurrence::Attributes::*`
    - Attributes that belong directly to the occurrence
    - Example: `Headline`, `UtcDate`, `WindSpeed`

- **Entity Attributes**: `Eccairs::Occurrence::Entities::{Entity}::Attributes::*`
    - Attributes that belong to specific entities
    - Example: `Aircraft::Attributes::AircraftRegistration`

- **Nested Entities**: `Eccairs::Occurrence::Entities::{Entity}::{SubEntity}::Attributes::*`
    - Sub-entities within entities
    - Example: `AerodromeGeneral::Runway::Attributes::RunwayIdentifier`

The report automatically organizes entities into the correct hierarchical structure based on their module namespace.

## Usage Examples

### Basic Occurrence Report

```ruby
report = Eccairs.report

# Basic information
report.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Runway incursion"))
report.add_entity(Eccairs::Occurrence::Attributes::LocationName.new("London Heathrow"))
report.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-01-15"))
report.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("09:45:00"))
report.add_entity(Eccairs::Occurrence::Attributes::OccurrenceCategory.new(1))
```

### Weather Conditions

```ruby
# Add weather information
report.add_entity(Eccairs::Occurrence::Attributes::AirTemperature.new(18.0))
report.add_entity(Eccairs::Occurrence::Attributes::DewPoint.new(12.0))
report.add_entity(Eccairs::Occurrence::Attributes::WxConditions.new(1)) # VMC
report.add_entity(Eccairs::Occurrence::Attributes::WindSpeed.new(8.0))
report.add_entity(Eccairs::Occurrence::Attributes::WindDirection.new(270))
report.add_entity(Eccairs::Occurrence::Attributes::Visibility.new(10000))
```

### Aircraft Information

```ruby
# Add aircraft details
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftCategory.new(1))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("G-ABCD"))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::SerialNumber.new("12345"))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::YearBuilt.new(2018))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::NumberOfEngines.new(2))
report.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(3))
```

### Aerodrome and Runway

```ruby
# Aerodrome information
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("EGLL"))
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(51.4700))
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude.new(-0.4543))
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::ElevationAboveMsl.new(25.0))

# Runway information
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayIdentifier.new("09L"))
report.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Runway::Attributes::RunwayNumber.new(9))
```

### Narrative

```ruby
narrative_text = "During approach to runway 09L, ATC reported a vehicle on the runway. " \
  "The crew executed a go-around and landed safely on the second approach."

report.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeText.new(narrative_text))
report.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeLanguage.new(1)) # English
```

### Air Navigation Services

```ruby
# ATC information
report.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Attributes::AnspName.new("NATS"))
report.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Sector::Attributes::SectorName.new("London North"))
```

### Method Chaining

The `add_entity` method returns `self`, allowing for method chaining:

```ruby
report = Eccairs.report
  .add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike"))
  .add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))
  .add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("14:30:00"))
  .add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))
```

## Validation

The gem includes comprehensive validation:

```ruby
report = Eccairs.report

# Add entities...
report.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike"))
report.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))

# Check if valid
if report.valid?
  puts "Report is valid!"
  xml = report.to_xml
else
  # Get validation errors
  errors = report.validate
  errors.each { |error| puts error }
end
```

### Built-in Validations

- **Numeric ranges**: Ensures values are within acceptable ranges
- **Enumerations**: Validates against allowed values from ECCAIRS taxonomy
- **Required attributes**: Checks for mandatory fields
- **XML schema validation**: Validates against official ECCAIRS XSD schema

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests:

```bash
bin/setup
rake spec
```

You can also run `bin/console` for an interactive prompt that will allow you to experiment:

```bash
bin/console
```

### Running Tests

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/eccairs/report_spec.rb

# Run with coverage
COVERAGE=true bundle exec rspec
```

### Project Structure

```
lib/eccairs/
├── base_entity.rb              # Base class for all attributes
├── base_entity_module.rb       # Base module for entity groupings
├── report.rb                   # Main report class (orchestrates XML generation)
└── occurrence/
    ├── attributes/             # Direct occurrence attributes
    │   ├── headline.rb
    │   ├── utc_date.rb
    │   └── ...
    └── entities/               # Nested entities
        ├── aircraft/
        │   └── attributes/
        ├── aerodrome_general/
        │   ├── attributes/
        │   └── runway/
        └── narrative/
```

## ECCAIRS Resources

- [ECCAIRS Portal](https://aviationreporting.eu/en/ElectronicReporting)
- [ECCAIRS Aviation Taxonomy v5.1.0.0](https://aviationreporting.eu/en/Taxonomy)
- Official documentation included in `docs/` directory

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Flightlogger/eccairs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Flightlogger/eccairs/blob/main/CODE_OF_CONDUCT.md).

### Contribution Guidelines

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests for your changes
4. Ensure all tests pass (`rake spec`)
5. Commit your changes (`git commit -am 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## License

This gem is available as open source under the terms of the MIT License.

## Code of Conduct

Everyone interacting in the ECCAIRS project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Flightlogger/eccairs/blob/main/CODE_OF_CONDUCT.md).

## Acknowledgments

- Built for compliance with ECCAIRS Aviation v5.1.0.0 taxonomy
- Developed by [Flightlogger](https://github.com/Flightlogger)
