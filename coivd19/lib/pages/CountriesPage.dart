import 'package:coivd19/controllers/baseModel.dart';
import 'package:coivd19/controllers/countryController.dart';
import 'package:coivd19/pages/baseViewModel.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatelessWidget {
  Widget _buildOptions(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

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
            ? Container(
                child: ListView.separated(
                itemCount: model.contriesList.length,
                itemBuilder: (context, i) => ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model.contriesList[i].country}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOptions(
                              'Confirm: ${model.contriesList[i].totalConfirmed}',
                              Icons.new_releases),
                          _buildOptions(
                              'Recup: ${model.contriesList[i].totalRecovered}',
                              Icons.new_releases),
                          _buildOptions(
                              'Muertes: ${model.contriesList[i].totalDeaths}',
                              Icons.new_releases),
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, i) => Divider(),
              ))
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
