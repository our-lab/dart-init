///Named parameter always require caller to define name.
/// Also either mark parameter as required OR give default value OR mark property of type nullable.
/// When to use: You enforce required/default parameter via Named parameter
class NamedWithRequiredOrNullable {
  int red;int? green;int blue;
  NamedWithRequiredOrNullable({required this.red, this.green, required this.blue});
}

/// When to use: You enforce required/default parameter via Named parameter
// class WrongNamedWithoutRequired {
//   int? red;int green;int blue;
//   WrongNamedWithoutRequired({ this.red, this.green, this.blue});
// }

class NamedWithDefaultValue {
  int red;int green;int blue;
  NamedWithDefaultValue({this.red = 0, this.green = 0, this.blue = 0});
}

/// When to Positional Constructor: when passed parameters can vary and you have default
/// values for un passed values.
///
class PositionalWithDefaultValue {
  int red;int green;int blue;
  PositionalWithDefaultValue(this.red, [this.green = 0, this.blue = 0]);
}
class PositionalWithNullable {
  int? red;int green;int? blue;
  PositionalWithNullable(this.red, [this.green = 0, this.blue]);
}
class PositionalWithoutRequired {
  int red;int green;int blue;
  PositionalWithoutRequired(this.red, [this.green = 0, this.blue = 0]);
}

class SimpleConstructor {
  int red;int green;int blue;
  SimpleConstructor(this.red, this.green, this.blue);
}


/// initializer list
///
///
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;
  FirstTwoLetters(String word) : assert(word.length >= 2), letterOne = word[0], letterTwo = word[1];
}
///
///
///


/// Named Constructor
class Point {
  double x, y;

  Point(this.x, this.y);

  Point.origin(): x = 0, y = 0;
}
///
///
///



///Factory Constructors
/// Note: Use factory when implementing a constructor that doesn’t always create a new instance.
///
///
class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    if(list.length==1) return IntegerSingle(list.first);
    if(list.length==2) return IntegerDouble(list.first, list.last);
    if(list.length==3) return IntegerTriple(list[0], list[1], list[2]);
    throw Error();
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}


class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {
    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    print('I don\'t recognize $typeName');
    throw Error();
  }
}
///
///
///


/// Redirecting Constructors
class Automobile {
  String make;
  String model;
  int mpg;

  // The main constructor for this class.
  Automobile(this.make, this.model, this.mpg);

  // Delegates to the main constructor.
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  // Delegates to a named constructor
  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}
///
///
///


/// Constant Constructor: I think its like enum
///
///

class ImmutablePoint {
  const ImmutablePoint(this.x, this.y);

  final int x;
  final int y;

  static const ImmutablePoint origin = ImmutablePoint(0, 0);
}








// PositionalColor([required this.red, required this.green, required this.blue]);

void main() {
  /// this constructor only enforce passing red and blue. Green is afforded to be null;
  NamedWithRequiredOrNullable(red: 1, blue: 3);

  /// this constructor helps assign default values when only providing partial named parameters.
  NamedWithDefaultValue(red: 10, blue: 30);

  /// This constructor helps passing partial values:
  /// red is required and its non-nullable, green has default value and blue is nullable
  PositionalWithDefaultValue(22, 33);
  PositionalWithNullable(null);

  PositionalWithoutRequired(1000);
  PositionalWithoutRequired(10);

  //Nulls not allowed
  // SimpleConstructor(1, null,2);
  //Only way to call constructor
  SimpleConstructor(1,2,3);


  final myPoint = Point.origin();

  IntegerHolder.fromList([1,2,3]);

  ImmutablePoint(10,20);
  ImmutablePoint.origin;
}


























//
