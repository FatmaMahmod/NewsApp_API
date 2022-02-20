import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/counter/cubit/cubit.dart';
import 'package:untitled/counter/cubit/state.dart';

class counterScreen extends StatelessWidget {
 // int counter = 1;
  Widget build(BuildContext context) {
    // var s = BlocProvider.of(context);
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, Counterstates>(
        listener: (context, state) {
          if(state is CounterInitialState){print("counter intial state }");}
          if(state is CountermunsState){print("counter muns state ${state.counter}");}
          if(state is CounterplusState){print("counter plus state ${state.counter}");}

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Counter",
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                       CounterCubit.get(context).muns();
                      },
                      child: Text(
                        "MINUS",
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "${CounterCubit.get(context).counter}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Text(
                        "PLUS",
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/*class _counterScreenState extends State<counterScreen> {

@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Counter",
      ),

      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){

                  setState(() {
                    counter--;
                    print(counter);
                  });
                },
                child: Text(
                  "MINUS",
                )),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextButton(onPressed: (){},
                  child: Text(
                    "$counter",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color:Colors.black,
                    ),
                  )),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    counter++;
                    print(counter);
                  });
                },
                child: Text(
                  "PLUS",
                )),
          ],
        ),
      ),
    );
  }
}*/
