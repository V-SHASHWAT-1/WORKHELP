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

abstract class ReviewComments implements _i1.SerializableModel {
  ReviewComments._({
    this.id,
    required this.madeBy,
    required this.forHelper,
    required this.madeAt,
    required this.stars,
    required this.comment,
  });

  factory ReviewComments({
    int? id,
    required int madeBy,
    required int forHelper,
    required DateTime madeAt,
    required int stars,
    required String comment,
  }) = _ReviewCommentsImpl;

  factory ReviewComments.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReviewComments(
      id: jsonSerialization['id'] as int?,
      madeBy: jsonSerialization['madeBy'] as int,
      forHelper: jsonSerialization['forHelper'] as int,
      madeAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['madeAt']),
      stars: jsonSerialization['stars'] as int,
      comment: jsonSerialization['comment'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int madeBy;

  int forHelper;

  DateTime madeAt;

  int stars;

  String comment;

  /// Returns a shallow copy of this [ReviewComments]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReviewComments copyWith({
    int? id,
    int? madeBy,
    int? forHelper,
    DateTime? madeAt,
    int? stars,
    String? comment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'madeBy': madeBy,
      'forHelper': forHelper,
      'madeAt': madeAt.toJson(),
      'stars': stars,
      'comment': comment,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReviewCommentsImpl extends ReviewComments {
  _ReviewCommentsImpl({
    int? id,
    required int madeBy,
    required int forHelper,
    required DateTime madeAt,
    required int stars,
    required String comment,
  }) : super._(
          id: id,
          madeBy: madeBy,
          forHelper: forHelper,
          madeAt: madeAt,
          stars: stars,
          comment: comment,
        );

  /// Returns a shallow copy of this [ReviewComments]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReviewComments copyWith({
    Object? id = _Undefined,
    int? madeBy,
    int? forHelper,
    DateTime? madeAt,
    int? stars,
    String? comment,
  }) {
    return ReviewComments(
      id: id is int? ? id : this.id,
      madeBy: madeBy ?? this.madeBy,
      forHelper: forHelper ?? this.forHelper,
      madeAt: madeAt ?? this.madeAt,
      stars: stars ?? this.stars,
      comment: comment ?? this.comment,
    );
  }
}
