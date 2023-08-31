import 'package:flutter/material.dart';
import 'package:yes_no_app_new/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_new/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.latercera.com/resizer/Qmce2wFqA9q1b1aLHHM7Olam-IA=/900x600/smart/cloudfront-us-east-1.images.arcpublishing.com/copesa/RNRFDR5R7JDFNA7A54CSXSAW6M.jpeg'),
          ),
        ),
        title: const Text('Billie'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            const Text('Mundo'),
          ],
        ),
      ),
    );
  }
}
