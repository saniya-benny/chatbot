import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<String> message = [];
  bool isLoading = false;

  TextEditingController inputTextEditingController = TextEditingController();

  //gemini call api
  geminiCall(String prompt) {
    setState(() {
      isLoading = true;
    });
    Gemini.instance.prompt(parts: [Part.text(prompt)]).then((value) {
      print(value?.output);
      setState(() {
        message.add(value!.output.toString());
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(child: Text("CHAT BOT")),
      ),
      floatingActionButton: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
                controller: inputTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter the message',
                ),
              ),
            ),
            isLoading
                ? CircularProgressIndicator()
                : IconButton(
                    onPressed: () {
                      inputTextEditingController.text;
                      setState(() {
                        message.add(inputTextEditingController.text);
                        isLoading = false;
                      });
                      geminiCall(inputTextEditingController.text);
                      inputTextEditingController.clear();
                      print(message);
                    },
                    icon: Icon(Icons.send),
                  ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: ListView.builder(
          itemCount: message.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                style: TextStyle(
                  color: Colors.deepPurple[700],
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
                message[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
