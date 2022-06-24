import 'package:crudfirestore/screens/profile_user/profile_user_img.dart';
import 'package:crudfirestore/screens/sign_in/cubits/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/authentication/authentication_bloc.dart';
import '../../providers/authentication_provider.dart';
import '../../utils/sizeconfig.dart';
import '../../widgets/button_default.dart';
import 'components/infomation_plan.dart';
import 'components/infomation_user copy.dart';
import 'components/settings_user.dart';

class BodyProfileUser extends StatefulWidget {
  const BodyProfileUser({Key? key}) : super(key: key);

  @override
  State<BodyProfileUser> createState() => _BodyProfileUserState();
}

class _BodyProfileUserState extends State<BodyProfileUser> {
  RangeValues values = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileUserPic(),
            SizedBox(
              height: getsizeHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Settings",
                        style: TextStyle(
                            fontSize: getsizeHeight(22),
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const Spacer(),
                      Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: getsizeHeight(20),
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfomationUser(
                    name: 'Name',
                    title: 'Anna',
                  ),
                  InfomationUser(
                    name: 'Phone Number',
                    title: '+84789472953',
                  ),
                  InfomationUser(
                    name: 'Date of Birthday',
                    title: '22/02/2000',
                  ),
                  InfomationUser(
                    name: 'Email',
                    title: 'abcd@gmail.com',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getsizeHeight(10)),
                    child: Text(
                      "Plan Settings",
                      style: TextStyle(
                          fontSize: getsizeHeight(20),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfomationPlan(
                    name: 'Current Plan',
                    title: 'Free',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: const [
                        Text(
                          "Discovery Settings",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfomationPlan(
                    name: 'Location',
                    title: 'My Current Location',
                  ),
                  InfomationPlan(
                    name: 'Preferred Languages',
                    title: 'English',
                  ),
                  InfomationPlan(
                    name: 'Show Me',
                    title: 'Man',
                  ),
                  SettingsUser(
                    name: 'Age Range',
                    title: '22-34',
                  ),
                  SettingsUser(
                    name: 'Maximum Distance',
                    title: '100km',
                  ),
                  SizedBox(
                    height: getsizeHeight(20),
                  ),
                  ButtonDefault(
                    press: () async{
                     await AuthenticationProvider().signOut();
                    },
                    title: 'Logout',
                  ),
                  SizedBox(
                    height: getsizeHeight(20),
                  ),
                  ButtonDefault(
                    press: () {},
                    title: 'Delete Account',
                  ),
                  SizedBox(
                    height: getsizeHeight(20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
