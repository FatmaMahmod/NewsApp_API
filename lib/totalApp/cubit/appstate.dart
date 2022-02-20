abstract class Appstate{}

class initialState extends Appstate{}
class AppchangemodState extends Appstate{
  final isdark;

  AppchangemodState(this.isdark);

}


