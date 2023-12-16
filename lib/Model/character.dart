class Character {
  final String _name, _description, _imageUrl;

  String get name => _name;
  String get description => _description;
  String get imageUrl => _imageUrl;

  Character({
    required String name,
    required String description,
    required String imageUrl,
  })  : _name = name,
        _description = description,
        _imageUrl = imageUrl;

  Character.fromJson(Map<String, dynamic> json)
      : _name = (json['FirstURL'] as String)
            .replaceAll('https://duckduckgo.com/', '')
            .replaceAll('_', ' '),
        _description = (json['Text'] as String).split(' - ').last,
        _imageUrl = json['Icon']['URL'];
}
