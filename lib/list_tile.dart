import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  late String title;
  late String description;

  MyListTile({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: ColorPalette.aux,
        child: Row(
          children: [
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white)),
            SizedBox(
              width: 16,
              height: 10,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(title)
                        .title(style: TextStyle(color: ColorPalette.secondary)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Spacing.x1),
                    child: Text(description).description(),
                  ),
                ])
          ],
        ));
  }
}
