class ActivityModel {
  final String name;
  final String username;
  final String time;
  final String description;
  final String imageUrl;
  final int likes;
  final int comments;
final String profilepic;
  ActivityModel({
    required this.name,
    required this.username,
    required this.time,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.profilepic

  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      profilepic: json['userprofile'],
      name: json['name'],
      username: json['username'],
      time: json['time'],
      description: json['description'],
      imageUrl: json['image_url'],
      likes: json['likes'],
      comments: json['comments'],
    );
  }
}

