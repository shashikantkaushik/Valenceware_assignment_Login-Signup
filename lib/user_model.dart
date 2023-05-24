class UserModel {
  String name;
  String add;
  String dob;

  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.add,
    required this.dob,

    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      add: map['add'] ?? '',
      dob: map['dob'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "add": add,
      "uid": uid,
      "dob": dob,

      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
