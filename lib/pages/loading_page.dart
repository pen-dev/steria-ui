import 'package:flutter/material.dart';
import 'package:steriaf/ui_components/components.dart' as ui;



class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(children: <Widget>[
              SizedBox(height: 20.0),
              ui.SearchBlockWidget(),
              ui.LoadingCardWidget(),
              ui.VersionInfoWidget(),
            ])
        )
    );
  }
}
