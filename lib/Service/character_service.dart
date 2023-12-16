import 'dart:convert';

import 'package:http/http.dart' as http;

class CharacterService {
  Future<List<Map<String, dynamic>>?> getCharacters() async {
    final url = Uri.parse('http://api.duckduckgo.com/?q=simpsons+characters&format=json');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      return jsonDecode(res.body)['RelatedTopics'];
    }

    return null;
  }
}