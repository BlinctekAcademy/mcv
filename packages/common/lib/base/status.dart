import 'package:common/enum/status.dart';
import 'package:flutter/material.dart';

abstract class BaseStatus with ChangeNotifier {
  Status _status = Status.pristine;

  void setStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  bool get isPristine => _status == Status.pristine;
  bool get isLoading => _status == Status.loading;
  bool get hasError => _status == Status.error;
  bool get hasSuccess => _status == Status.success;
}
