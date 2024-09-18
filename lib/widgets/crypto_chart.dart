import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/crypto_model.dart';
import '../provider/crypto_provider.dart';

class CryptoChart extends StatelessWidget {
  const CryptoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoProvider>(
      builder: (context, provider, child) {
        return SfCartesianChart(
            legend: const Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                zoomMode: ZoomMode.x,
                enablePanning: true,
                enableMouseWheelZooming: true // Untuk desktop atau web
                ),
            primaryXAxis: DateTimeAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              dateFormat: DateFormat.yMd().add_Hms(),
              intervalType: DateTimeIntervalType.auto,
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
              title: const AxisTitle(text: 'Price (USD)'),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            series: <LineSeries<CryptoData, DateTime>>[
              LineSeries<CryptoData, DateTime>(
                  dataSource: provider.data,
                  xValueMapper: (CryptoData data, _) => data.timestamp,
                  yValueMapper: (CryptoData data, _) => data.price,
                  name: 'Crypto Price',
                  dataLabelSettings: const DataLabelSettings(isVisible: false))
            ]);
      },
    );
  }
}
