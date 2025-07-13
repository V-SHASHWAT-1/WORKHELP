import 'package:serverpod/serverpod.dart';
import 'package:workrhelp_server/src/generated/protocol.dart';

class AccountEndpoint extends Endpoint {
  // Creating Account
  Future<int> createAccount(
      Session session,
      int userInfoId,
      String name,
      DateTime? dob,
      String gender,
      String avatar,
      int contact,
      String accountType) async {
    try {
      var accountObj = User(
          userInfoId: userInfoId,
          name: name,
          dob: dob,
          gender: gender,
          avatar: avatar,
          contact: contact,
          accountType: accountType);
      var accountIns = await User.db.insertRow(session, accountObj);
      return accountIns.id!;
    } catch (err) {
      return -1;
    }
  }

  // Fetching Account
  Future<User?> fetchAccount(Session session, int userId) async {
    var accountObj = await User.db
        .findFirstRow(session, where: (t) => t.userInfoId.equals(userId));
    return accountObj;
  }

  Future<List<User>> fetchHelpers(Session session) async {
    try {
      var helpers = await User.db
          .find(session, where: (t) => t.accountType.equals("helper"));
      return helpers;
    } catch (err) {
      return [];
    }
  }

  // Update Account

  // Delete Account
}
