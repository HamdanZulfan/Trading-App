import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/crypto_model.dart';

class CryptoProvider with ChangeNotifier {
  final WebSocketChannel channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.eodhistoricaldata.com/ws/crypto?api_token=demo'));

  List<CryptoData> data = [];
  DateTime? lastUpdateTime;

  CryptoProvider() {
    channel.sink.add('{"action": "subscribe", "symbols": "ETH-USD,BTC-USD"}');
    channel.stream.listen((jsonData) {
      var response = jsonDecode(jsonData);
      var newPrice = double.parse(response['p'].toString());
      var timeStamp = DateTime.fromMillisecondsSinceEpoch(response['t']);

      // Filter untuk hanya menyimpan satu data per detik
      if (lastUpdateTime == null ||
          timeStamp.second != lastUpdateTime!.second) {
        lastUpdateTime = timeStamp;
        var newCrypto = CryptoData(
            symbol: response['s'],
            price: newPrice,
            dailyChange: double.parse(response['dc'].toString()),
            dailyDifference: double.parse(response['dd'].toString()),
            timestamp: timeStamp);
        data.add(newCrypto);
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
