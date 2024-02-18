import 'package:flutter/material.dart';
import 'package:understand_api/Router/app_router.dart';
import 'package:understand_api/Router/routes.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

// this is our client app..
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.allCharactersScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
