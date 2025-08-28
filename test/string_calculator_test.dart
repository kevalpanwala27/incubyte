import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    group('add method', () {
      test('should return 0 for empty string', () {
        // Arrange & Act
        final result = calculator.add('');
        
        // Assert
        expect(result, equals(0));
      });

      test('should return the number for single number string', () {
        // Arrange & Act
        final result = calculator.add('1');
        
        // Assert
        expect(result, equals(1));
      });

      test('should return sum for two comma-separated numbers', () {
        // Arrange & Act
        final result = calculator.add('1,5');
        
        // Assert
        expect(result, equals(6));
      });

      test('should return sum for multiple comma-separated numbers', () {
        // Arrange & Act
        final result = calculator.add('1,2,3,4,5');
        
        // Assert
        expect(result, equals(15));
      });

      test('should handle new lines between numbers', () {
        // Arrange & Act
        final result = calculator.add('1\n2,3');
        
        // Assert
        expect(result, equals(6));
      });

      test('should handle custom delimiter', () {
        // Arrange & Act
        final result = calculator.add('//;\n1;2');
        
        // Assert
        expect(result, equals(3));
      });

      test('should handle custom delimiter with multiple numbers', () {
        // Arrange & Act
        final result = calculator.add('//;\n1;2;3;4');
        
        // Assert
        expect(result, equals(10));
      });

      test('should throw exception for negative numbers', () {
        // Arrange & Act & Assert
        expect(
          () => calculator.add('-1,2'),
          throwsA(
            predicate((e) => e.toString().contains('negative numbers not allowed')),
          ),
        );
      });

      test('should show all negative numbers in exception message', () {
        // Arrange & Act & Assert
        expect(
          () => calculator.add('-1,-2,3'),
          throwsA(
            predicate((e) => e.toString().contains('negative numbers not allowed -1,-2')),
          ),
        );
      });

      test('should handle mixed delimiters and new lines', () {
        // Arrange & Act
        final result = calculator.add('//|\n1|2\n3');
        
        // Assert
        expect(result, equals(6));
      });
    });
  });
}
