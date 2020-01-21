import 'package:flutter/material.dart';
import 'package:flutter_dart_side_animations_demo/widgets/delete_button.widget.dart';

import '../data/person.model.dart';
import '../data/sample.data.dart' as data;

class HomePage extends StatelessWidget {
  final List<Person> _listPersons = data.listPerson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _listPersons.length,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int i) {
    return ListTile(
      title: Text(_listPersons[i].getName()),
      subtitle: Text(_listPersons[i].location.city),
      leading: Hero(
        tag: _listPersons[i].id.value,
        child: CircleAvatar(
          backgroundImage: NetworkImage(_listPersons[i].picture.thumbnail),
        ),
      ),
      trailing: DeleteButton(),
      onTap: () => Navigator.pushNamed(
        context,
        'profile',
        arguments: _listPersons[i],
      ),
    );
  }
}
