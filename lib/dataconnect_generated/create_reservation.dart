part of 'generated.dart';

class CreateReservationVariablesBuilder {
  String roomId;
  String idNum;
  DateTime day;
  Timestamp startTime;
  Timestamp endTime;
  String purpose;

  final FirebaseDataConnect _dataConnect;
  CreateReservationVariablesBuilder(this._dataConnect, {required  this.roomId,required  this.idNum,required  this.day,required  this.startTime,required  this.endTime,required  this.purpose,});
  Deserializer<CreateReservationData> dataDeserializer = (dynamic json)  => CreateReservationData.fromJson(jsonDecode(json));
  Serializer<CreateReservationVariables> varsSerializer = (CreateReservationVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateReservationData, CreateReservationVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateReservationData, CreateReservationVariables> ref() {
    CreateReservationVariables vars= CreateReservationVariables(roomId: roomId,idNum: idNum,day: day,startTime: startTime,endTime: endTime,purpose: purpose,);
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
  final String roomId;
  final String idNum;
  final DateTime day;
  final Timestamp startTime;
  final Timestamp endTime;
  final String purpose;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateReservationVariables.fromJson(Map<String, dynamic> json):
  
  roomId = nativeFromJson<String>(json['roomId']),
  idNum = nativeFromJson<String>(json['idNum']),
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

    final CreateReservationVariables otherTyped = other as CreateReservationVariables;
    return roomId == otherTyped.roomId && 
    idNum == otherTyped.idNum && 
    day == otherTyped.day && 
    startTime == otherTyped.startTime && 
    endTime == otherTyped.endTime && 
    purpose == otherTyped.purpose;
    
  }
  @override
  int get hashCode => Object.hashAll([roomId.hashCode, idNum.hashCode, day.hashCode, startTime.hashCode, endTime.hashCode, purpose.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['roomId'] = nativeToJson<String>(roomId);
    json['idNum'] = nativeToJson<String>(idNum);
    json['day'] = nativeToJson<DateTime>(day);
    json['startTime'] = startTime.toJson();
    json['endTime'] = endTime.toJson();
    json['purpose'] = nativeToJson<String>(purpose);
    return json;
  }

  CreateReservationVariables({
    required this.roomId,
    required this.idNum,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.purpose,
  });
}

