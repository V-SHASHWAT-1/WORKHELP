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

abstract class Ratings implements _i1.SerializableModel {
  Ratings._({
    this.id,
    required this.helperId,
    required this.cumulativeRating,
    required this.totalRatings,
  });

  factory Ratings({
    int? id,
    required int helperId,
    required double cumulativeRating,
    required int totalRatings,
  }) = _RatingsImpl;

  factory Ratings.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ratings(
      id: jsonSerialization['id'] as int?,
      helperId: jsonSerialization['helperId'] as int,
      cumulativeRating:
          (jsonSerialization['cumulativeRating'] as num).toDouble(),
      totalRatings: jsonSerialization['totalRatings'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int helperId;

  double cumulativeRating;

  int totalRatings;

  /// Returns a shallow copy of this [Ratings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ratings copyWith({
    int? id,
    int? helperId,
    double? cumulativeRating,
    int? totalRatings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'helperId': helperId,
      'cumulativeRating': cumulativeRating,
      'totalRatings': totalRatings,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RatingsImpl extends Ratings {
  _RatingsImpl({
    int? id,
    required int helperId,
    required double cumulativeRating,
    required int totalRatings,
  }) : super._(
          id: id,
          helperId: helperId,
          cumulativeRating: cumulativeRating,
          totalRatings: totalRatings,
        );

  /// Returns a shallow copy of this [Ratings]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ratings copyWith({
    Object? id = _Undefined,
    int? helperId,
    double? cumulativeRating,
    int? totalRatings,
  }) {
    return Ratings(
      id: id is int? ? id : this.id,
      helperId: helperId ?? this.helperId,
      cumulativeRating: cumulativeRating ?? this.cumulativeRating,
      totalRatings: totalRatings ?? this.totalRatings,
    );
  }
}
