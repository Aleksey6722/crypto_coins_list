import 'package:crypto_coins_list/features/crypto_coin/view/view.dart';
import 'package:crypto_coins_list/features/crypto_list/view/view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        dividerColor: Colors.white24,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[900],
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white
        ),
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        )
        // useMaterial3: true,
      ),
      routes: {
        '/': (context) => CryptoListScreen(title: 'Crypto Currencies List'),
        '/coin': (context) => CryptoCoinScreen(),
      },
    );
  }
}

