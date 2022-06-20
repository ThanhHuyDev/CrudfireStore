import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirestore/screens/setting_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import '../../utils/sizeconfig.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _likes = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _name.text = documentSnapshot['name'];
      _age.text = documentSnapshot['age'].toString();
      _image.text = documentSnapshot['image'];
      _likes.text = documentSnapshot['likes'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ct) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ct).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _age,
                  decoration: const InputDecoration(labelText: 'age'),
                ),
                TextField(
                  controller: _image,
                  decoration: const InputDecoration(labelText: 'image'),
                ),
                TextField(
                  controller: _likes,
                  decoration: const InputDecoration(labelText: 'like'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple[200]),
                      onPressed: () async {
                        final String name = _name.text;
                        final int? age = int.tryParse(_age.text);
                        final String image = _image.text;
                        final String like = _likes.text;
                        if (age != null) {
                          await _user.doc(documentSnapshot!.id).update({
                            "name": name,
                            "age": age,
                            "image": image,
                            "likes": like
                          });
                          _name.text = '';
                          _age.text = '';
                          _image.text = '';
                          _likes.text = '';
                        }
                      },
                      child: const Text('update')),
                )
              ],
            ),
          );
        });
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _name.text = documentSnapshot['name'];
      _age.text = documentSnapshot['age'].toString();
      _image.text = documentSnapshot['image'];
      _likes.text = documentSnapshot['likes'];
    }
    _name.text = '';
    _age.text = '';
    _image.text = '';
    _likes.text = '';

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ct) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ct).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _age,
                  decoration: const InputDecoration(labelText: 'age'),
                ),
                TextField(
                  controller: _image,
                  decoration: const InputDecoration(labelText: 'image'),
                ),
                TextField(
                  controller: _likes,
                  decoration: const InputDecoration(labelText: 'like'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple[200]),
                      onPressed: () async {
                        final String name = _name.text;
                        final int? age = int.tryParse(_age.text);
                        final String image = _image.text;
                        final String like = _likes.text;
                        if (age != null) {
                          await _user.add({
                            "name": name,
                            "age": age,
                            "image": image,
                            "likes": like
                          });
                          _name.text = '';
                          _age.text = '';
                          _image.text = '';
                          _likes.text = '';
                        }
                      },
                      child: const Text('add')),
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String userId) async {
    await _user.doc(userId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have successfully delete a user')));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple[200],
          onPressed: (() => _create()),
          child: const Text('add')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getsizeHeight(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Tinder',style: TextStyle(fontSize: getsizeHeight(35),color: Colors.red),),
                    Positioned(top: 0,right:0,child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreens()));
                    }, icon: Icon(Icons.settings,size: getsizeHeight(30),color: Colors.red,)))
                
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: getsizeHeight(25)),
              child: StreamBuilder(
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
                                            color: Colors.grey.withOpacity(0.8),
                                            blurRadius: 5,
                                            spreadRadius: 2,
                                            offset: const Offset(4, 4)),
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
                                            child: info_TinderSwapCard(
                                                documentSnapshot),
                                          ),
                                          Positioned(
                                            top: 3,right: 3,
                                            child: deleteUser(documentSnapshot.id),
                                          )
                                        ],
                                      ),
                                    ));
                              }));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  Widget deleteUser(String id){
    return IconButton(
      onPressed: () => _delete(id),
      icon: Icon(Icons.delete_forever_outlined,color: Colors.red[300],size: getsizeHeight(33),));
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
                  onTap: () {},
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
                      _update(documentSnapshot);
                    },
                    icon: Icon(
                      Icons.insert_emoticon,
                      color: Colors.deepPurple,
                      size: getsizeHeight(35),
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
  // Widget info_Likes(DocumentSnapshot documentSnapshot) {
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
  //                 documentSnapshot['likes'][indexLikes],
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
  //               documentSnapshot['likes'][indexLikes],
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
