class UserDm {
  UserDm({
      this.email, 
      this.password,
      this.confirmPassword,
      this.name, 
      this.phone, 
      this.avaterId,
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  UserDm.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "phone": phone,
      "avaterId": avaterId,
      "_id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": v,
    };
  }
}