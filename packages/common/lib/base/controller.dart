import 'package:common/base/status.dart';
import 'dart:async';

abstract class BaseController extends BaseStatus {
  final StreamController<dynamic> _eventSubscription =
      StreamController<dynamic>.broadcast();
  Stream<dynamic> get onErrorOccured => _eventSubscription.stream;
  final StreamController<dynamic> _eventMessageSubscription =
      StreamController<dynamic>.broadcast();
  Stream<dynamic> get onMessageOccured => _eventMessageSubscription.stream;

  void notifyError(dynamic event) {
    _eventSubscription.sink.add(event);
  }

  void notifyMessage(dynamic event) {
    _eventMessageSubscription.sink.add(event);
  }

  @override
  void dispose() {
    _eventMessageSubscription.close();
    _eventSubscription.close();
    super.dispose();
  }
}
