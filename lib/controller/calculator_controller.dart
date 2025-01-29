import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = '0'.obs;
  var firstOperand = ''.obs;
  var secondOperand = ''.obs;
  var operator = ''.obs;

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
          result = num1 / num2;
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
