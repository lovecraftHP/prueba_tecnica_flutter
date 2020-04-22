import 'package:coivd19/controllers/baseModel.dart';
import 'package:coivd19/controllers/globalController.dart';
import 'package:coivd19/pages/baseViewModel.dart';
import 'package:coivd19/pages/widgets/barCharts.dart';
import 'package:coivd19/pages/widgets/pieChart.dart';
import 'package:flutter/material.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseViewModel<GlobalController>(
        onReadyModel: (model) {
          Future.delayed(Duration(milliseconds: 100), () async {
            await model.getGlobalStats();
          });
        },
        builder: (context, model, child) {
          return model.isLoading == ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 90, vertical: 30),
                          child: Text(
                            'Global Statistics',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 90, vertical: 8),
                          child: Text(
                            'Casos nuevos',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ]),
                    ),
                    SliverGrid.count(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      children: [
                        BarCharts(
                          title: 'Casos nuevos',
                          news: model.global.newConfirmed,
                          deaths: model.global.newDeaths,
                          recovers: model.global.newRecovered,
                        ),
                        PieChart(
                          news: model.global.newConfirmed,
                          deaths: model.global.newDeaths,
                          recovers: model.global.newRecovered,
                        ),
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 90, vertical: 8),
                          child: Text(
                            'Resultados totales',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        BarCharts(
                          title: 'Totales',
                          news: model.global.totalConfirmed,
                          deaths: model.global.totalDeaths,
                          recovers: model.global.totalRecovered,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    )
                  ],
                );
        },
      ),
    );
  }
}
