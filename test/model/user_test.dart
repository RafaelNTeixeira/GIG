import 'package:flutter_test/flutter_test.dart';
import 'package:gig/model/user.dart';

void main() {
  test('User object can be created', () {
    final user = AppUser(
      id: '123',
      email: 'johndoe@gmail.com',
      name: 'John Doe',
      age: '24',
      workDescription: 'A software engineer',
      location: 'Rua Central, 153',
      biography: 'Trabalhador em Engenharia Informática',
      service: 'Gardening',
      paymentHour: '12',
      tasks: {'task1': true, 'task2': false},
      uid: 'dwasdXdwa123',
    );

    expect(user.id, '123');
    expect(user.email, 'johndoe@gmail.com');
    expect(user.name, 'John Doe');
    expect(user.age, '24');
    expect(user.workDescription, 'A software engineer');
    expect(user.location, 'Rua Central, 153');
    expect(user.biography, 'Trabalhador em Engenharia Informática');
    expect(user.service, 'Gardening');
    expect(user.paymentHour, '12');
    expect(user.tasks, {'task1': true, 'task2': false});
    expect(user.uid, 'dwasdXdwa123');
  });

  test('User object can be converted to JSON', () {
    final user = AppUser(
      id: '123',
      email: 'johndoe@gmail.com',
      name: 'John Doe',
      age: '24',
      workDescription: 'A software engineer',
      location: 'Rua Central, 153',
      biography: 'Trabalhador em Engenharia Informática',
      service: 'Gardening',
      paymentHour: '12',
      tasks: {'task1': true, 'task2': false},
      uid: 'dwasdXdwa123',
    );

    final json = user.toJson();

    expect(json['id'], '123');
    expect(json['email'], 'johndoe@gmail.com');
    expect(json['name'], 'John Doe');
    expect(json['age'], '24');
    expect(json['workDescription'], 'A software engineer');
    expect(json['location'], 'Rua Central, 153');
    expect(json['biography'], 'Trabalhador em Engenharia Informática');
    expect(json['service'], 'Gardening');
    expect(json['paymentHour'], '12');
    expect(json['tasks'], {'task1': true, 'task2': false});
    expect(json['uid'], 'dwasdXdwa123');
  });

  test('User object has correct default values', () {
    final user = AppUser(id: '123', uid: 'dwasdXdwa123');

    expect(user.email, isNull);
    expect(user.name, isNull);
    expect(user.age, isNull);
    expect(user.location, isNull);
    expect(user.workDescription, isNull);
    expect(user.biography, isNull);
    expect(user.service, isNull);
    expect(user.paymentHour, isNull);
    expect(user.tasks, isNull);
  });

  test('There are no different users with the same uid', () {
    final user1 = AppUser(id: '123', uid: 'dwasdXdwa123');
    final user2 = AppUser(id: '123', uid: 'dwasdXdwa123');
    final user3 = AppUser(id: '456', uid: 'dwasdXdwa123');

    expect(user1 == user2, isFalse);
    expect(user1 == user3, isFalse);
  });

  test('fromJson() deserializes a JSON object into a User object', () {
    final json = {
      'id': '123',
      'email': 'johndoe@gmail.com',
      'name': 'John Doe',
      'age': '24',
      'workDescription': 'A software engineer',
      'location': 'Rua Central, 153',
      'biography': 'Trabalhador em Engenharia Informática',
      'service': 'Gardening',
      'paymentHour': '12',
      'tasks': {'task1': true, 'task2': false},
      'uid': 'dwasdXdwa123',
    };

    final user = AppUser.fromJson(json);

    expect(user.id, '123');
    expect(user.email, 'johndoe@gmail.com');
    expect(user.name, 'John Doe');
    expect(user.age, '24');
    expect(user.workDescription, 'A software engineer');
    expect(user.location, 'Rua Central, 153');
    expect(user.biography, 'Trabalhador em Engenharia Informática');
    expect(user.service, 'Gardening');
    expect(user.paymentHour, '12');
    expect(user.tasks, {'task1': true, 'task2': false});
    expect(user.uid, 'dwasdXdwa123');
  });
}