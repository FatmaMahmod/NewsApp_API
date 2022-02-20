import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/totalApp/cubit/appcubit.dart';
import 'package:untitled/counter/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/modules/search/search_screen.dart';
import 'package:untitled/shared/componants/componants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

     return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context ,state){},
       builder: (context ,state){
         var cubit = NewsCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             title: Text(
               'News app',
             ),
             actions: [
               IconButton(
                 onPressed: (){
                   navigatTo(context,Search_Screen());
                 }, icon: Icon(
                 Icons.search,
               ),),
               IconButton(
                   onPressed: (){
                     CounterCubit.get(context).changmode();
                   },
                   icon: Icon(
                    Icons.brightness_4_outlined,
                   ),
               ),
             ],
           ),
           floatingActionButton: FloatingActionButton(
             onPressed: (){

             },
           child: Icon(
             Icons.add,
           ),

           ),
           bottomNavigationBar:BottomNavigationBar(
             currentIndex: cubit.currentIndex,
             onTap: (index){
               cubit.change(index);
             },
             items:cubit.bottomItems,
             ),
           body: cubit.screen[cubit.currentIndex],
         );
       },

    // ),
    );
  }
}

