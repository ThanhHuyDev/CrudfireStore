class AppUser {
  final String? id, firstName, lastName, email, phoneNumber, imageAvatar, gender, bio;
  final int? createDateTimeMillis, dateOfBirthTimeMillis;

  AppUser(
      {this.id,
      this.lastName,
      this.firstName,
      this.email,
      this.phoneNumber,
      this.imageAvatar,
      this.createDateTimeMillis,
      this.dateOfBirthTimeMillis,
      this.gender,
      this.bio});
  factory AppUser.fromJson(Map<String, dynamic> data) {
    return AppUser(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      imageAvatar: data['imageAvatar'],
      createDateTimeMillis: data['createDateTimeMillis'],
      dateOfBirthTimeMillis: data['dateOfBirthTimeMillis'],
      gender: data['gender'],
      bio: data['bio'],
    );
  }
  toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageAvatar': imageAvatar,
      'createDateTimeMillis': createDateTimeMillis,
      'dateOfBirthTimeMillis': dateOfBirthTimeMillis,
      'gender': gender,
      'bio': bio,
    };
  }
}
