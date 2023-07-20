class UserDTO {

  String? email;

  String? name;

  String? phone;

  num? userGroup;

  String? registerDate;

  String? token;




  UserDTO.fromJson(Map<String, dynamic> json) {

    email = json["email"];

    name = json["name"];

    phone = json["phone"];

    userGroup = json["userGroup"];

    registerDate = json["registerDate"];

    token = json["token"];

  }

}