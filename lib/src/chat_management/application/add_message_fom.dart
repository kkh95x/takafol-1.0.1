
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_message_fom.g.dart';

@Riverpod(keepAlive: true)
FormGroup addMessageForm (AddMessageFormRef ref)=> FormGroup({

"text":FormControl<String>(),
"image":FormControl<String>(),
"voice":FormControl<String>(),
"point":FormControl<GeoPoint>(),
"isVoices":FormControl<bool>()

});