//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verify_email_code_request.g.dart';

/// VerifyEmailCodeRequest
///
/// Properties:
/// * [email] 
/// * [code] 
@BuiltValue()
abstract class VerifyEmailCodeRequest implements Built<VerifyEmailCodeRequest, VerifyEmailCodeRequestBuilder> {
  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'code')
  String? get code;

  VerifyEmailCodeRequest._();

  factory VerifyEmailCodeRequest([void updates(VerifyEmailCodeRequestBuilder b)]) = _$VerifyEmailCodeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerifyEmailCodeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerifyEmailCodeRequest> get serializer => _$VerifyEmailCodeRequestSerializer();
}

class _$VerifyEmailCodeRequestSerializer implements PrimitiveSerializer<VerifyEmailCodeRequest> {
  @override
  final Iterable<Type> types = const [VerifyEmailCodeRequest, _$VerifyEmailCodeRequest];

  @override
  final String wireName = r'VerifyEmailCodeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerifyEmailCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VerifyEmailCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VerifyEmailCodeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VerifyEmailCodeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerifyEmailCodeRequestBuilder();
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

