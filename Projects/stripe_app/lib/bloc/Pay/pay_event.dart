part of 'pay_bloc.dart';

@immutable
abstract class PayEvent {}


class OnSelectCard extends PayEvent{

  final CreditsCard card;

  OnSelectCard(this.card);
}


class OnDeactiveCard extends PayEvent{


}