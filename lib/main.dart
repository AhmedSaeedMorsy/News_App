// ignore_for_file: deprecated_member_use, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/newsLayOut.dart';
import 'package:news_app/shared/blocObserver.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark, {Key? key}) : super(key: key);

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeMoodApp(fromShared: isDark)..getBusiness(),
      child: BlocConsumer<AppCubit, AppStetes>(
          listener: (context, states) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              
              theme: ThemeData(
                primarySwatch: Colors.purple,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.purple,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.purple,
                
                scaffoldBackgroundColor: HexColor("333739"),
                appBarTheme: AppBarTheme(
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  backgroundColor: HexColor("333937"),
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor("333739"),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  backgroundColor: HexColor("333739"),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.grey,
                  
                ),
                
                textTheme: const TextTheme(

                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,
              home: const NewsLayOut(),
            );
          }),
    );
  }
}
