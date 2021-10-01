class Post {
  final int id;
  final String name;
  final String email;

  Post({
    required this.id,
    required this.name,
    required this.email,
  });

  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      name: json['title'] ?? '',
      email: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
