import 'package:calculator_proj/core/operations.dart';
import 'package:flutter/material.dart';

class CalculatorEngine extends ChangeNotifier {

  /// Private fields
  static const String _SYMBOLS = "+-x/";
  static const String _DIGITS = "0123456789.";
  String _valueLiteral = "";
  String _result = "";
  List<num> _numbers = [];
  List<String> _operators = [];

  /// Public getters
  String get result => _result;
  String get valueLiteral => _valueLiteral;

  /// Public methods
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
      if (_DIGITS.contains(lastChar)) {
        _valueLiteral += " $op ";
      } else if (_SYMBOLS.contains(lastChar)) {
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

  void calculate() {
    /// Protections against empty string
    if (_valueLiteral.trim().isEmpty) return;

    /// Protection against last char being an operator
    if (!_checkSyntaxErrors()) return;

    /// Parsing valueLiteral into list of number and list of operators
    _parseValueLiteral();

    /// Protection against a single number in valueLiteral
    if (_numbers.length < 2) return;

    /// Doing All Multiplications and Divisions first
    if (!_calculateMultiplicationsAndDivisions()) return;

    /// If there are no more operations show result
    if (_operators.isEmpty && _numbers.length == 1) {
      _convertNumberToScientificNotationIfNeeded(_numbers.firstOrNull);
      return;
    }

    /// Doing Additions and Subtractions last
    _calculateAdditionAndSubtraction();

    /// Show result
    _convertNumberToScientificNotationIfNeeded(_numbers.firstOrNull);
  }

  /// Private methods
  void _updateResult(String res) {
    _result = res;
    notifyListeners();
  }

  void _updateResultAndRemoveDecimalPointsIfZero(String res) {
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

  void _convertNumberToScientificNotationIfNeeded(num? number) {
    if (number == null) return _updateResult("");
    if (number > 1000000000000000) {
      return _updateResult(number.toStringAsExponential());
    }
    return _updateResultAndRemoveDecimalPointsIfZero("$number");
  }

  void _updateResultWithError(String error) {
    _result = error;
    notifyListeners();
  }

  bool _checkSyntaxErrors() {
    final lastChar = _valueLiteral.trimRight().characters.lastOrNull;
    if (lastChar != null && _SYMBOLS.contains(lastChar)) {
      _updateResultWithError("Syntax Error");
      return false;
    }
    return true;
  }

  void _parseValueLiteral() {
    List<String> units =
        _valueLiteral.split(" ").where((unit) => unit.isNotEmpty).toList();
    _numbers = units
        .where((unit) => _DIGITS.contains(unit.characters.last))
        .map<num>((unit) => num.parse(unit))
        .toList();
    _operators =
        units.where((unit) => !_DIGITS.contains(unit.characters.last)).toList();
  }

  bool _calculateMultiplicationsAndDivisions() {
    while (_operators.contains("x") || _operators.contains("/")) {
      List<num> numbersTemp = [];
      List<String> operatorsTemp = [];
      bool operationFound = false;
      int secondOperandIndex = -1;
      for (int i = 0; i < _numbers.length; i++) {
        if (!operationFound &&
            i < _operators.length &&
            (_operators[i] == "x" || _operators[i] == "/")) {
          final firstOperand = _numbers[i];
          final secondOperand = _numbers[i + 1];
          if (_operators[i] == "/" && secondOperand == 0) {
            _updateResultWithError("Error: Division by zero");
            return false;
          }
          final res =
              operations[_operators[i]]?.call(firstOperand, secondOperand);
          numbersTemp.add(res!);
          secondOperandIndex = i + 1;
          operationFound = true;
        } else {
          if (i != secondOperandIndex) numbersTemp.add(_numbers[i]);
          if (i < _operators.length) operatorsTemp.add(_operators[i]);
        }
      }
      _numbers = numbersTemp;
      _operators = operatorsTemp;
    }
    return true;
  }

  bool _calculateAdditionAndSubtraction() {
    while (_operators.isNotEmpty) {
      List<num> numbersTemp = [];
      List<String> operatorsTemp = [];
      final firstOperand = _numbers[0];
      final secondOperand = _numbers[1];
      final res = operations[_operators[0]]?.call(firstOperand, secondOperand);
      numbersTemp.add(res!);
      for (int i = 1; i < _numbers.length; i++) {
        if (i > 1) numbersTemp.add(_numbers[i]);
        if (i < _operators.length) operatorsTemp.add(_operators[i]);
      }
      _numbers = numbersTemp;
      _operators = operatorsTemp;
    }
    return true;
  }

}
