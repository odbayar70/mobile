import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotipyt/core/configs/theme/app_theme.dart';
import 'package:spotipyt/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotipyt/presentation/splash/pages/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const SplashPage()
        ),
      ),
    );
  }
  // State<MyApp> createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {

//   @override
//   void initState(){
//     super.initState();
//     redirect();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: AppTheme.lightTheme,
//       home: const SplashPage()
//     );
//   }

//   Future<void> redirect() async {
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => const GetStartedPage()
//         )
//     );
//   }
// }