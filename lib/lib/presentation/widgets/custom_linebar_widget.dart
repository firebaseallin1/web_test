import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  final double percentage; // Value between 0 and 100
  final Color backgroundColor;
  final Color progressColor;
  final double height;

  const LinearProgressBar({
    super.key,
    required this.percentage,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.height = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("${percentage.toStringAsFixed(0)}%", style: const TextStyle(fontWeight: FontWeight.bold)),
        // const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: height,
                color: backgroundColor,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: (percentage / 100) * MediaQuery.of(context).size.width * 0.8,
                height: height,
                color: progressColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
