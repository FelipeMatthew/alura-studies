import 'dart:convert';

import 'package:floor/floor.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@entity
class Entry {
  @primaryKey
  int id;
  String name;
  String image;
  String description;
  String commonsLocations;
  String category;
  
  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonsLocations,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'commonsLocations': commonsLocations,
      'category': category,
    };
  }

  // esse que vai buscar na api
  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonsLocations: jsonEncode(map['common_locations'] ?? ['Sem localização']),
      category: map['category'] as String,
    );
  }

  List<String> commonLocationConverter() {
    return (jsonDecode(commonsLocations) as List<dynamic>).map((e) => e as String).toList();
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source) as Map<String, dynamic>);
}
