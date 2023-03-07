

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
}