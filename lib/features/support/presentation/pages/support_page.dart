import 'package:flutter/material.dart';
import 'package:marvel/localization.dart';
import 'package:marvel/core/route/bloc/router_bloc.dart';
import 'package:marvel/core/route/custom_router.dart';
import 'package:marvel/service_locator.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate('support'),
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
          child: Center(
        child: Text(AppLocalizations.of(context).translate('support')),
      )),
    );
  }
}
