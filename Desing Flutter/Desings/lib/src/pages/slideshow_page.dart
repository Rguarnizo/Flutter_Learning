import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final themeData = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
                      child: Center(
        
        child: SlideShow(slides: [
            SvgPicture.asset('assets/svg/slide-1.svg'),
            SvgPicture.asset('assets/svg/slide-2.svg'),
            SvgPicture.asset('assets/svg/slide-3.svg'),
            SvgPicture.asset('assets/svg/slide-4.svg'),
            SvgPicture.asset('assets/svg/slide-5.svg'),
            
        ],
        colorPrimario:themeData.currentTheme.accentColor,
        
        bulletPrimario: 15,
        bulletSecundario: 12,),
     ),
          ),Expanded(
            child: Center(
          
          child: SlideShow(slides: [
            SvgPicture.asset('assets/svg/slide-1.svg'),
            SvgPicture.asset('assets/svg/slide-2.svg'),
            SvgPicture.asset('assets/svg/slide-3.svg'),
            SvgPicture.asset('assets/svg/slide-4.svg'),
            SvgPicture.asset('assets/svg/slide-5.svg'),
            
          ],
          colorPrimario: themeData.currentTheme.accentColor,
          colorSecundario: themeData.currentTheme.buttonColor,
          bulletPrimario: 15,
          bulletSecundario: 12,),
       ),
     ),
        ],
      )
   );
  }
}