import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/models/adminModel.dart';

import 'adminClient.dart';

class AdminRepository {
  AdminRepository._();

  static AdminRepository adminRepository = AdminRepository._();

  Future<List<AdminProductModel>> getAllProductAdmin() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminProductClient.adminClient.getAllProductAdmin();
      List<AdminProductModel> allAdminModel =
          documents.map((e) => AdminProductModel.fromJson(e)).toList();
      return allAdminModel;
    } catch (error) {
      print(error);
    }
  }


}
