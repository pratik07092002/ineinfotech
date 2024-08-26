class NotificationModel {
  final int id;
  final String userName;
  final String userImage;
  final String action;
  final String timeAgo;

  NotificationModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.action,
    required this.timeAgo,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userName: json['userName'],
      userImage: json['userImage'],
      action: json['action'],
      timeAgo: json['timeAgo'],
    );
  }
}
