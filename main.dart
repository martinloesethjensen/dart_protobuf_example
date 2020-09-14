import 'dart:convert';
import 'dart:io';
import 'models/person.pb.dart';

Person promptForPerson() {
  final encoding = Encoding.getByName('utf-8');

  Person person = Person();

  print('Name: ');
  person.name = stdin.readLineSync(encoding: encoding);

  print('Age: ');
  var age = stdin.readLineSync(encoding: encoding) ?? -1;
  person.age = int.tryParse(age);

  print('Enter email address (blank for none): ');
  String email = stdin.readLineSync(encoding: encoding);
  if (email.isNotEmpty) {
    person.email = email;
  }

  print('Gender (male [0], female [1], other [2] -- default ): ');
  var genderInput = stdin.readLineSync(encoding: encoding);
  var parsedGenderType = int.tryParse(genderInput) ?? -1;

  switch (parsedGenderType) {
    case 0:
      person.gender = Person_Gender.MALE;
      break;
    case 1:
      person.gender = Person_Gender.FEMALE;
      break;
    case 2:
    default:
      person.gender = Person_Gender.OTHER;
  }

  return person;
}

void printPeople(PersonList personList) {
  personList.people.forEach((person) {
    print('Name: ${person.name}');
    print('Age: ${person.age}');
    if (person.hasEmail()) print('Email: ${person.email}');
    print('Gender: ${person.gender}');
  });
}

main(List<String> args) {
  if (args.length != 1) {
    print('Usage: list person PERSON_FILE');
    exit(-1);
  }

  // Read the existing .
  File file = File(args.first);

  PersonList personList;
  if (!file.existsSync()) {
    print('File not found. Creating new file.');
    personList = PersonList();
  } else {
    personList = PersonList.fromBuffer(file.readAsBytesSync());
    printPeople(personList);
  }
  personList.people.add(promptForPerson());
  file.writeAsBytes(personList.writeToBuffer());
}
