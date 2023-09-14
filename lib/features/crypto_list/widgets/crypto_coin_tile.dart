import 'package:crypto_coins_list/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';


class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        coin.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD}\$',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      leading: Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: (){
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin.name,
        );
      },
    );
  }
}