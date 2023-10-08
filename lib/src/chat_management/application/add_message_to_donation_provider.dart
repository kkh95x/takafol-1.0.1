
import 'dart:io';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/chat_management/data/supa_message_repo.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
import 'package:takafol/src/chat_management/domain/message_type.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/supabase_storge_service.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/notification/application/notification_service.dart';
import 'package:takafol/src/notification/domain/notification.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
class AddMessageToDonationProvider{
  final String donationId;
 final FormGroup form;
 AddMessageToDonationProvider(this.donationId,this.form);
}
final addMessageToDonationProvider=Provider.autoDispose.family<Message,AddMessageToDonationProvider>((ref,input) {
//   "text":FormControl<String>(),
// "image":FormControl<String>(),
// "voice":FormControl<String>(),
// "point":FormControl<GeoPoint>(),
// "isVoices":FormControl<bool>()
  final donationId=input.donationId;
  final text=input.form.control("text").value;
    final image=input.form.control("image").value;
        final voice=input.form.control("voice").value;

    final point=input.form.control("point").value as GeoPoint?;
    MessageType messageType;
    String? content;
    if(voice!=null){
      messageType=MessageType.voice;
      
      content=voice;
    }else if(image !=null){
      messageType=MessageType.text;
      content=image;
    }
    else if(voice !=null){
      messageType=MessageType.voice;
    }else{
      messageType=MessageType.text;}

    final message=   Message(chatId: donationId, sendDate: DateTime.now(), messageType: messageType,fileUrl: content,text: text,latitude:point?.latitude ,longitude: point?.longitude,senderId: ref.read(authNotiferProvider).currentUser?.id??"",);
    helper( message, ref);
    ref.read(donationRepositoryProvider).getDonationById(donationId).then((donation) {
      final user=ref.read(authNotiferProvider).currentUser;
      final isNeedy=user?.accountType==AccountType.needy;


 ref.read(notificationServiceProvider).createNotification(AppNotification(title: "رسالة جديدة", body:"لديك رسالة جديدة في التبرع ${donation?.title}", 
 from:
 isNeedy?donation!.needy!:donation!.benfactor!,
 
refreanceId:isNeedy? donation.benfactor?.id??"":donation.needy?.id??"", type: NotificationType.donation, extra: ""));

    });

     
     return  message.copyWith(messageStatus: MessageStatus.created,created_at: DateTime(2040));
    // }
    // final donation=await ref.read(donationRepositoryProvider).getDonationById(donationId);
    // final newDonation=donation.copyWith(messages: [...donation?.messages??[],])
    



});

Future helper(Message message,Ref ref)async{

switch(message.messageType){
  case MessageType.point:
  case MessageType.text:
   ref.read(messageRepositoryProvider).createMessage(message);
  case MessageType.voice:
  case MessageType.image:
  try{
    //"/data/user/0/com.takafol.io/app_flutter/1693306812281.aac"

    final url=await ref.read(storgeServiceProvider).saveFile(File(message.fileUrl??""), "donations/messages/${message.chatId}/${DateTime.now()}.${message.fileUrl?.split(".").last}");

    final newMessage=message.copyWith(fileUrl: url);
       ref.read(messageRepositoryProvider).createMessage(newMessage);
  }catch(e){
    print("------> error: ${e.toString()}");
  }
   
}
  

}