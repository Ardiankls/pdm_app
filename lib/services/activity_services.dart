part of 'services.dart';

class ActivityServices {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
  String hasil = formatter.format(now);
  return hasil;
}