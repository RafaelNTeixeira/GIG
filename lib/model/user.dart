class AppUser {
  String id;
  String? email;
  String? name;
  String? age;
  String? location;
  String? workDescription;
  String? biography;
  String? service;
  String? paymentHour;
  String uid;
  Map<String, dynamic>? tasks;
  Map<String, dynamic>? offers;

  AppUser({required this.id, this.email,
    this.name, this.age, this.workDescription,
    this.location, this.biography, required this.uid,
    this.service, this.paymentHour, this.tasks, this.offers});

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'age': age,
    'workDescription': workDescription,
    'location': location,
    'biography' : biography,
    'uid': uid,
    'service': service,
    'paymentHour': paymentHour,
    'tasks': tasks,
    'offers': offers
  };

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    age: json['age'] as String,
    workDescription: json['workDescription'] as String,
    location : json['location'] as String,
    biography : json['biography'] as String,
    uid : json['uid'] as String,
    service: json['service'] as String,
    paymentHour: json['paymentHour'] as String,
    tasks: json['tasks'] as Map<String, dynamic>,
  );

  static AppUser fromJsonOffers(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      age: json['age'] as String,
      workDescription: json['workDescription'] as String,
      location : json['location'] as String,
      biography : json['biography'] as String,
      uid : json['uid'] as String,
      service: json['service'] as String,
      paymentHour: json['paymentHour'] as String,
      tasks: json['tasks'] as Map<String, dynamic>,
      offers: json['offers'] as Map<String, dynamic>
  );
}

