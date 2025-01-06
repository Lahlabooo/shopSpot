import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shopspot/core/cubits/firebase_cubit/firebase_cubit.dart';
import 'package:shopspot/core/utilis/firebase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'custom_bloc_observer.dart';
import 'core/utilis/app_router.dart';
import 'core/utilis/constants.dart';
import 'core/utilis/hive_services.dart';
import 'core/utilis/setup_service_locator.dart';
import 'feature/home/domain/entities/product_entity.dart';
import 'firebase_options.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(HiveServices.kProducts);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit(FireBaseServices()),
      child: MaterialApp.router(
        routerConfig: AppRouter.routers,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
