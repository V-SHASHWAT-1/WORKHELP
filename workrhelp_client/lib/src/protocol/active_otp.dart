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

abstract class ActiveOTP implements _i1.SerializableModel {
  ActiveOTP._({
    this.id,
    required this.requestId,
    required this.otp,
    required this.madeAt,
  });

  factory ActiveOTP({
    int? id,
    required int requestId,
    required int otp,
    required DateTime madeAt,
  }) = _ActiveOTPImpl;

  factory ActiveOTP.fromJson(Map<String, dynamic> jsonSerialization) {
    return ActiveOTP(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      otp: jsonSerialization['otp'] as int,
      madeAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['madeAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int requestId;

  int otp;

  DateTime madeAt;

  /// Returns a shallow copy of this [ActiveOTP]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ActiveOTP copyWith({
    int? id,
    int? requestId,
    int? otp,
    DateTime? madeAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'requestId': requestId,
      'otp': otp,
      'madeAt': madeAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ActiveOTPImpl extends ActiveOTP {
  _ActiveOTPImpl({
    int? id,
    required int requestId,
    required int otp,
    required DateTime madeAt,
  }) : super._(
          id: id,
          requestId: requestId,
          otp: otp,
          madeAt: madeAt,
        );

  /// Returns a shallow copy of this [ActiveOTP]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ActiveOTP copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? otp,
    DateTime? madeAt,
  }) {
    return ActiveOTP(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      otp: otp ?? this.otp,
      madeAt: madeAt ?? this.madeAt,
    );
  }
}
