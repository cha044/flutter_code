class EmailModel {
  final dynamic id;
  final dynamic title;
  final dynamic description;
  final dynamic img_link;
  final dynamic email;

  EmailModel(
      {this.id, this.title, this.description, this.img_link, this.email});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        img_link: json["img_link"],
        email: json["email"]);
  }
}
