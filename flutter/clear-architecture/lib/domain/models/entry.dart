import 'dart:convert';
import 'package:floor/floor.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@entity
class Entry {
  @primaryKey
  final int id;
  final String name;
  final String image;
  final String description;
  final String commonsLocations; // JSON-encoded string for common_locations
  final String category;

  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonsLocations,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'commonsLocations': commonsLocations,
      'category': category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
      name: map['name']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      commonsLocations: jsonEncode(
        map['common_locations'] is List
            ? map['common_locations']
            : (map['common_locations'] == null ? ['Sem localização'] : [map['common_locations'].toString()]),
      ),
      category: map['category']?.toString() ?? '',
    );
  }

  List<String> commonLocationConverter() {
    try {
      return (jsonDecode(commonsLocations) as List<dynamic>).map((e) => e.toString()).toList();
    } catch (e) {
      return ['Sem localização'];
    }
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Entry(id: $id, name: $name, category: $category, commonsLocations: $commonsLocations)';
}