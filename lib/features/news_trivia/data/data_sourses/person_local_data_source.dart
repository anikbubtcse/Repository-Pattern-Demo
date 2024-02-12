import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:repository_pattern_demo/core/error/exception.dart';
import 'package:repository_pattern_demo/features/news_trivia/data/models/person_model.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/entities/person_entity.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_add_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_delete_person_use_case.dart';
import 'package:repository_pattern_demo/features/news_trivia/domain/usecases/get_update_person_use_case.dart';
import 'package:sqflite/sqflite.dart';

abstract class PersonLocalDataSource {
  Future<int> addPerson(PersonEntity personEntity);

  Future<int> updatePerson(PersonEntity personEntity);

  Future<int> deletePerson(PersonEntity personEntity);

  Future<List<PersonModel>> allPerson();

  Future<Database> getDB();
}

class PersonLocalDataSourceImp extends PersonLocalDataSource {
  @override
  Future<int> addPerson(PersonEntity personEntity) async {
    Database database = await getDB();

    try {
      int value = await database.insert("Person", personEntity.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print(value);
      return value;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<PersonModel>> allPerson() async {
    Database database = await getDB();

    final List<Map<String, dynamic>> maps = await database.query("Person");
    if (maps.isNotEmpty) {
      final person =
          List<PersonModel>.from(maps.map((x) => PersonModel.fromJson(x)));
      return person;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<int> deletePerson(PersonEntity personEntity) async {
    Database database = await getDB();

    try {
      int value = await database
          .delete("Person", where: 'id = ?', whereArgs: [personEntity.id]);
      return value;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<int> updatePerson(PersonEntity personEntity) async {
    Database database = await getDB();

    try {
      int value = await database.update("Person", personEntity.toJson(),
          where: 'id = ?',
          whereArgs: [personEntity.id],
          conflictAlgorithm: ConflictAlgorithm.replace);
      return value;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Database> getDB() async {
    const String dbName = 'person.db';
    const int version = 1;

    Database database = await openDatabase(
        join(await getDatabasesPath(), dbName),
        version: version, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Person(id INTEGER PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL)");
    });

    return database;
  }
}
