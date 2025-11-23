
class Authmodel 
{
  final String message;
  final bool status;
  final int userId;

  Authmodel({required this.message, required this.status, required this.userId});
  factory Authmodel.fromJson(Map<String,dynamic> json)
  {
    return Authmodel(message: json["message"], status: json["status"], userId: json["userId"]);
  }
}