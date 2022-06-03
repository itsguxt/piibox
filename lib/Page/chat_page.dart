import 'package:flutter/material.dart';

//ARQUIVO QUE CRIA A TELA DO CARRINHO MENSSAGENS

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Image.asset(
              "empty-folder.png",
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Você não possui mensagens...",
              style: TextStyle(fontFamily: 'lobster', fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
