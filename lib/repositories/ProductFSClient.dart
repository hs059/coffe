import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/auth.dart';
import 'package:coffe/models/productFS.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductFSClient {
  ProductFSClient._();

  static final ProductFSClient orderClient = ProductFSClient._();
  Firestore firestore = Firestore.instance;

  uploadImage()async{
    FirebaseStorage firebaseStorage =FirebaseStorage.instance ;

  }

  Future<String> addNewProductFS(ProductFS productFS) async {
    try {
      DocumentReference documentReference = await firestore.collection('product').add(productFS.toJson());
      return documentReference.documentID ;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getAllProductFS()async{
    try{
      QuerySnapshot querySnapshot = await firestore.collection('product').getDocuments();
      return  querySnapshot.documents;
    }catch(error){
      print(error);
    }

  }
  editProductFS(ProductFS productFS)async{
    await firestore.collection('product').document(productFS.documentId).updateData(productFS.toJson()) ;
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