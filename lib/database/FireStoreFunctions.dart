import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallreview/models/fallmodel.dart';


Future<void> updateFirestoreDocument({FallData fallData, String collection, String id}) {

  Map<String, dynamic> data = {
  'fallId': fallData.getFallID,
  'name': fallData.getName,
  'fallTime': fallData.getFallTime,
  'unconciousNotBreathingBleeding': fallData.getUnconciousNotBreathingBleeding,
  'hitHead': fallData.getHitHead,
  'pain': fallData.getPain,
  'painDesc': fallData.getPainDesc,
  'changePainWithMov': fallData.getChangePainWithMovement,
  'changePainWithMovDesc': fallData.getChangePainWithMovDesc,
  'bonyTenderness': fallData.getBonyTenderness,
  'bonyTendernessDesc': fallData.getBonyTendernessDesc,
  'limbShort': fallData.getLimbShort,
  'limbShortDecs': fallData.getLimbShortDesc,
  'nausea': fallData.getNausea,
  'vomit': fallData.getVomit,
  'sevHeadache': fallData.getSevHeadache,
  'cut': fallData.getCut,
  'neckPain': fallData.getNeckPain,
  'changConcious': fallData.getChangeConious,
  'antiCoag': fallData.getAntiCoag,
  'weightBear': fallData.getWeightBear,
  'bpH': fallData.getBPH,
  'bpL': fallData.getBPL,
  'hR': fallData.getHr,
  'temperature': fallData.getTemperature,
  'bgl': fallData.getBGL

  };


  return Firestore.instance.runTransaction((Transaction transactionHandler) {
    return Firestore.instance
        .collection(collection)
        .document(id)
        .setData(data, merge: true);
  });
}

Future<void> updateFirestoreCollection(Map<dynamic, dynamic> data, String collection) {

  return Firestore.instance.runTransaction((Transaction transactionHandler) {
    return Firestore.instance
        .collection(collection)
        .add(data);
  });
}


void incrementFirestore(String collection, String id, String fieldToIncrement) {
  final DocumentReference docRef = Firestore.instance.collection(collection).document(id);
  docRef.updateData({fieldToIncrement: FieldValue.increment(1)});
}

Future<void> deleteDocument(String collection, String documentID) async{
  return Firestore.instance
      .collection(collection)
      .document(documentID)
      .delete();
}



















//Future<DocumentReference> removeSpottedFromStore(context, String productID, storeID) async {
//  Map<String, dynamic> spottersList =   {
//    productID : FieldValue.arrayRemove([GlobalData.userId]),
//  };
//  Map<String, dynamic> data = {
//
//    'spotters' : spottersList,
//  };
//
//  updateFirestore(data, 'stores', storeID);
//  showDialog(
//    context: context,
//    builder: (_) => GeneralnfoPopup('Thanks!'),
//
//  );
//}


//Future<DocumentReference> addSpottedToStore(context, String productID, storeID) async {
//  Map<String, dynamic> spottersList =   {
//    productID : FieldValue.arrayUnion([GlobalData.userId]),
//  };
//  Map<String, dynamic> data = {
//
//    'spotters' : spottersList,
//  };
//
//  updateFirestore(data, 'stores', storeID);
//  showDialog(
//    context: context,
//    builder: (_) => GeneralnfoPopup('Thanks!'),
//
//  );
//}







