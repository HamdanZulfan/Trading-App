import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/crypto_provider.dart';

class CryptoWatchlist extends StatelessWidget {
  const CryptoWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoProvider>(builder: (context, provider, child) {
      return ListView.builder(
          itemCount: provider.data.length,
          itemBuilder: (context, index) {
            var item = provider.data[index];
            return ListTile(
              title: Text(item.symbol),
              subtitle: Text(
                'Last: ${item.price}, Chg: ${item.dailyDifference}, Chg%: ${item.dailyChange}%',
              ),
            );
          });
    });
  }
}
