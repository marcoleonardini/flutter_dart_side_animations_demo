import 'dart:async';

import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();

  final StreamSink<double> parentEvents;
  List<String> items;

  FrontPage(this.parentEvents, this.items);
}

class _FrontPageState extends State<FrontPage> {
  //
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.70, initialPage: 0);
    controller.addListener(() {
      widget.parentEvents.add(controller.offset / 0.70);
      if (controller.position.maxScrollExtent - controller.offset + 1 == 1) {
        setState(() {
          widget.items.add(
              '${((widget.items.length) % 9) + 1}00/${((widget.items.length) % 9) + 1}00');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${currentPage + 1} / ${widget.items.length}',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12.0,
          ),
        ),
        Expanded(
          flex: 4,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int i) {
              return _containers2(i);
            },
            onPageChanged: (int i) {
              setState(
                () {
                  currentPage = i;
                },
              );
            },
          ),
        ),
        _detailsBuilder(currentPage)
      ],
    );
  }

  Widget _detailsBuilder(index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }

        return Expanded(
          child: Transform.translate(
            offset: Offset(0, (500 + (-value * 500))),
            child: Opacity(
              opacity: value,
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.items[currentPage],
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      widget.items[currentPage],
                      style: TextStyle(fontSize: 18.0, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 80.0,
                      height: 5.0,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Read More",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _containers2(int i) {
    String item = widget.items[i];
    final con = ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: FadeInImage(
        placeholder: AssetImage('assets/placeholder.png'),
        image: NetworkImage(
          'https://picsum.photos/$item',
        ),
        fit: BoxFit.cover,
      ),
    );

    return AnimatedBuilder(
      animation: controller,
      child: con,
      builder: (BuildContext context, Widget child) {
        double value = 1;
        double valueStart = 1;
        double value2 = 1;
        if (controller.position.haveDimensions) {
          valueStart = controller.page - i;
          value = (1 - (valueStart.abs() * 0.5)).clamp(0.0, 1.0);
          value2 = (1 - (valueStart.abs() * 0.25)).clamp(0.0, 1.0);

          return obj(value, value2, child);
        } else {
          value = i == 0 ? value : value * 0.5;
          value2 = i == 0 ? value2 : value2 * 0.70;
          return obj(value, value2, child);
        }
      },
    );
  }

  Widget obj(value, value2, child) {
    return Opacity(
      opacity: Curves.easeIn.transform(value),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: Curves.easeIn.transform(value2) * 550,
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black,
              width: 12.0,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
