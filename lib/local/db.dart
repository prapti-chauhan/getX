import 'package:getx_demo/local/app_database.dart';
import 'package:getx_demo/local/my_dao.dart';

class DB {
  static final DB instance = DB._privateConstructor();
  late UserDatabase db;
  late MyDao dao;

  factory DB() {
    return instance;
  }

  DB._privateConstructor() {
    builder();
  }

  builder() async {
     db = await $FloorUserDatabase.databaseBuilder('users_database.db').build();
    dao = db.myDao;
    return dao;
  }
}
