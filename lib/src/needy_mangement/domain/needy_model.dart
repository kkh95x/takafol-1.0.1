// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/needy_mangement/domain/needy_status.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'needy_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'needy_model.g.dart';

@freezed
class Needy with _$Needy {
  const factory Needy({
    // required int starsCount,
    // required int familyPersons,
    // required NeedStatus status,
    required String needyNumber,
    required String gName,
    required  String gSName,
    required String gLName,
    DateTime? gBirthDay,
    required  String gIdType,
    required String gIdnumber,
    String? zFName,
    String? zSName,
    String? zLName,
    DateTime? zBirthDay,
    int? boy02,
    int? girl02,
    int? boy210,
    int? girl210,
    int? boy1020,
    int? girl020,
    int? boy2040,
    int? gir2040,
    int? boy40,
    int? gir40,
    int?orphans,
    int? specialNeeds,

  }) = _Needy;

  factory Needy.fromJson(Map<String, Object?> json)
      => _$NeedyFromJson(json);
}
/**
 *  final gFName = form.control("guardianFamily.name").value;
  final gSName = form.control("guardianFamily.fName").value;
  final gLName = form.control("guardianFamily.sName").value;
  final gBirthDay = form.control("guardianFamily.bithDay").value;
  final gIdType = form.control("guardianFamily.idType").value;
  final gIdnumber = form.control("guardianFamily.idNumber").value;

  final zFName = form.control("husband.name").value;
  final zSName = form.control("husband.fName").value;
  final zLName = form.control("husband.sName").value;
  final zBirthDay = form.control("husband.bithDay").value;

  final boy02 = form.control("children.boy02").value;
  final girl02 = form.control("children.girl02").value;
  final boy210 = form.control("children.boy210").value;
  final girl210 = form.control("children.girl210").value;
  final boy1020 = form.control("children.boy1020").value;
  final girl020 = form.control("children.girl020").value;
  final boy2040 = form.control("children.boy2040").value;
  final gir2040 = form.control("children.gir2040").value;
  final boy40 = form.control("children.boy40").value;
  final gir40 = form.control("children.gir40").value;

  final orphans = form.control("isOrphans").value;
  final specialNeeds = form.control("specialNeeds").value;
 */