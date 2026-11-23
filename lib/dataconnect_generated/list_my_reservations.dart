part of 'generated.dart';

class ListMyReservationsVariablesBuilder {
  String idNum;

  final FirebaseDataConnect _dataConnect;
  ListMyReservationsVariablesBuilder(this._dataConnect, {required  this.idNum,});
  Deserializer<ListMyReservationsData> dataDeserializer = (dynamic json)  => ListMyReservationsData.fromJson(jsonDecode(json));
  Serializer<ListMyReservationsVariables> varsSerializer = (ListMyReservationsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListMyReservationsData, ListMyReservationsVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListMyReservationsData, ListMyReservationsVariables> ref() {
    ListMyReservationsVariables vars= ListMyReservationsVariables(idNum: idNum,);
    return _dataConnect.query("ListMyReservations", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListMyReservationsReservations {
  final String resId;
  final String roomId;
  final DateTime day;
  final Timestamp startTime;
  final Timestamp endTime;
  final EnumValue<ReservationStatus> status;
  final String purpose;
  final String? rejectionReason;
  ListMyReservationsReservations.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']),
  roomId = nativeFromJson<String>(json['roomId']),
  day = nativeFromJson<DateTime>(json['day']),
  startTime = Timestamp.fromJson(json['startTime']),
  endTime = Timestamp.fromJson(json['endTime']),
  status = reservationStatusDeserializer(json['status']),
  purpose = nativeFromJson<String>(json['purpose']),
  rejectionReason = json['rejectionReason'] == null ? null : nativeFromJson<String>(json['rejectionReason']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListMyReservationsReservations otherTyped = other as ListMyReservationsReservations;
    return resId == otherTyped.resId && 
    roomId == otherTyped.roomId && 
    day == otherTyped.day && 
    startTime == otherTyped.startTime && 
    endTime == otherTyped.endTime && 
    status == otherTyped.status && 
    purpose == otherTyped.purpose && 
    rejectionReason == otherTyped.rejectionReason;
    
  }
  @override
  int get hashCode => Object.hashAll([resId.hashCode, roomId.hashCode, day.hashCode, startTime.hashCode, endTime.hashCode, status.hashCode, purpose.hashCode, rejectionReason.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    json['roomId'] = nativeToJson<String>(roomId);
    json['day'] = nativeToJson<DateTime>(day);
    json['startTime'] = startTime.toJson();
    json['endTime'] = endTime.toJson();
    json['status'] = 
    reservationStatusSerializer(status)
    ;
    json['purpose'] = nativeToJson<String>(purpose);
    if (rejectionReason != null) {
      json['rejectionReason'] = nativeToJson<String?>(rejectionReason);
    }
    return json;
  }

  ListMyReservationsReservations({
    required this.resId,
    required this.roomId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.purpose,
    this.rejectionReason,
  });
}

@immutable
class ListMyReservationsData {
  final List<ListMyReservationsReservations> reservations;
  ListMyReservationsData.fromJson(dynamic json):
  
  reservations = (json['reservations'] as List<dynamic>)
        .map((e) => ListMyReservationsReservations.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListMyReservationsData otherTyped = other as ListMyReservationsData;
    return reservations == otherTyped.reservations;
    
  }
  @override
  int get hashCode => reservations.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['reservations'] = reservations.map((e) => e.toJson()).toList();
    return json;
  }

  ListMyReservationsData({
    required this.reservations,
  });
}

@immutable
class ListMyReservationsVariables {
  final String idNum;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListMyReservationsVariables.fromJson(Map<String, dynamic> json):
  
  idNum = nativeFromJson<String>(json['idNum']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListMyReservationsVariables otherTyped = other as ListMyReservationsVariables;
    return idNum == otherTyped.idNum;
    
  }
  @override
  int get hashCode => idNum.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['idNum'] = nativeToJson<String>(idNum);
    return json;
  }

  ListMyReservationsVariables({
    required this.idNum,
  });
}

