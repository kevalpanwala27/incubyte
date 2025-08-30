class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    if (numbers.startsWith('//')) {
      return _handleCustomDelimiter(numbers);
    }

    if (!numbers.contains(',') && !numbers.contains('\n')) {
      return _parseAndValidateSingleNumber(numbers);
    }

    if (numbers.contains(',') && !numbers.contains('\n')) {
      return _parseAndSumCommaSeparatedNumbers(numbers);
    }

    if (numbers.contains('\n')) {
      return _parseAndSumWithNewLines(numbers);
    }

    throw FormatException(
      'Unsupported input format: "$numbers". '
      'Supported formats: comma-separated (1,2,3), new lines (1\\n2,3), '
      'or custom delimiters (//;\\n1;2)',
    );
  }

  int _handleCustomDelimiter(String numbers) {
    final lines = numbers.split('\n');
    if (lines.length >= 2) {
      final delimiter = lines[0].substring(2);
      final numbersPart = lines.sublist(1).join('\n');

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
    final normalizedNumbers = numbers.replaceAll('\n', ',');
    final numberList = normalizedNumbers.split(',');
    return _parseAndSumNumberList(numberList);
  }

  int _parseAndSumNumberList(List<String> numberList) {
    final negativeNumbers = <String>[];
    for (final num in numberList) {
      if (int.parse(num) < 0) {
        negativeNumbers.add(num);
      }
    }
    if (negativeNumbers.isNotEmpty) {
      throw FormatException(
        'negative numbers not allowed ${negativeNumbers.join(',')}',
      );
    }

    return numberList.map((n) => int.parse(n)).reduce((a, b) => a + b);
  }
}
