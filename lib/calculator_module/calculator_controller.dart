// import 'package:get/get.dart';
// import 'package:my_calculator/calculator_module/calculator_service.dart';

// class CalculatorController extends GetxController {
//   var expression = "".obs;
//   var result = "0".obs;

//   final CalculatorService _service = CalculatorService();

//   void append(String value) {
//     expression.value += value;
//   }

//   void clear() {
//     expression.value = "";
//     result.value = "0";
//   }

//   void delete() {
//     if (expression.value.isNotEmpty) {
//       expression.value = expression.value.substring(
//         0,
//         expression.value.length - 1,
//       );
//     }
//   }

//   void calculate() {
//     if (expression.value.isNotEmpty) {
//       result.value = _service.evaluateExpression(expression.value);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:my_calculator/calculator_module/calculator_service.dart';

class CalculatorController extends GetxController {
  var expression = "".obs;
  var result = "0".obs;

  final CalculatorService _service = CalculatorService();

  void append(String value) {
    // Agar user log10 likhna chahta hai to use base-10 log banayein
    if (value == "log") {
      expression.value += "log("; // user input ke liye bracket open kare
    } else if (value == "pi") {
      expression.value += "pi";
    } else {
      expression.value += value;
    }
  }

  void clear() {
    expression.value = "";
    result.value = "0";
  }

  void delete() {
    if (expression.value.isNotEmpty) {
      expression.value = expression.value.substring(
        0,
        expression.value.length - 1,
      );
    }
  }

  void calculate() {
    if (expression.value.isNotEmpty) {
      String exp = expression.value;

      try {
        result.value = _service.evaluateExpression(exp);
      } catch (e) {
        result.value = "Error";
      }
    }
  }
}
