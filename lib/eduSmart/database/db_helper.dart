import 'package:path/path.dart';
import 'package:ppkd_b4_abee/eduSmart/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableStudent = 'students';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'ppkd.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableStudent(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, class TEXT, age int, password TEXT )",
        );
      },

      version: 1,
    );
  }

  static Future<void> registerUser(StudentModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableStudent,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<StudentModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableStudent,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return StudentModel.fromMap(results.first);
    }
    return null;
  }

  //GET SISWA
  static Future<List<StudentModel>> getAllStudent() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableStudent);
    print(results.map((e) => StudentModel.fromMap(e)).toList());
    return results.map((e) => StudentModel.fromMap(e)).toList();
  }

  //UPDATE SISWA
  static Future<void> updateStudent(StudentModel student) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.update(
      tableStudent,
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(student.toMap());
  }

  //DELETE SISWA
  static Future<void> deleteStudent(int id) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.delete(tableStudent, where: "id = ?", whereArgs: [id]);
  }
}
