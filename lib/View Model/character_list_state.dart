import 'package:anywhere_exercise/Model/character.dart';
import 'package:anywhere_exercise/Service/character_service.dart';
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

  const CharacterListCubitItialized({required this.characters});

  @override
  List<Object?> get props => [
        characters,
      ];
}

class CharacterListCubitErrored extends CharacterListState {}
