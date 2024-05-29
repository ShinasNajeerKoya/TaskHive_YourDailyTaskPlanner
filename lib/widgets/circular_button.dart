import 'package:flutter/material.dart';

class CircularFloatingButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  final void Function()? onClick;
  final String buttonName;

  const CircularFloatingButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.child,
    required this.onClick,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onClick,
        child: Tooltip(
          showDuration: const Duration(milliseconds: 300),
          message: buttonName,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
