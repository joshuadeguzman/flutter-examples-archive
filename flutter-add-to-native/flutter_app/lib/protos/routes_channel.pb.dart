///
//  Generated code. Do not modify.
//  source: routes_channel.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class RoutesChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RoutesChannel')
    ..aOS(1, 'route')
    ..hasRequiredFields = false
  ;

  RoutesChannel._() : super();
  factory RoutesChannel() => create();
  factory RoutesChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoutesChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RoutesChannel clone() => RoutesChannel()..mergeFromMessage(this);
  RoutesChannel copyWith(void Function(RoutesChannel) updates) => super.copyWith((message) => updates(message as RoutesChannel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoutesChannel create() => RoutesChannel._();
  RoutesChannel createEmptyInstance() => create();
  static $pb.PbList<RoutesChannel> createRepeated() => $pb.PbList<RoutesChannel>();
  static RoutesChannel getDefault() => _defaultInstance ??= create()..freeze();
  static RoutesChannel _defaultInstance;

  $core.String get route => $_getS(0, '');
  set route($core.String v) { $_setString(0, v); }
  $core.bool hasRoute() => $_has(0);
  void clearRoute() => clearField(1);
}

