part of 'generated.dart';

class ListRoomsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListRoomsVariablesBuilder(this._dataConnect, );
  Deserializer<ListRoomsData> dataDeserializer = (dynamic json)  => ListRoomsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListRoomsData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListRoomsData, void> ref() {
    
    return _dataConnect.query("ListRooms", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListRoomsRooms {
  final String roomId;
  final String roomNumber;
  ListRoomsRooms.fromJson(dynamic json):
  
  roomId = nativeFromJson<String>(json['roomId']),
  roomNumber = nativeFromJson<String>(json['roomNumber']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListRoomsRooms otherTyped = other as ListRoomsRooms;
    return roomId == otherTyped.roomId && 
    roomNumber == otherTyped.roomNumber;
    
  }
  @override
  int get hashCode => Object.hashAll([roomId.hashCode, roomNumber.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['roomId'] = nativeToJson<String>(roomId);
    json['roomNumber'] = nativeToJson<String>(roomNumber);
    return json;
  }

  ListRoomsRooms({
    required this.roomId,
    required this.roomNumber,
  });
}

@immutable
class ListRoomsData {
  final List<ListRoomsRooms> rooms;
  ListRoomsData.fromJson(dynamic json):
  
  rooms = (json['rooms'] as List<dynamic>)
        .map((e) => ListRoomsRooms.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListRoomsData otherTyped = other as ListRoomsData;
    return rooms == otherTyped.rooms;
    
  }
  @override
  int get hashCode => rooms.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['rooms'] = rooms.map((e) => e.toJson()).toList();
    return json;
  }

  ListRoomsData({
    required this.rooms,
  });
}

