part of 'generated.dart';

class UpsertUserVariablesBuilder {
  String idNum;
  String name;
  String college;
  Role role;

  final FirebaseDataConnect _dataConnect;
  UpsertUserVariablesBuilder(this._dataConnect, {required  this.idNum,required  this.name,required  this.college,required  this.role,});
  Deserializer<UpsertUserData> dataDeserializer = (dynamic json)  => UpsertUserData.fromJson(jsonDecode(json));
  Serializer<UpsertUserVariables> varsSerializer = (UpsertUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertUserData, UpsertUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertUserData, UpsertUserVariables> ref() {
    UpsertUserVariables vars= UpsertUserVariables(idNum: idNum,name: name,college: college,role: role,);
    return _dataConnect.mutation("UpsertUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpsertUserUserUpsert {
  final String idNum;
  UpsertUserUserUpsert.fromJson(dynamic json):

  idNum = nativeFromJson<String>(json['idNum']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUserUserUpsert otherTyped = other as UpsertUserUserUpsert;
    return idNum == otherTyped.idNum;

  }
  @override
  int get hashCode => idNum.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['idNum'] = nativeToJson<String>(idNum);
    return json;
  }

  UpsertUserUserUpsert({
    required this.idNum,
  });
}

@immutable
class UpsertUserData {
  final UpsertUserUserUpsert user_upsert;
  UpsertUserData.fromJson(dynamic json):

  user_upsert = UpsertUserUserUpsert.fromJson(json['user_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUserData otherTyped = other as UpsertUserData;
    return user_upsert == otherTyped.user_upsert;

  }
  @override
  int get hashCode => user_upsert.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_upsert'] = user_upsert.toJson();
    return json;
  }

  UpsertUserData({
    required this.user_upsert,
  });
}

@immutable
class UpsertUserVariables {
  final String idNum;
  final String name;
  final String college;
  final Role role;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertUserVariables.fromJson(Map<String, dynamic> json):

  idNum = nativeFromJson<String>(json['idNum']),
  name = nativeFromJson<String>(json['name']),
  college = nativeFromJson<String>(json['college']),
  role = Role.values.byName(json['role']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUserVariables otherTyped = other as UpsertUserVariables;
    return idNum == otherTyped.idNum &&
    name == otherTyped.name &&
    college == otherTyped.college &&
    role == otherTyped.role;

  }
  @override
  int get hashCode => Object.hashAll([idNum.hashCode, name.hashCode, college.hashCode, role.hashCode]);


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['idNum'] = nativeToJson<String>(idNum);
    json['name'] = nativeToJson<String>(name);
    json['college'] = nativeToJson<String>(college);
    json['role'] =
    role.name
    ;
    return json;
  }

  UpsertUserVariables({
    required this.idNum,
    required this.name,
    required this.college,
    required this.role,
  });
}

