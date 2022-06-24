import 'package:country_code_picker/country_code_picker.dart';
import 'package:crudfirestore/widgets/button_default.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/country.dart';
import '../../../utils/constants.dart';
import '../../../widgets/app_textfield.dart';
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
                  ?.copyWith(color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 10,
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
            ButtonDefault(
              press: () {
                context.read<SignInCubit>().sendOtp();
              },
              title: 'Continute',)
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
      hintText: ' Input phone number',
    );
  }

  Text _buildViewMessage(BuildContext context, ThemeData themeData) {
    return Text(
      'Please enter your valid phone number. We will\nsend you a 6 -digit code to verityt your account.',
      style: themeData.textTheme.bodyText1?.copyWith(
        color: themeData.textTheme.bodyText1?.color?.withOpacity(.7),
        fontSize: 14.0,
      ),
    );
  }

  RichText _buildDisclaimer(BuildContext context, ThemeData themeData) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bạn nhấn tiếp tục, tức là bạn đồng ý với ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: 'chính sách bảo mật ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/terms_and_conditions");
              },
          ),
          TextSpan(
            text: '& ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
            ),
          ),
          TextSpan(
            text: 'điều khoản sử dụng ',
            style: themeData.textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: themeData.primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/privacy_policy");
              },
          ),
          TextSpan(
            text:
                'của ${AppConstants.appName}',
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
