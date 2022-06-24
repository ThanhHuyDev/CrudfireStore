import 'package:flutter/material.dart';
import '../../utils/app_palette.dart';
import '../../utils/sizeconfig.dart';
import 'components/custom_appbar.dart';

class ProfileUserPic extends StatelessWidget {
  const ProfileUserPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(SizeConfig.screenWidth, getsizeHeight(60))),
          gradient: kPrimaryGradientRightToLeftColorUser),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppbarCustomUser(title: 'Profile',press: (){
            Navigator.pop(context);
          },),
          SizedBox(height: getsizeHeight(20),),
          Stack(
            clipBehavior: Clip.none,
            children: [
               CircleAvatar(
                radius: getsizeHeight(60),
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: getsizeHeight(59),
                  backgroundColor: const Color.fromARGB(255, 196, 73, 237),
                  backgroundImage: const NetworkImage(
                      'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg'),
                ),
              ),
              Positioned(
                bottom: getsizeHeight(0),
                right: getsizeWidth(0),
                child: CircleAvatar(
                    radius: getsizeHeight(20),
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      size: getsizeHeight(20),
                      color: Colors.deepPurple,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: getsizeHeight(15),
          ),
          Text(
            " Anna, 22",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getsizeHeight(20),
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
