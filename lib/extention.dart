import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';

extension CustomBot on BotToast {
  static void myLoading(String? text) {
    BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => LoadingComponent(
        text: text,
      ),
    );
  }
}

extension Id on GeoPoint {
  static void myLoading(String? text) {
    String? id;
    void setId(String newid) {
      id = newid;
    }
    String? getId() {
    return id;
  }
  }

  
}
