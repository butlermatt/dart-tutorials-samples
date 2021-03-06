import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('tute-little-ben')
class TuteLittleBen extends PolymerElement with ObservableMixin {

  @observable String currentTime;
  
  void inserted() {
    super.inserted();
    new Timer.periodic(new Duration(seconds:1), _updateTime);
  }
  
  void _updateTime(Timer _) {
    DateTime today = new DateTime.now();
    currentTime = _formatTime(today.hour, today.minute, today.second);
  }
  
  String _formatTime(int h, int m, int s) {
    if (h > 12) { h = h - 12; }
    String minute = (m <= 9) ? '0$m' : '$m';
    String second = (s <= 9) ? '0$s' : '$s';
    return '$h:$minute:$second';
  }
}
