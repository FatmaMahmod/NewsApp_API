import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/shared/componants/componants.dart';

class Search_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var contro=TextEditingController();
    return  BlocConsumer<NewsCubit,NewsStates>(
         builder: (context,state){
          // var list = NewsCubit.get(context).
           return Scaffold(
             appBar: AppBar(),
             body:  Padding(
               padding: const EdgeInsets.all(0),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: TextFormField(
                       controller: contro,
                       keyboardType: TextInputType.text,
                       validator: (String value){
                         if(value.isEmpty){
                           return 'search must not be empty';
                         }
                         else
                           return null;
                       },
                       decoration:InputDecoration (
                         icon: Icon(
                           Icons.search,
                         ),
                         label:Text('search') ,
                       ),
                       onChanged: (value){
                         NewsCubit.get(context).getSearch(value);
   
                          },
                     ),
                   ),
                   Expanded(child: articleBuilder(NewsCubit.get(context).Search, context,issearch: true ))

                 ],
               ),
             ),

           );
         },
         listener: (context,state){}
        // ),
         );

  }
}
