import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uts/dias/Models/dias.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String diasTable = 'dias_table';
	String colId = 'id';
	String colGames = 'games';
	String colServer1 = 'server1';
  String colDias = 'dias';
	String colDate = 'date';

	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'dias.db';

		// Open/create the database at a given path
		var diasDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return diasDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $diasTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colGames TEXT, $colServer1 TEXT, $colDias TEXT, $colDate TEXT)');
	}

	// Fetch Operation: Get all todo objects from database
	Future<List<Map<String, dynamic>>> getTodoMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
		var result = await db.query(diasTable, orderBy: '$colDate ASC');
		return result;
	}

	// Insert Operation: Insert a todo object to database
	Future<int> insertTodo(Todo todo) async {
		Database db = await this.database;
		var result = await db.insert(diasTable, todo.toMap());
		return result;
	}

	// Update Operation: Update a todo object and save it to database
	Future<int> updateTodo(Todo todo) async {
		var db = await this.database;
		var result = await db.update(diasTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
		return result;
	}

  	Future<int> updateTodoCompleted(Todo todo) async {
		var db = await this.database;
		var result = await db.update(diasTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
		return result;
	}

	// Delete Operation: Delete a todo object from database
	Future<int> deleteTodo(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $diasTable WHERE $colId = $id');
		return result;
	}

	// Get number of todo objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $diasTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
	Future<List<Todo>> getTodoList() async {

		var todoMapList = await getTodoMapList(); // Get 'Map List' from database
		int count = todoMapList.length;         // Count the number of map entries in db table

		List<Todo> todoList = List<Todo>();
		// For loop to create a 'todo List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			todoList.add(Todo.fromMapObject(todoMapList[i]));
		}

		return todoList;
	}

}







