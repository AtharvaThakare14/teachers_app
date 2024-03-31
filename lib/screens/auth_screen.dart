import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:teachers_app/screens/main_screen.dart';
import 'package:teachers_app/services/database_service.dart';
import 'package:teachers_app/services/storage_services.dart';
import 'package:teachers_app/controller/auth_controller.dart';
import 'package:teachers_app/controller/user_info_controller.dart';
import 'package:teachers_app/screens/auth_pages/registraton_screen.dart';
import 'package:teachers_app/screens/onboarding_screen.dart';
import 'package:teachers_app/screens/loader_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: context.read<AuthController>().authStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        print(snapshot.hasData);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularLoaderScreen();
        } else if (snapshot.hasData) {
          // Provider.of<AuthController>(context).signOut();

          if (!GetIt.instance.isRegistered<DatabaseServices>()) {
            GetIt.instance.registerSingleton<DatabaseServices>(
              DatabaseServices(snapshot.data!.uid),
            );
          } else {
            GetIt.instance.get<DatabaseServices>().setUser(snapshot.data!.uid);
          }
          if (!GetIt.instance.isRegistered<FirebaseStorageService>()) {
            GetIt.instance.registerSingleton<FirebaseStorageService>(
              FirebaseStorageService(snapshot.data!.uid),
            );
          } else {
            GetIt.instance
                .get<FirebaseStorageService>()
                .setUser(snapshot.data!.uid);
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => UserInfoController(
                  GetIt.I.get<DatabaseServices>(),
                  GetIt.I.get<FirebaseStorageService>(),
                ),
              )
            ],
            child: Builder(
              builder: (context) {
                return FutureBuilder(
                  future:
                      Provider.of<UserInfoController>(context, listen: false)
                          .fetchUserInfo(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularLoaderScreen();
                    }

                    if (snapshot.hasData && snapshot.data != null) {
                      print("userData ${snapshot.data}");
                      return const MainScreen();
                    }

                    return Navigator(
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          return RegistrationScreen();
                        },
                      ),
                    );
                    // RegistrationScreen();
                  },
                );
              },
            ),
          );
        } else {
          return Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) {
                return const OnBoardingScreen();
              },
            ),
          );
          // const OnBoardingScreen();
        }
      },
    );
  }
}
