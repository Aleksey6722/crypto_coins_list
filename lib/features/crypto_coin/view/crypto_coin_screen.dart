import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_coins_list/features/crypto_coin/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _cryptoCoinDetailBloc = CryptoCoinDetailBloc();

  // @override
  // void initState() {
  //   final coin = ModalRoute.of(context)?.settings.arguments;
  //   assert(coin != null && coin is CryptoCoin, 'You must provide a CryptoCoin object');
  //   _cryptoCoinDetailBloc.add(LoadCryptoCoinDetail(coin: coin as CryptoCoin));
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final coin = ModalRoute.of(context)?.settings.arguments;
    assert(coin != null && coin is CryptoCoin, 'You must provide a CryptoCoin object');
    _cryptoCoinDetailBloc.add(LoadCryptoCoinDetail(coin: coin as CryptoCoin));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailBloc, CryptoCoinDetailState>(
        bloc: _cryptoCoinDetailBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailLoaded) {
            final coinDetails = state.coin.details;
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.coin.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    coinDetails.priceInUSD.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(child: Column(
                    children: [
                      _DataRow(
                          title: 'High 24 Hour',
                          value: '${coinDetails.high24Hour}\$'),
                      const SizedBox(height: 6),
                      _DataRow(
                          title: 'Low 24 Hour',
                          value: '${coinDetails.low24Hour}\$'),
                    ],
                  ),)
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
