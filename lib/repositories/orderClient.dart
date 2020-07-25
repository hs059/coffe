import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/models/order.dart';

class OrderClient {
  OrderClient._();

  static final OrderClient orderClient = OrderClient._();
  Firestore firestore = Firestore.instance;

  addNewOrder(Map<String, dynamic> map) async {
    try {
      await firestore.collection('orders').add(map);
    } catch (e) {
      print(e);
    }
  }

  Future<QuerySnapshot> getQuerySnapshotOrder() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection('orders')
        .where('userId', isEqualTo: await Auth.auth.getUserId())
        .getDocuments();
    return querySnapshot;
  }
  Future<QuerySnapshot> getQuerySnapshotOrderAdmin() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection('orders')
        .getDocuments();
    return querySnapshot;
  }




  deleteOrder(String iD) async {
    try {
      await firestore.collection('orders').document(iD).delete();
    } catch (e) {
      print(e);
    }
  }

  deleteAllOrder() async {
    try {
      QuerySnapshot querySnapshot = await getQuerySnapshotOrder();

      for (DocumentSnapshot dd in querySnapshot.documents) {
        await deleteOrder(dd.documentID);
      }
    } catch (e) {
      print(e);
    }
  }
}
