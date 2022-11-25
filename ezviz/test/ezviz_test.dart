import 'package:flutter_test/flutter_test.dart';
import 'package:ezviz/ezviz.dart';
import 'package:ezviz/ezviz_platform_interface.dart';
import 'package:ezviz/ezviz_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEzvizPlatform 
    with MockPlatformInterfaceMixin
    implements EzvizPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EzvizPlatform initialPlatform = EzvizPlatform.instance;

  test('$MethodChannelEzviz is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEzviz>());
  });

  test('getPlatformVersion', () async {
    Ezviz ezvizPlugin = Ezviz();
    MockEzvizPlatform fakePlatform = MockEzvizPlatform();
    EzvizPlatform.instance = fakePlatform;
  
    expect(await ezvizPlugin.getPlatformVersion(), '42');
  });
}
