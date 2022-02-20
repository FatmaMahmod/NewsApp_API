import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/sports/sports_screen.dart';
import 'package:untitled/modules/bussins/bussins_screen.dart';
import 'package:untitled/modules/science/science_screen.dart';
import 'package:untitled/modules/setting/setting_screen.dart';

import 'package:untitled/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get (context)=>BlocProvider.of(context);

  int currentIndex=0;
 // int index=1;
  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science,
    ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports,
      ),
      label: 'sports',
    ),

  ];
  List<Widget>screen=[
 bussnis(),
  science(),
    sports(),

  ];
  void change(int index){
    currentIndex=index;
    if(index==2){
      getsports();
    }
    if(index==1){
      getscience();
    }
    emit(NewsBottomNave());
  }
  List<dynamic>sport=[];

  void getsports(){
    emit(NewsGetSportsLoddingNavState());
    if(sport.length==0){
    DioHelper.getData(
      url: 'v2/top-headlines',
      qury:{
        'country':'eg',
        'category':'sports',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
    ).then((value){
      // print(value.data)

      sport=value.data['articles'];
      print(sport[0]['title']);
      emit(NewsGetSportsSuccessState());
    } ).catchError((onError){
      print(onError.toString());
      emit(NewsGetSportsErrorState(onError.toString()));

    });}
    else{
      emit(NewsGetSportsSuccessState());

    }
  }
  List<dynamic>scence=[];
  void getscience(){
    emit(NewsGetScienceLoddingNavState());
    if(scence.length==0){
    DioHelper.getData(
      url: 'v2/top-headlines',
      qury:{
        'country':'eg',
        'category':'science',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
    ).then((value){
      // print(value.data)

      scence=value.data['articles'];
      print(scence[0]['title']);
      emit(NewsGetScienceSuccessState());
    } ).catchError((onError){
      print(onError.toString());
      emit(NewsGetScienceErrorState(onError.toString()));

    });}
    else{
      emit(NewsGetScienceSuccessState());

    }
  }
  List<dynamic>business=[];

  void getBussiness(){
    emit(NewsGetBusinessLoddingNavState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      qury:{
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
    ).then((value){
     // print(value.data)

      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    } ).catchError((onError){
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));

    });
  }


  List<dynamic>Search=[];

  void getSearch(String value){
    emit(NewsGetSearchLoddingNavState());
    Search=[];




    DioHelper.getData(
      url: 'v2/everything',
      qury:{
        'q' : '$value',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },

      //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
    ).then((value){
      // print(value.data)

      Search=value.data['articles'];
      print(Search[0]['title']);
      emit(NewsGetSearchSuccessState());
    } ).catchError((onError){
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError.toString()));

    });
  }

}