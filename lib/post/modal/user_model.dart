class UserModel {
  int? id, v;
  String? email, username, password, phone;
  AddressModel? address;
  NameModel? nameModel;

  UserModel({this.id,
    this.v,
    this.email,
    this.username,
    this.password,
    this.phone,
    this.nameModel,
    this.address});

  factory UserModel.fromJson(Map m1) {
    return UserModel(
        id: m1['id'],
        email: m1['email'],
        password: m1['password'],
        username: m1['username'],
        phone: m1['phone'],
        v: m1['__v'],
        address: AddressModel.fromJson(m1['address']),
        nameModel: NameModel.fromJson(m1['name']));
  }
}

class AddressModel {
  int? number;
  String? city, street, zipcode;
  GeoModel? geoModel;

  AddressModel({this.number, this.city, this.street, this.zipcode,
    this.geoModel});

  factory AddressModel.fromJson(Map m1)
  {
    return AddressModel(city: m1['city'],
        street: m1['street'],
        zipcode: m1['zipcode'],
        number: m1['number'],
        geoModel: GeoModel.fromJson(m1['geolocation']));
  }

}

class GeoModel {
  String? late, long;

  GeoModel({this.late, this.long});

  factory GeoModel.fromJson(Map m1)
  {
    return GeoModel(late: m1['late'], long: m1['long']);
  }
}

class NameModel {
  String? firstname, lastname;

  NameModel({this.firstname, this.lastname});

  factory NameModel.fromJson(Map m1)
  {
    return NameModel(firstname: m1['firstname'], lastname: m1['lastname']);
  }

}
