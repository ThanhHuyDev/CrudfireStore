import 'package:flutter/material.dart';
import '../../../../database/data.dart';
import '../../../../utils/sizeconfig.dart';
import 'components/chat_message_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        title_Messenger(),
        SizedBox(
          height: getsizeHeight(6),
        ),
        const Divider(
          thickness: 0.4,
        ),
        SizedBox(
          height: getsizeHeight(5),
        ),
        search_Messenger(),
        SizedBox(
          height: getsizeHeight(12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getsizeWidth(15)),
              child: Text(
                "New Matches",
                style: TextStyle(
                  fontSize: getsizeHeight(16),
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: getsizeHeight(20)),
            list_PersonMessenger(),
            SizedBox(height: getsizeHeight(15)),
            list_Messenger(size),
          ],
        ),
        SizedBox(height: getsizeHeight(60)),
      ],
    );
  }

  Widget list_Messenger(Size size) {
    return Padding(
      padding: EdgeInsets.only(
        left: getsizeWidth(15),
      ),
      child: Column(
        children: List.generate(userMessages.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: getsizeHeight(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessengerScreen()));
              },
              child: Row(
                children: [
                  SizedBox(
                    width: getsizeWidth(70),
                    height: getsizeHeight(70),
                    child: Stack(
                      children: [
                        userMessages[index]['story']
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: getsizeWidth(3),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(getsizeHeight(3)),
                                  child: Container(
                                    width: getsizeWidth(70),
                                    height: getsizeHeight(70),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            userMessages[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: getsizeWidth(70),
                                height: getsizeHeight(70),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage(userMessages[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        Positioned(
                          bottom: getsizeHeight(3),
                          right: getsizeWidth(3),
                          child: Container(
                              width: getsizeWidth(20),
                              height: getsizeHeight(20),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: getsizeWidth(3),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getsizeWidth(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userMessages[index]['name'],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size.width - 135,
                        child: Text(
                          userMessages[index]['message'] +
                              " - " +
                              userMessages[index]['created_at'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget list_PersonMessenger() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: getsizeWidth(15)),
        child: Row(
          children: List.generate(chats_json.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: getsizeWidth(20)),
              child: Column(
                children: [
                  SizedBox(
                    width: getsizeWidth(70),
                    height: getsizeHeight(70),
                    child: Stack(
                      children: [
                        chats_json[index]['story']
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: getsizeWidth(3),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(getsizeHeight(3)),
                                  child: Container(
                                    width: getsizeWidth(70),
                                    height: getsizeHeight(70),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            chats_json[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: getsizeWidth(70),
                                height: getsizeHeight(70),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(chats_json[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        Positioned(
                          bottom: getsizeHeight(3),
                          right: getsizeWidth(3),
                          child: Container(
                              width: getsizeWidth(20),
                              height: getsizeHeight(20),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: getsizeWidth(3),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getsizeHeight(5),
                  ),
                  SizedBox(
                    width: getsizeHeight(70),
                    child: Align(
                      child: Text(chats_json[index]['name'],
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget search_Messenger() {
    return Padding(
      padding: EdgeInsets.only(left: getsizeWidth(10), right: getsizeWidth(10)),
      child: Container(
        height: getsizeHeight(45),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(getsizeWidth(5))),
        child: TextField(
          style: TextStyle(fontSize: getsizeHeight(15)),
          cursorColor: Colors.black.withOpacity(0.5),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.3),
              ),
              hintText: "Search",
              hintStyle: TextStyle(fontSize: getsizeHeight(15))),
        ),
      ),
    );
  }

  Widget title_Messenger() {
    return Padding(
      padding: EdgeInsets.only(top: getsizeHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Messages",
            style: TextStyle(
                fontSize: getsizeHeight(18),
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          Container(
            height: getsizeHeight(25),
            width: getsizeWidth(1),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
          ),
          Text(
            "Matches",
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: getsizeHeight(18),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
