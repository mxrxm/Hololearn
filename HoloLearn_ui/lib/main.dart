import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/providers/app_state_provider.dart';
import 'state/providers/lecture_state_provider.dart';
// import 'state/providers/theme_provider.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';
import 'screens/splash_screen.dart';
import 'screens/create_new_lecture_screen.dart';
// import 'themes/app_themes.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        ChangeNotifierProvider(create: (_) => LectureStateProvider()),
                // ChangeNotifierProvider(create: (_) => ThemeProvider()),

        // Add other providers here if needed
      ],
      // child: Consumer<ThemeProvider>(
      //   builder: (context, themeProvider, _) {
      child:  MaterialApp(
        title: 'HoloLearn',
        debugShowCheckedModeBanner: false,
        // theme:      AppThemes.darkTheme,        // ← light
        //     darkTheme:  AppThemes.darkTheme,         // ← dark
        //     themeMode:  themeProvider.themeMode,
        initialRoute: AppRoutes.splash, // start with splash screen route
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorObservers: [routeObserver],
        home: const SplashScreen(),

      ),
    );
  }
}
