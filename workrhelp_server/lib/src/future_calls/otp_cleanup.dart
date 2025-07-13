import 'package:serverpod/serverpod.dart';
import 'package:workrhelp_server/src/generated/protocol.dart';

class OtpCleanup extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? model) async {
    final cutoffTime = DateTime.now().subtract(Duration(hours: 3));
    await ActiveOTP.db
        .deleteWhere(session, where: (otp) => otp.madeAt < cutoffTime);
  }
}
