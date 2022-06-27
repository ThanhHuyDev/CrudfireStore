import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../models/slider.dart';

class OnboardingProfileScreen extends StatefulWidget {
  const OnboardingProfileScreen({Key? key,required this.documentSnapshot}) : super(key: key);
    final DocumentSnapshot documentSnapshot;

  @override
  State<OnboardingProfileScreen> createState() => _OnboardingScreenState(documentSnapshot: documentSnapshot);
}

class _OnboardingScreenState extends State<OnboardingProfileScreen> {
  int? _currentPage;
  final PageController _pagecontroller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pagecontroller.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  bool inFinalPage() {
    if (_currentPage == 5 - 1) {
      return true;
    } else {
      return false;
    }
  }
   final DocumentSnapshot documentSnapshot;
   _OnboardingScreenState({required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              //Container Item image
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.82,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pagecontroller,
                  onPageChanged: _onPageChanged,
                  itemCount: 5,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(documentSnapshot['imageAvatar']),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //Container Item slider
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 5; i++)
                      if (i == _currentPage)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          margin: const EdgeInsets.symmetric(horizontal: 3.2),
                          height: 80.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                documentSnapshot['imageAvatar'],
                              ),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        )
                      else
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          margin: const EdgeInsets.symmetric(horizontal: 3.2),
                          height: 60.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                opacity: 0.3,
                                fit: BoxFit.cover,
                                image: NetworkImage (
                                    documentSnapshot['imageAvatar'])),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(30.0),
                  height: 52.0,
                  width: 52.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white54),
                      color: Colors.white.withOpacity(0.2)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
