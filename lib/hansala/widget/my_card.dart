import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';
import 'package:handichatcraft_w1986581/hansala/pages/counselor_profiles.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.counselorModel});

  
  final CounselorModel counselorModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(counselorModel.name),
          subtitle: Text(counselorModel.specialize),
          trailing: const Icon(Icons.arrow_forward_ios),
          leading: CircleAvatar(
              radius: 60,
              child: Image.asset(counselorModel.isMale ? maleUser : femaleUser),
            ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounselorProfile(
                    counselor: counselorModel, counselorModel: counselorModel,
                  ),
                ));
          },
        ),
      ),
    );
  }
}
