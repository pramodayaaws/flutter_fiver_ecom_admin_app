class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.address});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'address': address
    };
  }
}
