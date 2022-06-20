import 'package:crudfirestore/screens/home/pages/account_page/account_page.dart';
import 'package:crudfirestore/screens/home/pages/chat_page/chat_page.dart';
import 'package:crudfirestore/screens/home/pages/explore_page/explore_page.dart';
import 'package:crudfirestore/screens/home/pages/like_page/like_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/sizeconfig.dart';
class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }
  
  IndexedStack getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ExplorePage(),
        LikesPage(),
        ChatPage(),
        ChatPage(),
        AccountPage(),
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset('assets/images/logo_slove_black.png', height: getsizeHeight(140)),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined,size: getsizeHeight(28),color: Colors.deepPurple,))],
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
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      color: Colors.white,
      width: SizeConfig.screenWidth,
      height: getsizeHeight(55),
      child: Padding(
        padding: EdgeInsets.only(left: getsizeWidth(10), right: getsizeWidth(10)),
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