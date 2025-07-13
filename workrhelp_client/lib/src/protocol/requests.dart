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

abstract class Requests implements _i1.SerializableModel {
  Requests._({
    this.id,
    required this.madeBy,
    required this.madeAt,
    this.acceptedBy,
    required this.description,
    required this.images,
    required this.location,
    required this.status,
  });

  factory Requests({
    int? id,
    required int madeBy,
    required DateTime madeAt,
    int? acceptedBy,
    required String description,
    required List<String> images,
    required _i2.Location location,
    required String status,
  }) = _RequestsImpl;

  factory Requests.fromJson(Map<String, dynamic> jsonSerialization) {
    return Requests(
      id: jsonSerialization['id'] as int?,
      madeBy: jsonSerialization['madeBy'] as int,
      madeAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['madeAt']),
      acceptedBy: jsonSerialization['acceptedBy'] as int?,
      description: jsonSerialization['description'] as String,
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      location: _i2.Location.fromJson(
          (jsonSerialization['location'] as Map<String, dynamic>)),
      status: jsonSerialization['status'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int madeBy;

  DateTime madeAt;

  int? acceptedBy;

  String description;

  List<String> images;

  _i2.Location location;

  String status;

  /// Returns a shallow copy of this [Requests]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Requests copyWith({
    int? id,
    int? madeBy,
    DateTime? madeAt,
    int? acceptedBy,
    String? description,
    List<String>? images,
    _i2.Location? location,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'madeBy': madeBy,
      'madeAt': madeAt.toJson(),
      if (acceptedBy != null) 'acceptedBy': acceptedBy,
      'description': description,
      'images': images.toJson(),
      'location': location.toJson(),
      'status': status,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestsImpl extends Requests {
  _RequestsImpl({
    int? id,
    required int madeBy,
    required DateTime madeAt,
    int? acceptedBy,
    required String description,
    required List<String> images,
    required _i2.Location location,
    required String status,
  }) : super._(
          id: id,
          madeBy: madeBy,
          madeAt: madeAt,
          acceptedBy: acceptedBy,
          description: description,
          images: images,
          location: location,
          status: status,
        );

  /// Returns a shallow copy of this [Requests]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Requests copyWith({
    Object? id = _Undefined,
    int? madeBy,
    DateTime? madeAt,
    Object? acceptedBy = _Undefined,
    String? description,
    List<String>? images,
    _i2.Location? location,
    String? status,
  }) {
    return Requests(
      id: id is int? ? id : this.id,
      madeBy: madeBy ?? this.madeBy,
      madeAt: madeAt ?? this.madeAt,
      acceptedBy: acceptedBy is int? ? acceptedBy : this.acceptedBy,
      description: description ?? this.description,
      images: images ?? this.images.map((e0) => e0).toList(),
      location: location ?? this.location.copyWith(),
      status: status ?? this.status,
    );
  }
}
