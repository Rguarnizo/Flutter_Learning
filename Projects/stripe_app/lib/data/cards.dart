import 'package:stripe_app/models/credits_card.dart';



final List<CreditsCard> tarjetas = <CreditsCard>[
  CreditsCard(
    cardNumberHidden: '4242',
    cardNumber: '4242424242424242',
    brand: 'visa',
    cvv: '213',
    expiracyDate: '01/25',
    cardHolderName: 'Fernando Herrera'
  ),
  CreditsCard(
    cardNumberHidden: '5555',
    cardNumber: '5555555555554444',
    brand: 'mastercard',
    cvv: '213',
    expiracyDate: '01/25',
    cardHolderName: 'Melissa Flores'
  ),
  CreditsCard(
    cardNumberHidden: '3782',
    cardNumber: '378282246310005',
    brand: 'american express',
    cvv: '2134',
    expiracyDate: '01/25',
    cardHolderName: 'Eduardo Rios'
  ),
  
];