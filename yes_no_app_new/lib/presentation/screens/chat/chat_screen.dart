import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_new/domain/entities/message.dart';
import 'package:yes_no_app_new/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_new/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_new/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_new/presentation/widgets/shared/message_field_box.dart';

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
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )
                ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
