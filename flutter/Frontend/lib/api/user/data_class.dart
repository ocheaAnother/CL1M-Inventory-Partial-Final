class Borrow {
  String username;
  String propertyNum;
  String description;
  String date;
  String dateReturn;

  Borrow(
      {required this.username,
      required this.propertyNum,
      required this.description,
      required this.date,
      required this.dateReturn});

  factory Borrow.fromJson(Map<String, dynamic> json) {
    return Borrow(
      username: json['username'],
      propertyNum: json['property_no'],
      description: json['description'],
      date: json['date'],
      dateReturn: json['date_return'],
    );
  }
}

class User {
  String name;
  String email;
  String password;
  User(this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return User(
      attributes['name'],
      attributes['email'],
      attributes['password'],
    );
  }

  get id => null;
}

class Item {
  String propertyNum;
  String description;
  String acquisitionDate;
  String estimatedLife;
  String officeDesignation;
  String serialNum;

  Item(
      {required this.propertyNum,
      required this.description,
      required this.acquisitionDate,
      required this.estimatedLife,
      required this.officeDesignation,
      required this.serialNum});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      propertyNum: json['property_no'],
      description: json['description'],
      acquisitionDate: json['acquisiton_date'],
      estimatedLife: json['estimated_life'],
      officeDesignation: json['office_designation'],
      serialNum: json['brand_serial_no'],
    );
  }

  get id => null;
}
