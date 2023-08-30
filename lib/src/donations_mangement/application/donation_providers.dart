import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/constant.dart';

final getDonationsTilte =
    FutureProvider.autoDispose.family<List<String>, String>((ref, pattern) {
  if (pattern.trim().isEmpty) {
    return donationsList;
  }
  final filtering =
      donationsList.where((element) => element.contains(pattern)).toList();

  if (filtering.isEmpty) {
    return [pattern];
  } else {
    return filtering;
  }
});
final currentDoationForDetails=StateProvider<String>((ref) => "");
