import 'package:flutter/material.dart';
import 'package:web_socket_chat_app/custom/other_message.dart';
import 'package:web_socket_chat_app/custom/own_message.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final TextEditingController messageController = TextEditingController();

  void sendMessage(String message, String senderName) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Group",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                OwnMessage(sender: 'Timur', message: 'Hello my name is Timur'),
                OtherMessage(sender: 'Teacher', message: 'Hi, my name is Alex'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type message here ...",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 4,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          String message = messageController.text;
                          if (message.isNotEmpty) {
                            sendMessage(
                                messageController.text, widget.userName);
                            messageController.clear();
                          }
                        },
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.teal[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
