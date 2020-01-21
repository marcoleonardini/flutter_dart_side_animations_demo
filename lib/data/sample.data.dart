import 'package:flutter_dart_side_animations_demo/data/person.model.dart';

Person _person1 = Person(
  gender: "female",
  name: Name(
    title: "Mrs",
    first: "Constance",
    last: "Mitchell",
    favoriteColor: 0xff343212,
  ),
  location: Location(
    street: Street(
      number: 5412,
      name: "Oak Lawn Ave",
    ),
    city: "Port Macquarie",
    state: "South Australia",
    country: "Australia",
    postcode: 2850,
    coordinates: Coordinates(
      latitude: "-86.8385",
      longitude: "159.6822",
    ),
    timezone: Timezone(
      offset: "+4:00",
      description: "Abu Dhabi, Muscat, Baku, Tbilisi",
    ),
  ),
  email: "constance.mitchell@example.com",
  phone: "01-4471-8464",
  cell: "0428-522-109",
  id: Id(
    name: "TFN",
    value: "168543938",
  ),
  picture: Picture(
    large: "https://randomuser.me/api/portraits/women/90.jpg",
    medium: "https://randomuser.me/api/portraits/med/women/90.jpg",
    thumbnail: "https://randomuser.me/api/portraits/thumb/women/90.jpg",
  ),
);

Person _person2 = Person(
  gender: "female",
  name: Name(
    title: "Ms",
    first: "Vanessa",
    last: "Burton",
    favoriteColor: 0xff4da23e,
  ),
  location: Location(
    city: "Roscrea",
    state: "Longford",
    country: "Ireland",
    postcode: 73493,
    timezone: Timezone(
      offset: "-3:00",
      description: "Brazil, Buenos Aires, Georgetown",
    ),
  ),
  email: "vanessa.burton@example.com",
  phone: "041-196-3401",
  cell: "081-280-1384",
  id: Id(name: "PPS", value: "4813083T"),
  picture: Picture(
    large: "https://randomuser.me/api/portraits/women/63.jpg",
    medium: "https://randomuser.me/api/portraits/med/women/63.jpg",
    thumbnail: "https://randomuser.me/api/portraits/thumb/women/63.jpg",
  ),
);

List<Person> listPerson = [
  _person1,
  _person2,
];
