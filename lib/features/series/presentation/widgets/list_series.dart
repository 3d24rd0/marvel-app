import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/features/series/presentation/bloc/series_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'circular_indicator.dart';

class ListSeries extends StatefulWidget {
  final refreshController = RefreshController(initialRefresh: false);

  @override
  _ListSeriesState createState() => _ListSeriesState();
}

class _ListSeriesState extends State<ListSeries> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      // buildWhen: (previous, current) =>
      //     (current?.series?.isNotEmpty ?? false) &&
      //     previous.series != current.series,
      builder: (context, state) {
        if (state?.series == null || (state?.series?.isEmpty ?? false)) {
          return Center(child: CircularIndicator());
        }
        return Scrollbar(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: widget.refreshController,
            onRefresh: () => BlocProvider.of<SeriesBloc>(context)
                .add(RefreshSeriesEvent(widget.refreshController)),
            onLoading: () => BlocProvider.of<SeriesBloc>(context)
                .add(LoadSeriesEvent(widget.refreshController)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                itemCount: state.series.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          BlocProvider.of<SeriesBloc>(context).add(
                            GoToCreators(state.series[index].id.toString()),
                          );
                        },
                        child: Card(
                          elevation: 18.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            color: Colors.black87,
                            child: Image.network(
                              state.series[index].thumbnail.getUri(),
                              fit: BoxFit.scaleDown,
                              height: 170.0,
                              width: 130.0,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.all(8.0),
                        ),
                      ),
                      Text(
                        state.series[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      )
                    ],
                  );
                }),
          ),
        );
      },
    );
  }
}
