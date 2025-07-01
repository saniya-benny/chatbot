import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini_bot/flutter_gemini_bot.dart';
import 'package:flutter_gemini_bot/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chatList = []; // Your list of ChatModel objects
  String apiKey = 'AIzaSyAHG0qF5gypc0FacjqL-jb7WqMW508YLmQ';

  geminiCall() {
    Gemini.instance
        .prompt(parts: [Part.text('Write a story about a magic backpack')])
        .then((value) {
          print(value?.output);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: Row(
      children: [
       TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Enter messagr'),)
      ],
    ),
      body:
        ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {

      return Container(height: 20,width: 30,color: Colors.lime[200])
      ;
    },
    )


      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [ElevatedButton(onPressed: () {
      //     print("object");
      //     geminiCall();
      //   }, child: Text('send'))],
      // ),
      // FlutterGeminiChat(
      //   chatContext: 'you are a frontend app developer',
      //   chatList: chatList,
      //   apiKey: apiKey,
      // ),
    );
  }
}
