part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}


class CharactersLoaded extends CharactersState{
  final List<AllCharacters> characters;

  CharactersLoaded(this.characters);
}