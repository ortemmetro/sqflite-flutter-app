import 'package:asd/src/core/features/posts/domain/entities/post_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PostsDatabaseDataSource {
  static const int _version = 1;
  static const String _dbName = 'Posts.db';

  Future<Database> _getDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: _version,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Posts(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL)");
      },
    );
  }

  Future<int> addPost(Post post) async {
    final db = await _getDatabase();
    return await db.insert(
      "Posts",
      post.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updatePost(Post post) async {
    final db = await _getDatabase();
    return await db.update(
      "Posts",
      post.toJson(),
      where: "id = ?",
      whereArgs: [post.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deletePost(Post post) async {
    final db = await _getDatabase();
    return await db.delete(
      "Posts",
      where: "id = ?",
      whereArgs: [post.id],
    );
  }

  Future<List<Post>> getAllPosts() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("Posts");

    return List.generate(
      maps.length,
      (index) => Post.fromJson(
        maps[index],
      ),
    );
  }
}
