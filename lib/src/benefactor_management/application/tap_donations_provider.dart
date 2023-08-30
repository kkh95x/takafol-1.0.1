import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final donationFormBenefactor =
    Provider((ref) => FormGroup({"tabs": FormControl<String>(value: "قيد اللإنتظار")}));
