part of '../../imports/app_imports.dart';

class QueryShelves {
  // private constructor
  QueryShelves._();

  // create object DB
  static final QueryShelves db = QueryShelves._();

  // create object from database
  Database? database; 

  // check if there is database and if there is no DB the method will create one
  Future<Database> get hasDB async {

    // return database == null ? await InitDB.init : database!;

    return database ?? await InitDB.init;
  }

  // when return -1 that means that not install shelf in DB
  Future<int> insertShelf(ModelShelvesDB data) {
    return hasDB.then((Database localDB) => localDB.insert(TableShelves.nameTable, data.toMap())).onError((error, stackTrace) {
      dev.log("error download shelf data",error: error.toString());
      return -1;
      });

  }

  /// [deleteShelfById] this method delete shelf by id and return the row number
  // Future<int> deleteShelfById (ModelShelvesDB data) {
  //   return hasDB.then((Database localDB) => localDB.delete(TableShelves.nameTable,
  //   where: '${data.id} = ?', whereArgs: [data.id]))
  //   .onError((error, stackTrace) {
  //     dev.log("error delete shelf data",error: error.toString());
  //     return -1;
  //     });
  // }


  /// [getShelves] return list from ModelShelvesDB
  Future<List<ModelShelvesDB>> get getShelves {
    return hasDB.then((Database localDB) => localDB.query(TableShelves.nameTable,orderBy: TableShelves.colName)
    .then((listData) => listData.isNotEmpty ? listData.map((shelf) => ModelShelvesDB.fromMap(map: shelf)).toList() : <ModelShelvesDB> [])
    .onError((error, stackTrace) {
      dev.log("error while fetch shelf data",error: error.toString());
      return <ModelShelvesDB>[];
      }));
  }

  Future<ModelShelvesDB?> getShelfById(ModelShelvesDB data) {
    return hasDB.then((Database localDB) => localDB.query(TableShelves.nameTable,
    where: '${TableShelves.colId} = ?',
    whereArgs: [data.id]
    ).then((listData) => listData.isNotEmpty ? ModelShelvesDB.fromMap(map: listData.first) : null),
    ).onError((error, stackTrace) {
      dev.log("error while get shelf data by id",error: error.toString());
      return null;
      });
  }

  Future<int> UpdateShelfById(ModelShelvesDB data) {
    return hasDB.then((Database localDB) => localDB.update(TableShelves.nameTable, data.toMap(),
    where: '${TableShelves.colId} = ?',
    whereArgs: [data.id]
    )).onError((error, stackTrace) {
      dev.log("error while update shelf data",error: error.toString());
      return -1;
      });
  }

}