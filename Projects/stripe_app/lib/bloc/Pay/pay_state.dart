part of 'pay_bloc.dart';

@immutable
class PayState {
  final double payAmount;
  final String money;
  final bool activeCard;
  final CreditsCard card;

  PayState(
      {
      this.payAmount = 375.55,
      this.money = 'USD',
      this.activeCard = false,
      this.card      
      });

  PayState copyWith(
    {
    double payAmount,
    String money,
    bool activeCard,
    CreditsCard card,
    }
  ) => PayState(
    payAmount: payAmount?? this.payAmount,
    activeCard: activeCard?? this.activeCard,
    card: card?? this.card,
    money: money?? this.money,
    );
}
