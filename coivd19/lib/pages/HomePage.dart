import 'package:coivd19/controllers/countryController.dart';
import 'package:coivd19/pages/CountriesPage.dart';
import 'package:coivd19/pages/GloabalPage.dart';
import 'package:coivd19/pages/baseViewModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            child: Text('Paises'),
          ),
          Tab(
            child: Text('Global'),
          )
        ]),
      ),
      body: Container(child: BaseViewModel<CountryController>(
        builder: (context, model, child) {
          return TabBarView(
            controller: _tabController,
            children: [CountriesPage(), GlobalPage()],
          );
        },
      )),
    );
  }
}
