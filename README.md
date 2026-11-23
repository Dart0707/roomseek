# appdev_roomseek

A new Flutter project.

## Database design

RoomSeek uses Firebase SQL Connect with these core tables:

- `User`: Firebase Auth UID, school ID, profile, and role.
- `Room`: managed rooms with building, capacity, facilities, and active status.
- `Reservation`: a user's requested room interval, approval status, purpose, and recurrence details.

Reservations are requested by students or teachers and reviewed by an admin. A
recurring reservation is represented by multiple reservation rows sharing the
same `recurrenceGroupId`; the client should create those occurrences from the
recurrence fields.

The client must validate that:

- `endTime` is after `startTime`.
- Both times fall on 30-minute boundaries.
- The duration is a whole number of 30-minute slots.
- A pending or approved reservation does not overlap another pending or approved
  reservation for the same room.

The overlap check must run again immediately before creating or approving a
reservation. The schema index improves lookup speed, but does not itself enforce
range-overlap exclusion.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
