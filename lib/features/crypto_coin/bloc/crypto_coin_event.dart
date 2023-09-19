part of 'crypto_coin_bloc.dart';


abstract class CryptoCoinDetailEvent extends Equatable {}

class LoadCryptoCoinDetail extends CryptoCoinDetailEvent{

  final CryptoCoin coin;

  LoadCryptoCoinDetail({required this.coin});
  @override
  List<Object?> get props => [];
}