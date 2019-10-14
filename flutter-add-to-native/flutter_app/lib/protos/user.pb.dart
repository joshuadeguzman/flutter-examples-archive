///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User')
    ..a<$core.int>(1, 'id', $pb.PbFieldType.O3)
    ..aOS(2, 'username')
    ..aOS(3, 'firstName')
    ..aOS(4, 'lastName')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  static User getDefault() => _defaultInstance ??= create()..freeze();
  static User _defaultInstance;

  $core.int get id => $_get(0, 0);
  set id($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get username => $_getS(1, '');
  set username($core.String v) { $_setString(1, v); }
  $core.bool hasUsername() => $_has(1);
  void clearUsername() => clearField(2);

  $core.String get firstName => $_getS(2, '');
  set firstName($core.String v) { $_setString(2, v); }
  $core.bool hasFirstName() => $_has(2);
  void clearFirstName() => clearField(3);

  $core.String get lastName => $_getS(3, '');
  set lastName($core.String v) { $_setString(3, v); }
  $core.bool hasLastName() => $_has(3);
  void clearLastName() => clearField(4);
}

