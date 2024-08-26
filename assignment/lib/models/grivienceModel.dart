class GrivienceModel {
  String? id;
  String? title;
  String? description;
  String? assignedto;
  String? initiatedOn;
  bool? resolved;
  String? category;

  GrivienceModel(
      {this.id,
      this.title,
      this.description,
      this.assignedto,
      this.initiatedOn,
      this.category,
      this.resolved});

  GrivienceModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    description = json['description'];
    assignedto = json['Assignedto'];
    initiatedOn = json['InitiatedOn'];
    resolved = json['Resolved'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['Assignedto'] = this.assignedto;
    data['InitiatedOn'] = this.initiatedOn;
    data['Resolved'] = this.resolved;
    data['category'] = this.category;
    return data;
  }
}
