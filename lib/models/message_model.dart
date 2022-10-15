import 'package:chat_app_v1/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

//me as a current user
final User currentUser =
    User(id: 0, name: "Current User", imageUrl: "assets/images/greg.jpg");

//users
final User greg = User(id: 1, name: "Greg", imageUrl: "assets/images/greg.jpg");
final User james =
    User(id: 2, name: "James", imageUrl: "assets/images/james.jpg");
final User john = User(id: 3, name: "John", imageUrl: "assets/images/john.jpg");
final User olivia =
    User(id: 4, name: "Olivia", imageUrl: "assets/images/olivia.jpg");
final User sam = User(id: 5, name: "Sam", imageUrl: "assets/images/sam.jpg");
final User sophia =
    User(id: 6, name: "Sophia", imageUrl: "assets/images/sophia.jpg");
final User steven =
    User(id: 7, name: "Steven", imageUrl: "assets/images/steven.jpg");

//favorite contacts
List<User> favorites = [sam, steven, olivia, john, greg];

//chat examples on home screen
List<Message> chats = [
  Message(
    sender: james,
    time: "5:30 PM",
    text: "Hey, how u doing? hope u are doing fine!",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: "5:30 PM",
    text: "Hey, how u doing",
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: john,
    time: "5:30 PM",
    text: "Hey, how u doing",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sam,
    time: "5:30 PM",
    text: "Hey, how u doing",
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: sophia,
    time: "5:30 PM",
    text: "Hey, how u doing",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: "5:30 PM",
    text: "Hey, how u doing",
    isLiked: true,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
