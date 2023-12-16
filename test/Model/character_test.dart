import 'dart:convert';
import 'dart:io';
import 'package:anywhere_exercise/Model/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('character model tests', () {
    test('test properties', () {
      Character character = Character(
        name: 'name',
        description: 'description',
        imageUrl: 'image',
      );

      expect(character.name, 'name');
      expect(character.description, 'description');
      expect(character.imageUrl, 'image');
    });

    test('fromJson', () {
      final String characterJson =
          File('assets/character.json').readAsStringSync();
      Character character = Character.fromJson(jsonDecode(characterJson));

      expect(character.name, 'Apu Nahasapeemapetilan');
      expect(character.description,
          'Apu Nahasapeemapetilan - Apu Nahasapeemapetilan is a recurring character in the American animated television series The Simpsons. He is an Indian immigrant proprietor who runs the Kwik-E-Mart, a popular convenience store in Springfield, and is known for his catchphrase, "Thank you, come again".');
      expect(character.imageUrl, '');
    });
  });
}
