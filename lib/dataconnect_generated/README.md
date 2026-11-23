# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListRooms
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listRooms().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListRoomsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listRooms();
ListRoomsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listRooms().ref();
ref.execute();

ref.subscribe(...);
```


### ListTakenRooms
#### Required Arguments
```dart
Timestamp fromTime = ...;
Timestamp toTime = ...;
DateTime day = ...;
ExampleConnector.instance.listTakenRooms(
  fromTime: fromTime,
  toTime: toTime,
  day: day,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListTakenRoomsData, ListTakenRoomsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listTakenRooms(
  fromTime: fromTime,
  toTime: toTime,
  day: day,
);
ListTakenRoomsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
Timestamp fromTime = ...;
Timestamp toTime = ...;
DateTime day = ...;

final ref = ExampleConnector.instance.listTakenRooms(
  fromTime: fromTime,
  toTime: toTime,
  day: day,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListMyReservations
#### Required Arguments
```dart
String idNum = ...;
ExampleConnector.instance.listMyReservations(
  idNum: idNum,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListMyReservationsData, ListMyReservationsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listMyReservations(
  idNum: idNum,
);
ListMyReservationsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String idNum = ...;

final ref = ExampleConnector.instance.listMyReservations(
  idNum: idNum,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListPendingReservations
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listPendingReservations().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListPendingReservationsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listPendingReservations();
ListPendingReservationsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listPendingReservations().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### UpsertUser
#### Required Arguments
```dart
String idNum = ...;
String name = ...;
Role role = ...;
ExampleConnector.instance.upsertUser(
  idNum: idNum,
  name: name,
  role: role,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpsertUserData, UpsertUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.upsertUser(
  idNum: idNum,
  name: name,
  role: role,
);
UpsertUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String idNum = ...;
String name = ...;
Role role = ...;

final ref = ExampleConnector.instance.upsertUser(
  idNum: idNum,
  name: name,
  role: role,
).ref();
ref.execute();
```


### CreateReservation
#### Required Arguments
```dart
String roomId = ...;
String idNum = ...;
DateTime day = ...;
Timestamp startTime = ...;
Timestamp endTime = ...;
String purpose = ...;
ExampleConnector.instance.createReservation(
  roomId: roomId,
  idNum: idNum,
  day: day,
  startTime: startTime,
  endTime: endTime,
  purpose: purpose,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateReservationData, CreateReservationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createReservation(
  roomId: roomId,
  idNum: idNum,
  day: day,
  startTime: startTime,
  endTime: endTime,
  purpose: purpose,
);
CreateReservationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String roomId = ...;
String idNum = ...;
DateTime day = ...;
Timestamp startTime = ...;
Timestamp endTime = ...;
String purpose = ...;

final ref = ExampleConnector.instance.createReservation(
  roomId: roomId,
  idNum: idNum,
  day: day,
  startTime: startTime,
  endTime: endTime,
  purpose: purpose,
).ref();
ref.execute();
```


### ApproveReservation
#### Required Arguments
```dart
String resId = ...;
ExampleConnector.instance.approveReservation(
  resId: resId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<ApproveReservationData, ApproveReservationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.approveReservation(
  resId: resId,
);
ApproveReservationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String resId = ...;

final ref = ExampleConnector.instance.approveReservation(
  resId: resId,
).ref();
ref.execute();
```


### RejectReservation
#### Required Arguments
```dart
String resId = ...;
String rejectionReason = ...;
ExampleConnector.instance.rejectReservation(
  resId: resId,
  rejectionReason: rejectionReason,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<RejectReservationData, RejectReservationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.rejectReservation(
  resId: resId,
  rejectionReason: rejectionReason,
);
RejectReservationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String resId = ...;
String rejectionReason = ...;

final ref = ExampleConnector.instance.rejectReservation(
  resId: resId,
  rejectionReason: rejectionReason,
).ref();
ref.execute();
```


### CancelReservation
#### Required Arguments
```dart
String resId = ...;
ExampleConnector.instance.cancelReservation(
  resId: resId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CancelReservationData, CancelReservationVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.cancelReservation(
  resId: resId,
);
CancelReservationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String resId = ...;

final ref = ExampleConnector.instance.cancelReservation(
  resId: resId,
).ref();
ref.execute();
```

