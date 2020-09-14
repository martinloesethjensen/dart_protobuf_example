///
//  Generated code. Do not modify.
//  source: person.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Person_Gender extends $pb.ProtobufEnum {
  static const Person_Gender MALE = Person_Gender._(0, 'MALE');
  static const Person_Gender FEMALE = Person_Gender._(1, 'FEMALE');
  static const Person_Gender OTHER = Person_Gender._(2, 'OTHER');

  static const $core.List<Person_Gender> values = <Person_Gender> [
    MALE,
    FEMALE,
    OTHER,
  ];

  static final $core.Map<$core.int, Person_Gender> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Person_Gender valueOf($core.int value) => _byValue[value];

  const Person_Gender._($core.int v, $core.String n) : super(v, n);
}

