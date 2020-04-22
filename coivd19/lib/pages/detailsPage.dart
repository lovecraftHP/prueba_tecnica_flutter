import 'package:coivd19/models/contrieModel.dart';
import 'package:coivd19/pages/widgets/barCharts.dart';
import 'package:coivd19/pages/widgets/cardInfo.dart';
import 'package:coivd19/pages/widgets/pieChart.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Country country;
  DetailsPage({this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${country.country}'),
        centerTitle: true,
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                CardInfo(
                  name: country.country,
                  totalConfirmed: country.totalConfirmed,
                  totalDeaths: country.totalDeaths,
                  totalRecovered: country.totalRecovered,
                ),
                Card(
                  elevation: 0,
                  child: Container(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Nuevos casos confirmados',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: BarCharts(
                          title: 'nuevos casos de ${country.country}',
                          deaths: country.newDeaths,
                          news: country.newConfirmed,
                          recovers: country.newRecovered,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child:
                        Text('Casos totales', style: TextStyle(fontSize: 20)),
                  ),
                )
              ]),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: .7,
              children: [
                BarCharts(
                  title: 'Casos nuevos',
                  news: country.totalConfirmed,
                  deaths: country.totalDeaths,
                  recovers: country.totalRecovered,
                ),
                PieChart(
                  news: country.totalConfirmed,
                  deaths: country.totalDeaths,
                  recovers: country.totalRecovered,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
