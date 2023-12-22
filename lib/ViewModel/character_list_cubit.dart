part of 'character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterService service;
  CharacterListCubit({required this.service})
      : super(CharacterListCubitUnitialized());

  Future<void> fetchCharacters() async {
    emit(CharacterListCubitFetchingData());

    final List<dynamic>? json = await service.getCharacters();

    if (json != null) {
      final List<Character> characters =
          json.map((e) => Character.fromJson(e)).toList();

      emit(CharacterListCubitItialized(characters: characters));
    } else {
      emit(CharacterListCubitErrored());
    }
  }

  void searchCharacters({required String input}) {
    List<Character> searchCharacters = (state as CharacterListCubitItialized)
        .characters
        .where((element) =>
            element.name.toLowerCase().contains(input) ||
            element.description.toLowerCase().contains(input))
        .toList();
        
    emit(CharacterListCubitItialized(
      characters: (state as CharacterListCubitItialized).characters,
      searchCharacters: searchCharacters,
      hasSearched: true,
    ));
  }
}
