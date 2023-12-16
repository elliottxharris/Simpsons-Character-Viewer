import 'package:anywhere_exercise/Service/character_service.dart';
import 'package:anywhere_exercise/View%20Model/character_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_list_cubit_test.mocks.dart';

@GenerateMocks([CharacterService])
void main() {
  group('character list cubit', () {
    late CharacterService mockCharacterService;

    setUp(() {
      mockCharacterService = MockCharacterService();
    });

    test('emits CharacterListCubitItialized.', () async {
      when(mockCharacterService.getCharacters())
          .thenAnswer((_) => Future.value([
                {
                  "FirstURL": "https://duckduckgo.com/Apu_Nahasapeemapetilan",
                  "Icon": {"Height": "", "URL": "", "Width": ""},
                  "Result":
                      "<a href=\"https://duckduckgo.com/Apu_Nahasapeemapetilan\">Apu Nahasapeemapetilan</a><br>Apu Nahasapeemapetilan is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, \"Thank you, come again\".",
                  "Text":
                      "Apu Nahasapeemapetilan - Apu Nahasapeemapetilan is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, \"Thank you, come again\"."
                }
              ]));

      final cubit = CharacterListCubit(service: mockCharacterService);

      expect(cubit.state, isA<CharacterListCubitUnitialized>());
      expect(cubit.state.props, []);

      await cubit.fetchCharacters();

      expect(cubit.state, isA<CharacterListCubitItialized>());
      expect(cubit.state.props.length, 1);
    });

    test('emits CharacterListCubitErrored.', () async {
      when(mockCharacterService.getCharacters())
          .thenAnswer((_) => Future.value(null));

      final cubit = CharacterListCubit(service: mockCharacterService);

      await cubit.fetchCharacters();

      expect(cubit.state, isA<CharacterListCubitErrored>());
    });
  });
}
