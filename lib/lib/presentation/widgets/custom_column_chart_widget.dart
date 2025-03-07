import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/model/chart_data.dart';

class CustomChart extends StatelessWidget {
   const CustomChart({super.key, required this.data});
 //  final TooltipBehavior tooltip;

   final List<ChartData> data;

  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0,maximum: 100,interval: 10,),
    //  tooltipBehavior: tooltip,
      series:   <CartesianSeries<ChartData, String>> [
        ColumnSeries<ChartData,String>(
          dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Gold',
            color: Color.fromRGBO(8, 142, 255, 1)
        )
      ],
    );
  }
}



