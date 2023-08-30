import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/benefactor_management/application/get_all_needy_provider.dart';
import 'package:takafol/src/benefactor_management/application/needy_ifo_dialoge.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/emtpy_data_component.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/core/presentation/components/map_component.dart';

class BenefactorMapPage extends ConsumerWidget {
  const BenefactorMapPage({super.key});
  static String get routeName => "benefactor-map";
  static String get routePath => "/$routeName";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
        body: Center(
      child: ref.watch(getAllNeedyProvider).when(
            data: (data) {
              if (data == null || data.isEmpty) {
                return const EmptyDataComponent(
                  text: "لايوجد محتاجين بالقرب منك",
                );
              } else {
                return MapComponent(
                  pepole: data,
                  onGeoPointClicked: (p0) async {
                    await ref.read(needyInfoDialogeProvider(NeedyInfoDialogeProvider(appUser: p0, context: context)).future);
                  },
                );
              }
            },
            error: (error, stackTrace) => Text("Error: ${error.toString()}"),
            loading: () => const LoadingComponent(backColor: false),
          ),
    ));
  }
}
