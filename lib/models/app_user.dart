class AppUser {
  final String? id, firstName, lastName, email, phoneNumber, adress, job, imageAvatar, gender, interestedgender, bio;
  final int? createDateTimeMillis, dateOfBirthTimeMillis;
  final List<dynamic>? imageUrl;
  final List<dynamic>? interests;

  AppUser({
       this.id,
       this.lastName,
       this.firstName,
       this.email,
       this.phoneNumber,
       this.adress,
       this.job,
       this.imageAvatar,
       this.createDateTimeMillis,
       this.dateOfBirthTimeMillis,
       this.gender,
       this.interestedgender,
       this.bio,
       this.imageUrl,
       this.interests});
  factory AppUser.fromJson(Map<String, dynamic> data) {
    return AppUser(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      adress: data['adress'],
      job: data['job'],
      imageAvatar: data['imageAvatar'],
      createDateTimeMillis: data['createDateTimeMillis'],
      dateOfBirthTimeMillis: data['dateOfBirthTimeMillis'],
      gender: data['gender'],
      interestedgender: data['interestedgender'],
      imageUrl: data['imageUrl'],
      interests: data['interests'],
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
      'adress': adress,
      'job': job,
      'imageAvatar': imageAvatar,
      'createDateTimeMillis': createDateTimeMillis,
      'dateOfBirthTimeMillis': dateOfBirthTimeMillis,
      'gender': gender,
      'interestedgender': interestedgender,
      'bio': bio,
      'imageUrl': imageUrl,
      'interests': interests,
    };
  }
}
