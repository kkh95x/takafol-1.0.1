import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'needy_form.g.dart';
@Riverpod(keepAlive: true)
FormGroup needyForm(NeedyFormRef ref) => FormGroup({
      "guardianFamily": FormGroup({
        "name": FormControl<String>(validators: [Validators.required]),
        "fName": FormControl<String>(validators: [Validators.required]),
        "sName": FormControl<String>(validators: [Validators.required],),
        "bithDay": FormControl<DateTime>(value: DateTime(2000, 1, 1),validators: [Validators.required]),
        "idType": FormControl<String>(validators: [Validators.required],value: "هوية سورية"),
        "idNumber": FormControl<String>(validators: [Validators.required]),
      }),
      "husband": FormGroup({
        "name": FormControl<String>(),
        "fName": FormControl<String>(),
        "sName": FormControl<String>(),
        "bithDay": FormControl<DateTime>(value: DateTime(2000, 1, 1)),
      }),
      "children": FormGroup({
        "boy02": FormControl<int>(),
        "girl02": FormControl<int>(),
        "boy210": FormControl<int>(),
        "girl210": FormControl<int>(),
        "boy1020": FormControl<int>(),
        "girl020": FormControl<int>(),
        "boy2040": FormControl<int>(),
        "gir2040": FormControl<int>(),
        "boy40": FormControl<int>(),
        "gir40": FormControl<int>(),
      }),
      "orphans":FormControl<int>(),
      "specialNeeds":FormControl<int>(),
      "username":FormControl<String>(validators: [Validators.required,Validators.minLength(6)]),
      "password":FormControl<String>(validators: [Validators.required,Validators.minLength(8)]),
      "goPoint":FormControl<GeoPoint>(validators: [Validators.required])
    });
