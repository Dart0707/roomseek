library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'upsert_user.dart';

part 'create_reservation.dart';

part 'approve_reservation.dart';

part 'reject_reservation.dart';

part 'cancel_reservation.dart';

part 'list_rooms.dart';

part 'list_taken_rooms.dart';

part 'list_my_reservations.dart';

part 'list_pending_reservations.dart';



  enum ReservationStatus {
    
      PENDING,
    
      APPROVED,
    
      REJECTED,
    
      CANCELLED,
    
  }
  
  String reservationStatusSerializer(EnumValue<ReservationStatus> e) {
    return e.stringValue;
  }
  EnumValue<ReservationStatus> reservationStatusDeserializer(dynamic data) {
    switch (data) {
      
      case 'PENDING':
        return const Known(ReservationStatus.PENDING);
      
      case 'APPROVED':
        return const Known(ReservationStatus.APPROVED);
      
      case 'REJECTED':
        return const Known(ReservationStatus.REJECTED);
      
      case 'CANCELLED':
        return const Known(ReservationStatus.CANCELLED);
      
      default:
        return Unknown(data);
    }
  }
  

  enum Role {
    
      STUDENT,
    
      TEACHER,
    
      ADMIN,
    
  }
  
  String roleSerializer(EnumValue<Role> e) {
    return e.stringValue;
  }
  EnumValue<Role> roleDeserializer(dynamic data) {
    switch (data) {
      
      case 'STUDENT':
        return const Known(Role.STUDENT);
      
      case 'TEACHER':
        return const Known(Role.TEACHER);
      
      case 'ADMIN':
        return const Known(Role.ADMIN);
      
      default:
        return Unknown(data);
    }
  }
  



String enumSerializer(Enum e) {
  return e.name;
}



/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class ExampleConnector {
  
  
  UpsertUserVariablesBuilder upsertUser ({required String idNum, required String name, required Role role, }) {
    return UpsertUserVariablesBuilder(dataConnect, idNum: idNum,name: name,role: role,);
  }
  
  
  CreateReservationVariablesBuilder createReservation ({required String roomId, required String idNum, required DateTime day, required Timestamp startTime, required Timestamp endTime, required String purpose, }) {
    return CreateReservationVariablesBuilder(dataConnect, roomId: roomId,idNum: idNum,day: day,startTime: startTime,endTime: endTime,purpose: purpose,);
  }
  
  
  ApproveReservationVariablesBuilder approveReservation ({required String resId, }) {
    return ApproveReservationVariablesBuilder(dataConnect, resId: resId,);
  }
  
  
  RejectReservationVariablesBuilder rejectReservation ({required String resId, required String rejectionReason, }) {
    return RejectReservationVariablesBuilder(dataConnect, resId: resId,rejectionReason: rejectionReason,);
  }
  
  
  CancelReservationVariablesBuilder cancelReservation ({required String resId, }) {
    return CancelReservationVariablesBuilder(dataConnect, resId: resId,);
  }
  
  
  ListRoomsVariablesBuilder listRooms () {
    return ListRoomsVariablesBuilder(dataConnect, );
  }
  
  
  ListTakenRoomsVariablesBuilder listTakenRooms ({required Timestamp fromTime, required Timestamp toTime, required DateTime day, }) {
    return ListTakenRoomsVariablesBuilder(dataConnect, fromTime: fromTime,toTime: toTime,day: day,);
  }
  
  
  ListMyReservationsVariablesBuilder listMyReservations ({required String idNum, }) {
    return ListMyReservationsVariablesBuilder(dataConnect, idNum: idNum,);
  }
  
  
  ListPendingReservationsVariablesBuilder listPendingReservations () {
    return ListPendingReservationsVariablesBuilder(dataConnect, );
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'asia-southeast1',
    'example',
    'appdevroomseek',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    
    CacheSettings cacheSettings = CacheSettings(
      maxAge: Duration(milliseconds:0),
      storage: CacheStorage.persistent,
    );
    
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            cacheSettings: cacheSettings,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
