library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'upsert_user.dart';

part 'create_schedule.dart';

part 'create_reservation.dart';

part 'list_users.dart';

part 'list_schedules.dart';

part 'list_reservations.dart';



  enum ReservationStatus {

      PENDING,

      APPROVED,

      REJECTED,

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


  UpsertUserVariablesBuilder upsertUser ({required String idNum, required String name, required String college, required Role role, }) {
    return UpsertUserVariablesBuilder(dataConnect, idNum: idNum,name: name,college: college,role: role,);
  }


  CreateScheduleVariablesBuilder createSchedule ({required String room, required DateTime date, required Timestamp fromTime, required Timestamp toTime, }) {
    return CreateScheduleVariablesBuilder(dataConnect, room: room,date: date,fromTime: fromTime,toTime: toTime,);
  }


  CreateReservationVariablesBuilder createReservation ({required String schedId, required String idNum, }) {
    return CreateReservationVariablesBuilder(dataConnect, schedId: schedId,idNum: idNum,);
  }


  ListUsersVariablesBuilder listUsers () {
    return ListUsersVariablesBuilder(dataConnect, );
  }


  ListSchedulesVariablesBuilder listSchedules () {
    return ListSchedulesVariablesBuilder(dataConnect, );
  }


  ListReservationsVariablesBuilder listReservations () {
    return ListReservationsVariablesBuilder(dataConnect, );
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
