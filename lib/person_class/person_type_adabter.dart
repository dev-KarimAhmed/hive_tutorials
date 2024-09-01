import 'package:hive_flutter/adapters.dart';
import 'package:project_1/person_class/person.dart';

class PersonTypeAdabter extends TypeAdapter<Person> {
  @override
  Person read(BinaryReader reader) {
    return Person(age: reader.readInt32(), name: reader.readString() , friends: reader.readList().cast<Person>());
  }

  @override
  // Unique type id for this type (0:223)
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.writeInt32(obj.age);
    writer.writeString(obj.name);
    writer.writeList(obj.friends);
  }
}
