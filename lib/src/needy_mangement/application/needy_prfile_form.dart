

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

FormGroup updateNedyProfileForm(AppUser appUser)=>
   FormGroup({
        // "email":FormControl<String>(validators: [Validators.required,Validators.minLength(6)],),

        "username": FormControl<String>(
          validators: [Validators.required, Validators.minLength(6),],
          value: appUser.username
        ),
      "needyNumber":FormControl<String>(
          validators: [Validators.required, Validators.minLength(6),],
          value: appUser.needy?.needyNumber

        ),
    
 
      }, );