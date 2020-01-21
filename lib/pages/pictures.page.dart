import 'package:flutter/material.dart';
import 'package:flutter_dart_side_animations_demo/streams/picture.stream.dart';
import 'package:flutter_dart_side_animations_demo/widgets/front_page.widget.dart';
import 'package:flutter_dart_side_animations_demo/widgets/page_view_back.widget.dart';

class PicturesPage extends StatelessWidget {
  //
  final PicturePageStream _str = PicturePageStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageViewBack(_str.stream, _str.items),
            ),
            Container(
              height: 600,
              child: FrontPage(_str.inputSink, _str.items),
            ),
          ],
        ),
      ),
    );
  }
}
