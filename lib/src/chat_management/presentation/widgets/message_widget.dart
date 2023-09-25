



import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/chat_management/data/supa_message_repo.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
import 'package:takafol/src/chat_management/domain/message_type.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:intl/intl.dart'as intl;
// import 'package:intl/src/intl/text_direction.dart';
import 'package:takafol/src/core/presentation/components/static_voice_component.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';

class MessageWidget extends ConsumerWidget {
  const MessageWidget({super.key,required this.message});
  final Message message;
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final user=ref.read(authNotiferProvider).currentUser;
    final isMine= user?.id==message.senderId;
    
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
      //  color: Colors.blue.shade50,
       borderRadius: BorderRadius.circular(20.r),
      
      ),
      child: Directionality(
        textDirection:isMine? TextDirection.ltr: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      //   if(isNeedy) const CircleAvatar(
      //   backgroundImage: AssetImage("assets/png/pic.png"),
      // ),
            Dismissible(
            
              key: UniqueKey(),
              confirmDismiss: (direction)async {
                if(message.id!=null&&isMine){
        showDialog(context: context, builder: (context) {
          
          return AlertDialog(
                 content: const Text("هل تريد حذف الرسالة ؟"),
                 actions: [ElevatedButton(onPressed: ()async {
                  BotToast.showLoading();
                  await ref.read(messageRepositoryProvider).delete(message.id!);
                   BotToast.closeAllLoading();
               
                   if(context.mounted){
                   context.pop();

                   }
                   
                 }, child: const Text("نعم"),
                 
                 ),
                 ElevatedButton(onPressed: () {
         context.pop();

                 }, child: const Text("لا"))
                 ],
          );
        },);}
                return false;
              },
              onDismissed: 
             isMine? (direction) {
        
      }:null,
              
            
              child: _getTypeMessage(context, message,isMine)),
           if(!isMine) const CircleAvatar(
        backgroundImage: AssetImage("assets/png/pic.png"),
      ),
            
          ],
        ),
      ),
      
    );
  }
  Widget _getTypeMessage(BuildContext context, Message message,bool isMine){
    switch(message.messageType){
      
      case MessageType.text:
      return sentMessage(context,   Text(
                      message.text??"",
                      style: TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                      ),
                    ),message,isMine);
        
      case MessageType.voice:
        return   voiceCard(context, message.fileUrl??""
                    ,message,isMine);
        
        
        
        
      case MessageType.image:
        return ListView.builder(
          itemCount: message.fileUrl?.length,
          physics:const NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          itemBuilder: (context, index) => CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl:  message.fileUrl![index]),);
      case MessageType.point:
      return OSMFlutter(
                        
                          controller:MapController
                          .withPosition(initPosition: GeoPoint(latitude: message.latitude??0.0, longitude: message.longitude??0.0) ),
                          mapIsLoading: Container(
                            color: Colors.blue.shade50,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),

                          osmOption: OSMOption(
                            isPicker: false,
                            showDefaultInfoWindow:
                                false, //THIS ENUBLE TOTH ON ONE PHGINER
                            enableRotationByGesture: false,
                            showZoomController: false,
                            // staticPoints: ref.watch(mark) ?? [],
                            zoomOption: const ZoomOption(
                              initZoom: 16,
                              minZoomLevel: 3,
                              maxZoomLevel: 19,
                              stepZoom: 1.0,
                            ),

                            // roadConfiguration: const RoadOption(
                            //   roadColor: Colors.yellowAccent,

                            // ),
                            markerOption: MarkerOption(
                                defaultMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                            )),
                          ));
       
    }
  }
  Widget sentMessage(BuildContext context, Widget child,Message message,bool isMine) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth:600.w,
              minWidth:500.w,
            ),
            decoration:  BoxDecoration(
                color:isMine?Colors.white: Color(0xffDCF8C6),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical:20.h,
            ),
            padding: EdgeInsets.only(
                left:20.w,
                right: 20.h,
                top: 20.h,),
            child:  Directionality(
        textDirection: TextDirection.rtl,
              child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                // alignment: WrapAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.005),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                    ),
                    child:child
                    
                   
                  ),
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.only(
                        top:50.h,
                        left:20.w),
                    //alignment: Alignment.bottomRight,
                    // constraints: BoxConstraints(
                    //   maxWidth:50.w,
                    // ),
                    child:  Text(
                    intl.DateFormat.MMMd("ar").add_jm().format(message.sendDate),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10.h),
                    child: _getIcont( message.messageStatus)
                    
                    
                 
                  ),
                  ],
                 )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  _getIcont( MessageStatus messageStatus){
    switch(messageStatus){
      
      case MessageStatus.send:
      return  Icon(
                          Icons.done,
                          size: 48.sp,
                          color: Colors.grey,
                        );
       
      case MessageStatus.recived:
       return  Icon(
                          Icons.done_all,
                          size: 48.sp,
                          color: Colors.blue,
                        );
      case MessageStatus.created:
        return Icon(
                          Icons.watch_later_outlined,
                          size:48.sp,
                          color: Colors.grey,
                        );
    }
  }
  
Widget voiceCard(BuildContext context,String url,Message message,bool isMine){

  return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth:600.w,
              minWidth:500.w,
            ),
            decoration: const BoxDecoration(
                // color: Color(0xffDCF8C6),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.width * 0.004,
            ),
            padding: EdgeInsets.only(
                left:20.w,
                right: MediaQuery.of(context).size.width * 0.015,
                top: MediaQuery.of(context).size.width * 0.015),
            child:  Directionality(
        textDirection: TextDirection.rtl,
              child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                // alignment: WrapAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.005),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                    ),
                    child: StaticVoiceComponent(urlVoice: message.fileUrl,color:isMine?Colors.white: const Color(0xffDCF8C6),recordColor: Colors.grey,)
                    
                   
                  ),
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.only(
                        top:1.h,
                        left:20.w),
                    //alignment: Alignment.bottomRight,
                    // constraints: BoxConstraints(
                    //   maxWidth:50.w,
                    // ),
                    child:  Text(
                    intl.DateFormat.MMMd("ar").add_jm().format(message.sendDate),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10.h),
                    child: _getIcont( message.messageStatus)
                    
                    
                 
                  ),
                  ],
                 )
                ],
              ),
            ),
          ),
        ),
      ],
    );

}
}
