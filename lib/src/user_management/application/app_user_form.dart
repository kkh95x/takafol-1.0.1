import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:reactive_phone_form_field/validators/validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'app_user_form.g.dart';

@riverpod
FormGroup userFormProvider(userFormProviderRef) => FormGroup({
      "login": FormGroup({
        "username": FormControl<String>(validators: [Validators.required]),
        "password": FormControl<String>(
            validators: [Validators.required, Validators.minLength(8)]),
        "isHidden": FormControl<bool>(value: true)
      }),
      "sginUp": FormGroup({
        "isPhone": FormControl<bool>(value: false),
        "email": FormControl<String>(
            validators: [Validators.required, Validators.email]),
        "phone": FormControl<PhoneNumber>(
            value: const PhoneNumber(
              isoCode: IsoCode.TR,
              nsn: '',
            ),
            validators: [
              PhoneValidators.validMobile,
              PhoneValidators.required
            ]),
        "verification": FormGroup({
          'verificationCode': FormControl<String>(
              validators: [Validators.minLength(6), Validators.required])
        }),
       
      }),
      "userImformation": FormGroup({
        // "email":FormControl<String>(validators: [Validators.required,Validators.minLength(6)],),

        "username": FormControl<String>(
          validators: [Validators.required, Validators.minLength(6)],
        ),
        "name": FormControl<String>(
          validators: [Validators.required],
        ),
        "surname": FormControl<String>(
          validators: [Validators.required],
        ),
        "secoundName": FormControl<String>(),
 "location":FormControl<GeoPoint>(validators: [Validators.required]),
        "birthDay": FormControl<DateTime>(
            validators: [Validators.required], value: DateTime(2000, 1, 1)),
        "password": FormControl<String>(
          validators: [Validators.required, Validators.minLength(8)],
        ),
        "isHidden": FormControl<bool>(value: true),
        "passwordConfirm": FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        "isHidden2": FormControl<bool>(value: true),
        "image": FormControl<XFile>(),
        "imageUrl": FormControl<String>(),
      }, validators: [
        Validators.mustMatch("password", "passwordConfirm")
      ])
    });
