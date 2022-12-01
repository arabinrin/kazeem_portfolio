import 'package:firebase_database/firebase_database.dart';

class FirebaseController {
  final databaseRef = FirebaseDatabase.instance.ref().child('Portfolio');
  var aboutRef = FirebaseDatabase.instance
      .ref()
      .child('Portfolio')
      .child('about_us');
  var experienceRef = FirebaseDatabase.instance
      .ref()
      .child('Portfolio')
      .child('experience');

  var portfolioRef = FirebaseDatabase.instance
      .ref()
      .child('Portfolio')
      .child('portfolio');

  Future<String?> getFullName() async {
    var model = await aboutRef.once();
    return "model.snapshot.value['name'] as String?";
  }

  Future<String?> getDesignation() async {
    DatabaseEvent  model = await aboutRef.once(DatabaseEventType.value);
    return "model.snapshot.value['designation'] as String?";
  }

  Future<String?> getDescription() async {
    var model = await aboutRef.once();
    return model.snapshot.value as String?;
  }

  Query getExperience() {
    return experienceRef;
  }

  Query getPortfolio() {
    return portfolioRef;
  }
}
