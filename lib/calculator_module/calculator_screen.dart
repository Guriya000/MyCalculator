import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/calculator_module/calculator_controller.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController controller = Get.put(CalculatorController());

  final List<String> buttons = [
    // Top row - scientific functions
    "sin", "cos", "tan", "log",
    "sqrt", "pi", "^", ".",

    // Numbers and operators
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "0", "00", "=", "+",

    // Extra controls
    "(", ")", "C", "DEL",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.shade400, Colors.lightBlue.shade200],
              transform: GradientRotation(15),
            ),
          ),
          child: Column(
            children: [
              // Display
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.expression.value,
                            style: TextStyle(
                              fontSize: size.width * 0.07,
                              color: Colors.brown.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.result.value,
                            style: TextStyle(
                              fontSize: size.width * 0.09,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 30),
              // Buttons Grid
              Expanded(
                flex: 5,
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    String btnText = buttons[index];
                    return InkWell(
                      onTap: () {
                        if (btnText == "C") {
                          controller.clear();
                        } else if (btnText == "DEL") {
                          controller.delete();
                        } else if (btnText == "=") {
                          controller.calculate();
                        } else {
                          controller.append(btnText);
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: 8,
                        child: PhysicalModel(
                          color: Colors.brown.shade200,
                          elevation: 3,
                          shadowColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                btnText,
                                style: TextStyle(
                                  fontSize: size.width * 0.06,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
