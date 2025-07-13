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

abstract class Business implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = BusinessTable();

  static const db = BusinessRepository._();

  @override
  int? id;

  String title;

  String overview;

  List<_i2.Location> location;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'overview': overview,
      'location': location.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static BusinessInclude include() {
    return BusinessInclude._();
  }

  static BusinessIncludeList includeList({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    BusinessInclude? include,
  }) {
    return BusinessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Business.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Business.t),
      include: include,
    );
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

class BusinessTable extends _i1.Table {
  BusinessTable({super.tableRelation}) : super(tableName: 'business') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    overview = _i1.ColumnString(
      'overview',
      this,
    );
    location = _i1.ColumnSerializable(
      'location',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString overview;

  late final _i1.ColumnSerializable location;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        overview,
        location,
      ];
}

class BusinessInclude extends _i1.IncludeObject {
  BusinessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Business.t;
}

class BusinessIncludeList extends _i1.IncludeList {
  BusinessIncludeList._({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Business.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Business.t;
}

class BusinessRepository {
  const BusinessRepository._();

  /// Returns a list of [Business]s matching the given query parameters.
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
  Future<List<Business>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Business] matching the given query parameters.
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
  Future<Business?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Business] by its [id] or null if no such row exists.
  Future<Business?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Business>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Business]s in the list and returns the inserted rows.
  ///
  /// The returned [Business]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Business>> insert(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Business>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Business] and returns the inserted row.
  ///
  /// The returned [Business] will have its `id` field set.
  Future<Business> insertRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Business>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Business]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Business>> update(
    _i1.Session session,
    List<Business> rows, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Business>(
      rows,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Business]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Business> updateRow(
    _i1.Session session,
    Business row, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Business>(
      row,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Business]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Business>> delete(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Business>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Business].
  Future<Business> deleteRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Business>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Business>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BusinessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Business>(
      where: where(Business.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Business>(
      where: where?.call(Business.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
