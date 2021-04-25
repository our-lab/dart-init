

/// If you’re sure that an expression with a nullable type isn’t null,
/// you can use a null assertion operator (!) to make Dart treat it as
/// non-nullable. By adding ! just after the expression, you tell Dart that
/// the value won’t be null, and that it’s safe to assign it to a non-nullable
/// variable.
int? couldReturnNullButDoesnt() => -3;


///When you put late in front of a variable declaration, that tells Dart the following:
///
/// Don’t assign that variable a value yet.
/// You will assign it a value later.
/// You’ll make sure that the variable has a value before the variable is used.
class Team {
  late final Coach coach;
}

class Coach {
  late final Team team;
}





class CachedValueProvider {
  late final _cache = _computeValue();
  int get value => _cache;

  int _computeValue() {
    print('In _computeValue...');
    return 3;
  }
}

void main() {

  int? couldBeNullButIsnt = 1;
  List<int?> listThatCouldHoldNulls = [2, null, 4];

  int a = couldBeNullButIsnt;
  int b = listThatCouldHoldNulls.first!; // first item in the list
  int c = couldReturnNullButDoesnt()!.abs(); // absolute value

  print('a is $a.');
  print('b is $b.');
  print('c is $c.');


  ///-----

  final myTeam = Team();
  final myCoach = Coach();
  myTeam.coach = myCoach;
  myCoach.team = myTeam;

  print('All done!');


  ///-----

  print('Calling constructor...');
  var provider = CachedValueProvider();
  print('Getting value...');
  print('The value is ${provider.value}!');
}
