import 'package:coivd19/locator.dart';
import 'package:coivd19/models/contrieModel.dart';
import 'package:coivd19/services/api.dart';
import 'baseModel.dart';

class CountryController extends BaseModel {
  Country _country = Country();
  Api _api = locator<Api>();
  List<Country> _countriesList = [];

  get contrie => _country;
  get contriesList => _countriesList;

  Future getContries() async {
    _countriesList.clear();
    try {
      isLoading = ViewState.Busy;
      var result = await _api.getContriesStatics();
      if (result != null || result.length != 0) {
        for (var i in result) {
          _countriesList.add(Country.fromJson(i));
        }
      }
      isLoading = ViewState.Idle;
    } catch (e) {
      print(e);
    }
  }
}
