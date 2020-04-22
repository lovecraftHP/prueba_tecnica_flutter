import 'package:animations/animations.dart';
import 'package:coivd19/controllers/baseModel.dart';
import 'package:coivd19/controllers/countryController.dart';
import 'package:coivd19/pages/baseViewModel.dart';
import 'package:coivd19/pages/detailsPage.dart';
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
                  itemBuilder: (context, i) => OpenContainer(
                      closedElevation: 3,
                      transitionDuration: Duration(milliseconds: 450),
                      closedBuilder: (context, action) => CardInfo(
                            name: model.contriesList[i].country,
                            totalConfirmed:
                                model.contriesList[i].totalConfirmed,
                            totalDeaths: model.contriesList[i].totalDeaths,
                            totalRecovered:
                                model.contriesList[i].totalRecovered,
                          ),
                      openBuilder: (context, action) => DetailsPage(
                            country: model.contriesList[i],
                          )),
                  separatorBuilder: (context, i) => Divider(),
                )),
                floatingActionButton: model.isAsc == true
                    ? FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: () {
                          model.sortAsc();
                        },
                        child: Icon(Icons.sort),
                      )
                    : FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () {
                          model.sortDesc();
                        },
                        child: Icon(Icons.sort),
                      ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
