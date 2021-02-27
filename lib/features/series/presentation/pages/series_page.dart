import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/localization.dart';
import 'package:marvel/core/route/bloc/router_bloc.dart';
import 'package:marvel/features/series/presentation/bloc/series_bloc.dart';
import 'package:marvel/features/series/presentation/widgets/ironman_animation.dart';
import 'package:marvel/features/series/presentation/widgets/list_series.dart';
import 'package:marvel/service_locator.dart';

class SeriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Marvel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset(
                  "assets/marvel.jpeg",
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings_sharp),
                title: Text(
                  AppLocalizations.of(context).translate('settings'),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                onTap: () {
                  getIt<RouterBloc>().add(SettingsEvent());
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text(
                  AppLocalizations.of(context).translate('support'),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                onTap: () {
                  getIt<RouterBloc>().add(SupportEvent());
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocProvider<SeriesBloc>(
            create: (_) => getIt<SeriesBloc>()..add(LoadEvent()),
            child: BlocBuilder<SeriesBloc, SeriesState>(
              buildWhen: (previous, current) =>
                  previous?.runtimeType != current?.runtimeType,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ListSeries(),
                    Visibility(
                      visible: state?.runtimeType != InitializedState,
                      child: Positioned.fill(
                        child: IronmanAnimation(),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
