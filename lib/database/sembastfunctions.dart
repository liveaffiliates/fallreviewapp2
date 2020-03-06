import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show Platform;
import 'package:fallreview/models/fallmodel.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';



Future <String> getWorkingDirectory() async {

  Directory directory;

  if (Platform.isAndroid) {
    directory = await getExternalStorageDirectory();
  } else if (Platform.isIOS) {

    //TODO
    directory = await getTemporaryDirectory();
  }

  return directory.path.toString() + '/summarise/';
}

Future<int> writeFallToDatabase({@required Map<String, dynamic> fallData}) async{
  // File path to a file in the current directory
  String dbPath = await getWorkingDirectory() + 'summarise.db';

  DatabaseFactory dbFactory = databaseFactoryIo;

  // We use the database factory to open the database
  Database db = await dbFactory.openDatabase(dbPath);

  // Create a store
  var store = intMapStoreFactory.store('summarise');


  var key =  await store.add(db, {'fall': fallData});


  return key;
}

void editFallInDatabase({@required Map<String, dynamic> fallData, int fallKey}) async{
  // File path to a file in the current directory
  String dbPath = await getWorkingDirectory() + 'summarise.db';

  DatabaseFactory dbFactory = databaseFactoryIo;

  // We use the database factory to open the database
  Database db = await dbFactory.openDatabase(dbPath);

  // Create a store
  var store = intMapStoreFactory.store('summarise');

  // Get the record
  var record = store.record(fallKey);

  // Update the data in the record
  await record.update(db, {'fall': fallData});
}

Future <List<FallData>> getFallsFromDatabase() async{
  // File path to a file in the current directory
  String dbPath = await getWorkingDirectory() + 'summarise.db';

  DatabaseFactory dbFactory = databaseFactoryIo;

  // We use the database factory to open the database
  Database db = await dbFactory.openDatabase(dbPath);

  // Create a store
  var store = intMapStoreFactory.store('summarise');

  List <FallData> fallDatas = List();
  // Store some objects
  await db.transaction((txn) async {
    var records = await store.find(db);

    records.forEach((record){
      FallData fallData = FallData.fromJson(record['fall']);
      fallData.id = record.key;
      fallDatas.add(fallData);
    });
  });

  db.close();

  return fallDatas;
}

Future <FallData> getSingleRecordFromDatabase({@required key}) async{
  // File path to a file in the current directory
  String dbPath = await getWorkingDirectory() + 'summarise.db';

  DatabaseFactory dbFactory = databaseFactoryIo;

  // We use the database factory to open the database
  Database db = await dbFactory.openDatabase(dbPath);

  // Create a store
  var store = intMapStoreFactory.store('summarise');

  var record = await store.record(key).get(db);

  FallData fallData = FallData.fromJson(record['fall']);

  db.close();

  return fallData;
}


Future <bool> deleteFallFromDatabase({int fallKey}) async{

  // File path to a file in the current directory
  String dbPath = await getWorkingDirectory() + 'summarise.db';

  DatabaseFactory dbFactory = databaseFactoryIo;

  // We use the database factory to open the database
  Database db = await dbFactory.openDatabase(dbPath);

  // Create a store
  var store = intMapStoreFactory.store('summarise');

  // Get the record
  var record = store.record(fallKey);

  // Update the data in the record
  await record.delete(db).then((_){
    return true;
  });

}