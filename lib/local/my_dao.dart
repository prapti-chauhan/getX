import 'package:floor/floor.dart';
import 'package:getx_demo/models/user.dart';

@dao
abstract class MyDao {

  @Query('SELECT * FROM Users')
  Future<List<Users>> retrieveUser();

  @Query('SELECT * FROM Users')
  Stream<List<Users>> retrieveUserAsStream();

  @Query('SELECT * FROM Users WHERE email = :email')
  Stream<Users?> retrieveEmail(String email);

  @Query('SELECT * FROM Users WHERE email = :email and password = :password')
  Future<Users?> checkLogin(String email, String password);

  @Query(
      'UPDATE Users SET fname = :fName , lname = :lName , email = :email WHERE email = :emails')
  Future<Users?> updateAccount(
      String fName, String lName, String email, String emails);

  @Query(
      'UPDATE Users SET password = :password, confirmPassword = :confirmpassword WHERE email = :email')
  Future<Users?> updatePassword(
      String password, String confirmpassword, String email);

  @insert
  Future<void> insertUser(Users user);

  @delete
  Future<void> deleteUser(Users user);
}
