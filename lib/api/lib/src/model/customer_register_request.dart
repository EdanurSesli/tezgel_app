//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_register_request.g.dart';

/// CustomerRegisterRequest
///
/// Properties:
/// * [firstName] 
/// * [lastName] 
/// * [email] 
/// * [password] 
/// * [userName] 
/// * [address] 
/// * [birthDate] 
@BuiltValue()
abstract class CustomerRegisterRequest implements Built<CustomerRegisterRequest, CustomerRegisterRequestBuilder> {
  @BuiltValueField(wireName: r'firstName')
  String? get firstName;

  @BuiltValueField(wireName: r'lastName')
  String? get lastName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'birthDate')
  DateTime? get birthDate;

  CustomerRegisterRequest._();

  factory CustomerRegisterRequest([void updates(CustomerRegisterRequestBuilder b)]) = _$CustomerRegisterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerRegisterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerRegisterRequest> get serializer => _$CustomerRegisterRequestSerializer();
}

class _$CustomerRegisterRequestSerializer implements PrimitiveSerializer<CustomerRegisterRequest> {
  @override
  final Iterable<Type> types = const [CustomerRegisterRequest, _$CustomerRegisterRequest];

  @override
  final String wireName = r'CustomerRegisterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerRegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.firstName != null) {
      yield r'firstName';
      yield serializers.serialize(
        object.firstName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastName != null) {
      yield r'lastName';
      yield serializers.serialize(
        object.lastName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.birthDate != null) {
      yield r'birthDate';
      yield serializers.serialize(
        object.birthDate,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerRegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerRegisterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'firstName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.firstName = valueDes;
          break;
        case r'lastName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
          break;
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'birthDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.birthDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CustomerRegisterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerRegisterRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

