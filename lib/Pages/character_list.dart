import 'package:anywhere_exercise/ViewModel/character_list_state.dart';
import 'package:anywhere_exercise/Widgets/character_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Characters'),
      ),
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
          builder: (context, state) {
        switch (state) {
          case CharacterListCubitUnitialized():
            context.read<CharacterListCubit>().fetchCharacters();
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CharacterListCubitFetchingData():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CharacterListCubitItialized():
            return ListView.builder(
              controller: ScrollController(initialScrollOffset: 66),
              itemCount: state.characters.length,
              itemBuilder: (context, index) => index == 0
                  ? const SizedBox(
                      height: 66,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)),),
                          hintText: 'Search...',
                        )),
                      ),
                    )
                  : CharacterTile(
                      character: state.characters[index],
                    ),
            );
          default:
            return const Text('Something went wrong!');
        }
      }),
    );
  }
}
