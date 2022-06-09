import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
                text: 'Próximo',
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.contactPage);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
