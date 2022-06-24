import 'package:flutter/material.dart';
import '../../../utils/sizeconfig.dart';

class AppbarCustomUser extends StatelessWidget {
  AppbarCustomUser({Key? key, this.title,this.press}) : super(key: key);
  String? title;
  VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getsizeHeight(50),
      child: Stack(
        children: [
          Center(
            child: Text(
              title!,
              style: TextStyle(fontSize: getsizeHeight(20), color: Colors.white),
            ),
          ),
          Positioned(
            left: getsizeWidth(10),
            top: getsizeHeight(5),
            child: IconButton(
              onPressed: press!,
              icon : Icon(
                Icons.arrow_back,
                size: getsizeHeight(20),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
