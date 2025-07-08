import 'package:direct_drive/config/genearte_route.dart';
import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/config/theme_data.dart';
import 'package:direct_drive/firebase_options.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/cubit/user_cubit.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_cubit.dart';

import 'package:direct_drive/src/feature/auth/data/auth_repository.dart';
import 'package:direct_drive/src/feature/auth/data/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  final AuthRepository _repository = AuthRepository(AuthService());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(_repository), 
        ),

        BlocProvider<UserCubit>( create:(_) => UserCubit(_repository)..loadUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: MyThemeData.themeData,
        initialRoute: RouteName.animation,
   
      ),
    );
  }
}
