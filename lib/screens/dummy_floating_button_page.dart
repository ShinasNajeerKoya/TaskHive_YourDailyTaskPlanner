import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation, degTwoTranslationAnimation, degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadianFromDegree(double degree) {
    double unitRadian = 57.2958;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.4), weight: 50.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 50.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.7), weight: 25.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.7, end: 1.0), weight: 75.0),
    ]).animate(animationController);
    rotationAnimation = Tween(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primaryPurple = Color.fromARGB(255, 235, 221, 255);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15, right: 15),
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Transform.translate(
                  offset:
                      Offset.fromDirection(getRadianFromDegree(270), degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadianFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularFloatingButton(
                      height: 45,
                      width: 45,
                      color: primaryPurple,
                      icon: Icon(Icons.add),
                      onClick: () {
                        log("add button is pressed");
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset:
                      Offset.fromDirection(getRadianFromDegree(225), degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadianFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularFloatingButton(
                      height: 45,
                      width: 45,
                      color: primaryPurple,
                      icon: Icon(Icons.save),
                      onClick: () {
                        log("save button is pressed");
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(
                      getRadianFromDegree(180), degThreeTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(getRadianFromDegree(rotationAnimation.value))
                      ..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularFloatingButton(
                      height: 45,
                      width: 45,
                      color: primaryPurple,
                      icon: Icon(Icons.delete_forever),
                      onClick: () {
                        log("delete button is pressed");
                      },
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(getRadianFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularFloatingButton(
                    height: 55,
                    width: 55,
                    color: primaryPurple,
                    icon: Icon(Icons.add),
                    onClick: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularFloatingButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final BorderRadius? borderRadius;
  final Icon icon;
  final void Function()? onClick;

  const CircularFloatingButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      height: height,
      width: width,
      child: FloatingActionButton(
        onPressed: onClick,
        child: icon,
      ),
    );
  }
}
