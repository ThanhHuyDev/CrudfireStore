const List item_icons = [
  {"icon": "assets/images/refresh_icon.svg", "size": 45.0, "icon_size": 20.0},
  {"icon": "assets/images/close_icon.svg", "size": 58.0, "icon_size": 25.0},
  {"icon": "assets/images/star_icon.svg", "size": 45.0, "icon_size": 25.0},
  {"icon": "assets/images/like_icon.svg", "size": 57.0, "icon_size": 27.0},
  {"icon": "assets/images/thunder_icon.svg", "size": 45.0, "icon_size": 17.0}
];
const List explore_json = [
  {
    "img": "assets/images/girls/img_1.jpeg",
    "name": "Ayo",
    "age": "20",
    "likes": ["Dancing", "Cooking", "Art"],
  },
  {
    "img": "assets/images/girls/img_2.jpeg",
    "name": "Rondeau",
    "age": "18",
    "likes": ["Instagram", "Cooking"],
  },
  {
    "img": "assets/images/girls/img_3.jpeg",
    "name": "Valerie",
    "age": "22",
    "likes": ["Instagram", "Netflix", "Comedy"],
  },
  {
    "img": "assets/images/girls/img_4.jpeg",
    "name": "Mary",
    "age": "22",
    "likes": ["Travel", "Fashion", "Reading"],
  },
  {
    "img": "assets/images/girls/img_5.jpeg",
    "name": "Angie",
    "age": "18",
    "likes": ["Model", "Fashion", "Working Out"],
  },
  {
    "img": "assets/images/girls/img_6.jpeg",
    "name": "Anne",
    "age": "19",
    "likes": ["Shopping", "Travel", "Cat lover"],
  },
  {
    "img": "assets/images/girls/img_7.jpeg",
    "name": "Fineas",
    "age": "20",
    "likes": ["Model", "Nature", "Instagram"],
  },
  {
    "img": "assets/images/girls/img_8.jpeg",
    "name": "Atikh",
    "age": "18",
    "likes": ["Cooking", "Art", "Working Out"],
  },
  {
    "img": "assets/images/girls/img_9.jpeg",
    "name": "Campbell",
    "age": "18",
    "likes": ["Swimming", "Working Out"],
  },
  {
    "img": "assets/images/girls/img_10.jpeg",
    "name": "Maya",
    "age": "19",
    "likes": ["Swag", "Dancing"],
  },
];
const List likes_json = [
  {"img": "assets/images/girls/img_11.jpeg", "active": true},
  {"img": "assets/images/girls/img_12.jpeg", "active": false},
  {"img": "assets/images/girls/img_13.jpeg", "active": false},
  {"img": "assets/images/girls/img_14.jpeg", "active": true},
  {"img": "assets/images/girls/img_15.jpeg", "active": true},
  {"img": "assets/images/girls/img_16.jpeg", "active": true},
];
// users story list
const List chats_json = [
  {
    "img": "assets/images/girls/img_1.jpeg",
    "name": "Ayo",
    "online": true,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_2.jpeg",
    "name": "Rondeau",
    "online": true,
    "story": false,
  },
  {
    "img": "assets/images/girls/img_3.jpeg",
    "name": "Valerie",
    "online": true,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_4.jpeg",
    "name": "Mary",
    "online": false,
    "story": false,
  },
  {
    "img": "assets/images/girls/img_5.jpeg",
    "name": "Angie",
    "online": true,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_6.jpeg",
    "name": "Anne",
    "online": false,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_7.jpeg",
    "name": "Fineas",
    "online": true,
    "story": false,
  },
  {
    "img": "assets/images/girls/img_8.jpeg",
    "name": "Atikh",
    "online": true,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_9.jpeg",
    "name": "Campbell",
    "online": false,
    "story": true,
  },
  {
    "img": "assets/images/girls/img_10.jpeg",
    "name": "Maya",
    "online": false,
    "story": true,
  },
];

// users message list
List userMessages = [
  {
    "id": 1,
    "name": "Ayo",
    "img": "assets/images/girls/img_1.jpeg",
    "online": true,
    "story": true,
    "message": "How are you doing?",
    "created_at": "1:00 pm"
  },
  {
    "name": "Rondeau",
    "img": "assets/images/girls/img_2.jpeg",
    "online": true,
    "story": false,
    "message": "Long time no see!!",
    "created_at": "12:00 am"
  },
  {
    "id": 3,
    "name": "Valerie",
    "img": "assets/images/girls/img_3.jpeg",
    "online": true,
    "story": true,
    "message": "Glad to know you in person!",
    "created_at": "3:30 pm"
  },
  {
    "id": 4,
    "name": "Anne",
    "img": "assets/images/girls/img_4.jpeg",
    "online": false,
    "story": false,
    "message": "I'm doing fine and how about you?",
    "created_at": "9:00 am"
  },
  {
    "id": 5,
    "name": "Fineas",
    "img": "assets/images/girls/img_5.jpeg",
    "online": true,
    "story": false,
    "message": "What is your real name?",
    "created_at": "11:25 am"
  },
  {
    "id": 6,
    "name": "Maya",
    "img": "assets/images/girls/img_6.jpeg",
    "online": false,
    "story": true,
    "message": "I'm happy to be your friend",
    "created_at": "10:00 am"
  },
];
enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demeChatMessages = [
  ChatMessage(
    text: "Hi Sajol,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
const List account_json = [
  {"img": "assets/images/profile.png", "name": "Sopheamen", "age": "25"}
];


