import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp? timestamp) {
    return timestamp?.toDate().toLocal() ?? DateTime.now();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
