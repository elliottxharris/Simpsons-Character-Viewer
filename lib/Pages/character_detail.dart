import 'package:simpsons_character_viewer/Model/character.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;
  const CharacterDetail({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            character.imageUrl.isNotEmpty
                ? SizedBox(
                  height: 200,
                  child: Center(
                      child: CachedNetworkImage(
                        imageUrl: 'https://duckduckgo.com/${character.imageUrl}',
                        placeholder: (_, url) => const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                )
                : Image.asset('assets/placeholder.png'),
            const SizedBox(
              height: 16,
            ),
            Text(
              character.description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
