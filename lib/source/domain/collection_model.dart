import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_model.freezed.dart';
part 'collection_model.g.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  genericArgumentFactories: true,
)
class CollectionModel<T> with _$CollectionModel<T> {
  factory CollectionModel({
    required List<T> data,
  }) = _CollectionModel<T>;

  factory CollectionModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CollectionModelFromJson(json, fromJsonT);
}
