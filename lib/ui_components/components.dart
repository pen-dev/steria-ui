import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steriaf/house.dart';
import 'package:steriaf/steria_provider.dart';

class SearchFieldWidget extends StatelessWidget {
  final ValueChanged<BuildContext> searchBehavior;

  SearchFieldWidget(this.searchBehavior);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        context.watch<HouseProvider>().searchController;

    return Container(
      height: 60,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (String text) {
                    searchBehavior(context);
                  },
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    hintText: "Название улицы и номер дома",
                    focusColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final ValueChanged<BuildContext> searchBehavior;

  const ButtonWidget(this.searchBehavior);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Material(
          elevation: 1.00,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(149, 16, 172, 100),
          child: InkWell(
              onTap: () => {searchBehavior(context)},
              splashColor: Color.fromRGBO(160, 16, 172, 100),
              child: Ink(
                  height: 50.0,
                  width: 150.0,
                  child: Center(
                      child: Text(
                        'Найти',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0),
                      )
                  )
              )
          )
      ),
    );
  }
}

class SearchBlockWidget extends StatelessWidget {
  void _searchBehavior(BuildContext context) {
    context.read<HouseProvider>().loadData();
    var currentRoute = ModalRoute.of(context).settings.name;

    if (currentRoute == null || currentRoute != '/houseInfo') {
      Navigator.pushNamed(context, '/houseInfo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: SearchFieldWidget(_searchBehavior),
      ),
      Padding(
        padding:
            EdgeInsets.only(top: 5.0, bottom: 30.0, left: 10.0, right: 10.0),
        child: ButtonWidget(_searchBehavior),
      ),
    ]));
  }
}

class CardWidget extends StatelessWidget {
  final Widget child;

  CardWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        child: Center(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            child: this.child,
          ),
        )
    );
  }
}

class HouseCardInfoWidget extends StatelessWidget {
  Widget _wrapTextRow(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 14.0),
    );
  }

  Widget _wrapRow(String leftText, String rightText) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 100, child: this._wrapTextRow(leftText)),
            SizedBox(
              width: 30,
            ),
            SizedBox(width: 100, child: this._wrapTextRow(rightText)),
          ],
        )
    );

  }

  @override
  Widget build(BuildContext context) {

    HouseData _data = context.watch<HouseProvider>().selectHouse;

    return CardWidget(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 8),
                Column(children: <Widget>[
                  SizedBox(height: 8.0),
                  Text(
                    '${_data.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  )
                ]),
                SizedBox(height: 10.00),
                this._wrapRow('Архитекторы:', '${_data.architect}'),
                SizedBox(height: 4.00),
                this._wrapRow('Год постройки:', '${_data.year}'),
                SizedBox(height: 4.00),
                this._wrapRow('Стиль:', '${_data.style}'),
              ]
          ),
        ),
      ),
    );
  }
}

class ErrorCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error, color: Colors.red),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Упс. Попробуйте другой адрес.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class LoadingCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Поиск...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

class VersionInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                InkWell(
                  child: Text(
                    'v0.2.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                  ),
                ),
              ],
            )
        )
    );
  }
}




class MiniHouseCard extends StatelessWidget {

  MiniHouseCard(this.houseData);

  HouseData houseData;

  static const height = 100.0;

  final ShapeBorder shape = Border();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: height,
          child: Card(
            // This ensures that the Card's children (including the ink splash) are clipped correctly.
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
//                shape: shape,
            child: InkWell(
              onTap: () {
                print('Card was tapped');
                context.read<HouseProvider>().setActiveHouse(this.houseData);
                context.read<HouseProvider>().setState(StatePage.homePage);
              },
              // Generally, material cards use onSurface with 12% opacity for the pressed state.
              splashColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              // Generally, material cards do not have a highlight overlay.
              highlightColor: Colors.transparent,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // This array contains the three line description on each card
                        // demo.
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            this.houseData.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0),
                          ),
                        ),
                        Text(this.houseData.fullAddress),
                      ],
                    ),
                  ),
                ),
              ),
              ),
            ),
          ),
      ),
    );
  }
}

class CardHouseMiniInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var searchResults = context.watch<HouseProvider>().searchResults;

    return CardWidget(
      child: ListView(
        children: <Widget>[
          for (final houseData in searchResults)
          MiniHouseCard(houseData),
        ]
      )
    );
  }
}




