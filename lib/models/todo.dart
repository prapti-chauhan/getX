class Home {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Home(
      {required this.id,
        required this.title,
        required this.userId,
        required this.completed});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }
}
