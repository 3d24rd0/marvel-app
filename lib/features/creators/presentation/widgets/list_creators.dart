import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/features/creators/presentation/bloc/creators_bloc.dart';
import 'package:marvel/features/series/presentation/widgets/circular_indicator.dart';

class ListCreators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorsBloc, CreatorsState>(
      buildWhen: (previous, current) => previous.creators != current.creators,
      builder: (context, state) {
        if (state?.creators == null || (state?.creators?.isEmpty ?? false)) {
          return Center(child: CircularIndicator());
        }
        return Scrollbar(
          child: ListView.builder(
              itemCount: state.creators.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      state.creators[index].thumbnail.getUri(),
                      fit: BoxFit.scaleDown,
                      height: 200.0,
                      width: 130.0,
                    ),
                    title: Text(
                      state.creators[index].fullName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
