import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/data/repositories/DemoRepository.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_bloc.dart';
import 'package:flutter_bloc_pattern/features/demo/demo_screen.dart';
import 'package:flutter_bloc_pattern/generated/i18n.dart';
import 'package:flutter_bloc_pattern/injector.dart';
import 'package:flutter_bloc_pattern/providers/app/app_bloc.dart';
import 'package:flutter_bloc_pattern/providers/app/app_provider.dart';
import 'package:flutter_bloc_pattern/statics/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      Injector(
        demoRepository: DemoRepository(),
        child: AppProvider(
          appBloc: AppBloc(),
          child: MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routes: {
              Routes.initial: (context) => DemoScreen(
                    i18n: S.of(context),
                    appBloc: AppProvider.of(context),
                    demoBloc: DemoBloc(Injector.of(context).demoRepository),
                  ),
              Routes.next: (context) => DemoScreen(
                    i18n: S.of(context),
                    appBloc: AppProvider.of(context),
                    demoBloc: DemoBloc(Injector.of(context).demoRepository),
                  ),
            },
            initialRoute: Routes.initial,
          ),
        ),
      ),
    );
