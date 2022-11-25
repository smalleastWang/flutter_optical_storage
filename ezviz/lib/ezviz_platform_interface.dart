import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ezviz_method_channel.dart';

abstract class EzvizPlatform extends PlatformInterface {
  /// Constructs a EzvizPlatform.
  EzvizPlatform() : super(token: _token);

  static final Object _token = Object();

  static EzvizPlatform _instance = MethodChannelEzviz();

  /// The default instance of [EzvizPlatform] to use.
  ///
  /// Defaults to [MethodChannelEzviz].
  static EzvizPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EzvizPlatform] when
  /// they register themselves.
  static set instance(EzvizPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
