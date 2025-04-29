// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_register_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerRegisterRequest extends CustomerRegisterRequest {
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
  final String? address;
  @override
  final DateTime? birthDate;

  factory _$CustomerRegisterRequest(
          [void Function(CustomerRegisterRequestBuilder)? updates]) =>
      (new CustomerRegisterRequestBuilder()..update(updates))._build();

  _$CustomerRegisterRequest._(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.userName,
      this.address,
      this.birthDate})
      : super._();

  @override
  CustomerRegisterRequest rebuild(
          void Function(CustomerRegisterRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerRegisterRequestBuilder toBuilder() =>
      new CustomerRegisterRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerRegisterRequest &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        userName == other.userName &&
        address == other.address &&
        birthDate == other.birthDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerRegisterRequest')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('password', password)
          ..add('userName', userName)
          ..add('address', address)
          ..add('birthDate', birthDate))
        .toString();
  }
}

class CustomerRegisterRequestBuilder
    implements
        Builder<CustomerRegisterRequest, CustomerRegisterRequestBuilder> {
  _$CustomerRegisterRequest? _$v;

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

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  DateTime? _birthDate;
  DateTime? get birthDate => _$this._birthDate;
  set birthDate(DateTime? birthDate) => _$this._birthDate = birthDate;

  CustomerRegisterRequestBuilder() {
    CustomerRegisterRequest._defaults(this);
  }

  CustomerRegisterRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _password = $v.password;
      _userName = $v.userName;
      _address = $v.address;
      _birthDate = $v.birthDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerRegisterRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerRegisterRequest;
  }

  @override
  void update(void Function(CustomerRegisterRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerRegisterRequest build() => _build();

  _$CustomerRegisterRequest _build() {
    final _$result = _$v ??
        new _$CustomerRegisterRequest._(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          userName: userName,
          address: address,
          birthDate: birthDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
