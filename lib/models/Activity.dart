

class Activity{
  int? id;
  String? body;
  int? userId;
  int? mailId;
  String? sendNumber;
  String? sendDestination;
  DateTime? sendDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Activity({
   this.id,
   this.body,
   this.mailId,
   this.userId,
   this.sendNumber,
   this.sendDate,
   this.sendDestination,
   this.createdAt,
   this.updatedAt,
});
  Activity.fromJson (Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    mailId = json['mail_id'];
    userId = json['user_id'];
    sendNumber = json['send_number'];
    sendDate = json['send_date'];
    sendDestination = json['send_destination'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['mail_id'] = mailId;
    data['user_id'] = userId;
    data['send_number'] = sendNumber;
    data['send_date'] = sendDate;
    data['send_destination'] = sendDestination;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}