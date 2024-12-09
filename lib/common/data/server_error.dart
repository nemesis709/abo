import 'package:abo/common/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_error.freezed.dart';

part 'server_error.g.dart';

@freezed
class ServerError with _$ServerError {
  const ServerError._();

  factory ServerError({
    required int status,
    String? message,
    @DateTimeJsonConverter() required DateTime datetime,
  }) = _ServerError;

  String get errorCode => message ?? status.toString();

  factory ServerError.fromJson(Map<String, dynamic> json) => _$ServerErrorFromJson(json);
}
