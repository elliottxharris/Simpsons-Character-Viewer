import 'package:simpsons_character_viewer/Model/character.dart';
import 'package:simpsons_character_viewer/Service/character_service.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'character_list_cubit.dart';

abstract class CharacterListState extends Equatable {
  const CharacterListState();

  @override
  List<Object?> get props => [];
}

class CharacterListCubitUnitialized extends CharacterListState {}

class CharacterListCubitFetchingData extends CharacterListState {}

class CharacterListCubitItialized extends CharacterListState {
  final List<Character> characters;
  final List<Character>? searchCharacters;
  final bool hasSearched;

  const CharacterListCubitItialized({
    required this.characters,
    this.searchCharacters,
    this.hasSearched = false,
  });

  @override
  List<Object?> get props => [
        characters,
        searchCharacters,
        hasSearched,
      ];
}

class CharacterListCubitErrored extends CharacterListState {}
