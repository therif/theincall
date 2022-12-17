import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'theincall_platform_interface.dart';

/// An implementation of [TheincallPlatform] that uses method channels.
class MethodChannelTheincall extends TheincallPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  //final methodChannel = const MethodChannel('theincall.Method');
  final methodChannel = const MethodChannel('theincall.Method');

  final EventChannel _eventChannel = const EventChannel('theincall.Event');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  MethodChannelTheincall() {
    _eventChannel.receiveBroadcastStream().listen(eventListener,
        cancelOnError: true,
        onError: (Object obj) => throw obj as PlatformException);
  }

  final StreamController<bool> onProximity = StreamController.broadcast();
  final StreamController<String> onAudioDeviceChanged =
      StreamController.broadcast();
  final StreamController<String> onAudioFocusChange =
      StreamController.broadcast();
  final StreamController<String> onMediaButton = StreamController.broadcast();

  void eventListener(dynamic data) {
    Map<dynamic, dynamic> event = data as Map<dynamic, dynamic>;
    print('Event ${event['event']} => ${event.toString()}');
    switch (event['event']) {
      case 'WiredHeadset': //wire headset is plugged
        bool isPlugged = event['isPlugged'];
        bool hasMic = event['hasMic'];
        String deviceName = event['deviceName'];
        print(
            "WiredHeadset:isPlugged:$isPlugged hasMic:$hasMic deviceName:$deviceName");
        break;
      case 'Proximity':
        bool isNear = event['isNear'];
        onProximity.add(isNear);
        break;
      /* ----- For Android only ------ */
      case 'NoisyAudio': //noisy audio
        String status = event['status'];
        print("NoisyAudio:status:$status");
        break;
      case 'MediaButton':
        String eventText = event['eventText'];
        int eventCode = event['eventCode'];
        onMediaButton.add(eventText);
        break;
      case 'onAudioFocusChange':
        String eventText = event['eventText'];
        bool eventCode = event['eventCode'] is int
            ? event['eventCode'] > 0
            : event['eventCode'];
        onAudioFocusChange.add(eventText);
        break;
      case 'onAudioDeviceChanged':
        String availableAudioDeviceList = event['availableAudioDeviceList'];
        String selectedAudioDevice = event['selectedAudioDevice'];
        onAudioDeviceChanged.add(selectedAudioDevice);
        break;
      /* ----- For Android only ------ */
    }
  }

  /// Start InCallManager
  @override
  Future<void> start(
      {bool auto = true,
      MediaType media = MediaType.mtAUDIO,
      String? ringback}) async {
    await methodChannel.invokeMethod('start', <String, dynamic>{
      'media': media == MediaType.mtAUDIO ? 'audio' : 'video',
      'auto': auto,
      'ringback': ringback
    });
  }

  /// Stop InCallManager
  @override
  Future<void> stop({String? busytone}) async {
    await methodChannel
        .invokeMethod('stop', <String, dynamic>{'busytone': busytone});
  }

  @override
  Future<void> setKeepScreenOn(bool enabled) async {
    await methodChannel
        .invokeMethod('setKeepScreenOn', <String, dynamic>{'enabled': enabled});
  }

  @override
  Future<void> setSpeakerphoneOn(bool enabled) async {
    await methodChannel.invokeMethod(
        'setSpeakerphoneOn', <String, dynamic>{'enabled': enabled});
  }

  @override
  Future<void> setForceSpeakerphoneOn(
      {ForceSpeakerType flag = ForceSpeakerType.spDEFAULT}) async {
    await methodChannel
        .invokeMethod('setForceSpeakerphoneOn', <String, dynamic>{
      'flag': flag == ForceSpeakerType.spDEFAULT
          ? 0
          : (flag == ForceSpeakerType.spFORCEON ? 1 : -1)
    });
  }

  @override
  Future<void> enableProximitySensor(bool enabled) async {
    await methodChannel.invokeMethod(
        'enableProximitySensor', <String, dynamic>{'enabled': enabled});
  }

  /// For Android only
  @override
  Future<void> turnScreenOff() async {
    if (Platform.isAndroid) {
      await methodChannel.invokeMethod('turnScreenOff');
    }
    await methodChannel.invokeMethod('turnScreenOff');
  }

  /// For Android only
  @override
  Future<void> turnScreenOn() async {
    await methodChannel.invokeMethod('turnScreenOn');
  }

  /// For Android only
  @override
  Future<void> setMicrophoneMute(bool enabled) async {
    await methodChannel.invokeMethod(
        'setMicrophoneMute', <String, dynamic>{'enabled': enabled});
  }

  /*
  @ringtoneUriType: BUNDLE | DEFAULT
  @iOSCategory:'ios value playback or default
  @ringSeconds: android only
  */
  @override
  Future<void> startRingtone(RingtoneUriType ringtoneUriType,
      String iOSCategory, int ringSeconds) async {
    try {
      await methodChannel.invokeMethod('startRingtone', <String, dynamic>{
        'ringtoneUriType': (ringtoneUriType == RingtoneUriType.rtBUNDLE
            ? '_BUNDLE_'
            : '_DEFAULT_'),
        'ios_category': iOSCategory,
        'seconds': ringSeconds,
      });
    } on PlatformException catch (e) {
      throw 'Unable to startRingtone: ${e.message}';
    }
  }

  @override
  Future<void> stopRingtone() async {
    try {
      await methodChannel.invokeMethod('stopRingtone');
    } on PlatformException catch (e) {
      throw 'Unable to stopRingtone: ${e.message}';
    }
  }

  /// Start Ringback.
  @override
  Future<void> startRingback() async {
    try {
      await methodChannel.invokeMethod('startRingback');
    } on PlatformException catch (e) {
      throw 'Unable to startRingback: ${e.message}';
    }
  }

  /// Stop Ringback.
  @override
  Future<void> stopRingback() async {
    try {
      await methodChannel.invokeMethod('stopRingback');
    } on PlatformException catch (e) {
      throw 'Unable to stopRingback: ${e.message}';
    }
  }

  /// Check record permission.
  @override
  Future<String> checkRecordPermission() async {
    String response = "unknow";
    try {
      response = await methodChannel.invokeMethod('checkRecordPermission');
    } catch (e) {
      //
    }

    return response;
  }

  /// Request record permission.
  @override
  Future<String> requestRecordPermission() async {
    String response = "unknow";
    try {
      response = await methodChannel.invokeMethod('requestRecordPermission');
    } catch (e) {
      //
    }

    return response;
  }

  /// Check camera permission.
  @override
  Future<String> checkCameraPermission() async {
    String response = "unknow";
    try {
      response = await methodChannel.invokeMethod('checkCameraPermission');
    } catch (e) {
      //
    }

    return response;
  }

  /// Request camera permission.
  @override
  Future<String> requestCameraPermission() async {
    String response = "unknow";
    try {
      response = await methodChannel.invokeMethod('requestCameraPermission');
    } catch (e) {
      //
    }

    return response;
  }
}
