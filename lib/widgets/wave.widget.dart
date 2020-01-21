import 'package:flutter/material.dart';
import 'package:flutter_dart_side_animations_demo/painters/details.painter.dart';

class Wave extends StatefulWidget {
  final Color colorWave;

  Wave({this.colorWave});

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController controller;
  double waveRadius = 0.0;
  double waveGap = 0.10;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 5000),
      vsync: this,
    );

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation =
        Tween<double>(begin: -waveGap, end: waveGap).animate(controller)
          ..addListener(() {
            setState(() {
              waveRadius = _animation.value;
            });
          });
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.deepOrange,
      child: CustomPaint(
        painter: DetailsPainter(colorFondo: widget.colorWave, wave: waveRadius),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
