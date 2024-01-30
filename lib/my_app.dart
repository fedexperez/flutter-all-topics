import 'package:flutter/material.dart';
import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';

import 'package:design_system/tokens/tokens.dart';
import 'package:flutter_all_topics/core/di/dependency_injector.dart';
import 'package:flutter_all_topics/core/env/env.dart';
import 'package:flutter_all_topics/core/router/app_routes.dart';
import 'package:flutter_all_topics/features/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppState extends StatelessWidget {
  final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternationalizationBloc>(
          create: (context) =>
              injectionContainerImpl.sl<InternationalizationBloc>()
                ..add(const InternationalizationCheckEvent()),
        ),
        BlocProvider<RestApiBloc>(
          create: (context) => injectionContainerImpl.sl<RestApiBloc>(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternationalizationBloc, InternationalizationState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: Locale(state.language?.languageCode ?? 'en'),
          localizationsDelegates: const [
            L10n.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routerConfig: router,
          supportedLocales: L10n.delegate.supportedLocales,
          theme: (AppEnvironment.shared.primaryColor == null)
              ? DesignSystemThemes.light
              : ThemeData(colorSchemeSeed: AppEnvironment.shared.primaryColor),
          title: 'Flutter All Topics',
        );
      },
    );
  }
}
