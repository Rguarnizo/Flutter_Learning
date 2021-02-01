

import 'package:flutter/cupertino.dart';

class AudioPlayerModel with ChangeNotifier{

  bool _playing = false;
  AnimationController _controller;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _songCurrentDuration = new Duration(milliseconds: 0);
  

  set controller(AnimationController controller){
    this._controller = controller;
  }

  AnimationController get controller => this._controller;

  get songDuration => this._songDuration;
  get songCurrentDuration => this._songCurrentDuration;

  set songDuration (Duration duration){
    this._songDuration;
  }

  
  set songCurrentDuration (Duration duration){
    this._songCurrentDuration;
  }

}