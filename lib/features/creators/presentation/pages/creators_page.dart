import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/core/route/bloc/router_bloc.dart';
import 'package:marvel/core/route/custom_router.dart';
import 'package:marvel/features/creators/presentation/bloc/creators_bloc.dart';
import 'package:marvel/features/creators/presentation/widgets/list_creators.dart';
import 'package:marvel/service_locator.dart';

class CreatorsPage extends StatelessWidget {
  final String serieId;

  const CreatorsPage({Key key, @required this.serieId}) : super(key: key);

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
            "Creators",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              getIt<RouterBloc>().add(GoBackOrNavigateEvent(CustomRouter.series));
            },
          ),
        ),
        body: SafeArea(
          child: BlocProvider<CreatorsBloc>(
            create: (_) => getIt<CreatorsBloc>()..add(LoadEvent(serieId)),
            child: BlocBuilder<CreatorsBloc, CreatorsState>(
              buildWhen: (previous, current) =>
                  previous?.runtimeType != current?.runtimeType,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ListCreators(),
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
