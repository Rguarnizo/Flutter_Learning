part of 'helpers.dart';




showModal(BuildContext context,Widget widget){
  showModalBottomSheet(context: context, builder: (context) => widget);
}