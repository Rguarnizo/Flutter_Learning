

import 'package:flutter/cupertino.dart';

class AudioPlayerModel with ChangeNotifier{

  bool _playing = false;
  AnimationController _controller;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _songCurrentDuration = new Duration(milliseconds: 0);

  double get porcentaje => (this._songCurrentDuration.inSeconds > 0)? this._songCurrentDuration.inSeconds /this._songDuration.inSeconds: 0;
  

  set controller(AnimationController controller){
    this._controller = controller;
  }

  AnimationController get controller => this._controller;

  get songDuration => this._songDuration;
  get songCurrentDuration => this._songCurrentDuration;

  set songDuration (Duration duration){
    this._songDuration;
    notifyListeners();
  }

  
  set songCurrentDuration (Duration duration){
    this._songCurrentDuration;
    notifyListeners();
  }

  bool get playing => this._playing;

  set playing(bool playing){
    this._playing = playing;
    notifyListeners();
  }

  String printDuration(Duration duration){

    String twoDigits(int n){
      if(n >=10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));


    return '$twoDigitMinutes:$twoDigitSeconds';
  }

}