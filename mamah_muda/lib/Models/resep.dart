import 'users.dart';

class PostResep {
  int? recipeId;
  String? name;
  String? description;
  String? waktu;
  String? tingkat;
  String? category;
  String? tahun;
  String? origin;
  String? bahan;
  String? instruction;
  users? user;

  PostResep({
    this.recipeId,
    this.name,
    this.description,
    this.waktu,
    this.tingkat,
    this.category,
    this.tahun,
    this.origin,
    this.bahan,
    this.instruction,
    this.user,
  });

  //json to post model

  factory PostResep.fromJson(Map<String, dynamic> json) {
    return PostResep(
        recipeId: json['recipeId'] as int?,
        name: json['name'],
        description: json['Desc'],
        waktu: json['waktu'],
        tingkat: json['kesulitan'],
        category: json['kategori'],
        tahun: json['viral'],
        origin: json['khas'],
        bahan: json['bahan'],
        instruction: json['method'],
        user: users(
          id: json['id'],
          name: json['user']['name'],
          email: json['user']['email'],
        ));
  }
}
