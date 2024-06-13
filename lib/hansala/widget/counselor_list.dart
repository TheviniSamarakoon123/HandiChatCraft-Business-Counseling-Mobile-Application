import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';
import 'package:handichatcraft_w1986581/hansala/widget/my_card.dart';


class CounselorList extends StatelessWidget {
  final List<CounselorModel> filteredList;
  const CounselorList({super.key, required this.filteredList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredList.length,
        itemBuilder: (context, index) => MyCard(
          counselorModel: filteredList[index],
        ),
      ),
    );
  }
}
