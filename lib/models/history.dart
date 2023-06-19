class History {
  String? attendanceTime;
  bool? enter;

  History({this.attendanceTime, this.enter});

  History.fromJson(Map<String, dynamic> json) {
    attendanceTime = json['the_attendance_time'];
    enter = json['enter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['the_attendance_time'] =  attendanceTime;
    data['enter'] = enter;
    return data;
  }
}