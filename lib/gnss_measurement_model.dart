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
    this.measurements,
    this.clock,
  });

  int contents;
  String string;
  List<Measurement> measurements;
  Clock clock;

  factory GnssMeasurementModel.fromJson(Map<String, dynamic> json) => GnssMeasurementModel(
    contents: json["contents"] == null ? null : json["contents"],
    string: json["string"] == null ? null : json["string"],
    measurements: json["measurements"] == null ? null : List<Measurement>.from(json["measurements"].map((x) => Measurement.fromJson(x))),
    clock: json["clock"] == null ? null : Clock.fromJson(json["clock"]),
  );

  Map<String, dynamic> toJson() => {
    "contents": contents == null ? null : contents,
    "string": string == null ? null : string,
    "measurements": measurements == null ? null : List<dynamic>.from(measurements.map((x) => x.toJson())),
    "clock": clock == null ? null : clock.toJson(),
  };
}

class Clock {
  Clock({
    this.contents,
    this.biasNanos,
    this.biasUncertaintyNanos,
    this.driftNanosPerSecond,
    this.driftUncertaintyNanosPerSecond,
    this.fullBiasNanos,
    this.hardwareClockDiscontinuityCount,
    this.leapSecond,
    this.timeNanos,
    this.timeUncertaintyNanos,
  });

  int contents;
  double biasNanos;
  double biasUncertaintyNanos;
  double driftNanosPerSecond;
  double driftUncertaintyNanosPerSecond;
  int fullBiasNanos;
  int hardwareClockDiscontinuityCount;
  int leapSecond;
  int timeNanos;
  double timeUncertaintyNanos;

  factory Clock.fromJson(Map<String, dynamic> json) => Clock(
    contents: json["contents"] == null ? null : json["contents"],
    biasNanos: json["biasNanos"] == null ? null : json["biasNanos"].toDouble(),
    biasUncertaintyNanos: json["biasUncertaintyNanos"] == null ? null : json["biasUncertaintyNanos"].toDouble(),
    driftNanosPerSecond: json["driftNanosPerSecond"] == null ? null : json["driftNanosPerSecond"].toDouble(),
    driftUncertaintyNanosPerSecond: json["driftUncertaintyNanosPerSecond"] == null ? null : json["driftUncertaintyNanosPerSecond"].toDouble(),
    fullBiasNanos: json["fullBiasNanos"] == null ? null : json["fullBiasNanos"],
    hardwareClockDiscontinuityCount: json["hardwareClockDiscontinuityCount"] == null ? null : json["hardwareClockDiscontinuityCount"],
    leapSecond: json["leapSecond"] == null ? null : json["leapSecond"],
    timeNanos: json["timeNanos"] == null ? null : json["timeNanos"],
    timeUncertaintyNanos: json["timeUncertaintyNanos"] == null ? null : json["timeUncertaintyNanos"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "contents": contents == null ? null : contents,
    "biasNanos": biasNanos == null ? null : biasNanos,
    "biasUncertaintyNanos": biasUncertaintyNanos == null ? null : biasUncertaintyNanos,
    "driftNanosPerSecond": driftNanosPerSecond == null ? null : driftNanosPerSecond,
    "driftUncertaintyNanosPerSecond": driftUncertaintyNanosPerSecond == null ? null : driftUncertaintyNanosPerSecond,
    "fullBiasNanos": fullBiasNanos == null ? null : fullBiasNanos,
    "hardwareClockDiscontinuityCount": hardwareClockDiscontinuityCount == null ? null : hardwareClockDiscontinuityCount,
    "leapSecond": leapSecond == null ? null : leapSecond,
    "timeNanos": timeNanos == null ? null : timeNanos,
    "timeUncertaintyNanos": timeUncertaintyNanos == null ? null : timeUncertaintyNanos,
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
