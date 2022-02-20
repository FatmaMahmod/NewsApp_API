import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/counter/cubit/cubit.dart';
import 'package:untitled/counter/cubit/state.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/shared/network/local/cach_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import 'totalApp/cubit/appcubit.dart';
import 'totalApp/cubit/appstate.dart';
import 'counter/counter_screen.dart';
import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cach_helper.init();
  bool isdark = cach_helper.getData(key: 'isdark');
  runApp(myapp(isdark));
}

class myapp extends StatelessWidget {
  final isdark;

  myapp(this.isdark);

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
            create: (BuildContext context) => NewsCubit()..getBussiness()),
        BlocProvider<CounterCubit>(
          create: (BuildContext context) =>
              CounterCubit()..changmode(fromshared: isdark),
        ),
      ],
      child: BlocConsumer<CounterCubit, Counterstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.green,
                  backgroundColor: Colors.white,
                  elevation: 40,
                  unselectedItemColor: Colors.grey,
                ),
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.green,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.green,
                  scaffoldBackgroundColor: HexColor('333739'),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.green,
                    backgroundColor: HexColor('333739'),
                    elevation: 40,
                    unselectedItemColor: Colors.grey,
                  ),
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                    ),
                    backwardsCompatibility: false,
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.green,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ))),
              themeMode: CounterCubit.get(context).isdark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: NewsLayout());
        },
      ),
    );
    //  );
  }
}
