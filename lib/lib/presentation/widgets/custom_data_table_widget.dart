

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../core/const/consts.dart';
import '../../data/model/row_data_model.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      // minWidth: MediaQuery.of(context).size.width,
      headingRowColor:  WidgetStateColor.resolveWith((states) => Colors.white24),
      columns:  StringValues.dataTableColumnValues,
      rows: [
        TableRowData(sNo: 1, orderId: '100001', cusName: 'Ram ', count: '25', amount: 2500.00),
        TableRowData(sNo: 2, orderId: '100002', cusName: 'Jagan ', count: '10', amount: 27423.00),
        TableRowData(sNo: 3, orderId: '100003', cusName: 'Govindhan ', count: '12', amount: 15632.00),
        TableRowData(sNo: 4, orderId: '100004', cusName: 'Kumar ', count: '44', amount: 45250.00),
        TableRowData(sNo: 5, orderId: '100005', cusName: 'Jack ', count: '63', amount: 75000.00),
      ].map((row) {
        return DataRow(cells: StringValues.dataTableDataRows);
      }).toList(),
    );
  }
}
