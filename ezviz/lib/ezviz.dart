
import 'ezviz_platform_interface.dart';

class Ezviz {
  Future<String?> getPlatformVersion() {
    return EzvizPlatform.instance.getPlatformVersion();
  }
}
