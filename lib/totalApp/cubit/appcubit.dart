import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/totalApp/cubit/appstate.dart';

class Appcubit extends Cubit<Appstate>{
  Appcubit() : super(initialState());
  static Appcubit get(context)=>BlocProvider.of(context);
   bool isdark=false;
  void changmode(){
    isdark=true;
    emit(AppchangemodState(isdark));
  }



}