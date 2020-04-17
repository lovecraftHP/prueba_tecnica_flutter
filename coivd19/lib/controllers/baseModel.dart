import 'package:flutter/widgets.dart';

enum ViewState { Busy, Idle }

class BaseModel extends ChangeNotifier {
  ViewState _isLoading = ViewState.Idle;

  get isLoading => _isLoading;
  set isLoading(ViewState newValue) {
    _isLoading = newValue;
    notifyListeners();
  }
}
