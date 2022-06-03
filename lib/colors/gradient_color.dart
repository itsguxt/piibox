// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  final Widget widgets;
  const MyBlinkingButton({Key? key, required this.widgets}) : super(key: key);
  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // _animationController.repeat(reverse: false);
    _animation = Tween(begin: 0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ShaderMask(
          child: widget.widgets,
          shaderCallback: (rect) {
            return LinearGradient(stops: [
              _animation.value - 0.5,
              _animation.value,
              _animation.value + 0.5
            ], colors: const [
              Colors.white,
              Color.fromARGB(255, 94, 30, 170),
              Colors.white,
            ]).createShader(rect);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
