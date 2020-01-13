class Data {
  int success;
  String desc;
  String token;

  Data({this.success, this.desc, this.token});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        success: json['success'] as int,
        desc: json['desc'] as String,
        token: json['token'] as String);
  }
}
