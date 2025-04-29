//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'business_register_request.g.dart';

/// BusinessRegisterRequest
///
/// Properties:
/// * [firstName] 
/// * [lastName] 
/// * [email] 
/// * [password] 
/// * [userName] 
/// * [companyName] 
/// * [companyType] 
@BuiltValue()
abstract class BusinessRegisterRequest implements Built<BusinessRegisterRequest, BusinessRegisterRequestBuilder> {
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

  @BuiltValueField(wireName: r'companyName')
  String? get companyName;

  @BuiltValueField(wireName: r'companyType')
  String? get companyType;

  BusinessRegisterRequest._();

  factory BusinessRegisterRequest([void updates(BusinessRegisterRequestBuilder b)]) = _$BusinessRegisterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BusinessRegisterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BusinessRegisterRequest> get serializer => _$BusinessRegisterRequestSerializer();
}

class _$BusinessRegisterRequestSerializer implements PrimitiveSerializer<BusinessRegisterRequest> {
  @override
  final Iterable<Type> types = const [BusinessRegisterRequest, _$BusinessRegisterRequest];

  @override
  final String wireName = r'BusinessRegisterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BusinessRegisterRequest object, {
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
    if (object.companyName != null) {
      yield r'companyName';
      yield serializers.serialize(
        object.companyName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.companyType != null) {
      yield r'companyType';
      yield serializers.serialize(
        object.companyType,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BusinessRegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BusinessRegisterRequestBuilder result,
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
        case r'companyName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyName = valueDes;
          break;
        case r'companyType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BusinessRegisterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BusinessRegisterRequestBuilder();
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

