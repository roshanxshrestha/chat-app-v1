import 'package:chat_app_v1/app_constants.dart';
import 'package:chat_app_v1/models/message_model.dart';

import 'package:chat_app_v1/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300.0,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(
                                user: chat.sender,
                              )));
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: const TextStyle(
                                  color: accent3Color,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                      color: chat.unread
                                          ? accent3Color
                                          : accent2Color,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            chat.time,
                            style: TextStyle(
                              color: chat.unread ? accent3Color : accent2Color,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          chat.unread
                              ? Container(
                                  height: 20.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: accent2Color,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "New",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : const Text(""),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
