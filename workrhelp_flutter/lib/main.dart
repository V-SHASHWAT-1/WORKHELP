import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:workrhelp_flutter/pages/create_request_page.dart';
import 'package:workrhelp_flutter/pages/home_page.dart';
import 'package:workrhelp_flutter/pages/login_page.dart';
import 'package:workrhelp_flutter/pages/sign_up_page.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
late SessionManager sessionManager;
late Client client;

void main() async {
  // The android emulator does not have access to the localhost of the machine.
  //const ipAddress = '10.0.2.2'; // Android emulator ip for the host
  const ipAddress = '192.168.0.123';
  // On a real device replace the ipAddress with the IP address of your computer.
  //const ipAddress = 'localhost';

  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget firstPage() {
    if (sessionManager.isSignedIn) {
      return const HomePage();
    }
    return const LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignUpPage(),
        "/create-request": (context) => const CreateRequestPage(),
      },
      home: firstPage(),
    );
  }
}
