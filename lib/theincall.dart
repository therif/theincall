import 'theincall_platform_interface.dart';

class TheincallPlugin {
  //static void registerWith() {
  static void registerWith(registrar) {
    //HelloPluginPlatform.instance = HelloPluginWindows();
  }

  Future<String?> getPlatformVersion() {
    return TheincallPlatform.instance.getPlatformVersion();
  }

  Future<void> start(
      {bool auto = true,
      MediaType media = MediaType.mtAUDIO,
      String? ringback}) async {
    TheincallPlatform.instance
        .start(auto: auto, media: media, ringback: ringback);
  }

  Future<void> stop({String? busytone}) async {
    TheincallPlatform.instance.stop(busytone: busytone);
  }

  Future<void> setKeepScreenOn(bool enabled) async {
    TheincallPlatform.instance.setKeepScreenOn(enabled);
  }

  Future<void> setSpeakerphoneOn(bool enabled) async {
    TheincallPlatform.instance.setSpeakerphoneOn(enabled);
  }

  Future<void> setForceSpeakerphoneOn(
      {ForceSpeakerType flag = ForceSpeakerType.spDEFAULT}) async {
    TheincallPlatform.instance.setForceSpeakerphoneOn(flag: flag);
  }

  Future<void> enableProximitySensor(bool enabled) async {
    TheincallPlatform.instance.enableProximitySensor(enabled);
  }

  Future<void> turnScreenOff() async {
    TheincallPlatform.instance.turnScreenOff();
  }

  Future<void> turnScreenOn() async {
    TheincallPlatform.instance.turnScreenOn();
  }

  Future<void> setMicrophoneMute(bool enabled) async {
    TheincallPlatform.instance.setMicrophoneMute(enabled);
  }

  Future<void> startRingtone(RingtoneUriType ringtoneUriType,
      String iOSCategory, int ringSeconds) async {
    TheincallPlatform.instance
        .startRingtone(ringtoneUriType, iOSCategory, ringSeconds);
  }

  Future<void> stopRingtone() async {
    TheincallPlatform.instance.stopRingtone();
  }

  Future<void> startRingback() async {
    TheincallPlatform.instance.startRingback();
  }

  Future<void> stopRingback() async {
    TheincallPlatform.instance.stopRingback();
  }

  Future<String> checkRecordPermission() async {
    return TheincallPlatform.instance.checkCameraPermission();
  }

  Future<String> requestRecordPermission() async {
    return TheincallPlatform.instance.requestRecordPermission();
  }

  Future<String> checkCameraPermission() async {
    return TheincallPlatform.instance.checkCameraPermission();
  }

  Future<String> requestCameraPermission() async {
    return TheincallPlatform.instance.requestCameraPermission();
  }
}
