import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/counter/cubit/state.dart';
import 'package:untitled/shared/network/local/cach_helper.dart';
class CounterCubit extends Cubit<Counterstates>{
  CounterCubit(): super(CounterInitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int counter=1;
  void plus(){
    counter++;
    emit(CounterplusState(counter));
  }
  void muns(){
    counter--;
    emit(CountermunsState(counter));

  }
  bool isdark=false;
  void changmode(

  {
  bool fromshared
}){
    if(fromshared!=null){
      isdark=fromshared;
    }
    else
    isdark=!isdark;
    cach_helper.putData(key: 'isdark', value: isdark).then((value) {
      emit(AppchangemodState(isdark));

    });
  }
}
