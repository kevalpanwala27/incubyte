# Incubyte TDD Assessment - String Calculator Kata

## Overview

This project demonstrates the implementation of the String Calculator TDD Kata following Test-Driven Development principles. The solution showcases software craftsmanship through clean, testable, and maintainable code.

## Project Structure

```
lib/
├── main.dart                 # Flutter app demonstrating the calculator
├── string_calculator.dart    # Core StringCalculator implementation
test/
├── string_calculator_test.dart  # Comprehensive test suite
└── widget_test.dart          # Widget tests for the demo app
```

## TDD Implementation Process

### Step 1: Red - Write Failing Tests
Started with a comprehensive test suite covering all requirements:
- Empty string returns 0
- Single number returns the number
- Comma-separated numbers return their sum
- New lines between numbers are handled
- Custom delimiters are supported
- Negative numbers throw exceptions with detailed messages

### Step 2: Green - Make Tests Pass
Implemented functionality incrementally:
1. **Empty string handling** - Basic case returning 0
2. **Single number parsing** - Parse and return single numbers
3. **Comma-separated numbers** - Split by comma and sum
4. **New line handling** - Replace new lines with commas
5. **Custom delimiter support** - Parse delimiter specification and apply
6. **Negative number validation** - Throw exceptions with all negative numbers listed

### Step 3: Refactor - Improve Code Quality
Eliminated code duplication by extracting common logic into helper methods:
- `_handleCustomDelimiter()` - Handles custom delimiter parsing
- `_parseAndValidateSingleNumber()` - Validates and parses single numbers
- `_parseAndSumCommaSeparatedNumbers()` - Processes comma-separated numbers
- `_parseAndSumWithNewLines()` - Handles new line separators
- `_parseAndSumNumberList()` - Common validation and summation logic

## Features Implemented

### ✅ Core Requirements
- [x] Empty string returns 0
- [x] Single number returns the number
- [x] Two comma-separated numbers return their sum
- [x] Handle any amount of numbers
- [x] Handle new lines between numbers
- [x] Support custom delimiters
- [x] Throw exception for negative numbers
- [x] Show all negative numbers in exception message

### ✅ Additional Features
- [x] Mixed delimiter handling (custom delimiters with new lines)
- [x] Comprehensive error handling
- [x] Clean, maintainable code structure
- [x] Full test coverage

## Code Quality Features

### 1. **Testability**
- Each method has a single responsibility
- Dependencies are injected where possible
- Clear separation of concerns

### 2. **Maintainability**
- Helper methods eliminate code duplication
- Clear method names describing functionality
- Consistent error handling patterns

### 3. **Readability**
- Descriptive variable names
- Clear method signatures
- Comprehensive comments explaining logic

### 4. **Error Handling**
- Specific exception messages
- Validation of all inputs
- Graceful handling of edge cases

## Test Coverage

The test suite covers:
- **11 test cases** covering all requirements
- **Edge cases** like empty strings and invalid inputs
- **Error scenarios** including negative numbers
- **Complex scenarios** like mixed delimiters

All tests pass with 100% success rate.

## Demo Application

A Flutter demo app showcases all functionality:
- Interactive input field for testing
- Real-time calculation results
- Error display for invalid inputs
- Examples of all supported formats
- Responsive design with scrollable content

## Running the Project

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK

### Commands
```bash
# Get dependencies
flutter pub get

# Run tests
flutter test

# Run analysis
flutter analyze

# Run the app
flutter run
```

## TDD Best Practices Demonstrated

1. **Red-Green-Refactor Cycle**: Followed the classic TDD cycle
2. **Test First**: Wrote tests before implementation
3. **Incremental Development**: Built functionality step by step
4. **Refactoring**: Continuously improved code quality
5. **Comprehensive Testing**: Covered all requirements and edge cases

## Software Craftsmanship Principles

1. **Clean Code**: Readable, maintainable, and well-structured
2. **SOLID Principles**: Single responsibility, open/closed, etc.
3. **DRY Principle**: Eliminated code duplication
4. **Error Handling**: Robust validation and meaningful error messages
5. **Documentation**: Clear code comments and examples

## Assessment Completion

This implementation successfully demonstrates:
- ✅ Strong TDD practices
- ✅ Clean, testable code
- ✅ Comprehensive test coverage
- ✅ Software craftsmanship principles
- ✅ Professional code quality
- ✅ All kata requirements met

The solution is ready for review and demonstrates the skills expected of a Software Craftsperson at Incubyte.
