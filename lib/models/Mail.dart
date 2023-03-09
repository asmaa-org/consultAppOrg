import 'package:pal_moh_app/screens/sender_screen.dart';

import '../screens/details_screen.dart';
import 'Attachment.dart';
import 'Status.dart';
import 'Sender.dart';
import 'Tag.dart';

class Mail{

  int? id;
  String? subject;
  String? description;
  int? senderId;
  String? archiveNumber;
  DateTime? archiveDate;
  String? decision;
  int? statusId;
  String? finalDecision;
  Sender? sender;
  Status? status;
  List<Tag?>? tags;
  List<Attachment?>? attachments;
  List<Activity?>? activities;
  DateTime? createdAt;
  DateTime? updatedAt;

  Mail({
    this.id,
    this.subject,
    this.description,
    this.senderId,
    this.archiveNumber,
    this.archiveDate,
    this.decision,
    this.statusId,
    this.finalDecision,
    this.sender,
    this.status,
    this.tags,
    this.attachments,
    this.activities,
    this.createdAt,
    this.updatedAt
});
  Mail.fromJson (Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    senderId = json['sender_id'];
    archiveNumber = json['archive_number'];
    archiveDate = DateTime.tryParse(json['archive_date']);
    decision = json['decision'];
    statusId = json['status_id'];
    finalDecision = json['final_decision'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']): null ;
    status = json['status'] != null ? Status.fromJson(json['status']): null ;
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['description'] = description;
    data['sender_id'] = senderId;
    data['archive_number'] = archiveNumber;
    data['archive_date'] = archiveDate;
    data['decision'] = decision;
    data['status_id'] = statusId;
    data['final_decision'] = finalDecision;
    data['tags'] = tags;
    data['attachments'] = attachments;
    data['activities'] = activities;
    if (sender != null) {
    data['sender'] = sender!.toJson();
    }
    if (status != null){
       data['status'] = status!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
    }

}