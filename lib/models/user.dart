import 'package:floor/floor.dart';

@entity
class Users {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String fname;
  String lname;
  String email;
  String password;
  String confirmPassword;
  String gender;

  Users({this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender});
}
