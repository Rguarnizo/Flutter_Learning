part of 'pay_bloc.dart';

@immutable
class PayState {
  final double payAmount;
  final String currency;
  final bool activeCard;
  final CreditsCard card;

  String get payAmountStr => '${(this.payAmount*100).floor()}';

  PayState(
      {
      this.payAmount = 375.55,
      this.currency = 'USD',
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
    currency: money?? this.currency,
    );
}
