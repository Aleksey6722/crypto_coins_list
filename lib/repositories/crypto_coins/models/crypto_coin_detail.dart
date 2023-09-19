import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable{

  const CryptoCoinDetail ({
  required this.priceInUSD,
  required this.imageUrl,
  required this.toSymbol,
  required this.high24Hour,
  required this.low24Hour,
  });

  final String toSymbol;
  final String imageUrl;
  final double high24Hour;
  final double low24Hour;
  final double priceInUSD;



  @override
  List<Object?> get props => [
    toSymbol,
    imageUrl,
    high24Hour,
    low24Hour,
    priceInUSD,
  ];

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';
}