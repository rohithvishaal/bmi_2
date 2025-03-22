import 'package:flutter/material.dart';

class BMIMetricBar extends StatefulWidget {
  final String metric;
  final Function(String operation) onOperation;
  const BMIMetricBar({
    super.key,
    required this.metric,
    required this.onOperation,
  });
  @override
  State<BMIMetricBar> createState() => _BMIMetricBarState();
}

class _BMIMetricBarState extends State<BMIMetricBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RawMaterialButton(
              onPressed: () => {widget.onOperation("decrement")},
              fillColor: Colors.black,
              shape: CircleBorder(),
              child: Icon(Icons.remove, color: Colors.white, size: 30),
            ),
            Text(
              widget.metric,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            RawMaterialButton(
              fillColor: Colors.black,
              shape: CircleBorder(),
              onPressed: () => {widget.onOperation("increment")},
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
