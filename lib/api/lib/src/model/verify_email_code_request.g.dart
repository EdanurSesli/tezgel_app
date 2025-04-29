// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_code_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyEmailCodeRequest extends VerifyEmailCodeRequest {
  @override
  final String? email;
  @override
  final String? code;

  factory _$VerifyEmailCodeRequest(
          [void Function(VerifyEmailCodeRequestBuilder)? updates]) =>
      (new VerifyEmailCodeRequestBuilder()..update(updates))._build();

  _$VerifyEmailCodeRequest._({this.email, this.code}) : super._();

  @override
  VerifyEmailCodeRequest rebuild(
          void Function(VerifyEmailCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyEmailCodeRequestBuilder toBuilder() =>
      new VerifyEmailCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyEmailCodeRequest &&
        email == other.email &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyEmailCodeRequest')
          ..add('email', email)
          ..add('code', code))
        .toString();
  }
}

class VerifyEmailCodeRequestBuilder
    implements Builder<VerifyEmailCodeRequest, VerifyEmailCodeRequestBuilder> {
  _$VerifyEmailCodeRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  VerifyEmailCodeRequestBuilder() {
    VerifyEmailCodeRequest._defaults(this);
  }

  VerifyEmailCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyEmailCodeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifyEmailCodeRequest;
  }

  @override
  void update(void Function(VerifyEmailCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyEmailCodeRequest build() => _build();

  _$VerifyEmailCodeRequest _build() {
    final _$result = _$v ??
        new _$VerifyEmailCodeRequest._(
          email: email,
          code: code,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
