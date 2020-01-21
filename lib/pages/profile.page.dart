import 'package:flutter/material.dart';
import 'package:flutter_dart_side_animations_demo/data/person.model.dart';
import 'package:flutter_dart_side_animations_demo/painters/details.painter.dart';
import 'package:flutter_dart_side_animations_demo/widgets/wave.widget.dart';

class ProfilePage extends StatelessWidget {
  final Person _person;

  ProfilePage(this._person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Material(
          child: Stack(
            children: <Widget>[
              // Wave(
              //   colorWave: Color(_person.name.favoriteColor),
              // ),
              _background(context),
              _allContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: DetailsPainter(
            colorFondo:
                Colors.blue.withOpacity(0.6) /*color.withOpacity(0.6)*/),
      ),
    );
  }

  Widget _seePictures(BuildContext context) {
    return RaisedButton(
      child: Text('View Images'),
      color: Theme.of(context).accentColor,
      onPressed: () {
        Navigator.pushNamed(context, 'pictures');
      },
    );
  }

  Widget _allContent(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          child: Text(
            'My Profile',
            style: TextStyle(fontSize: 32.0),
          ),
          alignment: Alignment.centerLeft,
        ),
        Flexible(flex: 5, child: _profile(context)),
        Divider(),
        Flexible(flex: 1, child: _contact()),
        Divider(),
        Flexible(flex: 1, child: _points()),
        _seePictures(context),
      ],
    );
  }

  Widget _points() {
    return Container(
      // color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Stars'),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star)
                ],
              )
            ],
          ),
          VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Favorites'),
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  Icon(Icons.favorite_border),
                  Icon(Icons.favorite_border),
                  Icon(Icons.favorite_border),
                  Icon(Icons.favorite_border)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _contact() {
    return Container(
      // color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.phone),
              Text(_person.phone),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.mail),
              Text(_person.email),
            ],
          ),
        ],
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      // color: Colors.lightBlueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Hero(
            tag: _person.id.value,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(78.0),
                child: Image.network(
                  _person.picture.large,
                ),
              ),
            ),
          ),
          Text(
            'Hi there, I\m',
            style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
          ),
          Text(
            _person.getName(),
            style: TextStyle(fontSize: 28.0, color: Colors.grey[700]),
          ),
          Text(
            'From ${_person.getCityCountry()}',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text(
              'Photographers are artists with the camera, using a blend of technical skills and an artistic eye to take pictures of people, places, landscapes, food, you name it. Photographers can work as fine artists, wedding and event photographers, or sell their photos to commercial clients.',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
