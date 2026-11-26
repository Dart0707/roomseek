# Basic Usage

```dart
ExampleConnector.instance.UpsertUser(upsertUserVariables).execute();
ExampleConnector.instance.CreateSchedule(createScheduleVariables).execute();
ExampleConnector.instance.CreateReservation(createReservationVariables).execute();
ExampleConnector.instance.ListUsers().execute();
ExampleConnector.instance.ListSchedules().execute();
ExampleConnector.instance.ListReservations().execute();

```

## Optional Fields

Some operations may have optional fields. In these cases, the Flutter SDK exposes a builder method, and will have to be set separately.

Optional fields can be discovered based on classes that have `Optional` object types.

This is an example of a mutation with an optional field:

```dart
await ExampleConnector.instance.CreateReservation({ ... })
.status(...)
.execute();
```

Note: the above example is a mutation, but the same logic applies to query operations as well. Additionally, `createMovie` is an example, and may not be available to the user.

