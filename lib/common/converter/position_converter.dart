import 'package:abo/source/domain/player_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PositionJsonConverter extends JsonConverter<Position, String> {
  const PositionJsonConverter();

  @override
  Position fromJson(String json){
    if (json == 'P') {
      return Position.pitcher;
    } else if (json == 'C') {
      return Position.catcher;
    } else if (json == '1B') {
      return Position.firstBase;
    } else if (json == '2B') {
      return Position.secondBase;
    } else if (json == '3B') {
      return Position.thirdBase;
    } else if (json == 'SS') {
      return Position.shortStop;
    } else if (json == 'LF') {
      return Position.leftField;
    } else if (json == 'CF') {
      return Position.centerField;
    } else if (json == 'RF') {
      return Position.rightField;
    } else {
      return Position.designated;
    }
  }

  @override
  String toJson(Position object) {
    if (object == Position.pitcher) {
      return 'P';
    } else if (object == Position.catcher) {
      return 'C';
    } else if (object == Position.firstBase) {
      return '1B';
    } else if (object == Position.secondBase) {
      return '2B';
    } else if (object == Position.thirdBase) {
      return '3B';
    } else if (object == Position.shortStop) {
      return 'SS';
    } else if (object == Position.leftField) {
      return 'LF';
    } else if (object == Position.centerField) {
      return 'CF';
    } else if (object == Position.rightField) {
      return 'RF';
    } else if (object == Position.designated){
      return 'DH';
    }else{
      return '';
    }
  }
}