import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_flutter_typeahead/reactive_flutter_typeahead.dart';
import 'package:takafol/src/benefactor_management/application/asgiment_donation_to_needy_provider.dart';
import 'package:takafol/src/benefactor_management/application/dontions_providers.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/widgets/login_button_widget.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

final donationSelected = StateProvider<Donation?>((ref) => null);

class SelectDonationComponent extends ConsumerWidget {
  const SelectDonationComponent({super.key, required this.needy});
  final AppUser needy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final din = ref.read(donationSelected);
    TextEditingController controller = TextEditingController(
        text: din == null ? "" : "${din.title} ${din.body}");
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
           
            SizedBox(
              height: 20.h,
            ),
            TypeAheadField<Donation>(
              hideOnEmpty: true,
              errorBuilder: (context, error) {
                return Text(
                  'حدث خطأ',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                );
              },
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground),
              onSuggestionSelected: (item) {
                ref.read(donationSelected.notifier).state = item;
                controller.text = "${item.title} ${item.body}";
              },
              textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down_circle_outlined,
                        color: Theme.of(context).colorScheme.primary),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                            width: 1),
                        borderRadius: BorderRadius.circular(10.r)),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: const TextStyle(),
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400,
                        ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.all(Radius.circular(15.0.r))),
                    fillColor: Colors.blue.shade50,
                    filled: true,
                  ),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
              suggestionsCallback: (pattern) async {
                final data = await ref
                    .read(donationRepositoryProvider)
                    .getCreatedDonations(
                        ref.read(authNotiferProvider).currentUser?.id ?? "-");

                return data ?? [];
              },
              itemBuilder: (context, suggestion) {
                return Container(
                  // height: 20.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  padding: EdgeInsets.all(12.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suggestion.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      if (suggestion.body != null)
                        Text(
                          suggestion.body ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      const Divider(),
                      // //  if (suggestion.notes?.imageUrl != null && suggestion.notes!.imageUrl!.isNotEmpty)
                      // // Row(
                      // //   mainAxisAlignment: MainAxisAlignment.end,
                      // //   children: [
                      // //     SizedBox(
                      // //       width: 10.w,
                      // //     ),
                      // //     for (var x in suggestion.notes!.imageUrl!) _buildImage(x),
                      // //     SizedBox(
                      // //       width: 10.w,
                      // //     )
                      //   ],
                      // )
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 100.h,
            ),
            Consumer(builder: (context, ref, child) {
              return MainButton(
                text: "إرسال التبرع للمستفيد",
                onPressed: ref.watch(donationSelected) != null
                    ? () async {
                        await ref
                            .read(assgmentDonationToNeedyProvider(
                                    AssgmentDonationToNeedyInput(
                                        appUser: needy,
                                        context: context,
                                        donation: ref.read(donationSelected)!))
                                .future)
                            .then((value) {
                          ref.read(donationSelected.notifier).state = null;
                         
                        });
                      }
                    : null,
              );
            })
          ],
        ),
      ),
    );
  }
}
