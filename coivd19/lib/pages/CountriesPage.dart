import 'package:coivd19/controllers/baseModel.dart';
import 'package:coivd19/controllers/countryController.dart';
import 'package:coivd19/pages/baseViewModel.dart';
import 'package:coivd19/pages/widgets/cardInfo.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseViewModel<CountryController>(
      onReadyModel: (model) {
        Future.delayed(Duration(milliseconds: 100), () async {
          await model.getContries();
        });
      },
      builder: (context, CountryController model, child) {
        return model.isLoading == ViewState.Idle
            ? Scaffold(
                body: Container(
                    child: ListView.separated(
                  itemCount: model.contriesList.length,
                  itemBuilder: (context, i) => CardInfo(
                    name: model.contriesList[i].country,
                    totalConfirmed: model.contriesList[i].totalConfirmed,
                    totalDeaths: model.contriesList[i].totalDeaths,
                    totalRecovered: model.contriesList[i].totalRecovered,
                  ),
                  separatorBuilder: (context, i) => Divider(),
                )),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.list),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
