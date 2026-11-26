part of 'generated.dart';

class ListReservationsVariablesBuilder {

  final FirebaseDataConnect _dataConnect;
  ListReservationsVariablesBuilder(this._dataConnect, );
  Deserializer<ListReservationsData> dataDeserializer = (dynamic json)  => ListReservationsData.fromJson(jsonDecode(json));

  Future<QueryResult<ListReservationsData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListReservationsData, void> ref() {

    return _dataConnect.query("ListReservations", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListReservationsReservations {
  final String resId;
  final String schedId;
  final String idNum;
  final EnumValue<ReservationStatus> status;
  ListReservationsReservations.fromJson(dynamic json):

  resId = nativeFromJson<String>(json['resId']),
  schedId = nativeFromJson<String>(json['schedId']),
  idNum = nativeFromJson<String>(json['idNum']),
  status = reservationStatusDeserializer(json['status']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListReservationsReservations otherTyped = other as ListReservationsReservations;
    return resId == otherTyped.resId &&
    schedId == otherTyped.schedId &&
    idNum == otherTyped.idNum &&
    status == otherTyped.status;

  }
  @override
  int get hashCode => Object.hashAll([resId.hashCode, schedId.hashCode, idNum.hashCode, status.hashCode]);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    json['schedId'] = nativeToJson<String>(schedId);
    json['idNum'] = nativeToJson<String>(idNum);
    json['status'] =
    reservationStatusSerializer(status)
    ;
    return json;
  }

  ListReservationsReservations({
    required this.resId,
    required this.schedId,
    required this.idNum,
    required this.status,
  });
}

@immutable
class ListReservationsData {
  final List<ListReservationsReservations> reservations;
  ListReservationsData.fromJson(dynamic json):

  reservations = (json['reservations'] as List<dynamic>)
        .map((e) => ListReservationsReservations.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListReservationsData otherTyped = other as ListReservationsData;
    return reservations == otherTyped.reservations;

  }
  @override
  int get hashCode => reservations.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['reservations'] = reservations.map((e) => e.toJson()).toList();
    return json;
  }

  ListReservationsData({
    required this.reservations,
  });
}
