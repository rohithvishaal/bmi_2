import 'package:bmi_2/widgets/bmi_large_button.dart';
import 'package:bmi_2/widgets/bmi_metric_bar.dart';
import 'package:flutter/material.dart';
import 'constants/bmi_constants.dart';
import 'screens/result_screen.dart';
import 'widgets/bmi_small_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int weight = 70;
  int height = 180;
  int age = 25;
  Gender selectedGender = Gender.male;

  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    void updateMetric(String metric, String operation) {
      setState(() {
        if (metric == "weight") {
          if (operation == "increment") {
            weight++;
          } else if (operation == "decrement" && weight > 0) {
            weight--;
          }
        } else if (metric == "height") {
          if (operation == "increment") {
            height++;
          } else if (operation == "decrement" && height > 0) {
            height--;
          }
        } else if (metric == "age") {
          if (operation == "increment") {
            age++;
          } else if (operation == "decrement" && age > 0) {
            age--;
          }
        }
      });
    }

    return MaterialApp(
      home: Navigator(
        onGenerateRoute:
            (settings) => MaterialPageRoute(
              builder:
                  (context) => Scaffold(
                    body: Container(
                      color: kBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 10,
                              ),
                              child: Text(
                                "BMI Calculator",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          BMISmallText(text: "Gender"),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            selectedGender == Gender.male
                                                ? Colors.green
                                                : Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(3),
                                      color: kGenderContainerColor,
                                    ),
                                    child: GestureDetector(
                                      onTap:
                                          () => {
                                            setState(() {
                                              selectedGender = Gender.male;
                                            }),
                                          },
                                      child: Icon(
                                        Icons.male,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            selectedGender == Gender.female
                                                ? Colors.green
                                                : Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(3),
                                      color: kGenderContainerColor,
                                    ),
                                    child: GestureDetector(
                                      onTap:
                                          () => {
                                            setState(() {
                                              selectedGender = Gender.female;
                                            }),
                                          },
                                      child: Icon(
                                        Icons.female,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BMISmallText(text: "Weight"),
                          Expanded(
                            child: BMIMetricBar(
                              metric: "$weight kg",
                              onOperation:
                                  (operation) =>
                                      updateMetric("weight", operation),
                            ),
                          ),
                          BMISmallText(text: "Height"),
                          Expanded(
                            child: BMIMetricBar(
                              metric: "$height cm",
                              onOperation:
                                  (operation) =>
                                      updateMetric("height", operation),
                            ),
                          ),
                          BMISmallText(text: "Age"),
                          Expanded(
                            child: BMIMetricBar(
                              metric: "$age years",
                              onOperation:
                                  (operation) => updateMetric("age", operation),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                double bmi = calculateBMI();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            BMIResultPage(bmiValue: bmi),
                                  ),
                                );
                              },
                              child: BmILargeButton(buttonText: "Calculate"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
      ),
    );
  }
}
