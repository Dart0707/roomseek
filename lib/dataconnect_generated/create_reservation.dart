part of 'generated.dart';

class CreateReservationVariablesBuilder {
  String schedId;
  String idNum;
  Optional<ReservationStatus> _status = Optional.optional((data) => ReservationStatus.values.byName(data), enumSerializer);

  final FirebaseDataConnect _dataConnect;  CreateReservationVariablesBuilder status(ReservationStatus? t) {
   _status.value = t;
   return this;
  }

  CreateReservationVariablesBuilder(this._dataConnect, {required  this.schedId,required  this.idNum,});
  Deserializer<CreateReservationData> dataDeserializer = (dynamic json)  => CreateReservationData.fromJson(jsonDecode(json));
  Serializer<CreateReservationVariables> varsSerializer = (CreateReservationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateReservationData, CreateReservationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateReservationData, CreateReservationVariables> ref() {
    CreateReservationVariables vars= CreateReservationVariables(schedId: schedId,idNum: idNum,status: _status,);
    return _dataConnect.mutation("CreateReservation", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateReservationReservationInsert {
  final String resId;
  CreateReservationReservationInsert.fromJson(dynamic json):

  resId = nativeFromJson<String>(json['resId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReservationReservationInsert otherTyped = other as CreateReservationReservationInsert;
    return resId == otherTyped.resId;

  }
  @override
  int get hashCode => resId.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['resId'] = nativeToJson<String>(resId);
    return json;
  }

  CreateReservationReservationInsert({
    required this.resId,
  });
}

@immutable
class CreateReservationData {
  final CreateReservationReservationInsert reservation_insert;
  CreateReservationData.fromJson(dynamic json):

  reservation_insert = CreateReservationReservationInsert.fromJson(json['reservation_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReservationData otherTyped = other as CreateReservationData;
    return reservation_insert == otherTyped.reservation_insert;

  }
  @override
  int get hashCode => reservation_insert.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['reservation_insert'] = reservation_insert.toJson();
    return json;
  }

  CreateReservationData({
    required this.reservation_insert,
  });
}

@immutable
class CreateReservationVariables {
  final String schedId;
  final String idNum;
  late final Optional<ReservationStatus>status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateReservationVariables.fromJson(Map<String, dynamic> json):

  schedId = nativeFromJson<String>(json['schedId']),
  idNum = nativeFromJson<String>(json['idNum']) {




    status = Optional.optional((data) => ReservationStatus.values.byName(data), enumSerializer);
    status.value = json['status'] == null ? null : ReservationStatus.values.byName(json['status']);

  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateReservationVariables otherTyped = other as CreateReservationVariables;
    return schedId == otherTyped.schedId &&
    idNum == otherTyped.idNum &&
    status == otherTyped.status;

  }
  @override
  int get hashCode => Object.hashAll([schedId.hashCode, idNum.hashCode, status.hashCode]);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['schedId'] = nativeToJson<String>(schedId);
    json['idNum'] = nativeToJson<String>(idNum);
    if(status.state == OptionalState.set) {
      json['status'] = status.toJson();
    }
    return json;
  }

  CreateReservationVariables({
    required this.schedId,
    required this.idNum,
    required this.status,
  });
}

