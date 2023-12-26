import 'package:simpsons_character_viewer/Pages/character_list.dart';
import 'package:simpsons_character_viewer/Service/character_service.dart';
import 'package:simpsons_character_viewer/ViewModel/character_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simpsons Character Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CharacterListCubit(service: CharacterService()),
        child: const CharacterList(),
      ),
    );
  }
}
