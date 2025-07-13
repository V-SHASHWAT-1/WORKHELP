/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'location.dart' as _i2;

abstract class Requests implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = RequestsTable();

  static const db = RequestsRepository._();

  @override
  int? id;

  int madeBy;

  DateTime madeAt;

  int? acceptedBy;

  String description;

  List<String> images;

  _i2.Location location;

  String status;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'madeBy': madeBy,
      'madeAt': madeAt.toJson(),
      if (acceptedBy != null) 'acceptedBy': acceptedBy,
      'description': description,
      'images': images.toJson(),
      'location': location.toJsonForProtocol(),
      'status': status,
    };
  }

  static RequestsInclude include() {
    return RequestsInclude._();
  }

  static RequestsIncludeList includeList({
    _i1.WhereExpressionBuilder<RequestsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RequestsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequestsTable>? orderByList,
    RequestsInclude? include,
  }) {
    return RequestsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Requests.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Requests.t),
      include: include,
    );
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

class RequestsTable extends _i1.Table {
  RequestsTable({super.tableRelation}) : super(tableName: 'requests') {
    madeBy = _i1.ColumnInt(
      'madeBy',
      this,
    );
    madeAt = _i1.ColumnDateTime(
      'madeAt',
      this,
    );
    acceptedBy = _i1.ColumnInt(
      'acceptedBy',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    images = _i1.ColumnSerializable(
      'images',
      this,
    );
    location = _i1.ColumnSerializable(
      'location',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
  }

  late final _i1.ColumnInt madeBy;

  late final _i1.ColumnDateTime madeAt;

  late final _i1.ColumnInt acceptedBy;

  late final _i1.ColumnString description;

  late final _i1.ColumnSerializable images;

  late final _i1.ColumnSerializable location;

  late final _i1.ColumnString status;

  @override
  List<_i1.Column> get columns => [
        id,
        madeBy,
        madeAt,
        acceptedBy,
        description,
        images,
        location,
        status,
      ];
}

class RequestsInclude extends _i1.IncludeObject {
  RequestsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Requests.t;
}

class RequestsIncludeList extends _i1.IncludeList {
  RequestsIncludeList._({
    _i1.WhereExpressionBuilder<RequestsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Requests.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Requests.t;
}

class RequestsRepository {
  const RequestsRepository._();

  /// Returns a list of [Requests]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Requests>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequestsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RequestsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequestsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Requests>(
      where: where?.call(Requests.t),
      orderBy: orderBy?.call(Requests.t),
      orderByList: orderByList?.call(Requests.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Requests] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Requests?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequestsTable>? where,
    int? offset,
    _i1.OrderByBuilder<RequestsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequestsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Requests>(
      where: where?.call(Requests.t),
      orderBy: orderBy?.call(Requests.t),
      orderByList: orderByList?.call(Requests.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Requests] by its [id] or null if no such row exists.
  Future<Requests?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Requests>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Requests]s in the list and returns the inserted rows.
  ///
  /// The returned [Requests]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Requests>> insert(
    _i1.Session session,
    List<Requests> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Requests>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Requests] and returns the inserted row.
  ///
  /// The returned [Requests] will have its `id` field set.
  Future<Requests> insertRow(
    _i1.Session session,
    Requests row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Requests>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Requests]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Requests>> update(
    _i1.Session session,
    List<Requests> rows, {
    _i1.ColumnSelections<RequestsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Requests>(
      rows,
      columns: columns?.call(Requests.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Requests]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Requests> updateRow(
    _i1.Session session,
    Requests row, {
    _i1.ColumnSelections<RequestsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Requests>(
      row,
      columns: columns?.call(Requests.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Requests]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Requests>> delete(
    _i1.Session session,
    List<Requests> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Requests>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Requests].
  Future<Requests> deleteRow(
    _i1.Session session,
    Requests row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Requests>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Requests>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RequestsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Requests>(
      where: where(Requests.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequestsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Requests>(
      where: where?.call(Requests.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
