part of '../../imports/app_imports.dart';

class InitDB {

  static Future<Database> get init async {
    Directory directory = await dir.getApplicationDocumentsDirectory();
    dev.log('directory: $directory ,name: initDB');

    String pathDB = path.join(directory.path,'Shelves.db');
    dev.log("path database: $pathDB", name: 'InitDB');

    return openDatabase(pathDB,onCreate: (db,version) async {
      await db.execute('''
      CREATE TABLE ${TableShelves.nameTable} (
        ${TableShelves.colId} TEXT PRIMARY KEY,
        ${TableShelves.colName} TEXT , 
        ${TableShelves.colPrice} TEXT , 
        ${TableShelves.colWeight} TEXT , 
        ${TableShelves.colExpireDate} TEXT 
      )
      ''',);
      
      /// change table name and columns names to create another table
      // CREATE TABLE ${TableShelves.nameTable} (
      //   ${TableShelves.colId} TEXT PRIMARY KEY,
      //   ${TableShelves.colName} TEXT , 
      //   ${TableShelves.colPrice} TEXT , 
      //   ${TableShelves.colWeight} TEXT , 
      //   ${TableShelves.colExpireDate} TEXT 
      // )
      // ''',);


    });
  }
}