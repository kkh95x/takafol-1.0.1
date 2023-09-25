import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';

import 'package:takafol/src/donations_mangement/application/donation_reall_time_provider.dart';
import 'package:takafol/src/donations_mangement/presentaion/components/detals_component.dart';

class DonationDetalsPage extends ConsumerWidget {
  const DonationDetalsPage({super.key, required this.donationId});
  static String get routeName => "donation-detalis";
  static String get routePath => "/$routeName";
  final String donationId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body:
        
        
        ref.watch(streamDontaion(donationId)).when(data: (recipes) {

if (recipes == null) {
                  return const Center(
                    child:   EmptyDataComponent(
                      text: "لم يتم  العثور على التبرع",
                    ),
                  );
                }
                return DetalisComponent(donation: recipes);


          
        }, error: (error, stackTrace) =>Center(child: Text(error.toString()),) , loading: () =>const Center(child: LoadingComponent(backColor: false),),)
        
        //  ref.watch(donationRealTimeProvider(donationId)).when(
        //       data: (recipes) {
        //         if (recipes == null) {
        //           return const  EmptyDataComponent(
        //             text: "لم يتم  العثور على التبرع",
        //           );
        //         }
        //         return DetalisComponent(donation: recipes);
        //       },
        //       loading: () {
        //         return const Center(
        //           child: LoadingComponent(
        //             backColor: false,
        //           ),
        //         );
        //       },
        //       error: (e, stk) {
        //         return Center(
        //           child: Text("Error: ${e.toString()}"),
        //         );
        //       },
        //       onGoingLoading: (recipes) {
        //          if (recipes == null) {
        //           return const  EmptyDataComponent(
        //             text: "لم يتم  العثور على التبرع",
        //           );
        //         }
        //         return DetalisComponent(donation: recipes);
        //       },
        //       onGoingError: (recipes, e, stk) {
        //         if (recipes == null) {
        //           return const  EmptyDataComponent(
        //             text: "لم يتم  العثور على التبرع",
        //           );
        //         }
        //         return DetalisComponent(donation: recipes);
        //       },
        //     )
            );
  }
}

