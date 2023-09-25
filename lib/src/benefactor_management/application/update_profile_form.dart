
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

FormGroup updateProfileForm(AppUser appUser)=>FormGroup({
  "userImformation": FormGroup({
        // "email":FormControl<String>(validators: [Validators.required,Validators.minLength(6)],),

        "username": FormControl<String>(
          validators: [Validators.required, Validators.minLength(6),],
          value: appUser.username
        ),
         "email": FormControl<String>(
          validators: [Validators.required, Validators.minLength(6),],
          value: appUser.email
        ),
        "name": FormControl<String>(
          validators: [Validators.required],
          value: appUser.firstName
        ),
        "surname": FormControl<String>(
          validators: [Validators.required],
          value: appUser.lastName
        ),
        "secoundName": FormControl<String>(value: appUser.secoundName),
 "location":FormControl<GeoPoint>(validators: [Validators.required],value:appUser.latitude!=null&&appUser.longitude!=null? GeoPoint(latitude: appUser.latitude!, longitude: appUser.longitude!):null),
        "birthDay": FormControl<DateTime>(
            validators: [Validators.required], value:appUser.birthday),
        // "password": FormControl<String>(
        //   validators: [Validators.required, Validators.minLength(8)],
        // ),
        // "isHidden": FormControl<bool>(value: true),
        // "passwordConfirm": FormControl<String>(
        //   validators: [
        //     Validators.required,
        //   ],
        // ),
        // "isHidden2": FormControl<bool>(value: true),
        "image": FormControl<XFile>(),
        "imageUrl": FormControl<String>(value: appUser.imageUrl),
      }, validators: [
        // Validators.mustMatch("password", "passwordConfirm")
      ])
});