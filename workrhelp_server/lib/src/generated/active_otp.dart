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

abstract class ActiveOTP implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = ActiveOTPTable();

  static const db = ActiveOTPRepository._();

  @override
  int? id;

  int requestId;

  int otp;

  DateTime madeAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'requestId': requestId,
      'otp': otp,
      'madeAt': madeAt.toJson(),
    };
  }

  static ActiveOTPInclude include() {
    return ActiveOTPInclude._();
  }

  static ActiveOTPIncludeList includeList({
    _i1.WhereExpressionBuilder<ActiveOTPTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ActiveOTPTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ActiveOTPTable>? orderByList,
    ActiveOTPInclude? include,
  }) {
    return ActiveOTPIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ActiveOTP.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ActiveOTP.t),
      include: include,
    );
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

class ActiveOTPTable extends _i1.Table {
  ActiveOTPTable({super.tableRelation}) : super(tableName: 'active_otp') {
    requestId = _i1.ColumnInt(
      'requestId',
      this,
    );
    otp = _i1.ColumnInt(
      'otp',
      this,
    );
    madeAt = _i1.ColumnDateTime(
      'madeAt',
      this,
    );
  }

  late final _i1.ColumnInt requestId;

  late final _i1.ColumnInt otp;

  late final _i1.ColumnDateTime madeAt;

  @override
  List<_i1.Column> get columns => [
        id,
        requestId,
        otp,
        madeAt,
      ];
}

class ActiveOTPInclude extends _i1.IncludeObject {
  ActiveOTPInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ActiveOTP.t;
}

class ActiveOTPIncludeList extends _i1.IncludeList {
  ActiveOTPIncludeList._({
    _i1.WhereExpressionBuilder<ActiveOTPTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ActiveOTP.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ActiveOTP.t;
}

class ActiveOTPRepository {
  const ActiveOTPRepository._();

  /// Returns a list of [ActiveOTP]s matching the given query parameters.
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
  Future<List<ActiveOTP>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ActiveOTPTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ActiveOTPTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ActiveOTPTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ActiveOTP>(
      where: where?.call(ActiveOTP.t),
      orderBy: orderBy?.call(ActiveOTP.t),
      orderByList: orderByList?.call(ActiveOTP.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ActiveOTP] matching the given query parameters.
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
  Future<ActiveOTP?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ActiveOTPTable>? where,
    int? offset,
    _i1.OrderByBuilder<ActiveOTPTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ActiveOTPTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ActiveOTP>(
      where: where?.call(ActiveOTP.t),
      orderBy: orderBy?.call(ActiveOTP.t),
      orderByList: orderByList?.call(ActiveOTP.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ActiveOTP] by its [id] or null if no such row exists.
  Future<ActiveOTP?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ActiveOTP>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ActiveOTP]s in the list and returns the inserted rows.
  ///
  /// The returned [ActiveOTP]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ActiveOTP>> insert(
    _i1.Session session,
    List<ActiveOTP> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ActiveOTP>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ActiveOTP] and returns the inserted row.
  ///
  /// The returned [ActiveOTP] will have its `id` field set.
  Future<ActiveOTP> insertRow(
    _i1.Session session,
    ActiveOTP row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ActiveOTP>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ActiveOTP]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ActiveOTP>> update(
    _i1.Session session,
    List<ActiveOTP> rows, {
    _i1.ColumnSelections<ActiveOTPTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ActiveOTP>(
      rows,
      columns: columns?.call(ActiveOTP.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ActiveOTP]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ActiveOTP> updateRow(
    _i1.Session session,
    ActiveOTP row, {
    _i1.ColumnSelections<ActiveOTPTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ActiveOTP>(
      row,
      columns: columns?.call(ActiveOTP.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ActiveOTP]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ActiveOTP>> delete(
    _i1.Session session,
    List<ActiveOTP> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ActiveOTP>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ActiveOTP].
  Future<ActiveOTP> deleteRow(
    _i1.Session session,
    ActiveOTP row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ActiveOTP>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ActiveOTP>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ActiveOTPTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ActiveOTP>(
      where: where(ActiveOTP.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ActiveOTPTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ActiveOTP>(
      where: where?.call(ActiveOTP.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
