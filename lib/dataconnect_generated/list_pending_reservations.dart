part of 'generated.dart';

class ListPendingReservationsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListPendingReservationsVariablesBuilder(this._dataConnect, );
  Deserializer<ListPendingReservationsData> dataDeserializer = (dynamic json)  => ListPendingReservationsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListPendingReservationsData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListPendingReservationsData, void> ref() {
    
    return _dataConnect.query("ListPendingReservations", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListPendingReservationsReservations {
  final String resId;
  final String roomId;
  final String idNum;
  final Timestamp startTime;
  final Timestamp endTime;
  final String purpose;
  ListPendingReservationsReservations.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']),
  roomId = nativeFromJson<String>(json['roomId']),
  idNum = nativeFromJson<String>(json['idNum']),
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

    final ListPendingReservationsReservations otherTyped = other as ListPendingReservationsReservations;
    return resId == otherTyped.resId && 
    roomId == otherTyped.roomId && 
    idNum == otherTyped.idNum && 
    startTime == otherTyped.startTime && 
    endTime == otherTyped.endTime && 
    purpose == otherTyped.purpose;
    
  }
  @override
  int get hashCode => Object.hashAll([resId.hashCode, roomId.hashCode, idNum.hashCode, startTime.hashCode, endTime.hashCode, purpose.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    json['roomId'] = nativeToJson<String>(roomId);
    json['idNum'] = nativeToJson<String>(idNum);
    json['startTime'] = startTime.toJson();
    json['endTime'] = endTime.toJson();
    json['purpose'] = nativeToJson<String>(purpose);
    return json;
  }

  ListPendingReservationsReservations({
    required this.resId,
    required this.roomId,
    required this.idNum,
    required this.startTime,
    required this.endTime,
    required this.purpose,
  });
}

@immutable
class ListPendingReservationsData {
  final List<ListPendingReservationsReservations> reservations;
  ListPendingReservationsData.fromJson(dynamic json):
  
  reservations = (json['reservations'] as List<dynamic>)
        .map((e) => ListPendingReservationsReservations.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListPendingReservationsData otherTyped = other as ListPendingReservationsData;
    return reservations == otherTyped.reservations;
    
  }
  @override
  int get hashCode => reservations.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['reservations'] = reservations.map((e) => e.toJson()).toList();
    return json;
  }

  ListPendingReservationsData({
    required this.reservations,
  });
}

