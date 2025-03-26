import 'package:dragon_ball/core/utils/%20service_locator.dart';
import 'package:dragon_ball/core/utils/app_router.dart';
import 'package:dragon_ball/features/home/data/repos/home_repo_implementation%20.dart';
import 'package:dragon_ball/features/home/presentation/manger/all_characters/all_characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCharactersCubit(getIt<HomeRepoImplementation>())..fetchAllCharacters(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.playfairDisplayTextTheme()
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}


