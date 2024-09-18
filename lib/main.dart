import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_app/provider/crypto_provider.dart';
import 'widgets/crypto_chart.dart';
import 'widgets/crypto_watch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Crypto Market Info")),
          body: const Column(
            children: [
              Expanded(flex: 2, child: CryptoChart()),
              Expanded(flex: 1, child: CryptoWatchlist()),
            ],
          ),
        ),
      ),
    );
  }
}
