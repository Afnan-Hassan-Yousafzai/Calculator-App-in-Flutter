import 'package:calculator/Constants.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  final String req;
  final Color color;
  final VoidCallback onTab;
  const TopButtons({
    super.key,
    required this.req,
    this.color = lightGrey,
    required this.onTab,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: color, // 1. MOVE COLOR HERE
        borderRadius: BorderRadius.circular(100), // Make the material round
        clipBehavior: Clip.hardEdge,

        child: InkWell(
          onTap: onTab,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 80,
            width: 80,

            child: Center(
              child: Text(
                req,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
