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

abstract class WorksIn implements _i1.SerializableModel {
  WorksIn._({
    this.id,
    required this.helperId,
    required this.businessId,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  factory WorksIn({
    int? id,
    required int helperId,
    required int businessId,
    required String role,
    required DateTime startDate,
    DateTime? endDate,
  }) = _WorksInImpl;

  factory WorksIn.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorksIn(
      id: jsonSerialization['id'] as int?,
      helperId: jsonSerialization['helperId'] as int,
      businessId: jsonSerialization['businessId'] as int,
      role: jsonSerialization['role'] as String,
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: jsonSerialization['endDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int helperId;

  int businessId;

  String role;

  DateTime startDate;

  DateTime? endDate;

  /// Returns a shallow copy of this [WorksIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorksIn copyWith({
    int? id,
    int? helperId,
    int? businessId,
    String? role,
    DateTime? startDate,
    DateTime? endDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'helperId': helperId,
      'businessId': businessId,
      'role': role,
      'startDate': startDate.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorksInImpl extends WorksIn {
  _WorksInImpl({
    int? id,
    required int helperId,
    required int businessId,
    required String role,
    required DateTime startDate,
    DateTime? endDate,
  }) : super._(
          id: id,
          helperId: helperId,
          businessId: businessId,
          role: role,
          startDate: startDate,
          endDate: endDate,
        );

  /// Returns a shallow copy of this [WorksIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorksIn copyWith({
    Object? id = _Undefined,
    int? helperId,
    int? businessId,
    String? role,
    DateTime? startDate,
    Object? endDate = _Undefined,
  }) {
    return WorksIn(
      id: id is int? ? id : this.id,
      helperId: helperId ?? this.helperId,
      businessId: businessId ?? this.businessId,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
    );
  }
}
