import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icons;
  

  PinterestButton({this.onPressed, this.icons});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items;

  final bool mostrar;

  final Color backGroundColor;
  final Color activeColor;
  final Color inactiveColor;

  PinterestMenu({
    Key key,
    this.items,
    this.mostrar,
    this.backGroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => new _MenuModel(),
        child: Builder(          
          builder: (context) {

            final prov = Provider.of<_MenuModel>(context);
            prov.backGroundColor = backGroundColor;
            prov.activeColor = activeColor;
            prov.inactiveColor = inactiveColor;
            return AnimatedOpacity(
                  opacity: mostrar? 1:0,
                  duration: Duration(milliseconds: 200),
                  child: _PinterestMenuBackground(
              child: _MenuItems(menuItems: items)),
            );
          }
        ));
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
   Color backGroundColor;
   Color activeColor;
   Color inactiveColor;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<_MenuModel>(context);
    return Container(
      child: this.child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: prov.backGroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({Key key, this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length,
          (i) => _PinterestMenuButton(index: i, item: menuItems[i])),
    ));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({Key key, this.index, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context)._itemSeleccionado;
    final prov = Provider.of<_MenuModel>(context);
    
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icons,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? prov.activeColor : prov.inactiveColor,
        ),
      ),
    );
  }
}
