import 'package:coivd19/locator.dart';
import 'package:coivd19/models/globalModel.dart';
import 'package:coivd19/services/api.dart';

import 'baseModel.dart';

class GlobalController extends BaseModel {
  GlobalStats _global = GlobalStats();
  Api _api = locator<Api>();

  get global => _global;

  Future getGlobalStats() async {
    isLoading = ViewState.Busy;
    try {
      var data = await _api.getGlobalStatics();
      if (data != null || data.length != 0) {
        _global = GlobalStats.fromJson(data);
        isLoading = ViewState.Idle;
        return _global;
      }
    } catch (e) {
      print(e);
    }
  }
}
