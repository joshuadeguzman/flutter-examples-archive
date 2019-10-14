///
//  Generated code. Do not modify.
//  source: fruits_embedded_channel_message.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class FruitsEmbeddedChannelMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FruitsEmbeddedChannelMessage')
    ..aOS(1, 'route')
    ..a<$0.User>(2, 'user', $pb.PbFieldType.OM, $0.User.getDefault, $0.User.create)
    ..aOB(3, 'isOwnProfile')
    ..hasRequiredFields = false
  ;

  FruitsEmbeddedChannelMessage._() : super();
  factory FruitsEmbeddedChannelMessage() => create();
  factory FruitsEmbeddedChannelMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FruitsEmbeddedChannelMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FruitsEmbeddedChannelMessage clone() => FruitsEmbeddedChannelMessage()..mergeFromMessage(this);
  FruitsEmbeddedChannelMessage copyWith(void Function(FruitsEmbeddedChannelMessage) updates) => super.copyWith((message) => updates(message as FruitsEmbeddedChannelMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FruitsEmbeddedChannelMessage create() => FruitsEmbeddedChannelMessage._();
  FruitsEmbeddedChannelMessage createEmptyInstance() => create();
  static $pb.PbList<FruitsEmbeddedChannelMessage> createRepeated() => $pb.PbList<FruitsEmbeddedChannelMessage>();
  static FruitsEmbeddedChannelMessage getDefault() => _defaultInstance ??= create()..freeze();
  static FruitsEmbeddedChannelMessage _defaultInstance;

  $core.String get route => $_getS(0, '');
  set route($core.String v) { $_setString(0, v); }
  $core.bool hasRoute() => $_has(0);
  void clearRoute() => clearField(1);

  $0.User get user => $_getN(1);
  set user($0.User v) { setField(2, v); }
  $core.bool hasUser() => $_has(1);
  void clearUser() => clearField(2);

  $core.bool get isOwnProfile => $_get(2, false);
  set isOwnProfile($core.bool v) { $_setBool(2, v); }
  $core.bool hasIsOwnProfile() => $_has(2);
  void clearIsOwnProfile() => clearField(3);
}

