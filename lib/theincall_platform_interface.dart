import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'theincall_method_channel.dart';

enum MediaType { mtAUDIO, mtVIDEO }

enum ForceSpeakerType { spDEFAULT, spFORCEON, spFORCEOFF }

enum RingtoneUriType { rtDEFAULT, rtBUNDLE }

abstract class TheincallPlatform extends PlatformInterface {
  /// Constructs a TheincallPlatform.
  TheincallPlatform() : super(token: _token);

  static final Object _token = Object();

  static TheincallPlatform _instance = MethodChannelTheincall();
  //static const EventChannel _eventChannel = EventChannel('theincall.Event');

  /// The default instance of [TheincallPlatform] to use.
  ///
  /// Defaults to [MethodChannelTheincall].
  static TheincallPlatform get instance => _instance;
  //static EventChannel get eventChannel => _eventChannel;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TheincallPlatform] when
  /// they register themselves.
  static set instance(TheincallPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);

    // _eventChannel.receiveBroadcastStream().listen(eventListener,
    //     cancelOnError: true,
    //     onError: (Object obj) => throw obj as PlatformException);

    _instance = instance;
  }

  // static final StreamController<bool> onProximity =
  //     StreamController.broadcast();
  // static final StreamController<String> onAudioDeviceChanged =
  //     StreamController.broadcast();
  // static final StreamController<String> onAudioFocusChange =
  //     StreamController.broadcast();
  // static final StreamController<String> onMediaButton =
  //     StreamController.broadcast();

  // static void eventListener(dynamic data) {
  //   Map<dynamic, dynamic> event = data as Map<dynamic, dynamic>;
  //   print('Event ${event['event']} => ${event.toString()}');
  //   switch (event['event']) {
  //     case 'WiredHeadset': //wire headset is plugged
  //       bool isPlugged = event['isPlugged'];
  //       bool hasMic = event['hasMic'];
  //       String deviceName = event['deviceName'];
  //       print(
  //           "WiredHeadset:isPlugged:$isPlugged hasMic:$hasMic deviceName:$deviceName");
  //       break;
  //     case 'Proximity':
  //       bool isNear = event['isNear'];
  //       onProximity.add(isNear);
  //       break;
  //     /* ----- For Android only ------ */
  //     case 'NoisyAudio': //noisy audio
  //       String status = event['status'];
  //       print("NoisyAudio:status:$status");
  //       break;
  //     case 'MediaButton':
  //       String eventText = event['eventText'];
  //       int eventCode = event['eventCode'];
  //       onMediaButton.add(eventText);
  //       break;
  //     case 'onAudioFocusChange':
  //       String eventText = event['eventText'];
  //       bool eventCode = event['eventCode'] is int
  //           ? event['eventCode'] > 0
  //           : event['eventCode'];
  //       onAudioFocusChange.add(eventText);
  //       break;
  //     case 'onAudioDeviceChanged':
  //       String availableAudioDeviceList = event['availableAudioDeviceList'];
  //       String selectedAudioDevice = event['selectedAudioDevice'];
  //       onAudioDeviceChanged.add(selectedAudioDevice);
  //       break;
  //     /* ----- For Android only ------ */
  //   }
  // }

  Future<String?> getPlatformVersion() {
    //return instance.getPlatformVersion();
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> start(
      {bool auto = true,
      MediaType media = MediaType.mtAUDIO,
      String? ringback}) async {
    //instance.start(auto: auto, media: media, ringback: ringback);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> stop({String? busytone}) async {
    //instance.stop(busytone: busytone);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setKeepScreenOn(bool enabled) async {
    //instance.setKeepScreenOn(enabled);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setSpeakerphoneOn(bool enabled) async {
    //instance.setSpeakerphoneOn(enabled);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setForceSpeakerphoneOn(
      {ForceSpeakerType flag = ForceSpeakerType.spDEFAULT}) async {
    //instance.setForceSpeakerphoneOn(flag: flag);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> enableProximitySensor(bool enabled) async {
    //instance.enableProximitySensor(enabled);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// For Android only
  Future<void> turnScreenOff() async {
    //instance.turnScreenOff();
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// For Android only
  Future<void> turnScreenOn() async {
    //instance.turnScreenOn();
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// For Android only
  Future<void> setMicrophoneMute(bool enabled) async {
    //instance.setMicrophoneMute(enabled);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /*
  @ringtoneUriType: BUNDLE | DEFAULT
  @iOSCategory:'ios value playback or default
  @ringSeconds: android only
  */
  Future<void> startRingtone(RingtoneUriType ringtoneUriType,
      String iOSCategory, int ringSeconds) async {
    //instance.startRingtone(ringtoneUriType, iOSCategory, ringSeconds);
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> stopRingtone() async {
    instance.stopRingtone();
  }

  /// Start Ringback.
  Future<void> startRingback() async {
    instance.startRingback();
  }

  /// Stop Ringback.
  Future<void> stopRingback() async {
    instance.stopRingback();
  }

  /// Check record permission.
  Future<String> checkRecordPermission() async {
    return instance.checkCameraPermission();
  }

  /// Request record permission.
  Future<String> requestRecordPermission() async {
    return instance.requestRecordPermission();
  }

  /// Check camera permission.
  Future<String> checkCameraPermission() async {
    //return instance.checkCameraPermission();
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Request camera permission.
  Future<String> requestCameraPermission() async {
    return instance.requestCameraPermission();
  }
}
