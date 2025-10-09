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
- ✅ Generic XML generation based purely on directory structure
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

# Create a new set
set = Eccairs.set

# Add basic occurrence information directly to the set
set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike during takeoff"))
set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))
set.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("14:30:00"))

# Add aircraft information
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(3)) # Takeoff

# Validate the set
if set.valid?
  # Generate XML
  xml = set.to_xml
  puts xml
else
  puts "Validation errors: #{set.validate.join(", ")}"
end
```

## Architecture

### Generic Structure-Based Design

The gem uses a **completely generic** approach where the XML structure is determined purely by the directory structure and module namespace. There is no hardcoded logic for specific entities or attributes.

**How it works:**
1. The module path of each entity determines its position in the XML hierarchy
2. `Attributes` modules create `<ATTRIBUTES>` sections
3. `Entities` modules create `<ENTITIES>` sections
4. The `Set` class automatically organizes everything based on module paths

**Example mappings:**

```ruby
# Module Path → XML Structure

Eccairs::Occurrence::Attributes::Headline
→ <Occurrence><ATTRIBUTES><Headline>

Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration
→ <Occurrence><ENTITIES><Aircraft><ATTRIBUTES><Aircraft_Registration>

Eccairs::Occurrence::Entities::Aircraft::Entities::Engine::Attributes::EnginePosition
→ <Occurrence><ENTITIES><Aircraft><ENTITIES><Engine><ATTRIBUTES><Engine_Position>

Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayIdentifier
→ <Occurrence><ENTITIES><Aerodrome_General><ENTITIES><Runway><ATTRIBUTES><Runway_Identifier>
```

### SET Structure

The gem follows the ECCAIRS XML structure. Each SET contains a single Occurrence with attributes and nested entities:

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
        │   ├── ATTRIBUTES
        │   │   ├── AircraftRegistration
        │   │   ├── FlightPhase
        │   │   └── ...
        │   └── ENTITIES
        │       └── Engine
        │           └── ATTRIBUTES
        │               └── EnginePosition
        ├── AerodromeGeneral
        │   ├── ATTRIBUTES
        │   └── ENTITIES
        │       └── Runway
        │           └── ATTRIBUTES
        │               └── RunwayIdentifier
        └── Narrative
            └── ATTRIBUTES
                └── NarrativeText
```

### Class Organization

The gem uses a simple, flat API where all entities are added directly to the set:

- **Set**: `Eccairs::Set`
    - Main entry point - manages all entities and generates XML
    - Use `Eccairs.set` to create a new SET
    - Use `set.add_entity(entity)` to add any attribute or entity

- **Direct Attributes**: `Eccairs::Occurrence::Attributes::*`
    - Attributes that belong directly to the occurrence
    - Example: `Headline`, `UtcDate`, `WindSpeed`

- **Entity Attributes**: `Eccairs::Occurrence::Entities::{Entity}::Attributes::*`
    - Attributes that belong to specific entities
    - Example: `Aircraft::Attributes::AircraftRegistration`

- **Nested Entities**: `Eccairs::Occurrence::Entities::{Entity}::Entities::{SubEntity}::Attributes::*`
    - Sub-entities within entities
    - Example: `AerodromeGeneral::Entities::Runway::Attributes::RunwayIdentifier`
    - Example: `Aircraft::Entities::Engine::Attributes::EnginePosition`

The set automatically organizes entities into the correct hierarchical structure based on their module namespace. The directory structure directly determines the XML nesting - no hardcoded logic required.

## Usage Examples

### Basic Occurrence SET

```ruby
set = Eccairs.set

# Basic information
set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Runway incursion"))
set.add_entity(Eccairs::Occurrence::Attributes::LocationName.new("London Heathrow"))
set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-01-15"))
set.add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("09:45:00"))
set.add_entity(Eccairs::Occurrence::Attributes::OccurrenceCategory.new(1))
```

### Weather Conditions

```ruby
# Add weather information
set.add_entity(Eccairs::Occurrence::Attributes::AirTemperature.new(18.0))
set.add_entity(Eccairs::Occurrence::Attributes::DewPoint.new(12.0))
set.add_entity(Eccairs::Occurrence::Attributes::WxConditions.new(1)) # VMC
set.add_entity(Eccairs::Occurrence::Attributes::WindSpeed.new(8.0))
set.add_entity(Eccairs::Occurrence::Attributes::WindDirection.new(270))
set.add_entity(Eccairs::Occurrence::Attributes::Visibility.new(10000))
```

### Aircraft Information

```ruby
# Add aircraft details
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftCategory.new(1))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("G-ABCD"))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::SerialNumber.new("12345"))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::YearBuilt.new(2018))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::NumberOfEngines.new(2))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::FlightPhase.new(3))
```

### Aerodrome and Runway

```ruby
# Aerodrome information
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::LocationIndicator.new("EGLL"))
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLatitude.new(51.4700))
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::AerodromeLongitude.new(-0.4543))
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Attributes::ElevationAboveMsl.new(25.0))

# Runway information (nested entity)
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayIdentifier.new("09L"))
set.add_entity(Eccairs::Occurrence::Entities::AerodromeGeneral::Entities::Runway::Attributes::RunwayNumber.new(9))
```

### Narrative

```ruby
narrative_text = "During approach to runway 09L, ATC reported a vehicle on the runway. " \
  "The crew executed a go-around and landed safely on the second approach."

set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeText.new(narrative_text))
set.add_entity(Eccairs::Occurrence::Entities::Narrative::Attributes::NarrativeLanguage.new(1)) # English
```

### Deeply Nested Entities

The gem supports arbitrary nesting levels. Here's an example with engine information nested under aircraft:

```ruby
# Aircraft
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))

# Engine (nested under Aircraft)
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::Engine::Attributes::EnginePosition.new(1))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::Engine::Attributes::EngineSerialNumber.new("ENG-12345"))
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::Engine::Attributes::ManufacturerModel.new("CFM56-7B"))

# Flight Crew Member (nested under Aircraft)
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::FlightCrewMember::Attributes::Category.new(1))

# Flight Crew Licenses (nested under Flight Crew Member, which is nested under Aircraft)
set.add_entity(Eccairs::Occurrence::Entities::Aircraft::Entities::FlightCrewMember::Entities::FlightCrewLicenses::Attributes::LicenseType.new(1))
```

### Air Navigation Services

```ruby
# ATC information
set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Attributes::AnspName.new("NATS"))

# Sector information (nested entity)
set.add_entity(Eccairs::Occurrence::Entities::AirNavigationService::Entities::Sector::Attributes::SectorName.new("London North"))
```

### Method Chaining

The `add_entity` method returns `self`, allowing for method chaining:

```ruby
set = Eccairs.set
  .add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike"))
  .add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))
  .add_entity(Eccairs::Occurrence::Attributes::UtcTime.new("14:30:00"))
  .add_entity(Eccairs::Occurrence::Entities::Aircraft::Attributes::AircraftRegistration.new("N12345"))
```

## Validation

The gem includes comprehensive validation:

```ruby
set = Eccairs.set

# Add entities...
set.add_entity(Eccairs::Occurrence::Attributes::Headline.new("Bird strike"))
set.add_entity(Eccairs::Occurrence::Attributes::UtcDate.new("2024-03-15"))

# Check if valid
if set.valid?
  puts "SET is valid!"
  xml = set.to_xml
else
  # Get validation errors
  errors = set.validate
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

The gem follows a consistent directory structure where the file path directly determines the XML nesting:

```
lib/eccairs/
├── base_entity.rb              # Base class for all attributes
├── base_entity_module.rb       # Base module for entity groupings
├── set.rb                      # Main Set class (orchestrates XML generation)
├── occurrence.rb               # Occurrence module definition
└── occurrence/
    ├── attributes/             # Direct occurrence attributes
    │   ├── headline.rb
    │   ├── utc_date.rb
    │   └── ...
    └── entities/               # Top-level entities
        ├── aircraft/
        │   ├── attributes/     # Aircraft attributes
        │   └── entities/       # Nested entities under Aircraft
        │       ├── engine/
        │       │   └── attributes/
        │       └── flight_crew_member/
        │           ├── attributes/
        │           └── entities/
        │               └── flight_crew_licenses/
        │                   └── attributes/
        ├── aerodrome_general/
        │   ├── attributes/     # Aerodrome attributes
        │   └── entities/       # Nested entities under Aerodrome
        │       ├── runway/
        │       │   └── attributes/
        │       └── narrative/
        │           └── attributes/
        └── narrative/
            └── attributes/
```

**Key Principle:** Directory structure = XML structure. Each `entities/` subdirectory creates an `<ENTITIES>` section in the XML, and each `attributes/` subdirectory creates an `<ATTRIBUTES>` section.

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
