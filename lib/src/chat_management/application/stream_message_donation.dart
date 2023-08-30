import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/chat_management/data/supa_message_repo.dart';
import 'package:takafol/src/chat_management/domain/message.dart';

final streamMessageDonation=StreamProvider.family<List<Message>?,String>((ref,id) => ref.read(messageRepositoryProvider).streamMessageDonation(id));