part of 'character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit() : super(CharacterListCubitUnitialized());

  Future<void> fetchCharacters() async {
    emit(CharacterListCubitFetchingData());

    final CharacterService service = CharacterService();
    final List<Map<String, dynamic>>? json = await service.getCharacters();

    if (json != null) {
      final List<Character> characters =
          json.map((e) => Character.fromJson(e)).toList();

      emit(CharacterListCubitItialized(characters: characters));
    } else {
      emit(CharacterListCubitErrored());
    }
  }
}
