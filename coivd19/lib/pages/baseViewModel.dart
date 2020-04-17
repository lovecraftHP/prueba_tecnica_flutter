import 'package:coivd19/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewModel<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onReadyModel;

  BaseViewModel({this.builder, this.onReadyModel});
  @override
  _BaseViewModelState<T> createState() => _BaseViewModelState<T>();
}

class _BaseViewModelState<T extends ChangeNotifier>
    extends State<BaseViewModel<T>> {
  T model = locator<T>();
  @override
  void initState() {
    super.initState();
    if (widget.onReadyModel != null) {
      widget.onReadyModel(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: locator<T>(), child: Consumer<T>(builder: widget.builder));
  }
}
