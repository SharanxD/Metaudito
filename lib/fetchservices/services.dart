
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/app_state.dart';
import 'package:finalproject/modals/data.dart';
class Services{
  final FirebaseFirestore firestore= FirebaseFirestore.instance;
  Future<void> requestData(ServiceDataItem newItem) async{
    Map<String,dynamic> obj ={
      "title":newItem.title,
      "Date":newItem.Date,
      "AuditorName":newItem.AuditorName,
      "AuditorContact":newItem.AuditorContact,
      "CompanyName":newItem.CompanyName,
      "CompanyContact":newItem.CompanyContact,
      "id": newItem.id
    };
    String docid=newItem.id;
    final DocumentReference tasksRef = firestore.collection("services").doc(docid);
    await tasksRef.set(obj);
  }
  Future<void> updateData(ServiceDataItem currentItem) async{

  }
  Future<List> fetchData() async{
    List<ServiceDataItem> servicedata = [];
    final snapshot= await firestore.collection("services").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    for (DocumentSnapshot element in documents) {
        servicedata.add(
          ServiceDataItem(title: element["title"], Date: element["Date"], AuditorName: element["AuditorName"], AuditorContact: element["AuditorContact"], CompanyName: element["CompanyName"], CompanyContact: element["CompanyContact"], id: element["title"]+element["Date"])
        );
    }
  return servicedata;
  }
Future<void>deleteItem(String documentId) async{
  final DocumentReference documentReference =
  firestore.collection('services').doc(documentId);
  await documentReference.delete();
}
}
//{"title":"Event 1","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},