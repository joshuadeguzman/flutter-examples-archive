///
//  Generated code. Do not modify.
//  source: flare_controller_amount.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class FlareControllerAmount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FlareControllerAmount')
    ..a<$core.double>(1, 'rockAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'speed', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  FlareControllerAmount._() : super();
  factory FlareControllerAmount() => create();
  factory FlareControllerAmount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FlareControllerAmount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FlareControllerAmount clone() => FlareControllerAmount()..mergeFromMessage(this);
  FlareControllerAmount copyWith(void Function(FlareControllerAmount) updates) => super.copyWith((message) => updates(message as FlareControllerAmount));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FlareControllerAmount create() => FlareControllerAmount._();
  FlareControllerAmount createEmptyInstance() => create();
  static $pb.PbList<FlareControllerAmount> createRepeated() => $pb.PbList<FlareControllerAmount>();
  static FlareControllerAmount getDefault() => _defaultInstance ??= create()..freeze();
  static FlareControllerAmount _defaultInstance;

  $core.double get rockAmount => $_getN(0);
  set rockAmount($core.double v) { $_setDouble(0, v); }
  $core.bool hasRockAmount() => $_has(0);
  void clearRockAmount() => clearField(1);

  $core.double get speed => $_getN(1);
  set speed($core.double v) { $_setDouble(1, v); }
  $core.bool hasSpeed() => $_has(1);
  void clearSpeed() => clearField(2);
}

