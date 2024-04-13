import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lautkita_mobile/bloc/campaign_detail/campaign_detail_bloc.dart';
import 'package:lautkita_mobile/bloc/login/login_bloc.dart';
import 'package:lautkita_mobile/bloc/logout/logout_bloc.dart';
import 'package:lautkita_mobile/bloc/register/register_bloc.dart';
import 'package:lautkita_mobile/common/global_variables.dart';
import 'package:lautkita_mobile/pages/auth/login_page.dart';
import 'package:lautkita_mobile/pages/auth/sign_up_page.dart';
import 'package:lautkita_mobile/pages/community/pages/c_home_page.dart';
import 'package:lautkita_mobile/pages/volunteer/home_page.dart';
import 'package:lautkita_mobile/pages/loading.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => LogoutBloc(),
          ),
          BlocProvider(
            create: (context) => CampaignDetailBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            useMaterial3: true,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color.fromRGBO(0, 168, 204, 1),
              selectionColor: Color.fromRGBO(0, 168, 204, 1),
            ),
          ),
          routes: {
            '/login': (context) => const LoginPage(),
            '/sign_up': (context) => const SignUpPage(),
            '/loading': (context) => const Loading(),
            '/home_page': (context) => const HomePage(),
            '/c_home_page': (context) => const CHomePage(),
          },
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final user = snapshot.data;
                uid = snapshot.data?.uid;
                if (user == null) {
                  // return const Loading();
                  // navigatorKey.currentState?.pushReplacementNamed('/login');
                  // return const Scaffold(
                  //   body: Center(
                  //     child: Text("Loading.."),
                  //   ),
                  // );
                  return const LoginPage();
                } else {
                  // navigatorKey.currentState?.pushReplacementNamed('/loading');
                  // return const Scaffold(
                  //   body: Center(
                  //     child: Text("Loading.."),
                  //   ),
                  // );

                  return const Loading();
                }
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
