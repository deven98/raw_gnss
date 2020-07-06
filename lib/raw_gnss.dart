import 'dart:async';

import 'package:flutter/services.dart';
import 'package:raw_gnss/gnss_measurement_model.dart';

class RawGnss {
  /// This channel hooks onto the stream for GnssMeasurement events
  static const EventChannel _gnssMeasurementEventChannel =
      EventChannel('dev.joshi.raw_gnss/gnss_measurement');

  /// This channel hooks onto the stream for GnssNavigationMessage events
  static const EventChannel _gnssNavigationMessageEventChannel =
      EventChannel('dev.joshi.raw_gnss/gnss_navigation_message');

  Stream<GnssMeasurementModel> _gnssMeasurementEvents;
  Stream _gnssNavigationMessageEvents;

  /// Getter for GnssMeasurement events
  Stream<GnssMeasurementModel> get gnssMeasurementEvents {
    if (_gnssMeasurementEvents == null) {
      _gnssMeasurementEvents = _gnssMeasurementEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => GnssMeasurementModel.fromJson(
              new Map<String, dynamic>.from(event)));
    }
    return _gnssMeasurementEvents;
  }

  /// Getter for GnssNavigationMessage events
  Stream get gnssNavigationMessageEvents {
    if (_gnssNavigationMessageEvents == null) {
      _gnssNavigationMessageEvents = _gnssNavigationMessageEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => event);
    }
    return _gnssNavigationMessageEvents;
  }
}
