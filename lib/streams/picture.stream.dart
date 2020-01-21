import 'dart:async';

class PicturePageStream {
  //
  List<String> _items = [
    '200/200',
    '300/200',
    '400/200',
    '500/300',
    '500/200',
    '500/400',
    '500/500',
    '500/600',
    '500/700',
  ];

  StreamController<double> _controller = StreamController.broadcast();

  PicturePageStream();

  Stream<double> get stream => _controller.stream;

  StreamSink<double> get inputSink => _controller.sink;

  List<String> get items => _items;
}
