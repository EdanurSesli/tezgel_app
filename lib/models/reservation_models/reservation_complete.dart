import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_complete.freezed.dart';
part 'reservation_complete.g.dart';

@freezed
abstract class ReservationComplete with _$ReservationComplete {
  const factory ReservationComplete({
    String? reservationId,
    String? businessQrid,
  }) = _ReservationRequest;

  factory ReservationComplete.fromJson(Map<String, dynamic> json) =>
      _$ReservationCompleteFromJson(json);
}
