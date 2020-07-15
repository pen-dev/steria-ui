import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steriaf/steria_provider.dart';
import 'package:steriaf/ui_components/components.dart' as ui;


class MainPage extends StatelessWidget {

  Widget _get_page_of_state(StatePage statePage){

    switch (statePage){
      case StatePage.loadingPage:
        return ui.LoadingCardWidget();
      case StatePage.errorPage:
        return ui.ErrorCardWidget();
      case StatePage.homePage:
        return ui.HouseCardInfoWidget();
      default:
        throw Exception('Error state unknown');
    }
  }


  @override
  Widget build(BuildContext context) {

    StatePage statePage = context.watch<HouseProvider>().currentState;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(children: <Widget>[
          SizedBox(height: 20.0),
          ui.SearchBlockWidget(),
          this._get_page_of_state(statePage),
          ui.VersionInfoWidget(),
        ])
      )
    );
  }
}


class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ui.SearchBlockWidget(),
                ui.VersionInfoWidget(),
              ],
            )
        )
    );
  }
}

