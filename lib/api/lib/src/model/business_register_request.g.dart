// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_register_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BusinessRegisterRequest extends BusinessRegisterRequest {
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? userName;
  @override
  final String? companyName;
  @override
  final String? companyType;

  factory _$BusinessRegisterRequest(
          [void Function(BusinessRegisterRequestBuilder)? updates]) =>
      (new BusinessRegisterRequestBuilder()..update(updates))._build();

  _$BusinessRegisterRequest._(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.userName,
      this.companyName,
      this.companyType})
      : super._();

  @override
  BusinessRegisterRequest rebuild(
          void Function(BusinessRegisterRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessRegisterRequestBuilder toBuilder() =>
      new BusinessRegisterRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinessRegisterRequest &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        userName == other.userName &&
        companyName == other.companyName &&
        companyType == other.companyType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, companyType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BusinessRegisterRequest')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('password', password)
          ..add('userName', userName)
          ..add('companyName', companyName)
          ..add('companyType', companyType))
        .toString();
  }
}

class BusinessRegisterRequestBuilder
    implements
        Builder<BusinessRegisterRequest, BusinessRegisterRequestBuilder> {
  _$BusinessRegisterRequest? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _companyType;
  String? get companyType => _$this._companyType;
  set companyType(String? companyType) => _$this._companyType = companyType;

  BusinessRegisterRequestBuilder() {
    BusinessRegisterRequest._defaults(this);
  }

  BusinessRegisterRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _password = $v.password;
      _userName = $v.userName;
      _companyName = $v.companyName;
      _companyType = $v.companyType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinessRegisterRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinessRegisterRequest;
  }

  @override
  void update(void Function(BusinessRegisterRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BusinessRegisterRequest build() => _build();

  _$BusinessRegisterRequest _build() {
    final _$result = _$v ??
        new _$BusinessRegisterRequest._(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          userName: userName,
          companyName: companyName,
          companyType: companyType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
