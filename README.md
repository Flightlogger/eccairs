# ECCAIRS Ruby Gem

[![Ruby](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml/badge.svg)](https://github.com/Flightlogger/eccairs/actions/workflows/main.yml)

A Ruby gem for generating valid ECCAIRS (European Coordination Centre for Accident and Incident Reporting Systems) XML reports compliant with the ECCAIRS Aviation v5.1.0.0 taxonomy.

## Overview

ECCAIRS is the European standard for aviation safety reporting. This gem provides a clean, object-oriented Ruby interface for building ECCAIRS XML reports that comply with the official schema and taxonomy.

**Key Features:**
- ✅ Full support for ECCAIRS Aviation v5.1.0.0 taxonomy
- ✅ Built-in XML schema validation against official XSD
- ✅ **Typed entity system** with automatic validation (DecimalEntity, IntegerEntity, EnumEntity, StringEntity, DateEntity, TimeEntity)
- ✅ Type-safe attribute and entity classes with compile-time validation
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

The gem uses a **typed entity system** where each attribute automatically validates based on its type:

#### Type-Based Validation

- **DecimalEntity**: Validates numeric values with optional `min` and `max` constraints
  ```ruby
  class DewPoint < Eccairs::Base::DecimalEntity
    attribute_id 85
    xml_tag "Dew_Point"
    unit "C"
    min -100
    max 100
  end
  ```

- **IntegerEntity**: Validates integer values with optional `min` and `max` constraints
  ```ruby
  class NumberOfEngines < Eccairs::Base::IntegerEntity
    attribute_id 392
    xml_tag "Number_Of_Engines"
    min 0
  end
  ```

- **EnumEntity**: Validates against allowed values from ECCAIRS taxonomy
  ```ruby
  class OccurrenceCategory < Eccairs::Base::EnumEntity
    attribute_id 430
    xml_tag "Occurrence_Category"
    allowed_values [1, 2, 3, 4, 5]
  end

  # With symbolic constants
  class DangGoodsInvolved < Eccairs::Base::EnumEntity
    attribute_id 129
    xml_tag "Dang_Goods_Involved"
    allowed_values({
      YES: 1,
      NO: 2,
      UNKNOWN: 99
    })
  end

  # Can use symbols, strings, or integer values
  set.add_entity(DangGoodsInvolved.new(:YES))
  set.add_entity(DangGoodsInvolved.new("NO"))
  set.add_entity(DangGoodsInvolved.new(99))
  set.add_entity(DangGoodsInvolved.new(DangGoodsInvolved::YES))
  ```

- **StringEntity**: Validates string values with optional `max_length` constraint
  ```ruby
  class Headline < Eccairs::Base::StringEntity
    attribute_id 601
    xml_tag "Headline"
    max_length 500
  end
  ```

- **DateEntity**: Validates Date, Time, or String values
  ```ruby
  class UtcDate < Eccairs::Base::DateEntity
    attribute_id 477
    xml_tag "UTC_Date"
  end

  set.add_entity(UtcDate.new(Date.today))
  set.add_entity(UtcDate.new("2024-03-15"))
  ```

- **TimeEntity**: Validates Time or String values
  ```ruby
  class UtcTime < Eccairs::Base::TimeEntity
    attribute_id 478
    xml_tag "UTC_Time"
  end

  set.add_entity(UtcTime.new(Time.now))
  set.add_entity(UtcTime.new("14:30:00"))
  ```

#### Validation Errors

All validation happens at initialization time, providing immediate feedback:

```ruby
# This will raise an error immediately
DewPoint.new(150)  # ArgumentError: Value 150 is above maximum 100

# This will raise an error immediately
OccurrenceCategory.new(99)  # ArgumentError: Value 99 is not in allowed values: [1, 2, 3, 4, 5]

# This will raise an error immediately
Headline.new("x" * 600)  # ArgumentError: Value exceeds maximum length of 500
```

#### XML Schema Validation

After building your set, validate against the official ECCAIRS XSD schema:

```ruby
if set.valid?
  puts "SET is valid!"
else
  errors = set.validate
  errors.each { |error| puts error }
end
```

## Typed Entity System

The gem uses a sophisticated typed entity system where each attribute inherits from one of six base entity types. This provides automatic validation and type safety.

### Base Entity Types

All attributes inherit from one of these typed base classes:

1. **`Eccairs::Base::DecimalEntity`** - For decimal/float values
   - DSL methods: `min`, `max`, `unit`
   - Validates numeric values within optional range

2. **`Eccairs::Base::IntegerEntity`** - For integer values
   - DSL methods: `min`, `max`, `unit`
   - Validates integer values within optional range

3. **`Eccairs::Base::EnumEntity`** - For enumerated values
   - DSL method: `allowed_values` (array or hash)
   - Validates against predefined value sets from ECCAIRS taxonomy
   - Supports symbolic constants for better code readability

4. **`Eccairs::Base::StringEntity`** - For string values
   - DSL methods: `max_length`, `wrap_text_in`
   - Validates string length
   - Optional text wrapping (e.g., `<PlainText>`)

5. **`Eccairs::Base::DateEntity`** - For date values
   - Accepts Date, Time, or String objects
   - Automatically formats for ECCAIRS XML

6. **`Eccairs::Base::TimeEntity`** - For time values
   - Accepts Time or String objects
   - Automatically formats for ECCAIRS XML

### Creating Custom Attributes

Each attribute is a simple class that declares its configuration using DSL methods:

```ruby
# Decimal attribute with range validation
class AirTemperature < Eccairs::Base::DecimalEntity
  attribute_id 287
  xml_tag "Air_Temperature"
  unit "C"
  min -100
  max 100
end

# Enum attribute with symbolic constants
class FlightPhase < Eccairs::Base::EnumEntity
  attribute_id 390
  xml_tag "Flight_Phase"
  allowed_values({
    STANDING: 1,
    TAXI: 2,
    TAKEOFF: 3,
    CLIMB: 4,
    CRUISE: 5,
    DESCENT: 6,
    APPROACH: 7,
    LANDING: 8
  })
end

# String attribute with length validation and text wrapping
class NarrativeText < Eccairs::Base::StringEntity
  attribute_id 392
  xml_tag "Narrative_Text"
  max_length 32000
  wrap_text_in "PlainText"
end
```

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
# Run all tests (1161 examples)
bundle exec rspec

# Run specific test file
bundle exec rspec spec/eccairs/occurrence/attributes/headline_spec.rb

# Run base entity tests
bundle exec rspec spec/eccairs/base/

# Run with coverage
COVERAGE=true bundle exec rspec
```

### Test Coverage

The gem has comprehensive test coverage:
- **130 base entity tests** covering all typed entity validation
- **1031+ attribute and entity tests** covering all ECCAIRS attributes
- **100% passing** - all 1161 tests pass
- **XML validation** - every test validates against the official XSD schema

### Project Structure

The gem follows a consistent directory structure where the file path directly determines the XML nesting:

```
lib/eccairs/
├── base/                       # Typed base entity classes
│   ├── entity.rb              # Base Entity class
│   ├── entity_module.rb       # Base module for entity groupings
│   ├── decimal_entity.rb      # Base for decimal attributes
│   ├── integer_entity.rb      # Base for integer attributes
│   ├── enum_entity.rb         # Base for enum attributes
│   ├── string_entity.rb       # Base for string attributes
│   ├── date_entity.rb         # Base for date attributes
│   └── time_entity.rb         # Base for time attributes
├── set.rb                      # Main Set class (orchestrates XML generation)
├── occurrence.rb               # Occurrence module definition
└── occurrence/
    ├── attributes/             # Direct occurrence attributes
    │   ├── headline.rb        # StringEntity
    │   ├── utc_date.rb        # DateEntity
    │   ├── utc_time.rb        # TimeEntity
    │   ├── dew_point.rb       # DecimalEntity
    │   ├── occurrence_category.rb  # EnumEntity
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
