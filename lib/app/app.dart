import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utils/routes_manager.dart';
import '../features/02_image_generation/presentation/cubit/image_generation_cubit.dart';
import '../features/03_text_completion/presentation/cubit/text_completion_cubit.dart';
import 'di.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ImageGenerationCubit>(
            create: (_) => instance<ImageGenerationCubit>(),
          ),
          BlocProvider<TextCompletionCubit>(
            create: (_) => instance<TextCompletionCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
        ));
  }
}
