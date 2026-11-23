part of 'generated.dart';

class RejectReservationVariablesBuilder {
  String resId;
  String rejectionReason;

  final FirebaseDataConnect _dataConnect;
  RejectReservationVariablesBuilder(this._dataConnect, {required  this.resId,required  this.rejectionReason,});
  Deserializer<RejectReservationData> dataDeserializer = (dynamic json)  => RejectReservationData.fromJson(jsonDecode(json));
  Serializer<RejectReservationVariables> varsSerializer = (RejectReservationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejectReservationData, RejectReservationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejectReservationData, RejectReservationVariables> ref() {
    RejectReservationVariables vars= RejectReservationVariables(resId: resId,rejectionReason: rejectionReason,);
    return _dataConnect.mutation("RejectReservation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejectReservationReservationUpdate {
  final String resId;
  RejectReservationReservationUpdate.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejectReservationReservationUpdate otherTyped = other as RejectReservationReservationUpdate;
    return resId == otherTyped.resId;
    
  }
  @override
  int get hashCode => resId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  RejectReservationReservationUpdate({
    required this.resId,
  });
}

@immutable
class RejectReservationData {
  final RejectReservationReservationUpdate? reservation_update;
  RejectReservationData.fromJson(dynamic json):
  
  reservation_update = json['reservation_update'] == null ? null : RejectReservationReservationUpdate.fromJson(json['reservation_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejectReservationData otherTyped = other as RejectReservationData;
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

  RejectReservationData({
    this.reservation_update,
  });
}

@immutable
class RejectReservationVariables {
  final String resId;
  final String rejectionReason;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejectReservationVariables.fromJson(Map<String, dynamic> json):
  
  resId = nativeFromJson<String>(json['resId']),
  rejectionReason = nativeFromJson<String>(json['rejectionReason']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejectReservationVariables otherTyped = other as RejectReservationVariables;
    return resId == otherTyped.resId && 
    rejectionReason == otherTyped.rejectionReason;
    
  }
  @override
  int get hashCode => Object.hashAll([resId.hashCode, rejectionReason.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    json['rejectionReason'] = nativeToJson<String>(rejectionReason);
    return json;
  }

  RejectReservationVariables({
    required this.resId,
    required this.rejectionReason,
  });
}

