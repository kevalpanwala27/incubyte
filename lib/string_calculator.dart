

class StringCalculator {
  int add(String numbers) {
    // Start with the simplest case - empty string returns 0
    if (numbers.isEmpty) {
      return 0;
    }
    
    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      return _handleCustomDelimiter(numbers);
    }
    
    // Handle single number
    if (!numbers.contains(',') && !numbers.contains('\n')) {
      return _parseAndValidateSingleNumber(numbers);
    }
    
    // Handle comma-separated numbers
    if (numbers.contains(',') && !numbers.contains('\n')) {
      return _parseAndSumCommaSeparatedNumbers(numbers);
    }
    
    // Handle new lines between numbers
    if (numbers.contains('\n')) {
      return _parseAndSumWithNewLines(numbers);
    }
    
    return 0;
  }
  
  int _handleCustomDelimiter(String numbers) {
    final lines = numbers.split('\n');
    if (lines.length >= 2) {
      final delimiter = lines[0].substring(2); // Remove "//"
      final numbersPart = lines.sublist(1).join('\n'); // Join remaining lines
      
      // Split by custom delimiter and handle new lines
      final normalizedNumbers = numbersPart.replaceAll('\n', delimiter);
      final numberList = normalizedNumbers.split(delimiter);
      
      return _parseAndSumNumberList(numberList);
    }
    return 0;
  }
  
  int _parseAndValidateSingleNumber(String number) {
    final num = int.parse(number);
    if (num < 0) {
      throw FormatException('negative numbers not allowed $num');
    }
    return num;
  }
  
  int _parseAndSumCommaSeparatedNumbers(String numbers) {
    final numberList = numbers.split(',');
    return _parseAndSumNumberList(numberList);
  }
  
  int _parseAndSumWithNewLines(String numbers) {
    // Replace new lines with commas and then split
    final normalizedNumbers = numbers.replaceAll('\n', ',');
    final numberList = normalizedNumbers.split(',');
    return _parseAndSumNumberList(numberList);
  }
  
  int _parseAndSumNumberList(List<String> numberList) {
    // Check for negative numbers
    final negativeNumbers = <String>[];
    for (final num in numberList) {
      if (int.parse(num) < 0) {
        negativeNumbers.add(num);
      }
    }
    if (negativeNumbers.isNotEmpty) {
      throw FormatException('negative numbers not allowed ${negativeNumbers.join(',')}');
    }
    
    return numberList.map((n) => int.parse(n)).reduce((a, b) => a + b);
  }
}
