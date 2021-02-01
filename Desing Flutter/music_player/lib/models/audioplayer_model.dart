

import 'package:flutter/cupertino.dart';

class AudioPlayerModel with ChangeNotifier{

  bool _playing = false;
  AnimationController _controller;

  set controller(AnimationController controller){
    this._controller = controller;
  }

  AnimationController get controller => this._controller;

}