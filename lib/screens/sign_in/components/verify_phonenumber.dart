import 'package:crudfirestore/screens/sign_in/cubits/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_palette.dart';
import '../../../utils/constants.dart';
import '../../../utils/sizeconfig.dart';
import '../../../views/widgets/app_textfield.dart';

class VerifyPhone extends StatefulWidget {
  VerifyPhone({Key? key}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String code = '';

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode5 = FocusNode();
  final focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SizeConfig.init(context);
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.padding,
        vertical: AppConstants.padding,
      ),
      child: SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildHeader(themeData, context),
            const SizedBox(
              height: 30,
            ),
            _buildViewMessage(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildInput(context),
            const SizedBox(
              height: 10,
            ),
            _buildResendButton(context, themeData),
            const SizedBox(
              height: 10,
            ),
            _buildSubmitButton(context, themeData),
          ],
        ),
      ),
    ));
  }

  GestureDetector _buildSubmitButton(
      BuildContext context, ThemeData themeData) {
    return GestureDetector(
      onTap: () {
        context.read<SignInCubit>().verifyPhoneNumber();
      },
      child: Container(
        margin:
            EdgeInsets.only(left: getsizeWidth(30), right: getsizeWidth(30)),
        decoration: BoxDecoration(
            gradient: kPrimaryGradientLeftToRightColor,
            border: Border.all(color: Colors.black12, width: getsizeWidth(1)),
            borderRadius: BorderRadius.circular(getsizeWidth(13))),
        width: double.infinity,
        height: getsizeHeight(50),
        child: Center(
            child: Text(
          'Continute',
          style: TextStyle(fontSize: getsizeHeight(17), color: Colors.white),
        )),
      ),
    );
  }

  Row _buildResendButton(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.read<SignInCubit>().sendOtp();
          },
          child: Text(
            'resend code',
            style: themeData.textTheme.subtitle1
                ?.copyWith(color: themeData.primaryColorLight),
          ),
        ),
      ],
    );
  }

  Row _buildHeader(ThemeData themeData, BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: themeData.primaryColor,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Verify Otp',
          style: themeData.textTheme.headline1
              ?.copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Row _buildInput(BuildContext context) {
    return Row(
      children: [
        _getPinField(
          context: context,
          key: '1',
          focusNode: focusNode1,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '2',
          focusNode: focusNode2,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '3',
          focusNode: focusNode3,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '4',
          focusNode: focusNode4,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '5',
          focusNode: focusNode5,
        ),
        const SizedBox(width: 5.0),
        _getPinField(
          context: context,
          key: '6',
          focusNode: focusNode6,
        ),
      ],
    );
  }

  Expanded _getPinField({
    required BuildContext context,
    required String key,
    required FocusNode focusNode,
  }) {
    return Expanded(
      child: AppTextField(
        focusNode: focusNode,
        key: Key(key),
        inputType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (txt) {
          code += txt;
          code.trim();
          context.read<SignInCubit>().otpChanged(code);
          if (txt.length == 1) {
            switch (code.length) {
              case 1:
                FocusScope.of(context).requestFocus(focusNode2);
                break;
              case 2:
                FocusScope.of(context).requestFocus(focusNode3);
                break;
              case 3:
                FocusScope.of(context).requestFocus(focusNode4);
                break;
              case 4:
                FocusScope.of(context).requestFocus(focusNode5);
                break;
              case 5:
                FocusScope.of(context).requestFocus(focusNode6);
                break;
              default:
                FocusScope.of(context).unfocus();
                break;
            }
          }
        },
      ),
    );
  }

  BlocBuilder _buildViewMessage(BuildContext context, ThemeData themeData) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enter the verification code sent to',
                    style: themeData.textTheme.bodyText1?.copyWith(
                      color:
                          themeData.textTheme.bodyText1?.color?.withOpacity(.7),
                      fontSize: 15.0,
                    ),
                  ),
                  TextSpan(
                    text: '+84${state.phoneNumber}',
                    style: themeData.textTheme.bodyText1?.copyWith(
                      color: themeData.primaryColorLight.withOpacity(.7),
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            buildTimer(),
          ],
        );
      },
    );
  }
}

Widget buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "This code will expired in ",
        style: TextStyle(fontFamily: "Muli", fontSize: getsizeHeight(16)),
      ),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: const Duration(seconds: 30),
        builder: (_, dynamic value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(
              color: Colors.orange,
              fontFamily: "Muli",
              fontSize: getsizeHeight(16)),
        ),
      ),
    ],
  );
}
