



void main(){
  /// Not working sample:
  Map<String, dynamic> json = fetchFromExternalSource();
  var names = json['names'] as List;
  /// convert type by using static type casting.
  var castFrom = List.castFrom<dynamic, String>(names);
  assumeStrings(names.cast<String>());
  //Convert type using map
  names.map((name) => name as String).toList();

  List<Animal> myCats = <Animal>[Animal(), Animal()];
  /// This assignment passes static analysis, but it creates an implicit cast. It is equivalent to:
  List<Cat> myCats2 = <Animal>[] as List<Cat>;

}

void assumeStrings(List<String> cast) {

}

Map<String, dynamic> fetchFromExternalSource() {
  return {"anshul": "mohil"};
}



class Animal {
  /// although you can use covariant in subclass to tighten type
  /// but flutter recommends to do on super class
  /// https://dart.dev/guides/language/sound-problems#the-covariant-keyword
  void chase(covariant Animal x) { }

}

class Mouse extends Animal {
  //expanding type while overriding is allowed.
  @override
  void chase(Object x) {

  }
}
/// The covariant keyword applies to a single parameter and is also supported on setters and fields.
/// https://dart.dev/guides/language/sound-problems#the-covariant-keyword
class Cat extends Animal {
  /// You are not allowed to tighten type while override
  /// but expanding is allowed
  @override
  void chase( Mouse x) {  }
}


/// Useful links while working with Type system:
/// Aftert null safty, automatic downcasting is removed, amd type-infrence doc is not updated
/// with latest version update. So downcasting related code snippet won't work.
/// https://dart.dev/guides/language/type-system#type-inference
/// https://dart.dev/guides/language/sound-problems#the-covariant-keyword
///https://dart.dev/guides/language/language-tour


// Use of Generics

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}



