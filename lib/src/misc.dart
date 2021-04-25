// import 'package:lib1/lib1.dart';
// import 'package:lib2/lib2.dart' as lib2;


// class Musician extends Performer with Musical {
// }

class Person{
String? name;
}
class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

class Demented{
//  try uncommenting below to checkout compile time errors.
// class Demented extends Aggressive{
// class with constructor or extending other than Object are not
// allowed as mixin
  // Demented();
}

class Aggressive {
}

// special mixin class not a regular class
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}


// To restrict which class can mixin with MusicalPerformer use on
// Now only Musician type classes only mixin with MusicalPerformer

class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
