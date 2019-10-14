///
//  Generated code. Do not modify.
//  source: fruits_channel.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class FruitsChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FruitsChannel')
    ..a<$core.int>(1, 'fruitId', $pb.PbFieldType.O3)
    ..aOS(2, 'fruitName')
    ..hasRequiredFields = false
  ;

  FruitsChannel._() : super();
  factory FruitsChannel() => create();
  factory FruitsChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FruitsChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FruitsChannel clone() => FruitsChannel()..mergeFromMessage(this);
  FruitsChannel copyWith(void Function(FruitsChannel) updates) => super.copyWith((message) => updates(message as FruitsChannel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FruitsChannel create() => FruitsChannel._();
  FruitsChannel createEmptyInstance() => create();
  static $pb.PbList<FruitsChannel> createRepeated() => $pb.PbList<FruitsChannel>();
  static FruitsChannel getDefault() => _defaultInstance ??= create()..freeze();
  static FruitsChannel _defaultInstance;

  $core.int get fruitId => $_get(0, 0);
  set fruitId($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasFruitId() => $_has(0);
  void clearFruitId() => clearField(1);

  $core.String get fruitName => $_getS(1, '');
  set fruitName($core.String v) { $_setString(1, v); }
  $core.bool hasFruitName() => $_has(1);
  void clearFruitName() => clearField(2);
}

