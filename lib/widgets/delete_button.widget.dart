import 'package:flutter/material.dart';

class DeleteButton extends StatefulWidget {
  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton>
    with TickerProviderStateMixin {
  Key key;
  AnimationController animationController;
  Animation<Color> animation;

  int currentState = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );

    animation = ColorTween(begin: Colors.black, end: Colors.red)
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    // animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.delete,
        color: animation.value,
      ),
      onTap: () {
        setState(() {
          if (currentState == 0) {
            animationController.forward();
            currentState = 1;
          } else {
            animationController.reverse();
            currentState = 0;
          }
        });
      },
    );
  }
}
