import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medi_app/features/ambience/data/datasources/ambient_localDataSources.dart';
import 'package:medi_app/features/ambience/data/repository/ambience_repository_impl.dart';
import 'package:medi_app/features/ambience/presentation/cubit/ambience_cubit.dart';
import 'package:medi_app/features/journal/data/datasources/journal_local_dataSources.dart';
import 'package:medi_app/features/journal/data/repository/journal_repository_impl.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_cubit.dart';
import 'package:medi_app/utils/navigation/app_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('journalBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AmbienceCubit(
            repository: AmbienceRepositoryImpl(
              localdatasources: AmbientLocaldatasources(),
            ),
          )..getData(),
        ),
        BlocProvider(
          create: (context) => JournalCubit(
            journalRepository: JournalRepositoryImpl(
              localDatasources: JournalLocalDatasources(),
            ),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppNavigator.goRouter,
        ),
      ),
    );
  }
}
