import 'package:flutter/material.dart';

import '../../../../utils/sizeconfig.dart';
import 'components/footer_tinder.dart';
import 'components/tinder_swapcard.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: getBody(),
    );
  }
  Widget getBody() {
    return Column(
      children: [
        SizedBox(height: getsizeHeight(10)),
        const TinderCard(),
        SizedBox(height: getsizeHeight(10)),
        const FooterTinder(),
        SizedBox(height: getsizeHeight(10)),
      ],
    );
  }
}
