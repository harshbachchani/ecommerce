import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/utils/formaters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phonenumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.phonenumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  String get formattedPhoneno => HFormatter.formatPhoneNumber(phonenumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernamewithPrefix = "user_$camelCaseUsername";
    return usernamewithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        phonenumber: '',
        profilePicture: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phonenumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'],
          email: data['Email'],
          username: data['Username'],
          phonenumber: data['PhoneNumber'],
          profilePicture: data['ProfilePicture']);
    }
    return UserModel.empty();
  }
}
