import 'package:finalproject/app_state.dart';
import 'package:finalproject/pages/home_page.dart';
import 'package:finalproject/pages/login_page.dart';
import 'package:finalproject/pages/signup_page.dart';
import 'package:finalproject/screens/HomePageFactories.dart';
import 'package:finalproject/utensils/routes.dart';
import 'package:finalproject/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyC-dNxe1trRvMw06t-qxe-Mv3_ziPzrip8',
          appId: '1:972590158499:web:df06fa54958fa406eda516',
          messagingSenderId: '972590158499',
          projectId: 'metaudito',
          authDomain: 'metaudito.firebaseapp.com',
          storageBucket: 'metaudito.appspot.com',
        ));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBOqV0aMNLRCnEU-GSRY5QG3BMxBE5czrM',
          appId: '1:972590158499:android:045b8416e04fe033eda516',
          messagingSenderId: '972590158499',
          projectId: 'metaudito',
          storageBucket: 'metaudito.appspot.com',
        )
    );
  }
  Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MainApp()),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
    /*initialRoute: "/",
    routes: {
      "/": (context) => Homepage(),
      MyRoutes.homeroute: (context) => Homepage(),
      MyRoutes.loginroute: (context) => Loginpage(),
      MyRoutes.signroute: (context) => Signpage(),
    }*/
      home: WidgetTree(),
      /*home: Scaffold(
        body: Center(
          child: HomePageFactories(),
        ),
      ),*/

    );
  }
}
