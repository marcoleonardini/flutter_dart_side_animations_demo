import 'dart:async';

import 'package:flutter/material.dart';

class PageViewBack extends StatefulWidget {
  @override
  _PageViewBackState createState() => _PageViewBackState();

  final Stream<double> parentEvents;
  List<String> items;
  PageViewBack(this.parentEvents, this.items);
}

class _PageViewBackState extends State<PageViewBack> {
  PageController controller = PageController();

  StreamSubscription<double> _subEvents;

  @override
  void initState() {
    super.initState();
    _subEvents = widget.parentEvents.asBroadcastStream().listen((event) {
      setState(() {
        controller.jumpTo(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: false,
      reverse: true,
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int i) {
        return _containers(i);
      },
    );
  }

  Widget _containers(int i) {
    String item = widget.items[i];
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black12, Colors.black],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.hardLight,
      child: Image.network(
        'https://picsum.photos/$item',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _subEvents.cancel();
  }
}
