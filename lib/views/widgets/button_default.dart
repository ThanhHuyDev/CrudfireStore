import 'package:flutter/material.dart';

import '../../utils/app_palette.dart';
import '../../utils/sizeconfig.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault({Key? key, this.press, this.title}) : super(key: key);
  final VoidCallback? press;
  final String? title;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: press!,
      child: Container(
        decoration: BoxDecoration(
            gradient: kPrimaryGradientLeftToRightColor,
            border: Border.all(color: Colors.black12, width: getsizeWidth(1)),
            borderRadius: BorderRadius.circular(getsizeWidth(13))),
        width: double.infinity,
        height: getsizeHeight(50),
        child: Center(
            child: Text(
          title!,
          style: TextStyle(fontSize: getsizeHeight(17), color: Colors.white),
        )),
      ),
    );
  }
}
