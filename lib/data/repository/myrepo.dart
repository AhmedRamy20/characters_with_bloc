import 'package:understand_api/data/model/all_characters.dart';
import 'package:understand_api/data/web_services/web_services.dart';

class MyRepo {
  final CharactersWebServices charactersWebServices;
  MyRepo(this.charactersWebServices);

  Future<List<AllCharacters>> getAllCharacters() async {
    final allCharacters = await charactersWebServices.getAllCharacters();

    return allCharacters
        .map((character) => AllCharacters.fromJson(character))
        .toList();
  }
}
