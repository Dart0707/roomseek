part of 'generated.dart';

class ApproveReservationVariablesBuilder {
  String resId;

  final FirebaseDataConnect _dataConnect;
  ApproveReservationVariablesBuilder(this._dataConnect, {required  this.resId,});
  Deserializer<ApproveReservationData> dataDeserializer = (dynamic json)  => ApproveReservationData.fromJson(jsonDecode(json));
  Serializer<ApproveReservationVariables> varsSerializer = (ApproveReservationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ApproveReservationData, ApproveReservationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ApproveReservationData, ApproveReservationVariables> ref() {
    ApproveReservationVariables vars= ApproveReservationVariables(resId: resId,);
    return _dataConnect.mutation("ApproveReservation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ApproveReservationReservationUpdate {
  final String resId;
  ApproveReservationReservationUpdate.fromJson(dynamic json):
  
  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ApproveReservationReservationUpdate otherTyped = other as ApproveReservationReservationUpdate;
    return resId == otherTyped.resId;
    
  }
  @override
  int get hashCode => resId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  ApproveReservationReservationUpdate({
    required this.resId,
  });
}

@immutable
class ApproveReservationData {
  final ApproveReservationReservationUpdate? reservation_update;
  ApproveReservationData.fromJson(dynamic json):
  
  reservation_update = json['reservation_update'] == null ? null : ApproveReservationReservationUpdate.fromJson(json['reservation_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ApproveReservationData otherTyped = other as ApproveReservationData;
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

  ApproveReservationData({
    this.reservation_update,
  });
}

@immutable
class ApproveReservationVariables {
  final String resId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ApproveReservationVariables.fromJson(Map<String, dynamic> json):
  
  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ApproveReservationVariables otherTyped = other as ApproveReservationVariables;
    return resId == otherTyped.resId;
    
  }
  @override
  int get hashCode => resId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  ApproveReservationVariables({
    required this.resId,
  });
}

