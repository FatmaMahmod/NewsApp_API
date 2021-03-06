import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/shared/componants/componants.dart';

class sports extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).sport;
    return BlocConsumer<NewsCubit , NewsStates>(

      listener: (context , state) {},
      builder: (context, state) => articleBuilder(list,context) ,

    );
  }
}