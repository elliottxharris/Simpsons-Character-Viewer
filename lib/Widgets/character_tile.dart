import 'package:anywhere_exercise/Model/character.dart';
import 'package:anywhere_exercise/Pages/character_detail.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CharacterDetail(
            character: character,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(character.name),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
