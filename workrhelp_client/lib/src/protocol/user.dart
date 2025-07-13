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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.userInfoId,
    required this.name,
    this.dob,
    required this.gender,
    required this.avatar,
    required this.contact,
    required this.accountType,
  });

  factory User({
    int? id,
    required int userInfoId,
    required String name,
    DateTime? dob,
    required String gender,
    required String avatar,
    required int contact,
    required String accountType,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      name: jsonSerialization['name'] as String,
      dob: jsonSerialization['dob'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dob']),
      gender: jsonSerialization['gender'] as String,
      avatar: jsonSerialization['avatar'] as String,
      contact: jsonSerialization['contact'] as int,
      accountType: jsonSerialization['accountType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  String name;

  DateTime? dob;

  String gender;

  String avatar;

  int contact;

  String accountType;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    int? userInfoId,
    String? name,
    DateTime? dob,
    String? gender,
    String? avatar,
    int? contact,
    String? accountType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'name': name,
      if (dob != null) 'dob': dob?.toJson(),
      'gender': gender,
      'avatar': avatar,
      'contact': contact,
      'accountType': accountType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userInfoId,
    required String name,
    DateTime? dob,
    required String gender,
    required String avatar,
    required int contact,
    required String accountType,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          name: name,
          dob: dob,
          gender: gender,
          avatar: avatar,
          contact: contact,
          accountType: accountType,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? name,
    Object? dob = _Undefined,
    String? gender,
    String? avatar,
    int? contact,
    String? accountType,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      name: name ?? this.name,
      dob: dob is DateTime? ? dob : this.dob,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
      contact: contact ?? this.contact,
      accountType: accountType ?? this.accountType,
    );
  }
}
