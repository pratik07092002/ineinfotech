class StatsModel {
  final int communityManager;
  final int taskManagers;
  final int totalUsers;
  final int totalGrievance;

  StatsModel({
    required this.communityManager,
    required this.taskManagers,
    required this.totalUsers,
    required this.totalGrievance,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      communityManager: json['community_manager'],
      taskManagers: json['task_managers'],
      totalUsers: json['total_users'],
      totalGrievance: json['total_grievance'],
    );
  }
}
