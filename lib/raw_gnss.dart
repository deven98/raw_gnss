import 'dart:async';

import 'package:flutter/services.dart';

class RawGnss {

  static const EventChannel _gnssMeasurementEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_measurement');

  static const EventChannel _gnssNavigationMessageEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_navigation_message');

  Stream _gnssMeasurementEvents;
  Stream _gnssNavigationMessageEvents;

  /// A broadcast stream of events from the device accelerometer.
  Stream get gnssMesasurementEvents {
    if (_gnssMeasurementEvents == null) {
      _gnssMeasurementEvents = _gnssMeasurementEventChannel
          .receiveBroadcastStream()
          .map(
              (dynamic event) => event);
    }
    return _gnssMeasurementEvents;
  }

  /// A broadcast stream of events from the device gyroscope.
  Stream get gnssNavigationMessageEvents {
    if (_gnssNavigationMessageEvents == null) {
      _gnssNavigationMessageEvents = _gnssNavigationMessageEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => event);
    }
    return _gnssNavigationMessageEvents;
  }
}
