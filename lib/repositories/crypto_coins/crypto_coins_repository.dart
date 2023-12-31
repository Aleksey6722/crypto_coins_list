import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_detail.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/models.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms='
          'BTC,ETH,BNB,AVAX&tsyms=USD'
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          return CryptoCoin(
            name: e.key,
            details: CryptoCoinDetail(
              priceInUSD: usdData['PRICE'],
              imageUrl: usdData['IMAGEURL'],
              toSymbol: usdData['TOSYMBOL'],
              high24Hour: usdData['HIGH24HOUR'],
              low24Hour: usdData['LOW24HOUR'],
            ),
          );
        })
        .toList();
    return cryptoCoinsList;
  }
}