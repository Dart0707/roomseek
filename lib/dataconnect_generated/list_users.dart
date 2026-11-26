part of 'generated.dart';

class ListUsersVariablesBuilder {

  final FirebaseDataConnect _dataConnect;
  ListUsersVariablesBuilder(this._dataConnect, );
  Deserializer<ListUsersData> dataDeserializer = (dynamic json)  => ListUsersData.fromJson(jsonDecode(json));

  Future<QueryResult<ListUsersData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListUsersData, void> ref() {

    return _dataConnect.query("ListUsers", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListUsersUsers {
  final String idNum;
  final String name;
  final String college;
  final EnumValue<Role> role;
  ListUsersUsers.fromJson(dynamic json):

  idNum = nativeFromJson<String>(json['idNum']),
  name = nativeFromJson<String>(json['name']),
  college = nativeFromJson<String>(json['college']),
  role = roleDeserializer(json['role']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUsersUsers otherTyped = other as ListUsersUsers;
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
    roleSerializer(role)
    ;
    return json;
  }

  ListUsersUsers({
    required this.idNum,
    required this.name,
    required this.college,
    required this.role,
  });
}

@immutable
class ListUsersData {
  final List<ListUsersUsers> users;
  ListUsersData.fromJson(dynamic json):

  users = (json['users'] as List<dynamic>)
        .map((e) => ListUsersUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUsersData otherTyped = other as ListUsersData;
    return users == otherTyped.users;

  }
  @override
  int get hashCode => users.hashCode;


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  ListUsersData({
    required this.users,
  });
}
