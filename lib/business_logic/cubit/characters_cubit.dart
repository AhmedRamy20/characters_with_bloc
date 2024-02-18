import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:understand_api/data/model/all_characters.dart';
import 'package:understand_api/data/repository/myrepo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final MyRepo myRepo;
  List<AllCharacters> characters = [];
  CharactersCubit(this.myRepo) : super(CharactersInitial());

  List<AllCharacters> getAllCharacters() {
    myRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));

      this.characters = characters;
    });

    return characters;
  }
}
