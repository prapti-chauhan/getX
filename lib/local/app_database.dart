import 'dart:async';

import 'package:floor/floor.dart';
import 'package:getx_demo/local/my_dao.dart';
import 'package:getx_demo/models/user.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Users])
abstract class UserDatabase extends FloorDatabase {
  MyDao get myDao;
}
