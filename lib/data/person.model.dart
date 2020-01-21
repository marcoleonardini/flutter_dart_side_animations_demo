// Generated by https://quicktype.io

class Person {
  String gender;
  Name name;
  Location location;
  String email;
  String phone;
  String cell;
  Id id;
  Picture picture;

  Person({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.phone,
    this.cell,
    this.id,
    this.picture,
  });

  String getName() => name.first + ' ' + name.last;
  String getCityCountry() => location.city + ', ' + location.country;
}

class Id {
  String name;
  String value;

  Id({
    this.name,
    this.value,
  });
}

class Location {
  Street street;
  String city;
  String state;
  String country;
  int postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });
}

class Street {
  int number;
  String name;

  Street({
    this.number,
    this.name,
  });
}

class Timezone {
  String offset;
  String description;

  Timezone({
    this.offset,
    this.description,
  });
}

class Name {
  String title;
  String first;
  String last;
  int favoriteColor;

  Name({
    this.title,
    this.first,
    this.last,
    this.favoriteColor,
  });
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });
}
