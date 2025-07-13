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
import 'dart:async' as _i2;
import 'package:workrhelp_client/src/protocol/user.dart' as _i3;
import 'dart:typed_data' as _i4;
import 'package:workrhelp_client/src/protocol/location.dart' as _i5;
import 'package:workrhelp_client/src/protocol/requests.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointAccount extends _i1.EndpointRef {
  EndpointAccount(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'account';

  _i2.Future<int> createAccount(
    int userInfoId,
    String name,
    DateTime? dob,
    String gender,
    String avatar,
    int contact,
    String accountType,
  ) =>
      caller.callServerEndpoint<int>(
        'account',
        'createAccount',
        {
          'userInfoId': userInfoId,
          'name': name,
          'dob': dob,
          'gender': gender,
          'avatar': avatar,
          'contact': contact,
          'accountType': accountType,
        },
      );

  _i2.Future<_i3.User?> fetchAccount(int userId) =>
      caller.callServerEndpoint<_i3.User?>(
        'account',
        'fetchAccount',
        {'userId': userId},
      );

  _i2.Future<List<_i3.User>> fetchHelpers() =>
      caller.callServerEndpoint<List<_i3.User>>(
        'account',
        'fetchHelpers',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointMisc extends _i1.EndpointRef {
  EndpointMisc(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'misc';

  _i2.Future<String> uploadImage(
    _i4.ByteData imageData,
    String filename,
  ) =>
      caller.callServerEndpoint<String>(
        'misc',
        'uploadImage',
        {
          'imageData': imageData,
          'filename': filename,
        },
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'misc',
        'getUploadDescription',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointRequest extends _i1.EndpointRef {
  EndpointRequest(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'request';

  _i2.Future<int> createRequest(
    int madeBy,
    String description,
    List<String> images,
    _i5.Location location,
  ) =>
      caller.callServerEndpoint<int>(
        'request',
        'createRequest',
        {
          'madeBy': madeBy,
          'description': description,
          'images': images,
          'location': location,
        },
      );

  _i2.Future<int> acceptRequest(
    int requestId,
    int helperId,
  ) =>
      caller.callServerEndpoint<int>(
        'request',
        'acceptRequest',
        {
          'requestId': requestId,
          'helperId': helperId,
        },
      );

  _i2.Future<String> verifyOtpAndStartProgress(
    int requestId,
    int submittedOtp,
    int helperId,
  ) =>
      caller.callServerEndpoint<String>(
        'request',
        'verifyOtpAndStartProgress',
        {
          'requestId': requestId,
          'submittedOtp': submittedOtp,
          'helperId': helperId,
        },
      );

  _i2.Future<int> markAsCompleted(int requestId) =>
      caller.callServerEndpoint<int>(
        'request',
        'markAsCompleted',
        {'requestId': requestId},
      );

  _i2.Future<int> cancelRequest(
    int userId,
    int requestId,
  ) =>
      caller.callServerEndpoint<int>(
        'request',
        'cancelRequest',
        {
          'userId': userId,
          'requestId': requestId,
        },
      );

  _i2.Future<List<_i6.Requests>> fetchUserRequest(int userId) =>
      caller.callServerEndpoint<List<_i6.Requests>>(
        'request',
        'fetchUserRequest',
        {'userId': userId},
      );

  _i2.Future<List<_i6.Requests>> fetchActiveUserRequest(int userId) =>
      caller.callServerEndpoint<List<_i6.Requests>>(
        'request',
        'fetchActiveUserRequest',
        {'userId': userId},
      );

  _i2.Future<List<_i6.Requests>> fetchActiveRequest() =>
      caller.callServerEndpoint<List<_i6.Requests>>(
        'request',
        'fetchActiveRequest',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    account = EndpointAccount(this);
    example = EndpointExample(this);
    misc = EndpointMisc(this);
    request = EndpointRequest(this);
    modules = Modules(this);
  }

  late final EndpointAccount account;

  late final EndpointExample example;

  late final EndpointMisc misc;

  late final EndpointRequest request;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'account': account,
        'example': example,
        'misc': misc,
        'request': request,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
