import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final themeData = Provider.of<ThemeChanger>(context);
    bool isLarge;
    if(MediaQuery.of(context).size.height>500){
      isLarge = true;
    }else{
      isLarge = false;
    }

    return Scaffold(
      body:(isLarge)? Column(
        children: [
          Expanded(
                      child: Center(
        
        child: MiSlideShow(themeData: themeData),
     ),
          ),Expanded(
            child: Center(
          
          child: MiSlideShow(themeData: themeData),
       ),
     ),
        ],
      ):Row(children: [
Expanded(
                      child: Center(
        
        child: MiSlideShow(themeData: themeData),
     ),
          ),Expanded(
            child: Center(
          
          child: MiSlideShow(themeData: themeData),
       ),
     ),
      ],)
   );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
    @required this.themeData,
  }) : super(key: key);

  final ThemeChanger themeData;

  @override
  Widget build(BuildContext context) {
    return SlideShow(slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
        
    ],
    colorPrimario:themeData.currentTheme.accentColor,
    
    bulletPrimario: 15,
    bulletSecundario: 12,);
  }
}