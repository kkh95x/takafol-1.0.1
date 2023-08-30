import 'package:takafol/src/chat_management/domain/message.dart';

abstract class MessageRepository{
  Stream<List<Message>?> streamMessageDonation(String donationId);
  Future<void> createMessage(Message message);
  Future<void> delete(String id);
}