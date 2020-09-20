import 'package:coffe/provider/adminProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ViewImage extends StatefulWidget {
  List<String> list;
  ViewImage(this.list);
  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200, // card height
        child: PageView.builder(
          itemCount: widget.list.length,
          controller: PageController(viewportFraction: 0.7),
          onPageChanged: (int index) {
            _index = index ;

            setState(() {

            });
          },
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.8,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      child: Image(image: AssetImage(widget.list[i]),)
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//ToDO:'complete this  '