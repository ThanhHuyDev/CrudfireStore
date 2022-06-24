import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import '../../../../../utils/sizeconfig.dart';
import '../../profile_friend_page/profile_myfriend_screen.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({Key? key}) : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('users');
  Future<void> _delete(String userId) async {
    await _user.doc(userId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have successfully delete a user')));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _user.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return SizedBox(
                height: SizeConfig.screenHeight / 1.4,
                child: TinderSwapCard(
                    totalNum: streamSnapshot.data!.docs.length,
                    maxWidth: SizeConfig.screenWidth,
                    maxHeight: SizeConfig.screenHeight,
                    minWidth: SizeConfig.screenWidth * 0.7,
                    minHeight: SizeConfig.screenHeight * 0.5,
                    cardBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(getsizeWidth(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: const Offset(3, 3)),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.screenHeight,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['imageAvatar']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.screenHeight,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.5),
                                        Colors.black.withOpacity(0),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: info_TinderSwapCard(documentSnapshot),
                                ),
                              ],
                            ),
                          ));
                    }));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget deleteUser(String id) {
    return IconButton(
        onPressed: () => _delete(id),
        icon: Icon(
          Icons.delete_forever_outlined,
          color: Colors.red[300],
          size: getsizeHeight(33),
        ));
  }

  Widget info_TinderSwapCard(DocumentSnapshot documentSnapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(getsizeHeight(15)),
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProfileFriend(
                    //               index: index,
                    //             )
                    //             )
                    //             );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      info_NameAdress(documentSnapshot),
                      SizedBox(
                        height: getsizeHeight(6),
                      ),
                      info_Active(),
                      SizedBox(
                        height: getsizeHeight(10),
                      ),
                      info_Likes(documentSnapshot),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: getsizeHeight(60), left: getsizeWidth(35)),
                  width: SizeConfig.screenWidth * 0.2,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileFriend(
                                    documentSnapshot: documentSnapshot,
                                  )));
                    },
                    icon: Icon(
                      Icons.insert_emoticon,
                      color: Colors.white,
                      size: getsizeHeight(34),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget info_Likes(DocumentSnapshot documentSnapshot) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: getsizeWidth(2)),
          borderRadius: BorderRadius.circular(getsizeWidth(30)),
          color: Colors.white.withOpacity(0.4)),
      child: Padding(
        padding: EdgeInsets.only(
            top: getsizeHeight(3),
            bottom: getsizeHeight(3),
            left: getsizeWidth(10),
            right: getsizeWidth(10)),
        child: Text(
          documentSnapshot['bio'],
          style: TextStyle(color: Colors.white, fontSize: getsizeHeight(14)),
        ),
      ),
    );
  }

  // Widget info_Likes(int index) {
  //   return Row(
  //     children: List.generate(2, (indexLikes) {
  //       if (indexLikes == 0) {
  //         return Padding(
  //           padding: EdgeInsets.only(right: getsizeWidth(8)),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 border:
  //                     Border.all(color: Colors.white, width: getsizeWidth(2)),
  //                 borderRadius: BorderRadius.circular(getsizeWidth(30)),
  //                 color: Colors.white.withOpacity(0.4)),
  //             child: Padding(
  //               padding: EdgeInsets.only(
  //                   top: getsizeHeight(3),
  //                   bottom: getsizeHeight(3),
  //                   left: getsizeWidth(10),
  //                   right: getsizeWidth(10)),
  //               child: Text(
  //                 itemsTemp[index]['likes'][indexLikes],
  //                 style: TextStyle(
  //                     color: Colors.white, fontSize: getsizeHeight(14)),
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //       return Padding(
  //         padding: EdgeInsets.only(right: getsizeHeight(8)),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(getsizeWidth(30)),
  //               color: Colors.white.withOpacity(0.2)),
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //                 top: getsizeHeight(3),
  //                 bottom: getsizeHeight(3),
  //                 left: getsizeWidth(10),
  //                 right: getsizeWidth(10)),
  //             child: Text(
  //               itemsTemp[index]['likes'][indexLikes],
  //               style:
  //                   TextStyle(color: Colors.white, fontSize: getsizeHeight(14)),
  //             ),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }

  Widget info_Active() {
    return Row(
      children: [
        Container(
          width: getsizeWidth(10),
          height: getsizeHeight(10),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: getsizeWidth(10),
        ),
        Text(
          "Recently Active",
          style: TextStyle(
            fontSize: getsizeHeight(16),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget info_NameAdress(DocumentSnapshot documentSnapshot) {
    return Row(
      children: [
        Text(
          documentSnapshot['firstName'],
          style: TextStyle(
              fontSize: getsizeHeight(24),
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: getsizeWidth(10),
        ),
        Text(
          documentSnapshot['dateOfBirthTimeMillis'].toString(),
          style: TextStyle(
            fontSize: getsizeHeight(22),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
