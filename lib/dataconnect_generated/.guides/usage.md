# Basic Usage

```dart
ExampleConnector.instance.UpsertUser(upsertUserVariables).execute();
ExampleConnector.instance.CreateReservation(createReservationVariables).execute();
ExampleConnector.instance.ApproveReservation(approveReservationVariables).execute();
ExampleConnector.instance.RejectReservation(rejectReservationVariables).execute();
ExampleConnector.instance.CancelReservation(cancelReservationVariables).execute();
ExampleConnector.instance.ListRooms().execute();
ExampleConnector.instance.ListTakenRooms(listTakenRoomsVariables).execute();
ExampleConnector.instance.ListMyReservations(listMyReservationsVariables).execute();
ExampleConnector.instance.ListPendingReservations().execute();

```

