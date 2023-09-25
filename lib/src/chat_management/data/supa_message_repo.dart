


import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/chat_management/data/message_repository.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
part 'supa_message_repo.g.dart';
@riverpod
SupaMessageRepository messageRepository(MessageRepositoryRef ref)=>SupaMessageRepository(Supabase.instance.client);
class SupaMessageRepository implements MessageRepository{
  SupaMessageRepository(this.supabaseClient);
  SupabaseClient supabaseClient;
  @override
  Future<void> createMessage(Message message) async{
   final body=message.toJson();
   body.remove("id");
   body.remove("created_at");
  await supabaseClient.from(Tabels.messages).insert(body);

  }

  @override
  Stream<List<Message>?> streamMessageDonation(String donationId) {
    final  stream=StreamController<List<Message>?>();
    supabaseClient.from(Tabels.messages)
    
    .stream(primaryKey: ["id"])
    
    .eq("chatId", donationId,)
    .order("created_at",ascending:false )
    .listen((event) { 
      stream.sink.add(event.map((e) => Message.fromJson(e)).toList());
    });
    return stream.stream;
  }
  
  @override
  Future<void> delete(String id)async {
   await supabaseClient.from(Tabels.messages)
    .delete().eq("id", id);
    
  }
}