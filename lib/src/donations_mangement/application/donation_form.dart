import 'package:image_picker/image_picker.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'donation_form.g.dart';
@Riverpod(keepAlive: true)
FormGroup donatioonForm(DonatioonFormRef ref) => FormGroup({
  "title":FormControl<String>(validators: [Validators.required]),
  "body":FormControl<String>(validators: [Validators.required]),
  "note":FormGroup({
    // "text":FormControl<String>(),
    "voices":FormControl<String>(),
    "images":FormControl<List<String>>()
  })
});
