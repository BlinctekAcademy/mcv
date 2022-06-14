import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:random/ui/controllers/random.dart';

class RandomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.aux,
        body: Consumer<RandomController>(builder: (_, randomController, x) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Spacing.x2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(Spacing.x2),
                    child: Text('Seu número é: ').description(),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: Spacing.x2, bottom: Spacing.x4),
                    child:
                        Text(randomController.number.toString()).superTitle(),
                  ),
                  PrimaryButton(
                      loading: randomController.isLoading,
                      text: 'Novo Número',
                      onPressed: () async {
                        if (!randomController.isLoading) {
                          randomController.randomInt();
                        }
                      }),
                ],
              ),
            ),
          );
        }));
  }
}
