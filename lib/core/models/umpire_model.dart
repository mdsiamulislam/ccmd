class Umpire {
  final String id;
  final String name;
  final String photoUrl;
  final int age;
  final Map<String, String> contact;
  final String experience;

  Umpire({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.age,
    required this.contact,
    required this.experience,
  });

  factory Umpire.fromJson(Map<String, dynamic> json) {
    return Umpire(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      age: json['age'],
      contact: Map<String, String>.from(json['contact']),
      experience: json['experience'],
    );
  }
}
