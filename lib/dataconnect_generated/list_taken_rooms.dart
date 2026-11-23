part of 'generated.dart';

class ListTakenRoomsVariablesBuilder {
  Timestamp fromTime;
  Timestamp toTime;
  DateTime day;

  final FirebaseDataConnect _dataConnect;
  ListTakenRoomsVariablesBuilder(this._dataConnect, {required  this.fromTime,required  this.toTime,required  this.day,});
  Deserializer<ListTakenRoomsData> dataDeserializer = (dynamic json)  => ListTakenRoomsData.fromJson(jsonDecode(json));
  Serializer<ListTakenRoomsVariables> varsSerializer = (ListTakenRoomsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListTakenRoomsData, ListTakenRoomsVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListTakenRoomsData, ListTakenRoomsVariables> ref() {
    ListTakenRoomsVariables vars= ListTakenRoomsVariables(fromTime: fromTime,toTime: toTime,day: day,);
    return _dataConnect.query("ListTakenRooms", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListTakenRoomsReservations {
  final String resId;
  final String roomId;
  final DateTime day;
  final Timestamp startTime;
  final Timestamp endTime;
  final String purpose;
  ListTakenRoomsReservations.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']),
  roomId = nativeFromJson<String>(json['roomId']),
  day = nativeFromJson<DateTime>(json['day']),
  startTime = Timestamp.fromJson(json['startTime']),
  endTime = Timestamp.fromJson(json['endTime']),
  purpose = nativeFromJson<String>(json['purpose']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListTakenRoomsReservations otherTyped = other as ListTakenRoomsReservations;
    return resId == otherTyped.resId && 
    roomId == otherTyped.roomId && 
    day == otherTyped.day && 
    startTime == otherTyped.startTime && 
    endTime == otherTyped.endTime && 
    purpose == otherTyped.purpose;
    
  }
  @override
  int get hashCode => Object.hashAll([resId.hashCode, roomId.hashCode, day.hashCode, startTime.hashCode, endTime.hashCode, purpose.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    json['roomId'] = nativeToJson<String>(roomId);
    json['day'] = nativeToJson<DateTime>(day);
    json['startTime'] = startTime.toJson();
    json['endTime'] = endTime.toJson();
    json['purpose'] = nativeToJson<String>(purpose);
    return json;
  }

  ListTakenRoomsReservations({
    required this.resId,
    required this.roomId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.purpose,
  });
}

@immutable
class ListTakenRoomsData {
  final List<ListTakenRoomsReservations> reservations;
  ListTakenRoomsData.fromJson(dynamic json):
  
  reservations = (json['reservations'] as List<dynamic>)
        .map((e) => ListTakenRoomsReservations.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListTakenRoomsData otherTyped = other as ListTakenRoomsData;
    return reservations == otherTyped.reservations;
    
  }
  @override
  int get hashCode => reservations.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['reservations'] = reservations.map((e) => e.toJson()).toList();
    return json;
  }

  ListTakenRoomsData({
    required this.reservations,
  });
}

@immutable
class ListTakenRoomsVariables {
  final Timestamp fromTime;
  final Timestamp toTime;
  final DateTime day;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListTakenRoomsVariables.fromJson(Map<String, dynamic> json):
  
  fromTime = Timestamp.fromJson(json['fromTime']),
  toTime = Timestamp.fromJson(json['toTime']),
  day = nativeFromJson<DateTime>(json['day']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListTakenRoomsVariables otherTyped = other as ListTakenRoomsVariables;
    return fromTime == otherTyped.fromTime && 
    toTime == otherTyped.toTime && 
    day == otherTyped.day;
    
  }
  @override
  int get hashCode => Object.hashAll([fromTime.hashCode, toTime.hashCode, day.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['fromTime'] = fromTime.toJson();
    json['toTime'] = toTime.toJson();
    json['day'] = nativeToJson<DateTime>(day);
    return json;
  }

  ListTakenRoomsVariables({
    required this.fromTime,
    required this.toTime,
    required this.day,
  });
}

