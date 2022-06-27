import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirestore/screens/home/home_screens.dart';
import 'package:crudfirestore/utils/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../chat_page/components/chat_message_page.dart';
import 'components/onloading_profile_screen.dart';

class ProfileFriend extends StatefulWidget {
  const ProfileFriend({Key? key, required this.documentSnapshot})
      : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  State<ProfileFriend> createState() =>
      _ProfileFriendState(documentSnapshot: documentSnapshot);
}

class _ProfileFriendState extends State<ProfileFriend> {
  final DocumentSnapshot documentSnapshot;
  _ProfileFriendState({required this.documentSnapshot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Image.network(documentSnapshot['imageAvatar'],fit: BoxFit.cover,)),
              StackInfomation(documentSnapshot: documentSnapshot)
            ],
          ),
      ),
    );
  }
}

class StackInfomation extends StatelessWidget {
  const StackInfomation({Key? key, required this.documentSnapshot})
      : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 1000,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Container icon
                const ButtonInfo(),
                //Container Name
                NameInfo(documentSnapshot: documentSnapshot),
                //Container Location
                const Location(),
                //Container About
                About(
                  documentSnapshot: documentSnapshot,
                ),
                //Container Interests
                const Interests(),
                //Container Gallery
                Gallery(
                  documentSnapshot: documentSnapshot,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonInfo extends StatelessWidget {
  const ButtonInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Button 1
          InkWell(
            onTap: (() => {Navigator.pop(context)}),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 28, top: 18, bottom: 18, right: 18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_back_ios,
                  color: Colors.orange, size: 30),
            ),
          ),
          //Button 2
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          //Button 3
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MessengerScreen()));
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 18, top: 18, bottom: 18, right: 18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.message,
                color: Colors.deepPurple,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameInfo extends StatelessWidget {
  const NameInfo({Key? key, required this.documentSnapshot}) : super(key: key);
  final DocumentSnapshot documentSnapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                documentSnapshot['firstName'] +
                    ", " +
                    documentSnapshot['dateOfBirthTimeMillis'].toString(),
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Student',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0)),
            child: const Padding(
              padding: EdgeInsets.only(left: 3),
              child: Icon(
                Icons.send_rounded,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adress',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Da Nang',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 194, 243),
                border:
                    Border.all(color: const Color.fromARGB(255, 227, 203, 244)),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Color(0xffA020F0),
                  size: 16.0,
                ),
                Text(
                  '1 Km',
                  style: TextStyle(color: Color(0xffA020F0), fontSize: 12.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key, required this.documentSnapshot}) : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 22.0,
                fontWeight: FontWeight.w700),
          ),
          ReadMoreText(
            documentSnapshot['bio'],
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            trimLines: 2,
            colorClickableText: const Color(0xffA020F0),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color(0xffA020F0)),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({Key? key, required this.documentSnapshot}) : super(key: key);
  final DocumentSnapshot documentSnapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gallery',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingProfileScreen(
                                documentSnapshot: documentSnapshot,
                              )));
                },
                child: const Text(
                  'see all',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA020F0)),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Image.network(
                    documentSnapshot['imageAvatar'],
                    fit: BoxFit.fill,
                  );
                }),
          ),
          const SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}

class Interests extends StatelessWidget {
  const Interests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interests',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 22.0,
                fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 1,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 10.0),
              itemBuilder: (context, index) {
                return Container(
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: kPrimaryGradientLeftToRightColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: const Text(
                    'Traveller',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
