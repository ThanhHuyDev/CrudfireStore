import 'package:crudfirestore/screens/home/pages/account_page/account_page.dart';
import 'package:crudfirestore/screens/home/pages/chat_page/chat_page.dart';
import 'package:crudfirestore/screens/home/pages/explore_page/explore_page.dart';
import 'package:crudfirestore/screens/home/pages/like_page/like_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/sizeconfig.dart';

class HomeScreens extends StatefulWidget {
  HomeScreens({Key? key}) : super(key: key);
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: getBody(),
      resizeToAvoidBottomInset: false,
      bottomSheet: getFooter(),
    );
  }

  SafeArea getBody() {
    return SafeArea(
      child: Column(
        children: [
          getAppbar(),
          Expanded(
            child: IndexedStack(
              index: pageIndex,
              children: const [
                ExplorePage(),
                LikesPage(),
                ChatPage(),
                AccountPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getAppbar() {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.only(bottom: 0.4),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 0.75)),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 45,
              child: Image.asset(
                'assets/images/logo_slove_small.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    size: getsizeHeight(30),
                    color: Colors.deepPurple,
                  )))
        ],
      ),
    );
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      pageIndex == 1
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      pageIndex == 2
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 3
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(4, 4)),
        ],
      ),
      width: SizeConfig.screenWidth,
      height: getsizeHeight(55),
      child: Padding(
        padding:
            EdgeInsets.only(left: getsizeWidth(10), right: getsizeWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(
                bottomItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
