import 'package:firebase_database/firebase_database.dart';

void main() {
  var databaseReference = FirebaseDatabase.instance.reference();
  void readData() {
    databaseReference.once().then(
      (DataSnapshot snapshot) {
        print('Data : ${snapshot.value}');
      },
    );
  }
}
