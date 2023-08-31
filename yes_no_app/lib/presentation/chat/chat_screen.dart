import 'package:flutter/material.dart';

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
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text('Indice: $index');
              },
            )),
            const Text('Mundo'),
          ],
        ),
      ),
    );
  }
}
