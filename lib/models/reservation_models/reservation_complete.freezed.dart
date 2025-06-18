// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_complete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ReservationComplete _$ReservationCompleteFromJson(Map<String, dynamic> json) {
  return _ReservationRequest.fromJson(json);
}

/// @nodoc
mixin _$ReservationComplete {
  String? get reservationId;
  String? get businessQrid;

  /// Create a copy of ReservationComplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReservationCompleteCopyWith<ReservationComplete> get copyWith =>
      _$ReservationCompleteCopyWithImpl<ReservationComplete>(
          this as ReservationComplete, _$identity);

  /// Serializes this ReservationComplete to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReservationComplete &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.businessQrid, businessQrid) ||
                other.businessQrid == businessQrid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reservationId, businessQrid);

  @override
  String toString() {
    return 'ReservationComplete(reservationId: $reservationId, businessQrid: $businessQrid)';
  }
}

/// @nodoc
abstract mixin class $ReservationCompleteCopyWith<$Res> {
  factory $ReservationCompleteCopyWith(
          ReservationComplete value, $Res Function(ReservationComplete) _then) =
      _$ReservationCompleteCopyWithImpl;
  @useResult
  $Res call({String? reservationId, String? businessQrid});
}

/// @nodoc
class _$ReservationCompleteCopyWithImpl<$Res>
    implements $ReservationCompleteCopyWith<$Res> {
  _$ReservationCompleteCopyWithImpl(this._self, this._then);

  final ReservationComplete _self;
  final $Res Function(ReservationComplete) _then;

  /// Create a copy of ReservationComplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? businessQrid = freezed,
  }) {
    return _then(_self.copyWith(
      reservationId: freezed == reservationId
          ? _self.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessQrid: freezed == businessQrid
          ? _self.businessQrid
          : businessQrid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReservationRequest implements ReservationComplete {
  const _ReservationRequest({this.reservationId, this.businessQrid});
  factory _ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);

  @override
  final String? reservationId;
  @override
  final String? businessQrid;

  /// Create a copy of ReservationComplete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReservationRequestCopyWith<_ReservationRequest> get copyWith =>
      __$ReservationRequestCopyWithImpl<_ReservationRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReservationRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationRequest &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.businessQrid, businessQrid) ||
                other.businessQrid == businessQrid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reservationId, businessQrid);

  @override
  String toString() {
    return 'ReservationComplete(reservationId: $reservationId, businessQrid: $businessQrid)';
  }
}

/// @nodoc
abstract mixin class _$ReservationRequestCopyWith<$Res>
    implements $ReservationCompleteCopyWith<$Res> {
  factory _$ReservationRequestCopyWith(
          _ReservationRequest value, $Res Function(_ReservationRequest) _then) =
      __$ReservationRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String? reservationId, String? businessQrid});
}

/// @nodoc
class __$ReservationRequestCopyWithImpl<$Res>
    implements _$ReservationRequestCopyWith<$Res> {
  __$ReservationRequestCopyWithImpl(this._self, this._then);

  final _ReservationRequest _self;
  final $Res Function(_ReservationRequest) _then;

  /// Create a copy of ReservationComplete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reservationId = freezed,
    Object? businessQrid = freezed,
  }) {
    return _then(_ReservationRequest(
      reservationId: freezed == reservationId
          ? _self.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessQrid: freezed == businessQrid
          ? _self.businessQrid
          : businessQrid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
