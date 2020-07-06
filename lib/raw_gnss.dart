import 'dart:async';

import 'package:flutter/services.dart';

class RawGnss {

  static const EventChannel _gnssMeasurementEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_measurement');

  static const EventChannel _gnssNavigationMessageEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_navigation_message');

  Stream _accelerometerEvents;
  Stream _gyroscopeEvents;

  /// A broadcast stream of events from the device accelerometer.
  Stream get accelerometerEvents {
    if (_accelerometerEvents == null) {
      _accelerometerEvents = _gnssMeasurementEventChannel
          .receiveBroadcastStream()
          .map(
              (dynamic event) => event);
    }
    return _accelerometerEvents;
  }

  /// A broadcast stream of events from the device gyroscope.
  Stream get gyroscopeEvents {
    if (_gyroscopeEvents == null) {
      _gyroscopeEvents = _gnssNavigationMessageEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => event);
    }
    return _gyroscopeEvents;
  }
}
