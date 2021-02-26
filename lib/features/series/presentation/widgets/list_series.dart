import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/core/tools/debouncer.dart';
import 'package:marvel/features/series/presentation/bloc/series_bloc.dart';
import 'circular_indicator.dart';

class ListSeries extends StatefulWidget {
  final Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  createState() => _ListSeriesState();
}

class _ListSeriesState extends State<ListSeries> {
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      buildWhen: (previous, current) =>
          (current?.series?.isNotEmpty ?? false) &&
          previous.series != current.series,
      builder: (context, state) {
        if (state?.series == null || (state?.series?.isEmpty ?? false)) {
          return Center(child: CircularIndicator());
        }
        return Scrollbar(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7),
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
                            height: 200.0,
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
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      // widget.debouncer.run(
      //     () => BlocProvider.of<SeriesBloc>(context).add(Fetch()));
    }
  }
}
