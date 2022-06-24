import 'package:flutter/material.dart';

import '../../../utils/sizeconfig.dart';

class InfomationUser extends StatelessWidget {
  InfomationUser({Key? key, this.name, this.title}) : super(key: key);
  String? name;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getsizeHeight(60),
      padding: EdgeInsets.symmetric(
          horizontal: getsizeWidth(10)),
      margin: EdgeInsets.symmetric(vertical: getsizeHeight(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getsizeWidth(10)),
          border: Border.all(width: 1, color: Colors.black26)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name!,
            style: TextStyle(fontSize: getsizeHeight(18), color: Colors.black),
          ),
          const Spacer(),
          Text(
            title!,
            style:
                TextStyle(fontSize: getsizeHeight(18), color: Colors.black26),
          )
        ],
      ),
    );
  }
}
