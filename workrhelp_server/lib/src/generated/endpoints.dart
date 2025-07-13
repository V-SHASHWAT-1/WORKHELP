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
import '../endpoints/account_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/misc_endpoint.dart' as _i4;
import '../endpoints/request_endpoint.dart' as _i5;
import 'dart:typed_data' as _i6;
import 'package:workrhelp_server/src/generated/location.dart' as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'account': _i2.AccountEndpoint()
        ..initialize(
          server,
          'account',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'misc': _i4.MiscEndpoint()
        ..initialize(
          server,
          'misc',
          null,
        ),
      'request': _i5.RequestEndpoint()
        ..initialize(
          server,
          'request',
          null,
        ),
    };
    connectors['account'] = _i1.EndpointConnector(
      name: 'account',
      endpoint: endpoints['account']!,
      methodConnectors: {
        'createAccount': _i1.MethodConnector(
          name: 'createAccount',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'dob': _i1.ParameterDescription(
              name: 'dob',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'gender': _i1.ParameterDescription(
              name: 'gender',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'avatar': _i1.ParameterDescription(
              name: 'avatar',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contact': _i1.ParameterDescription(
              name: 'contact',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accountType': _i1.ParameterDescription(
              name: 'accountType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint).createAccount(
            session,
            params['userInfoId'],
            params['name'],
            params['dob'],
            params['gender'],
            params['avatar'],
            params['contact'],
            params['accountType'],
          ),
        ),
        'fetchAccount': _i1.MethodConnector(
          name: 'fetchAccount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint).fetchAccount(
            session,
            params['userId'],
          ),
        ),
        'fetchHelpers': _i1.MethodConnector(
          name: 'fetchHelpers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['account'] as _i2.AccountEndpoint)
                  .fetchHelpers(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['misc'] = _i1.EndpointConnector(
      name: 'misc',
      endpoint: endpoints['misc']!,
      methodConnectors: {
        'uploadImage': _i1.MethodConnector(
          name: 'uploadImage',
          params: {
            'imageData': _i1.ParameterDescription(
              name: 'imageData',
              type: _i1.getType<_i6.ByteData>(),
              nullable: false,
            ),
            'filename': _i1.ParameterDescription(
              name: 'filename',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['misc'] as _i4.MiscEndpoint).uploadImage(
            session,
            params['imageData'],
            params['filename'],
          ),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['misc'] as _i4.MiscEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['request'] = _i1.EndpointConnector(
      name: 'request',
      endpoint: endpoints['request']!,
      methodConnectors: {
        'createRequest': _i1.MethodConnector(
          name: 'createRequest',
          params: {
            'madeBy': _i1.ParameterDescription(
              name: 'madeBy',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'images': _i1.ParameterDescription(
              name: 'images',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'location': _i1.ParameterDescription(
              name: 'location',
              type: _i1.getType<_i7.Location>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint).createRequest(
            session,
            params['madeBy'],
            params['description'],
            params['images'],
            params['location'],
          ),
        ),
        'acceptRequest': _i1.MethodConnector(
          name: 'acceptRequest',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'helperId': _i1.ParameterDescription(
              name: 'helperId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint).acceptRequest(
            session,
            params['requestId'],
            params['helperId'],
          ),
        ),
        'verifyOtpAndStartProgress': _i1.MethodConnector(
          name: 'verifyOtpAndStartProgress',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'submittedOtp': _i1.ParameterDescription(
              name: 'submittedOtp',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'helperId': _i1.ParameterDescription(
              name: 'helperId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint)
                  .verifyOtpAndStartProgress(
            session,
            params['requestId'],
            params['submittedOtp'],
            params['helperId'],
          ),
        ),
        'markAsCompleted': _i1.MethodConnector(
          name: 'markAsCompleted',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint).markAsCompleted(
            session,
            params['requestId'],
          ),
        ),
        'cancelRequest': _i1.MethodConnector(
          name: 'cancelRequest',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint).cancelRequest(
            session,
            params['userId'],
            params['requestId'],
          ),
        ),
        'fetchUserRequest': _i1.MethodConnector(
          name: 'fetchUserRequest',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint).fetchUserRequest(
            session,
            params['userId'],
          ),
        ),
        'fetchActiveUserRequest': _i1.MethodConnector(
          name: 'fetchActiveUserRequest',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint)
                  .fetchActiveUserRequest(
            session,
            params['userId'],
          ),
        ),
        'fetchActiveRequest': _i1.MethodConnector(
          name: 'fetchActiveRequest',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['request'] as _i5.RequestEndpoint)
                  .fetchActiveRequest(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
