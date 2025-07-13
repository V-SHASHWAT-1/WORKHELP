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

abstract class WorksIn implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = WorksInTable();

  static const db = WorksInRepository._();

  @override
  int? id;

  int helperId;

  int businessId;

  String role;

  DateTime startDate;

  DateTime? endDate;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'helperId': helperId,
      'businessId': businessId,
      'role': role,
      'startDate': startDate.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
    };
  }

  static WorksInInclude include() {
    return WorksInInclude._();
  }

  static WorksInIncludeList includeList({
    _i1.WhereExpressionBuilder<WorksInTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WorksInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorksInTable>? orderByList,
    WorksInInclude? include,
  }) {
    return WorksInIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WorksIn.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WorksIn.t),
      include: include,
    );
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

class WorksInTable extends _i1.Table {
  WorksInTable({super.tableRelation}) : super(tableName: 'works_in') {
    helperId = _i1.ColumnInt(
      'helperId',
      this,
    );
    businessId = _i1.ColumnInt(
      'businessId',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
  }

  late final _i1.ColumnInt helperId;

  late final _i1.ColumnInt businessId;

  late final _i1.ColumnString role;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  @override
  List<_i1.Column> get columns => [
        id,
        helperId,
        businessId,
        role,
        startDate,
        endDate,
      ];
}

class WorksInInclude extends _i1.IncludeObject {
  WorksInInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => WorksIn.t;
}

class WorksInIncludeList extends _i1.IncludeList {
  WorksInIncludeList._({
    _i1.WhereExpressionBuilder<WorksInTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WorksIn.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => WorksIn.t;
}

class WorksInRepository {
  const WorksInRepository._();

  /// Returns a list of [WorksIn]s matching the given query parameters.
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
  Future<List<WorksIn>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorksInTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WorksInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorksInTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WorksIn>(
      where: where?.call(WorksIn.t),
      orderBy: orderBy?.call(WorksIn.t),
      orderByList: orderByList?.call(WorksIn.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [WorksIn] matching the given query parameters.
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
  Future<WorksIn?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorksInTable>? where,
    int? offset,
    _i1.OrderByBuilder<WorksInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WorksInTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<WorksIn>(
      where: where?.call(WorksIn.t),
      orderBy: orderBy?.call(WorksIn.t),
      orderByList: orderByList?.call(WorksIn.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [WorksIn] by its [id] or null if no such row exists.
  Future<WorksIn?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<WorksIn>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [WorksIn]s in the list and returns the inserted rows.
  ///
  /// The returned [WorksIn]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WorksIn>> insert(
    _i1.Session session,
    List<WorksIn> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WorksIn>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WorksIn] and returns the inserted row.
  ///
  /// The returned [WorksIn] will have its `id` field set.
  Future<WorksIn> insertRow(
    _i1.Session session,
    WorksIn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WorksIn>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WorksIn]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WorksIn>> update(
    _i1.Session session,
    List<WorksIn> rows, {
    _i1.ColumnSelections<WorksInTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WorksIn>(
      rows,
      columns: columns?.call(WorksIn.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WorksIn]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WorksIn> updateRow(
    _i1.Session session,
    WorksIn row, {
    _i1.ColumnSelections<WorksInTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WorksIn>(
      row,
      columns: columns?.call(WorksIn.t),
      transaction: transaction,
    );
  }

  /// Deletes all [WorksIn]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WorksIn>> delete(
    _i1.Session session,
    List<WorksIn> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WorksIn>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WorksIn].
  Future<WorksIn> deleteRow(
    _i1.Session session,
    WorksIn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WorksIn>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WorksIn>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WorksInTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WorksIn>(
      where: where(WorksIn.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WorksInTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WorksIn>(
      where: where?.call(WorksIn.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
