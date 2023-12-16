import 'package:anywhere_exercise/Model/character.dart';
import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;
  const CharacterDetail({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
    );
  }
}
