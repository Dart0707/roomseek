part of 'generated.dart';

class CreateScheduleVariablesBuilder {
  String room;
  DateTime date;
  Timestamp fromTime;
  Timestamp toTime;
  Optional<String> _reason = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  CreateScheduleVariablesBuilder reason(String? t) {
   _reason.value = t;
   return this;
  }

  CreateScheduleVariablesBuilder(this._dataConnect, {required  this.room,required  this.date,required  this.fromTime,required  this.toTime,});
  Deserializer<CreateScheduleData> dataDeserializer = (dynamic json)  => CreateScheduleData.fromJson(jsonDecode(json));
  Serializer<CreateScheduleVariables> varsSerializer = (CreateScheduleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateScheduleData, CreateScheduleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateScheduleData, CreateScheduleVariables> ref() {
    CreateScheduleVariables vars= CreateScheduleVariables(room: room,date: date,fromTime: fromTime,toTime: toTime,reason: _reason,);
    return _dataConnect.mutation("CreateSchedule", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateScheduleScheduleInsert {
  final String schedId;
  CreateScheduleScheduleInsert.fromJson(dynamic json):

  schedId = nativeFromJson<String>(json['schedId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateScheduleScheduleInsert otherTyped = other as CreateScheduleScheduleInsert;
    return schedId == otherTyped.schedId;

  }
  @override
  int get hashCode => schedId.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['schedId'] = nativeToJson<String>(schedId);
    return json;
  }

  CreateScheduleScheduleInsert({
    required this.schedId,
  });
}

@immutable
class CreateScheduleData {
  final CreateScheduleScheduleInsert schedule_insert;
  CreateScheduleData.fromJson(dynamic json):

  schedule_insert = CreateScheduleScheduleInsert.fromJson(json['schedule_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateScheduleData otherTyped = other as CreateScheduleData;
    return schedule_insert == otherTyped.schedule_insert;

  }
  @override
  int get hashCode => schedule_insert.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['schedule_insert'] = schedule_insert.toJson();
    return json;
  }

  CreateScheduleData({
    required this.schedule_insert,
  });
}

@immutable
class CreateScheduleVariables {
  final String room;
  final DateTime date;
  final Timestamp fromTime;
  final Timestamp toTime;
  late final Optional<String>reason;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateScheduleVariables.fromJson(Map<String, dynamic> json):

  room = nativeFromJson<String>(json['room']),
  date = nativeFromJson<DateTime>(json['date']),
  fromTime = Timestamp.fromJson(json['fromTime']),
  toTime = Timestamp.fromJson(json['toTime']) {






    reason = Optional.optional(nativeFromJson, nativeToJson);
    reason.value = json['reason'] == null ? null : nativeFromJson<String>(json['reason']);

  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateScheduleVariables otherTyped = other as CreateScheduleVariables;
    return room == otherTyped.room &&
    date == otherTyped.date &&
    fromTime == otherTyped.fromTime &&
    toTime == otherTyped.toTime &&
    reason == otherTyped.reason;

  }
  @override
  int get hashCode => Object.hashAll([room.hashCode, date.hashCode, fromTime.hashCode, toTime.hashCode, reason.hashCode]);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['room'] = nativeToJson<String>(room);
    json['date'] = nativeToJson<DateTime>(date);
    json['fromTime'] = fromTime.toJson();
    json['toTime'] = toTime.toJson();
    if(reason.state == OptionalState.set) {
      json['reason'] = reason.toJson();
    }
    return json;
  }

  CreateScheduleVariables({
    required this.room,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.reason,
  });
}
