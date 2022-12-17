import 'package:flutter_test/flutter_test.dart';
import 'package:theincall/theincall.dart';
import 'package:theincall/theincall_platform_interface.dart';
import 'package:theincall/theincall_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTheincallPlatform
    with MockPlatformInterfaceMixin
    implements TheincallPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> checkCameraPermission() {
    // TODO: implement checkCameraPermission
    return Future.value('True');
    throw UnimplementedError();
  }

  @override
  Future<String> checkRecordPermission() {
    // TODO: implement checkRecordPermission
    throw UnimplementedError();
  }

  @override
  Future<void> enableProximitySensor(bool enabled) {
    // TODO: implement enableProximitySensor
    throw UnimplementedError();
  }

  @override
  Future<String> requestCameraPermission() {
    // TODO: implement requestCameraPermission
    throw UnimplementedError();
  }

  @override
  Future<String> requestRecordPermission() {
    // TODO: implement requestRecordPermission
    throw UnimplementedError();
  }

  @override
  Future<void> setForceSpeakerphoneOn(
      {ForceSpeakerType flag = ForceSpeakerType.spDEFAULT}) {
    // TODO: implement setForceSpeakerphoneOn
    throw UnimplementedError();
  }

  @override
  Future<void> setKeepScreenOn(bool enabled) {
    // TODO: implement setKeepScreenOn
    throw UnimplementedError();
  }

  @override
  Future<void> setMicrophoneMute(bool enabled) {
    // TODO: implement setMicrophoneMute
    throw UnimplementedError();
  }

  @override
  Future<void> setSpeakerphoneOn(bool enabled) {
    // TODO: implement setSpeakerphoneOn
    throw UnimplementedError();
  }

  @override
  Future<void> start(
      {bool auto = true,
      MediaType media = MediaType.mtAUDIO,
      String? ringback}) {
    // TODO: implement start
    throw UnimplementedError();
  }

  @override
  Future<void> startRingback() {
    // TODO: implement startRingback
    throw UnimplementedError();
  }

  @override
  Future<void> startRingtone(
      RingtoneUriType ringtoneUriType, String iOSCategory, int ringSeconds) {
    // TODO: implement startRingtone
    throw UnimplementedError();
  }

  @override
  Future<void> stop({String? busytone}) {
    // TODO: implement stop
    throw UnimplementedError();
  }

  @override
  Future<void> stopRingback() {
    // TODO: implement stopRingback
    throw UnimplementedError();
  }

  @override
  Future<void> stopRingtone() {
    // TODO: implement stopRingtone
    throw UnimplementedError();
  }

  @override
  Future<void> turnScreenOff() {
    // TODO: implement turnScreenOff
    throw UnimplementedError();
  }

  @override
  Future<void> turnScreenOn() {
    // TODO: implement turnScreenOn
    throw UnimplementedError();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final TheincallPlatform initialPlatform = TheincallPlatform.instance;

  test('$MethodChannelTheincall is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTheincall>());
  });

  test('getPlatformVersion', () async {
    TheincallPlugin theincallPlugin = TheincallPlugin();
    MockTheincallPlatform fakePlatform = MockTheincallPlatform();
    TheincallPlatform.instance = fakePlatform;

    var test0 = await theincallPlugin.getPlatformVersion();
    print('test0 : $test0');
    expect(test0, '42');
  });

  test('checkCameraPermission', () async {
    TheincallPlugin theincallPlugin = TheincallPlugin();
    MockTheincallPlatform fakePlatform = MockTheincallPlatform();
    TheincallPlatform.instance = fakePlatform;

    var test1 = await theincallPlugin.checkCameraPermission();
    print('test1 : $test1');
    expect(test1, 'True');
  });

  test('checkCameraPermission', () async {
    TheincallPlugin theincallPlugin = TheincallPlugin();
    MockTheincallPlatform fakePlatform = MockTheincallPlatform();
    TheincallPlatform.instance = fakePlatform;

    var test2 = await theincallPlugin.checkCameraPermission();
    print('test2 : $test2');
    expect(test2, 'True');
  });
}
