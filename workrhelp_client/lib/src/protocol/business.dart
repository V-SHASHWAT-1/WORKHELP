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
import 'location.dart' as _i2;

abstract class Business implements _i1.SerializableModel {
  Business._({
    this.id,
    required this.title,
    required this.overview,
    required this.location,
  });

  factory Business({
    int? id,
    required String title,
    required String overview,
    required List<_i2.Location> location,
  }) = _BusinessImpl;

  factory Business.fromJson(Map<String, dynamic> jsonSerialization) {
    return Business(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      overview: jsonSerialization['overview'] as String,
      location: (jsonSerialization['location'] as List)
          .map((e) => _i2.Location.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String overview;

  List<_i2.Location> location;

  /// Returns a shallow copy of this [Business]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Business copyWith({
    int? id,
    String? title,
    String? overview,
    List<_i2.Location>? location,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'overview': overview,
      'location': location.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BusinessImpl extends Business {
  _BusinessImpl({
    int? id,
    required String title,
    required String overview,
    required List<_i2.Location> location,
  }) : super._(
          id: id,
          title: title,
          overview: overview,
          location: location,
        );

  /// Returns a shallow copy of this [Business]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Business copyWith({
    Object? id = _Undefined,
    String? title,
    String? overview,
    List<_i2.Location>? location,
  }) {
    return Business(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      location: location ?? this.location.map((e0) => e0.copyWith()).toList(),
    );
  }
}
