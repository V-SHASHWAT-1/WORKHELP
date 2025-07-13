/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'active_otp.dart' as _i2;
import 'business.dart' as _i3;
import 'example.dart' as _i4;
import 'location.dart' as _i5;
import 'ratings.dart' as _i6;
import 'requests.dart' as _i7;
import 'review_comments.dart' as _i8;
import 'user.dart' as _i9;
import 'works_in.dart' as _i10;
import 'package:workrhelp_client/src/protocol/user.dart' as _i11;
import 'package:workrhelp_client/src/protocol/requests.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'active_otp.dart';
export 'business.dart';
export 'example.dart';
export 'location.dart';
export 'ratings.dart';
export 'requests.dart';
export 'review_comments.dart';
export 'user.dart';
export 'works_in.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ActiveOTP) {
      return _i2.ActiveOTP.fromJson(data) as T;
    }
    if (t == _i3.Business) {
      return _i3.Business.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.Location) {
      return _i5.Location.fromJson(data) as T;
    }
    if (t == _i6.Ratings) {
      return _i6.Ratings.fromJson(data) as T;
    }
    if (t == _i7.Requests) {
      return _i7.Requests.fromJson(data) as T;
    }
    if (t == _i8.ReviewComments) {
      return _i8.ReviewComments.fromJson(data) as T;
    }
    if (t == _i9.User) {
      return _i9.User.fromJson(data) as T;
    }
    if (t == _i10.WorksIn) {
      return _i10.WorksIn.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ActiveOTP?>()) {
      return (data != null ? _i2.ActiveOTP.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Business?>()) {
      return (data != null ? _i3.Business.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Location?>()) {
      return (data != null ? _i5.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Ratings?>()) {
      return (data != null ? _i6.Ratings.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Requests?>()) {
      return (data != null ? _i7.Requests.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ReviewComments?>()) {
      return (data != null ? _i8.ReviewComments.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.User?>()) {
      return (data != null ? _i9.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.WorksIn?>()) {
      return (data != null ? _i10.WorksIn.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Location>) {
      return (data as List).map((e) => deserialize<_i5.Location>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i11.User>) {
      return (data as List).map((e) => deserialize<_i11.User>(e)).toList() as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i12.Requests>) {
      return (data as List).map((e) => deserialize<_i12.Requests>(e)).toList()
          as T;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.ActiveOTP) {
      return 'ActiveOTP';
    }
    if (data is _i3.Business) {
      return 'Business';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.Location) {
      return 'Location';
    }
    if (data is _i6.Ratings) {
      return 'Ratings';
    }
    if (data is _i7.Requests) {
      return 'Requests';
    }
    if (data is _i8.ReviewComments) {
      return 'ReviewComments';
    }
    if (data is _i9.User) {
      return 'User';
    }
    if (data is _i10.WorksIn) {
      return 'WorksIn';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ActiveOTP') {
      return deserialize<_i2.ActiveOTP>(data['data']);
    }
    if (dataClassName == 'Business') {
      return deserialize<_i3.Business>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i5.Location>(data['data']);
    }
    if (dataClassName == 'Ratings') {
      return deserialize<_i6.Ratings>(data['data']);
    }
    if (dataClassName == 'Requests') {
      return deserialize<_i7.Requests>(data['data']);
    }
    if (dataClassName == 'ReviewComments') {
      return deserialize<_i8.ReviewComments>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i9.User>(data['data']);
    }
    if (dataClassName == 'WorksIn') {
      return deserialize<_i10.WorksIn>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
