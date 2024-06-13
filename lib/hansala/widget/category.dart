import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/category_model.dart';


class CategoryCard extends StatefulWidget {
  final Function(int,String) callback;
  const CategoryCard({super.key, required this.callback});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categoryDataList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
        child: InkWell(
          onTap: () {
            setState(() {
              selected = selected == index ? -1 : index;

              for (var element in categoryDataList) {
                element.active = false;
              }
              if (selected != -1) categoryDataList[index].active = true;
            });
            widget.callback(selected,"");
          },
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 180,
              width: 100,
              decoration: BoxDecoration(
                  color: categoryDataList[index].active
                      ? Colors.orange
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categoryDataList[index].imagePath,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    categoryDataList[index].categoryname,
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
