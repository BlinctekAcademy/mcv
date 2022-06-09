import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../controller/user.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.aux,
        body: Consumer<UserController>(builder: (_, userController, x) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Spacing.x2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                      loading: userController.isLoading,
                      text: 'Buscar',
                      onPressed: () async {
                        if (!userController.isLoading) {
                          //userController.add();
                          /*final user = await userController.buscaUsuario(
                              uid: 'YmVdLj34LFwvxTFUdcqE');*/
                          await userController.listaUsuarios();
                        }
                      }),
                  Container(
                    padding: EdgeInsets.all(Spacing.x2),
                    child: Text(userController.count.toString()).title(),
                  ),
                  Container(
                    padding: EdgeInsets.all(Spacing.x2),
                    child: Text(userController.isLoading.toString()).title(),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
