import 'dart:async';

import 'package:flutter/services.dart';
import 'package:raw_gnss/gnss_measurement_model.dart';

class RawGnss {

  static const EventChannel _gnssMeasurementEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_measurement');

  static const EventChannel _gnssNavigationMessageEventChannel =
  EventChannel('dev.joshi.raw_gnss/gnss_navigation_message');

  Stream _gnssMeasurementEvents;
  Stream _gnssNavigationMessageEvents;

  Stream get gnssMeasurementEvents {
    if (_gnssMeasurementEvents == null) {
      _gnssMeasurementEvents = _gnssMeasurementEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => GnssMeasurementModel.fromJson(new Map<String, dynamic>.from(event)));
    }
    return _gnssMeasurementEvents;
  }

  Stream get gnssNavigationMessageEvents {
    if (_gnssNavigationMessageEvents == null) {
      _gnssNavigationMessageEvents = _gnssNavigationMessageEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => event);
    }
    return _gnssNavigationMessageEvents;
  }
}
