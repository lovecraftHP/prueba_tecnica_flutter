import 'package:coivd19/locator.dart';
import 'package:coivd19/models/contrieModel.dart';
import 'package:coivd19/services/api.dart';
import 'baseModel.dart';

class CountryController extends BaseModel {
  Country _country = Country();
  Api _api = locator<Api>();
  bool _isAsc = true;
  List<Country> _countriesList = [];

  get contrie => _country;
  get isAsc => _isAsc;
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

  Future sortAsc() async {
    try {
      isLoading = ViewState.Busy;
      _countriesList
          .sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
      _isAsc = !_isAsc;
      isLoading = ViewState.Idle;
    } catch (e) {
      print(e);
    }
  }

  // Future sortAlpha() async {
  //   try {
  //     isLoading = ViewState.Busy;
  //     _countriesList.sort();
  //     isLoading = ViewState.Idle;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future sortDesc() async {
    try {
      isLoading = ViewState.Busy;
      _countriesList
          .sort((a, b) => b.totalConfirmed.compareTo(a.totalConfirmed));
      _isAsc = !_isAsc;
      isLoading = ViewState.Idle;
    } catch (e) {
      print(e);
    }
  }
}
