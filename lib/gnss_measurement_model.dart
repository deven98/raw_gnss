// To parse this JSON data, do
//
//     final gnssMeasurementModel = gnssMeasurementModelFromJson(jsonString);

import 'dart:convert';

GnssMeasurementModel gnssMeasurementModelFromJson(String str) => GnssMeasurementModel.fromJson(json.decode(str));

String gnssMeasurementModelToJson(GnssMeasurementModel data) => json.encode(data.toJson());

class GnssMeasurementModel {
  GnssMeasurementModel({
    this.contents,
    this.string,
    this.clock,
    this.measurements,
  });

  int contents;
  String string;
  Map<String, double> clock;
  List<Measurement> measurements;

  factory GnssMeasurementModel.fromJson(Map<String, dynamic> json) => GnssMeasurementModel(
    contents: json["contents"] == null ? null : json["contents"],
    string: json["string"] == null ? null : json["string"],
    clock: json["clock"] == null ? null : Map.from(json["clock"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    measurements: json["measurements"] == null ? null : List<Measurement>.from(json["measurements"].map((x) => Measurement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contents": contents == null ? null : contents,
    "string": string == null ? null : string,
    "clock": clock == null ? null : Map.from(clock).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "measurements": measurements == null ? null : List<dynamic>.from(measurements.map((x) => x.toJson())),
  };
}

class Measurement {
  Measurement({
    this.contents,
    this.accumulatedDeltaRangeMeters,
    this.accumulatedDeltaRangeState,
    this.accumulatedDeltaRangeUncertaintyMeters,
    this.automaticGainControlLevelDb,
    this.carrierFrequencyHz,
    this.cn0DbHz,
    this.constellationType,
    this.multipathIndicator,
    this.pseudorangeRateMetersPerSecond,
    this.pseudorangeRateUncertaintyMetersPerSecond,
    this.receivedSvTimeNanos,
    this.receivedSvTimeUncertaintyNanos,
    this.snrInDb,
    this.state,
    this.svid,
    this.timeOffsetNanos,
    this.string,
  });

  int contents;
  double accumulatedDeltaRangeMeters;
  int accumulatedDeltaRangeState;
  double accumulatedDeltaRangeUncertaintyMeters;
  double automaticGainControlLevelDb;
  double carrierFrequencyHz;
  double cn0DbHz;
  int constellationType;
  int multipathIndicator;
  double pseudorangeRateMetersPerSecond;
  double pseudorangeRateUncertaintyMetersPerSecond;
  int receivedSvTimeNanos;
  int receivedSvTimeUncertaintyNanos;
  double snrInDb;
  int state;
  int svid;
  double timeOffsetNanos;
  String string;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    contents: json["contents"] == null ? null : json["contents"],
    accumulatedDeltaRangeMeters: json["accumulatedDeltaRangeMeters"] == null ? null : json["accumulatedDeltaRangeMeters"].toDouble(),
    accumulatedDeltaRangeState: json["accumulatedDeltaRangeState"] == null ? null : json["accumulatedDeltaRangeState"],
    accumulatedDeltaRangeUncertaintyMeters: json["accumulatedDeltaRangeUncertaintyMeters"] == null ? null : json["accumulatedDeltaRangeUncertaintyMeters"].toDouble(),
    automaticGainControlLevelDb: json["automaticGainControlLevelDb"] == null ? null : json["automaticGainControlLevelDb"].toDouble(),
    carrierFrequencyHz: json["carrierFrequencyHz"] == null ? null : json["carrierFrequencyHz"].toDouble(),
    cn0DbHz: json["cn0DbHz"] == null ? null : json["cn0DbHz"].toDouble(),
    constellationType: json["constellationType"] == null ? null : json["constellationType"],
    multipathIndicator: json["multipathIndicator"] == null ? null : json["multipathIndicator"],
    pseudorangeRateMetersPerSecond: json["pseudorangeRateMetersPerSecond"] == null ? null : json["pseudorangeRateMetersPerSecond"].toDouble(),
    pseudorangeRateUncertaintyMetersPerSecond: json["pseudorangeRateUncertaintyMetersPerSecond"] == null ? null : json["pseudorangeRateUncertaintyMetersPerSecond"].toDouble(),
    receivedSvTimeNanos: json["receivedSvTimeNanos"] == null ? null : json["receivedSvTimeNanos"],
    receivedSvTimeUncertaintyNanos: json["receivedSvTimeUncertaintyNanos"] == null ? null : json["receivedSvTimeUncertaintyNanos"],
    snrInDb: json["snrInDb"] == null ? null : json["snrInDb"].toDouble(),
    state: json["state"] == null ? null : json["state"],
    svid: json["svid"] == null ? null : json["svid"],
    timeOffsetNanos: json["timeOffsetNanos"] == null ? null : json["timeOffsetNanos"].toDouble(),
    string: json["string"] == null ? null : json["string"],
  );

  Map<String, dynamic> toJson() => {
    "contents": contents == null ? null : contents,
    "accumulatedDeltaRangeMeters": accumulatedDeltaRangeMeters == null ? null : accumulatedDeltaRangeMeters,
    "accumulatedDeltaRangeState": accumulatedDeltaRangeState == null ? null : accumulatedDeltaRangeState,
    "accumulatedDeltaRangeUncertaintyMeters": accumulatedDeltaRangeUncertaintyMeters == null ? null : accumulatedDeltaRangeUncertaintyMeters,
    "automaticGainControlLevelDb": automaticGainControlLevelDb == null ? null : automaticGainControlLevelDb,
    "carrierFrequencyHz": carrierFrequencyHz == null ? null : carrierFrequencyHz,
    "cn0DbHz": cn0DbHz == null ? null : cn0DbHz,
    "constellationType": constellationType == null ? null : constellationType,
    "multipathIndicator": multipathIndicator == null ? null : multipathIndicator,
    "pseudorangeRateMetersPerSecond": pseudorangeRateMetersPerSecond == null ? null : pseudorangeRateMetersPerSecond,
    "pseudorangeRateUncertaintyMetersPerSecond": pseudorangeRateUncertaintyMetersPerSecond == null ? null : pseudorangeRateUncertaintyMetersPerSecond,
    "receivedSvTimeNanos": receivedSvTimeNanos == null ? null : receivedSvTimeNanos,
    "receivedSvTimeUncertaintyNanos": receivedSvTimeUncertaintyNanos == null ? null : receivedSvTimeUncertaintyNanos,
    "snrInDb": snrInDb == null ? null : snrInDb,
    "state": state == null ? null : state,
    "svid": svid == null ? null : svid,
    "timeOffsetNanos": timeOffsetNanos == null ? null : timeOffsetNanos,
    "string": string == null ? null : string,
  };
}
