import 'package:calculator_proj/core/operations.dart';
import 'package:flutter/material.dart';

class CalculatorEngine extends ChangeNotifier {
  static const String SYMBOLS = "+-x/";
  static const String DIGITS = "0123456789.";

  String _valueLiteral = "";
  String _result = "";

  String get result => _result;

  String get valueLiteral => _valueLiteral;

  void clear() {
    _valueLiteral = "";
    _result = "";
    notifyListeners();
  }

  void backspace() {
    if (_valueLiteral.isEmpty) return;
    final trimmed = _valueLiteral.trimRight();
    final newValue = trimmed.substring(0, trimmed.length - 1);
    _valueLiteral = newValue;
    _result = "";
    notifyListeners();
  }

  void appendDigit(String char) {
    _valueLiteral += char;
    _result = "";
    notifyListeners();
  }

  void appendOperator(String op) {
    final lastChar = valueLiteral.trimRight().characters.lastOrNull;

    if (lastChar != null) {
      if (DIGITS.contains(lastChar)) {
        _valueLiteral += " $op ";
      } else if (SYMBOLS.contains(lastChar)) {
        if (op == "-" && lastChar != "-") {
          _valueLiteral += " $op";
        }
      }
    } else if (op == "-") {
      _valueLiteral += " $op";
    }
    _result = "";
    notifyListeners();
  }

  void updateResult(String res) {
    _result = res;
    notifyListeners();
  }

  void updateResultAndRemoveDecimalPointsIfZero(String res) {
    final parts = res.trim().split(".");
    _result = parts.firstOrNull ?? "";

    final decimalPoints = parts.lastOrNull;
    if (parts.length > 1 && decimalPoints != null && decimalPoints.isNotEmpty) {
      if (!decimalPoints.characters.every((c) => c == "0")) {
        _result += ".";
        _result += decimalPoints;
      }
    }
    notifyListeners();
  }

  void convertNumberToScientificNotationIfNeeded(num? number) {
    if (number == null) return updateResult("");
    if (number > 1000000000000000) {
      return updateResult(number.toStringAsExponential());
    }
    return updateResultAndRemoveDecimalPointsIfZero("$number");
  }

  void updateResultWithError(String error) {
    _result = error;
    notifyListeners();
  }

  void calculate() {
    if (_valueLiteral.trim().isEmpty) return;
    final lastChar = _valueLiteral.trimRight().characters.lastOrNull;
    if (lastChar != null && SYMBOLS.contains(lastChar)) {
      updateResultWithError("Syntax Error");
      return;
    }

    List<String> units =
        _valueLiteral.split(" ").where((unit) => unit.isNotEmpty).toList();
    List<num> numbers = units
        .where((unit) => DIGITS.contains(unit.characters.last))
        .map<num>((unit) => num.parse(unit))
        .toList();
    List<String> symbols =
        units.where((unit) => !DIGITS.contains(unit.characters.last)).toList();

    if (numbers.length < 2) return;

    List<num> numbersTemp = [];
    List<String> symbolsTemp = [];

    print(_valueLiteral);
    print(numbers);
    print(symbols);

    while (symbols.contains("x") || symbols.contains("/")) {
      bool operationFound = false;
      int secondOperandIndex = -1;
      for (int i = 0; i < numbers.length; i++) {
        if (!operationFound &&
            i < symbols.length &&
            (symbols[i] == "x" || symbols[i] == "/")) {
          final firstOperand = numbers[i];
          final secondOperand = numbers[i + 1];
          if (symbols[i] == "/" && secondOperand == 0) {
            updateResultWithError("Error: Division by zero");
            return;
          }
          final res = operations[symbols[i]]?.call(firstOperand, secondOperand);
          numbersTemp.add(res!);
          secondOperandIndex = i + 1;
          operationFound = true;
        } else {
          if (i != secondOperandIndex) numbersTemp.add(numbers[i]);
          if (i < symbols.length) symbolsTemp.add(symbols[i]);
        }
      }
      numbers = numbersTemp;
      symbols = symbolsTemp;
      numbersTemp = [];
      symbolsTemp = [];
    }

    if (symbols.isEmpty && numbers.length == 1) {
      convertNumberToScientificNotationIfNeeded(numbers.firstOrNull);
      return;
    }

    // TODO: do + and -
    while (symbols.isNotEmpty) {
      final firstOperand = numbers[0];
      final secondOperand = numbers[1];
      final res = operations[symbols[0]]?.call(firstOperand, secondOperand);
      numbersTemp.add(res!);
      for (int i = 1; i < numbers.length; i++) {
        if (i > 1) numbersTemp.add(numbers[i]);
        if (i < symbols.length) symbolsTemp.add(symbols[i]);
      }
      numbers = numbersTemp;
      symbols = symbolsTemp;
      numbersTemp = [];
      symbolsTemp = [];
      print(numbers);
      print(symbols);
    }
    convertNumberToScientificNotationIfNeeded(numbers.firstOrNull);
  }
}
