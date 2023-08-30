import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/benefactor_management/application/tap_donations_provider.dart';
import 'package:takafol/src/benefactor_management/presentation/components/complete_donation_component.dart';
import 'package:takafol/src/benefactor_management/presentation/components/created_donation_component.dart';
import 'package:takafol/src/benefactor_management/presentation/components/floating_benefactor_component.dart';
import 'package:takafol/src/benefactor_management/presentation/components/waiting_donation_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/components/tap_bar_component.dart';
import 'package:takafol/src/donations_mangement/application/donation_pagenation_provider.dart';
import 'package:takafol/src/donations_mangement/application/donation_reall_time_provider.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';

class BeneFactorDonationsPage extends ConsumerWidget {
  const BeneFactorDonationsPage({super.key});
  static String get routeName => "donations";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 182.h),
          child: const FloatingBenefactorButtonComponent()),
      body: ReactiveForm(
        formGroup: ref.read(donationFormBenefactor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 180.h,
            ),
            child: Column(
              children: [
                const TapBarComponent(
                    title: "التبرعات",
                    formControlName: "tabs",
                    tabs: ["غير مرسلة", "قيد اللإنتظار", "مُسلمة"]),

                    Expanded(
                      child: ref.watch(streamMyDonations).when(data: (data) {
                    
                        if(data==null||data.isEmpty){
                          return const Center(child: Text("لاتوجد تبرعات"),);
                        }
                        return  ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                          return _getScreen(formGroup.control("tabs").value,data);
                        });
                      }, error: (error, stackTrace) => Center(child: Text(error.toString()),), loading: () => const Center(child: LoadingComponent(backColor: false),),
                      skipLoadingOnRefresh: true,
                      skipLoadingOnReload: true,
                      
                      ),
                    )
               
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getScreen(String tab,List<Donation> data) {
    switch (tab) {
      case "غير مرسلة":
        return  DonationCreatedComponent(data: data.where((element) => (element.currentStatus.name==DonationState.created)||element.currentStatus.name==DonationState.rejectFromBenfactor,).toList(),);
      case "قيد اللإنتظار":
        return  BenefctorDonationWitingComponent( data: data.where((element) => (element.currentStatus.name==DonationState.send),).toList(),);
      case "مُسلمة":
        return  DonationCompleteComponent(data: data.where((element) => (element.currentStatus.name==DonationState.complete),).toList(),);
      default:
        return  DonationCreatedComponent(data: data.where((element) => (element.currentStatus.name==DonationState.complete),).toList());
    }
  }
}
