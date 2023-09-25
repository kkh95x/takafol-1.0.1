import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/components/tap_bar_component.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/needy_mangement/application/donation_provider.dart';
import 'package:takafol/src/needy_mangement/application/donation_real_time_provider.dart';
import 'package:takafol/src/needy_mangement/presentation/components/donation_requested_component.dart';
import 'package:takafol/src/needy_mangement/presentation/components/donation_witing_component.dart';

class NeedyDonationsPage extends ConsumerWidget {
  const NeedyDonationsPage({super.key});
  static String get  routeName=>"donation";
  static String get routePath=>"/$routeName";

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body:SafeArea(child: ReactiveForm(
        formGroup: ref.read(donationFormNeedy),
        child: Column(
          children: [
            const TapBarComponent(formControlName: "tabs", tabs: ["قيد اللإنتظار","جديدة"], title: "التبرعات"),
            Expanded(
                      child: ref.watch(streamMyDonationsNeedy).when(data: (data) {
                    
                    
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
      ))
    );
  }
  
  Widget _getScreen(String tab,List<Donation>? data) {
    switch (tab) {
      case "جديدة":
        return  RequestedDonationComponent(donation: data?.where((element) => (element.currentStatus.name==DonationState.send)).toList(),);
      case "قيد اللإنتظار":
        return  WitingDonationComponent( donation: data?.where((element) => (element.currentStatus.name==DonationState.acypt),).toList(),);
      default:
        return  WitingDonationComponent(donation: data?.where((element) => (element.currentStatus.name==DonationState.acypt),).toList());
    }
  }
}