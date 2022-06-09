import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorPalette.aux,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(Spacing.x2),
              child: PrimaryButton(
                text: 'Voltar',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Spacing.x2),
              child: PrimaryButton(
                text: 'Voltar tudo',
                onPressed: () {
                  Navigator.of(context)
                      .popUntil((ModalRoute.withName(Routes.welcomePage)));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
