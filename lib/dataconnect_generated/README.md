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

### ListUsers
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listUsers().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListUsersData, void>`
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

final result = await ExampleConnector.instance.listUsers();
ListUsersData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listUsers().ref();
ref.execute();

ref.subscribe(...);
```


### ListSchedules
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listSchedules().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListSchedulesData, void>`
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

final result = await ExampleConnector.instance.listSchedules();
ListSchedulesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listSchedules().ref();
ref.execute();

ref.subscribe(...);
```


### ListReservations
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listReservations().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListReservationsData, void>`
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

final result = await ExampleConnector.instance.listReservations();
ListReservationsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listReservations().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### UpsertUser
#### Required Arguments
```dart
String idNum = ...;
String name = ...;
String college = ...;
Role role = ...;
ExampleConnector.instance.upsertUser(
  idNum: idNum,
  name: name,
  college: college,
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
  college: college,
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
String college = ...;
Role role = ...;

final ref = ExampleConnector.instance.upsertUser(
  idNum: idNum,
  name: name,
  college: college,
  role: role,
).ref();
ref.execute();
```


### CreateSchedule
#### Required Arguments
```dart
String room = ...;
DateTime date = ...;
Timestamp fromTime = ...;
Timestamp toTime = ...;
ExampleConnector.instance.createSchedule(
  room: room,
  date: date,
  fromTime: fromTime,
  toTime: toTime,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateSchedule, we created `CreateScheduleBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateScheduleVariablesBuilder {
  ...
   CreateScheduleVariablesBuilder reason(String? t) {
   _reason.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createSchedule(
  room: room,
  date: date,
  fromTime: fromTime,
  toTime: toTime,
)
.reason(reason)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateScheduleData, CreateScheduleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createSchedule(
  room: room,
  date: date,
  fromTime: fromTime,
  toTime: toTime,
);
CreateScheduleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String room = ...;
DateTime date = ...;
Timestamp fromTime = ...;
Timestamp toTime = ...;

final ref = ExampleConnector.instance.createSchedule(
  room: room,
  date: date,
  fromTime: fromTime,
  toTime: toTime,
).ref();
ref.execute();
```


### CreateReservation
#### Required Arguments
```dart
String schedId = ...;
String idNum = ...;
ExampleConnector.instance.createReservation(
  schedId: schedId,
  idNum: idNum,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateReservation, we created `CreateReservationBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateReservationVariablesBuilder {
  ...
   CreateReservationVariablesBuilder status(ReservationStatus? t) {
   _status.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createReservation(
  schedId: schedId,
  idNum: idNum,
)
.status(status)
.execute();
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
  schedId: schedId,
  idNum: idNum,
);
CreateReservationData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String schedId = ...;
String idNum = ...;

final ref = ExampleConnector.instance.createReservation(
  schedId: schedId,
  idNum: idNum,
).ref();
ref.execute();
```

