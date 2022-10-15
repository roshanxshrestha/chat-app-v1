import 'package:chat_app_v1/app_constants.dart';
import 'package:chat_app_v1/models/message_model.dart';
import 'package:chat_app_v1/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : const EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? accent1Color : primaryColor,
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
                color: accent3Color,
                fontSize: 14.0,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 8.0),
          Text(
            message.text,
            style: const TextStyle(
                color: accent3Color,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: primaryColor,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            iconSize: 25.0,
            color: accent3Color,
          ),
          const Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: "Message...",
                hintStyle: TextStyle(color: accent3Color),
              ),
              style: TextStyle(color: accent3Color),
              textInputAction: TextInputAction.send,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none_outlined),
            iconSize: 25.0,
            color: accent3Color,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: accent3Color,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_rounded),
            iconSize: 25.0,
            color: accent3Color,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          widget.user.name,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(
                      30.0,
                    ),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(
                      30.0,
                    ),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
