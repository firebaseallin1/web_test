import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/admin_dashboard_bloc/admin_dashboard_bloc.dart';
import '../bloc/admin_dashboard_bloc/admin_dashboard_event.dart';

class GlobalDropdownWidget extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String? selectedValue;

  const GlobalDropdownWidget({
    super.key,
    required this.items,
    this.hintText = "Select an option",
    required this.selectedValue
  });

  @override
  Widget build(BuildContext context) {
      return DropdownButton<String>(
        value: selectedValue,
        hint: Text(hintText),
        isExpanded: true,
        onChanged: (newValue) {
          if (newValue != null) {
              context.read<AdminDashboardBloc>().add(DropSelectValEvent(selectVal: newValue));
          }
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      );
  }
}
