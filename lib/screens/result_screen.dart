import 'package:bmi_2/widgets/bmi_large_button.dart';
import 'package:flutter/material.dart';

class BMIResultPage extends StatelessWidget {
  final double bmiValue;

  const BMIResultPage({super.key, required this.bmiValue});

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case "Underweight":
        return Colors.blue;
      case "Normal weight":
        return Colors.green;
      case "Overweight":
        return Colors.orange;
      case "Obesity":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String category = getBMICategory(bmiValue);
    final Color categoryColor = getCategoryColor(category);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black, // Set background to black
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Your BMI is:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color:
                            Colors
                                .white, // Text color adjusted for black background
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bmiValue.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Category: $category",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: categoryColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            Colors.grey[800], // Adjusted for black background
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "BMI Categories:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color adjusted
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "• Underweight: BMI < 18.5",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "• Normal weight: BMI 18.5 - 24.9",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "• Overweight: BMI 25 - 29.9",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "• Obesity: BMI >= 30",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: BmILargeButton(buttonText: "Recalculate"),
            ),
          ),
        ],
      ),
    );
  }
}
