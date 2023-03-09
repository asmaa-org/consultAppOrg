

class Attachment{
  int? id;
  String? title;
  String? image;
  int? mailId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Attachment({
    this.id,
    this.title,
    this.image,
    this.mailId,
    this.createdAt,
    this.updatedAt,
});
  Attachment.fromJson (Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    mailId = json['mail_id'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['mail_id'] = mailId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}