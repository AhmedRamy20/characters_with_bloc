import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:understand_api/Router/routes.dart';
import 'package:understand_api/business_logic/cubit/characters_cubit.dart';
import 'package:understand_api/data/model/all_characters.dart';
import 'package:understand_api/data/repository/myrepo.dart';
import 'package:understand_api/data/web_services/web_services.dart';
import 'package:understand_api/presentation/screens/details_screen.dart';
import 'package:understand_api/presentation/screens/home.dart';

class AppRouter {
  late MyRepo myRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    myRepo = MyRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(myRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.allCharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case Routes.charactersDetailsScreen:
        final character = settings.arguments as AllCharacters;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(character: character),
        );

      // default:
      //   return MaterialPageRoute(builder: (_) => const Text("Route Not Found"));
    }
  }
}
