import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:workrhelp_server/src/generated/protocol.dart';

class RequestEndpoint extends Endpoint {
  // Create Request
  Future<int> createRequest(Session session, int madeBy, String description,
      List<String> images, Location location) async {
    try {
      var requestObj = Requests(
          madeBy: madeBy,
          madeAt: DateTime.now(),
          description: description,
          images: images,
          location: location,
          status: "active");
      var requestIns = await Requests.db.insertRow(session, requestObj);
      return requestIns.id!;
    } catch (err) {
      return -1;
    }
  }

  // Update Request

  int _generate6DigitCode() {
    final random = Random.secure();
    return 100000 + random.nextInt(900000); // ensures a 6-digit number
  }

  Future<int> acceptRequest(
      Session session, int requestId, int helperId) async {
    try {
      var requestObj = await Requests.db.findById(session, requestId);
      if (requestObj!.status == "accepted" && requestObj.acceptedBy == null) {
        requestObj.acceptedBy = helperId;
        // ignore: unused_local_variable
        var updateRequest = await Requests.db.updateRow(session, requestObj);
        int otp = _generate6DigitCode();
        var otpObj =
            ActiveOTP(requestId: requestId, otp: otp, madeAt: DateTime.now());
        // ignore: unused_local_variable
        var otpIns = await ActiveOTP.db.insertRow(session, otpObj);
        return 0;
      }
      return 1;
    } catch (err) {
      return -1;
    }
  }

  Future<String> verifyOtpAndStartProgress(
      Session session, int requestId, int submittedOtp, int helperId) async {
    try {
      var requestObj = await Requests.db.findById(session, requestId);
      if (requestObj!.status == "accepted" &&
          requestObj.acceptedBy == helperId) {
        var otp = await ActiveOTP.db
            .findFirstRow(session, where: (t) => t.requestId.equals(requestId));
        if (otp != null) {
          if (otp.otp == submittedOtp) {
            requestObj.status = "In progress";
            // ignore: unused_local_variable
            var updateRequest =
                await Requests.db.updateRow(session, requestObj);
            return "Success";
          }
          return "Invalid OTP";
        }
        return "OTP Expired";
      }
      return "Authentication Faile";
    } catch (err) {
      return "Error";
    }
  }

  Future<int> markAsCompleted(Session session, int requestId) async {
    try {
      var requestObj = await Requests.db.findById(session, requestId);
      requestObj!.status = "completed";
      var updateRequest = await Requests.db.updateRow(session, requestObj);
      return updateRequest.id!;
    } catch (err) {
      return -1;
    }
  }

  Future<int> cancelRequest(Session session, int userId, int requestId) async {
    try {
      var requestObj = await Requests.db.findById(session, requestId);
      if (requestObj!.madeBy == userId) {
        requestObj.status = "cancelled";
        // ignore: unused_local_variable
        var updateRequest = await Requests.db.updateRow(session, requestObj);
        return 0;
      }
      return 1;
    } catch (err) {
      return -1;
    }
  }

  // Fetch Request
  Future<List<Requests>> fetchUserRequest(Session session, int userId) async {
    var requestsObj =
        await Requests.db.find(session, where: (t) => t.madeBy.equals(userId));
    return requestsObj;
  }

  Future<List<Requests>> fetchActiveUserRequest(
      Session session, int userId) async {
    var requestsObj = await Requests.db.find(session,
        where: (t) => t.status.equals("active") & t.madeBy.equals(userId));
    return requestsObj;
  }

  Future<List<Requests>> fetchActiveRequest(Session session) async {
    var requestsObj = await Requests.db
        .find(session, where: (t) => t.status.equals("active"));
    return requestsObj;
  }

  // Delete Request
}
