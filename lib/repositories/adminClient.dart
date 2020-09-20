import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/models/adminModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminProductClient {
  AdminProductClient._();

  static final AdminProductClient adminClient = AdminProductClient._();
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;


  uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('product/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
    }
  }

  Future<String> addNewProductAdmin(AdminProductModel adminModel) async {
    try {
      DocumentReference documentReference =
          await firestore.collection('product').add(adminModel.toJson());
      return documentReference.documentID;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getAllProductAdmin() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('product').getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  editProductFS(AdminProductModel adminProductModel) async {
    await firestore
        .collection('product')
        .document(adminProductModel.documentId)
        .updateData(adminProductModel.toJson());
  }

  deleteProductFS(String iD) async {
    try {
      await firestore.collection('product').document(iD).delete();
    } catch (e) {
      print(e);
    }
  }
}
//TODO:'complete this'
