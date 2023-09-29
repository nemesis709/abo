import 'package:abo/common/extension/datetime_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class DateTimeJsonConverter extends JsonConverter<DateTime, String> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toLocal().formatISOTime();
}

class DateJsonConverter extends JsonConverter<DateTime, String> {
  const DateJsonConverter();

  @override
  DateTime fromJson(String json) => DateFormat('yyyy-MM-dd').parse(json).toLocal();

  @override
  String toJson(DateTime object) => DateFormat('yyyy-MM-dd').format(object.toLocal());
}