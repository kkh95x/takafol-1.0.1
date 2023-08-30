


import 'package:flutter/material.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
import 'package:takafol/src/chat_management/presentation/widgets/message_widget.dart';

class MessagesListComponent extends StatelessWidget {
  const MessagesListComponent({super.key,required this.scrollController,required this.messages});
  final ScrollController scrollController;
  final List<Message> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      
     itemCount: messages.length,
      itemBuilder:(context, index) => MessageWidget(message: messages[index]), );
  }
}