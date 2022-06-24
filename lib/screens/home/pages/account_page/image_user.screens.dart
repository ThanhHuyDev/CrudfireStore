import 'package:crudfirestore/screens/home/pages/account_page/custom_image.dart';
import 'package:crudfirestore/utils/app_palette.dart';
import 'package:flutter/material.dart';

class ImageUserScreens extends StatelessWidget {
  const ImageUserScreens({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
          SizedBox(width: double.infinity,height: 60,
          child: Stack(
            children: [
              const Center(child: Text('Image User',style: TextStyle(color: Colors.black,fontSize: 30),)),
              Positioned(
                top: 10,
                right: 5,
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradientLeftToRightColor,
                      borderRadius: BorderRadius.circular(5)),
                    width: 40,height: 30,child: const Center(child: Text('save',style: TextStyle(color: Colors.white),)),),
                ))
            ],
          ),),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[
              CustomImageContainer(),
            ],
          ),
          const SizedBox(height: 30,),
          Row(children: [
            
          ],),
          const SizedBox(height: 30,)
        ]),
      ),
    );
  }
}
