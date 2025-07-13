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

abstract class ReviewComments
    implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = ReviewCommentsTable();

  static const db = ReviewCommentsRepository._();

  @override
  int? id;

  int madeBy;

  int forHelper;

  DateTime madeAt;

  int stars;

  String comment;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'madeBy': madeBy,
      'forHelper': forHelper,
      'madeAt': madeAt.toJson(),
      'stars': stars,
      'comment': comment,
    };
  }

  static ReviewCommentsInclude include() {
    return ReviewCommentsInclude._();
  }

  static ReviewCommentsIncludeList includeList({
    _i1.WhereExpressionBuilder<ReviewCommentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReviewCommentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewCommentsTable>? orderByList,
    ReviewCommentsInclude? include,
  }) {
    return ReviewCommentsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReviewComments.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ReviewComments.t),
      include: include,
    );
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

class ReviewCommentsTable extends _i1.Table {
  ReviewCommentsTable({super.tableRelation})
      : super(tableName: 'review_comments') {
    madeBy = _i1.ColumnInt(
      'madeBy',
      this,
    );
    forHelper = _i1.ColumnInt(
      'forHelper',
      this,
    );
    madeAt = _i1.ColumnDateTime(
      'madeAt',
      this,
    );
    stars = _i1.ColumnInt(
      'stars',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
  }

  late final _i1.ColumnInt madeBy;

  late final _i1.ColumnInt forHelper;

  late final _i1.ColumnDateTime madeAt;

  late final _i1.ColumnInt stars;

  late final _i1.ColumnString comment;

  @override
  List<_i1.Column> get columns => [
        id,
        madeBy,
        forHelper,
        madeAt,
        stars,
        comment,
      ];
}

class ReviewCommentsInclude extends _i1.IncludeObject {
  ReviewCommentsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ReviewComments.t;
}

class ReviewCommentsIncludeList extends _i1.IncludeList {
  ReviewCommentsIncludeList._({
    _i1.WhereExpressionBuilder<ReviewCommentsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReviewComments.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ReviewComments.t;
}

class ReviewCommentsRepository {
  const ReviewCommentsRepository._();

  /// Returns a list of [ReviewComments]s matching the given query parameters.
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
  Future<List<ReviewComments>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReviewCommentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReviewCommentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewCommentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ReviewComments>(
      where: where?.call(ReviewComments.t),
      orderBy: orderBy?.call(ReviewComments.t),
      orderByList: orderByList?.call(ReviewComments.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ReviewComments] matching the given query parameters.
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
  Future<ReviewComments?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReviewCommentsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReviewCommentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReviewCommentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ReviewComments>(
      where: where?.call(ReviewComments.t),
      orderBy: orderBy?.call(ReviewComments.t),
      orderByList: orderByList?.call(ReviewComments.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ReviewComments] by its [id] or null if no such row exists.
  Future<ReviewComments?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ReviewComments>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ReviewComments]s in the list and returns the inserted rows.
  ///
  /// The returned [ReviewComments]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ReviewComments>> insert(
    _i1.Session session,
    List<ReviewComments> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ReviewComments>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ReviewComments] and returns the inserted row.
  ///
  /// The returned [ReviewComments] will have its `id` field set.
  Future<ReviewComments> insertRow(
    _i1.Session session,
    ReviewComments row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReviewComments>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ReviewComments]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ReviewComments>> update(
    _i1.Session session,
    List<ReviewComments> rows, {
    _i1.ColumnSelections<ReviewCommentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ReviewComments>(
      rows,
      columns: columns?.call(ReviewComments.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReviewComments]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ReviewComments> updateRow(
    _i1.Session session,
    ReviewComments row, {
    _i1.ColumnSelections<ReviewCommentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReviewComments>(
      row,
      columns: columns?.call(ReviewComments.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ReviewComments]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ReviewComments>> delete(
    _i1.Session session,
    List<ReviewComments> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ReviewComments>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ReviewComments].
  Future<ReviewComments> deleteRow(
    _i1.Session session,
    ReviewComments row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReviewComments>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ReviewComments>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ReviewCommentsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ReviewComments>(
      where: where(ReviewComments.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReviewCommentsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReviewComments>(
      where: where?.call(ReviewComments.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
