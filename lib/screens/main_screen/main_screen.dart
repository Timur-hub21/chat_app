import 'package:flutter/material.dart';
import 'package:web_socket_chat_app/screens/group_screen/group_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Group Chat App",
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
          Image.asset('assets/group_chat.jpeg'),
          const Spacer(),
          const Text(
            "Hello Dear User, welcome to our test group chat app\n Here you can share your thoughts about your day",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  "Please enter your username",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                content: Form(
                  key: formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      errorStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    controller: userNameController,
                    validator: (value) {
                      if (value == null || value.length <= 3) {
                        return "User must type username that contain more than 3 symbols";
                      }
                      return null;
                    },
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          userNameController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String userName = userNameController.text;
                            userNameController.clear();
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroupScreen(
                                  userName: userName,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Enter",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.teal[800],
              ),
              child: const Center(
                child: Text(
                  "Start group chat",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
