
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/consts.dart';
import 'custom_linebar_widget.dart';

class CustomCard extends StatelessWidget {
   const CustomCard({super.key, required this.title, required this.subTitle,
     required this.iconData,required this.percentage, required this.progressColor});

  final String title;
  final String subTitle;
  final IconData iconData;
  final double percentage;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(title,style: const TextStyle(fontSize: 26, fontWeight: FontWeight.normal))),
                  SizedBox(width: 12,),
                  Icon(iconData,color: CustomAppColors.iconGrey,size: AssetConst.iconSize,)
                ],
              ),
              Text(subTitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.grey)),
              const SizedBox(height: 8),
              LinearProgressBar(percentage: percentage,progressColor: progressColor,)
              // Text(subTitle, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              // const SizedBox(height: 8),

            ],
          ),
        ),
      ),
    );
  }
}
