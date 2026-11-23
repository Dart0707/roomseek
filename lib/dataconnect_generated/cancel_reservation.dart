part of 'generated.dart';

class CancelReservationVariablesBuilder {
  String resId;

  final FirebaseDataConnect _dataConnect;
  CancelReservationVariablesBuilder(this._dataConnect, {required  this.resId,});
  Deserializer<CancelReservationData> dataDeserializer = (dynamic json)  => CancelReservationData.fromJson(jsonDecode(json));
  Serializer<CancelReservationVariables> varsSerializer = (CancelReservationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CancelReservationData, CancelReservationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CancelReservationData, CancelReservationVariables> ref() {
    CancelReservationVariables vars= CancelReservationVariables(resId: resId,);
    return _dataConnect.mutation("CancelReservation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CancelReservationReservationUpdate {
  final String resId;
  CancelReservationReservationUpdate.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CancelReservationReservationUpdate otherTyped = other as CancelReservationReservationUpdate;
    return resId == otherTyped.resId;
    
  }
  @override
  int get hashCode => resId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  CancelReservationReservationUpdate({
    required this.resId,
  });
}

@immutable
class CancelReservationData {
  final CancelReservationReservationUpdate? reservation_update;
  CancelReservationData.fromJson(dynamic json):
  
  reservation_update = json['reservation_update'] == null ? null : CancelReservationReservationUpdate.fromJson(json['reservation_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CancelReservationData otherTyped = other as CancelReservationData;
    return reservation_update == otherTyped.reservation_update;
    
  }
  @override
  int get hashCode => reservation_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (reservation_update != null) {
      json['reservation_update'] = reservation_update!.toJson();
    }
    return json;
  }

  CancelReservationData({
    this.reservation_update,
  });
}

@immutable
class CancelReservationVariables {
  final String resId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CancelReservationVariables.fromJson(Map<String, dynamic> json):
  
  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CancelReservationVariables otherTyped = other as CancelReservationVariables;
    return resId == otherTyped.resId;
    
  }
  @override
  int get hashCode => resId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  CancelReservationVariables({
    required this.resId,
  });
}

