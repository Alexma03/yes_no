import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/presantation/providers/chat_provider.dart';
import 'package:yes_no/presantation/screens/widgets/chat/her_message_bubble.dart';
import 'package:yes_no/presantation/screens/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/presantation/screens/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/19484515?v=4',
            ),
          ),
        ),
        title: const Text('Chat'),
        centerTitle: true,
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
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return (index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
            },
          )),
          const MessageFieldBox(),
        ]),
      ),
    );
  }
}
