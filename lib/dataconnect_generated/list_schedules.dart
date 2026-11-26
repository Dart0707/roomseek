part of 'generated.dart';

class ListSchedulesVariablesBuilder {

  final FirebaseDataConnect _dataConnect;
  ListSchedulesVariablesBuilder(this._dataConnect, );
  Deserializer<ListSchedulesData> dataDeserializer = (dynamic json)  => ListSchedulesData.fromJson(jsonDecode(json));

  Future<QueryResult<ListSchedulesData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListSchedulesData, void> ref() {

    return _dataConnect.query("ListSchedules", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListSchedulesSchedules {
  final String schedId;
  final String room;
  final DateTime date;
  final Timestamp fromTime;
  final Timestamp toTime;
  final bool isOccupied;
  final String? reason;
  ListSchedulesSchedules.fromJson(dynamic json):

  schedId = nativeFromJson<String>(json['schedId']),
  room = nativeFromJson<String>(json['room']),
  date = nativeFromJson<DateTime>(json['date']),
  fromTime = Timestamp.fromJson(json['fromTime']),
  toTime = Timestamp.fromJson(json['toTime']),
  isOccupied = nativeFromJson<bool>(json['isOccupied']),
  reason = json['reason'] == null ? null : nativeFromJson<String>(json['reason']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSchedulesSchedules otherTyped = other as ListSchedulesSchedules;
    return schedId == otherTyped.schedId &&
    room == otherTyped.room &&
    date == otherTyped.date &&
    fromTime == otherTyped.fromTime &&
    toTime == otherTyped.toTime &&
    isOccupied == otherTyped.isOccupied &&
    reason == otherTyped.reason;

  }
  @override
  int get hashCode => Object.hashAll([schedId.hashCode, room.hashCode, date.hashCode, fromTime.hashCode, toTime.hashCode, isOccupied.hashCode, reason.hashCode]);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['schedId'] = nativeToJson<String>(schedId);
    json['room'] = nativeToJson<String>(room);
    json['date'] = nativeToJson<DateTime>(date);
    json['fromTime'] = fromTime.toJson();
    json['toTime'] = toTime.toJson();
    json['isOccupied'] = nativeToJson<bool>(isOccupied);
    if (reason != null) {
      json['reason'] = nativeToJson<String?>(reason);
    }
    return json;
  }

  ListSchedulesSchedules({
    required this.schedId,
    required this.room,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.isOccupied,
    this.reason,
  });
}

@immutable
class ListSchedulesData {
  final List<ListSchedulesSchedules> schedules;
  ListSchedulesData.fromJson(dynamic json):

  schedules = (json['schedules'] as List<dynamic>)
        .map((e) => ListSchedulesSchedules.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSchedulesData otherTyped = other as ListSchedulesData;
    return schedules == otherTyped.schedules;

  }
  @override
  int get hashCode => schedules.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['schedules'] = schedules.map((e) => e.toJson()).toList();
    return json;
  }

  ListSchedulesData({
    required this.schedules,
  });
}
