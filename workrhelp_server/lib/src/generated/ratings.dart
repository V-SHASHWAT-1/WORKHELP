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

abstract class Ratings implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = RatingsTable();

  static const db = RatingsRepository._();

  @override
  int? id;

  int helperId;

  double cumulativeRating;

  int totalRatings;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'helperId': helperId,
      'cumulativeRating': cumulativeRating,
      'totalRatings': totalRatings,
    };
  }

  static RatingsInclude include() {
    return RatingsInclude._();
  }

  static RatingsIncludeList includeList({
    _i1.WhereExpressionBuilder<RatingsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RatingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RatingsTable>? orderByList,
    RatingsInclude? include,
  }) {
    return RatingsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ratings.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Ratings.t),
      include: include,
    );
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

class RatingsTable extends _i1.Table {
  RatingsTable({super.tableRelation}) : super(tableName: 'ratings') {
    helperId = _i1.ColumnInt(
      'helperId',
      this,
    );
    cumulativeRating = _i1.ColumnDouble(
      'cumulativeRating',
      this,
    );
    totalRatings = _i1.ColumnInt(
      'totalRatings',
      this,
    );
  }

  late final _i1.ColumnInt helperId;

  late final _i1.ColumnDouble cumulativeRating;

  late final _i1.ColumnInt totalRatings;

  @override
  List<_i1.Column> get columns => [
        id,
        helperId,
        cumulativeRating,
        totalRatings,
      ];
}

class RatingsInclude extends _i1.IncludeObject {
  RatingsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Ratings.t;
}

class RatingsIncludeList extends _i1.IncludeList {
  RatingsIncludeList._({
    _i1.WhereExpressionBuilder<RatingsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Ratings.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Ratings.t;
}

class RatingsRepository {
  const RatingsRepository._();

  /// Returns a list of [Ratings]s matching the given query parameters.
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
  Future<List<Ratings>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RatingsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RatingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RatingsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Ratings>(
      where: where?.call(Ratings.t),
      orderBy: orderBy?.call(Ratings.t),
      orderByList: orderByList?.call(Ratings.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Ratings] matching the given query parameters.
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
  Future<Ratings?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RatingsTable>? where,
    int? offset,
    _i1.OrderByBuilder<RatingsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RatingsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Ratings>(
      where: where?.call(Ratings.t),
      orderBy: orderBy?.call(Ratings.t),
      orderByList: orderByList?.call(Ratings.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Ratings] by its [id] or null if no such row exists.
  Future<Ratings?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Ratings>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Ratings]s in the list and returns the inserted rows.
  ///
  /// The returned [Ratings]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Ratings>> insert(
    _i1.Session session,
    List<Ratings> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Ratings>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Ratings] and returns the inserted row.
  ///
  /// The returned [Ratings] will have its `id` field set.
  Future<Ratings> insertRow(
    _i1.Session session,
    Ratings row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Ratings>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Ratings]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Ratings>> update(
    _i1.Session session,
    List<Ratings> rows, {
    _i1.ColumnSelections<RatingsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Ratings>(
      rows,
      columns: columns?.call(Ratings.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Ratings]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Ratings> updateRow(
    _i1.Session session,
    Ratings row, {
    _i1.ColumnSelections<RatingsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Ratings>(
      row,
      columns: columns?.call(Ratings.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Ratings]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Ratings>> delete(
    _i1.Session session,
    List<Ratings> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Ratings>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Ratings].
  Future<Ratings> deleteRow(
    _i1.Session session,
    Ratings row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Ratings>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Ratings>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RatingsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Ratings>(
      where: where(Ratings.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RatingsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Ratings>(
      where: where?.call(Ratings.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
