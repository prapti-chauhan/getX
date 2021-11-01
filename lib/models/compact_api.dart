class DetailPage {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  DetailPage({
    required this.id,
    required this.body,
    required this.postId,
    required this.name,
    required this.email,
  });

  factory DetailPage.fromJson(Map<String, dynamic> json) {
    return DetailPage(
      body: json['body'],
      id: json['id'],
      postId: json['postId'],
      email: json['email'],
      name: json['name'],
    );
  }
}