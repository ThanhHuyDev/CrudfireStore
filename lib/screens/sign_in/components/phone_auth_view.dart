import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/country.dart';
import '../../../utils/app_palette.dart';
import '../../../utils/constants.dart';
import '../../../utils/sizeconfig.dart';
import '../../../views/widgets/app_textfield.dart';
import '../cubits/sign_in_cubit.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
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
            SizedBox(height: size.height * 0.085),
            Text(
              'My mobile',
              style: themeData.textTheme.headline4
                  ?.copyWith(color: themeData.primaryColor),
            ),
            _buildViewMessage(context, themeData),
            const SizedBox(
              height: 20,
            ),
            _buildInput(context),
            const SizedBox(
              height: 20,
            ),
            _buildDisclaimer(context, themeData),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<SignInCubit>().sendOtp();
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: getsizeWidth(30), right: getsizeWidth(30)),
                decoration: BoxDecoration(
                    gradient: kPrimaryGradientLeftToRightColor,
                    border: Border.all(
                        color: Colors.black12, width: getsizeWidth(1)),
                    borderRadius: BorderRadius.circular(getsizeWidth(13))),
                width: double.infinity,
                height: getsizeHeight(50),
                child: Center(
                    child: Text(
                  'Continute',
                  style: TextStyle(
                      fontSize: getsizeHeight(17), color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

 AppTextField _buildInput(BuildContext context) {
    return AppTextField(
      prefix: CountryCodePicker(
        initialSelection: "VN",
        onChanged: (country) {
          context.read<SignInCubit>().countryChanged(
                Country(
                  dialCode: country.dialCode,
                  code: country.code,
                  name: country.name,
                ),
              );
        },
      ),
      onChanged: (value) {
        context.read<SignInCubit>().phoneNumberChanged(value);
      },
      hintText: 'phone number',
    );
  }

  Text _buildViewMessage(BuildContext context, ThemeData themeData) {
    return Text(
      'Please enter your valid phone number. We will\nsend you a 4 -digit code to verityt your account.',
      style: themeData.textTheme.bodyText1?.copyWith(
        color: themeData.textTheme.bodyText1?.color?.withOpacity(.7),
        fontSize: 15.0,
      ),
    );
  }

  RichText _buildDisclaimer(BuildContext context, ThemeData themeData) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By tapping continute you agress to out ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: 'Terms & conditions ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColorLight,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/terms_and_conditions");
              },
          ),
          TextSpan(
            text: 'and ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: 'privacy policy ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColorLight,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/privacy_policy");
              },
          ),
          TextSpan(
            text:
                'of ${AppConstants.appName}',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
