import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

class NeedyInfoComponent extends StatelessWidget {
  const NeedyInfoComponent({super.key ,required this.needyUser});
  final  AppUser needyUser;
  @override
  Widget build(BuildContext context) {
     int  countPerson =0;
   countPerson+=needyUser.needy?.boy02??0;
      countPerson+=needyUser.needy?.boy02??0;
   countPerson+=needyUser.needy?.girl02??0;
   countPerson+=needyUser.needy?.boy210??0;
   countPerson+=needyUser.needy?.girl210??0;
   countPerson+=needyUser.needy?.boy1020??0;
   countPerson+=needyUser.needy?.girl020??0;
   countPerson+=needyUser.needy?.boy2040??0;
   countPerson+=needyUser.needy?.gir2040??0;
   countPerson+=needyUser.needy?.boy40??0;
  countPerson+=needyUser.needy?.gir40??0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
width: MediaQuery.of(context).size.width,
padding:EdgeInsets.symmetric(vertical: 40.h,horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(50.r)
          ),
          child: Column(
            children: [
              Text("المعرف"),
            Text(needyUser.needy?.needyNumber??"-"),
        
            ],
          ),
        ),
       const Divider(),
        Container(
width: MediaQuery.of(context).size.width,
padding:EdgeInsets.symmetric(vertical: 40.h,horizontal: 20.w),

          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(50.r)
          ),
          child: Column(
            children: [
              _buildRow("عدد أفراد الأسرة", countPerson.toString()),
                _buildRow("عدد الآيتام", needyUser.needy?.orphans?.toString()??"0"),
      _buildRow("عدد ذوي الإحتياجات الخاصة", needyUser.needy?.orphans?.toString()??"0"),

      
            ],
          ),
        ),
    
      // Text("معرف المحتاج : قريباَ"),
      Text("بقية البيانات قريبا"),
     
      ],
    );
  }

  Widget _buildRow(String title, String info) {
   


    return Row(
      children: [Text("$title: "), Text(info)],
    );
  }
}
