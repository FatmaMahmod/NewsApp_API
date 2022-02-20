abstract class  Counterstates{

}
class CounterInitialState extends Counterstates{

}
class CounterplusState extends Counterstates{
  final int counter;
  CounterplusState(this.counter);
}
class CountermunsState extends Counterstates{
  final int counter;
  CountermunsState(this.counter);

}
class AppchangemodState extends Counterstates{
  final isdark;

  AppchangemodState(this.isdark);

}