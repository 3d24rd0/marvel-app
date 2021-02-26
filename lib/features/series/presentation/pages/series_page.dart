import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
