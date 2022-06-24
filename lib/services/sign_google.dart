import 'package:country_code_picker/country_code_picker.dart';
import 'package:crudfirestore/services/auth_sevices.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_palette.dart';
import '../utils/constants.dart';
import '../utils/sizeconfig.dart';
import '../widgets/app_textfield.dart';

class SignGoogle extends StatelessWidget {
  const SignGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: kPrimaryGradientTopToBotColor),
      height: SizeConfig.screenHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getsizeHeight(100),
            ),
        
            SizedBox(
              height: getsizeHeight(100),
            ),
            SizedBox(
              height: getsizeHeight(40),
            ),
            GestureDetector(
              onTap: () async{
                await AuthSevice().signInWithGoogle();
              },
              child: Container(
                  margin: EdgeInsets.only(
                      left: getsizeWidth(30), right: getsizeWidth(30)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(getsizeWidth(30)),
                      border: Border.all(width: 1, color: Colors.black12)),
                  width: double.infinity,
                  height: getsizeHeight(50),
                  child: Stack(
                    children: [
                      Center(
                          child: Text("LOGIN WITH GOOGLE+",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: getsizeHeight(16)))),
                      Positioned(
                          left: getsizeWidth(20),
                          top: getsizeHeight(14),
                          child: SvgPicture.asset(
                            'assets/icons/ic_google.svg',
                            height: getsizeHeight(20),
                            width: getsizeWidth(20),
                          ))
                    ],
                  )),
            ),
            SizedBox(
              height: getsizeHeight(20),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(
                      left: getsizeWidth(30), right: getsizeWidth(30)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(getsizeWidth(30)),
                      border: Border.all(
                          width: getsizeWidth(1), color: Colors.black12)),
                  width: double.infinity,
                  height: getsizeHeight(50),
                  child: Stack(
                    children: [
                      Center(
                          child: Text("LOGIN WITH FACEBOOK",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: getsizeHeight(16)))),
                      Positioned(
                          left: getsizeWidth(20),
                          top: getsizeHeight(14),
                          child: SvgPicture.asset(
                            'assets/icons/ic_facebook.svg',
                            width: getsizeWidth(20),
                            height: getsizeHeight(20),
                          ))
                    ],
                  )),
            ),
            SizedBox(
              height: getsizeHeight(20),
            ),
            GestureDetector(
              onTap: (() {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SignInPhoneScreens()));
              }),
              child: Container(
                  margin: EdgeInsets.only(
                      left: getsizeWidth(30), right: getsizeWidth(30)),
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradientLeftToRightColor,
                      borderRadius: BorderRadius.circular(getsizeWidth(30))),
                  width: double.infinity,
                  height: getsizeHeight(50),
                  child: Stack(
                    children: [
                      Center(
                          child: Text("LOGIN WITH PHONE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getsizeHeight(16)))),
                      Positioned(
                          left: getsizeWidth(20),
                          top: getsizeHeight(14),
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: getsizeHeight(20),
                          ))
                    ],
                  )),
            ),
            SizedBox(
              height: getsizeHeight(150),
            ),
            GestureDetector(
              onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SignInPhoneScreens()));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Bạn đồng ý với ',
                          style: themeData.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                          ),
                        ),
                        TextSpan(
                          text: 'chính sách bảo mật ',
                          style: themeData.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                            color: themeData.primaryColorLight,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, "/terms_and_conditions");
                            },
                        ),
                        TextSpan(
                          text: '& ',
                          style: themeData.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                          ),
                        ),
                        TextSpan(
                          text: 'điều khoản sử dụng ',
                          style: themeData.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                            color: themeData.primaryColorLight,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/privacy_policy");
                            },
                        ),
                        TextSpan(
                          text: 'của ${AppConstants.appName}',
                          style: themeData.textTheme.subtitle2?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
