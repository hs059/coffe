

import 'package:coffe/provider/adminProvider.dart';
import 'package:coffe/ui/admin/widgets/viewImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Consumer<AdminProductProvider>(builder: (context, value, child) {
            List<String> imageList = value.imagesList ;
            return ViewImage(imageList);
          },)
        ],
      ),
    );
  }
}
