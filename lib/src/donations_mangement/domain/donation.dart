// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/chat_management/domain/message.dart';
import 'package:takafol/src/core/domain/note_model.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/donations_mangement/domain/donation_status.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'donation.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'donation.g.dart';

@freezed
class Donation with _$Donation{
  const factory Donation({
    String? id,
    required String title,

    String? body,
     UserInformation? needy,
    UserInformation? benfactor,
   DateTime? createdDate,
  //  List<Message>? messages,
   required DonationStatus currentStatus,
   List<DonationStatus>? status,

  Note? notes,
  }) = _Donation;

  factory Donation.fromJson(Map<String, Object?> json)
      => _$DonationFromJson(json);
}