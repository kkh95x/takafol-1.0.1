import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takafol/src/admin_management/presentation/components/add_needy_component.dart';

class AddNeedyPage extends ConsumerWidget {
  const AddNeedyPage({super.key});

  static String get routeName=>"add-needy";
    static String get routePath=>"/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(child: Column(
      children: [
        AppBar(
          title:   const Text("مستفيد جديد",style: TextStyle(fontSize: 18,),),
          centerTitle: true,
          
        ),
      
        SizedBox(height: 10.h,),
         const Expanded(child: AddNeedyComponent()),
    
      ],
    ));
  }
}
