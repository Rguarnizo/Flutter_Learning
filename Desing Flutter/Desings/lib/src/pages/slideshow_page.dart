import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
        colorPrimario: Colors.purple,
        colorSecundario: Colors.blue,
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
          colorPrimario: Colors.purple,
          colorSecundario: Colors.blue,
          bulletPrimario: 15,
          bulletSecundario: 12,),
       ),
     ),
        ],
      )
   );
  }
}