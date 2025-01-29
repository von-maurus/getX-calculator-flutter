import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = '0'.obs;
  var firstOperand = ''.obs;
  var secondOperand = ''.obs;
  var operator = ''.obs;

  void toggleSign() {
    if (operator.value.isEmpty) {
      if (firstOperand.value.isNotEmpty) {
        if (firstOperand.value.startsWith('-')) {
          firstOperand.value = firstOperand.value.substring(1);
        } else {
          firstOperand.value = '-' + firstOperand.value;
        }
        display.value = firstOperand.value;
      }
    } else {
      if (secondOperand.isNotEmpty) {
        if (secondOperand.startsWith('-')) {
          secondOperand.value = secondOperand.value.substring(1);
        } else {
          secondOperand.value = '-' + secondOperand.value;
        }
        display.value = secondOperand.value;
      }
    }
  }

  void inputNumber(String number) {
    if (operator.isEmpty) {
      firstOperand.value += number;
      display.value = firstOperand.value;
    } else {
      secondOperand.value += number;
      display.value = secondOperand.value;
    }
  }

  void inputOperator(String op) {
    if (firstOperand.isNotEmpty) {
      operator.value = op;
    }
  }

  void calculateResult() {
    if (firstOperand.isNotEmpty && secondOperand.isNotEmpty && operator.isNotEmpty) {
      double num1 = double.parse(firstOperand.value);
      double num2 = double.parse(secondOperand.value);
      double result = 0;

      switch (operator.value) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            display.value = 'Error';
            clear();
            return;
          }
          break;
      }

      display.value = result.toString();
      clear();
    }
  }

  void clear() {
    firstOperand.value = '';
    secondOperand.value = '';
    operator.value = '';
  }

  void clearAll() {
    clear();
    display.value = '0';
  }
}
