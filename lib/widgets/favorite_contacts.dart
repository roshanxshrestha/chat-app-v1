import 'package:chat_app_v1/app_constants.dart';
import 'package:chat_app_v1/models/message_model.dart';
import 'package:chat_app_v1/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Favorite Contacts",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: accent1Color),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: accent1Color,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChatScreen(
                                  user: favorites[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          favorites[index].name,
                          style: const TextStyle(
                              color: accent1Color,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: favorites.length,
            ),
          ),
        ],
      ),
    );
  }
}
