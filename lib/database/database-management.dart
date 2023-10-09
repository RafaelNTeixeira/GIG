import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';

class DatabaseManagement {

  static Future<AppUser?> getUserByUid(String uid) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.length > 0) {
      final userDoc = querySnapshot.docs[0];
      return AppUser.fromJson(userDoc.data());
    } else {
      return null;
    }
  }


  static Future<String> getCurrentUserDocId(String uid) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'user').where('uid', isEqualTo: uid).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id;
    } else {
      return "null";
    }
  }


  final usersRef = FirebaseFirestore.instance.collection('user').withConverter<
      AppUser>(
    fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );

  static Future<void> init() async {
    await Firebase.initializeApp();
  }


  static Future createUser({required String uid, required String email}) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    Map<String, bool> tasks_ = {'tasks': true};
    final user = AppUser(id: docUser.id,
        uid: uid,
        email: email,
        name: "name",
        age: "age",
        location: "location",
        workDescription: "workDescription",
        biography: "biography",
        service: "service",
        paymentHour: "paymentHour",
        tasks: tasks_,
        offers: {});
    final json = user.toJson();
    await docUser.set(json);
  }


  static Future updateUser(
      {String? id, String? name, String? workDescription, String? age, String? location,
        String? biography, String? service, String? paymentHour, Map<
          String,
          bool>? tasks}) async {
    final userRef = FirebaseFirestore.instance.collection('user').doc(id);
    final userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      final user = AppUser.fromJson(userSnapshot.data()!);
      if (name != null) user.name = name;
      if (age != null) user.age = age;
      if (location != null) user.location = location;
      if (biography != null) user.biography = biography;
      if (workDescription != null) user.workDescription = workDescription;
      if (service != null) user.service = service;
      if (paymentHour != null) user.paymentHour = paymentHour;
      if (tasks != null) user.tasks = tasks;
      final json = user.toJson();
      await userRef.set(json);
    } else {
      throw Exception("User not found!");
    }
  }


  static Future updateProfileRequester(
      {String? id, String? name, String? workDescription, String? age, String? location,
        String? biography, String? paymentHour}) async {
    final userRef = FirebaseFirestore.instance.collection('user').doc(id);
    final userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      final user = AppUser.fromJson(userSnapshot.data()!);
      if (name != null) user.name = name;
      if (age != null) user.age = age;
      if (location != null) user.location = location;
      if (biography != null) user.biography = biography;
      if (workDescription != null) user.workDescription = workDescription;
      if (paymentHour != null) user.paymentHour = paymentHour;
      final json = user.toJson();
      await userRef.update(json);
    } else {
      throw Exception("User not found!");
    }
  }


  static Future<void> updateProfileProvider({String? id, String? name, String? workDescription, String? age, String? location,
    String? biography, String? paymentHour, required List<Map<String, dynamic>> offers}) async {
    final userRef = FirebaseFirestore.instance.collection('user').doc(id);
    final userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      final user = AppUser.fromJson(userSnapshot.data()!);
      if (name != null) user.name = name;
      if (age != null) user.age = age;
      if (location != null) user.location = location;
      if (biography != null) user.biography = biography;
      if (workDescription != null) user.workDescription = workDescription;
      if (paymentHour != null) user.paymentHour = paymentHour;
      final offersMap = <String, dynamic>{};
      for (final offer in offers) {
        final offerKey = offer['offer'] as String;
        offersMap[offerKey] = offer;
      }

      user.offers = offersMap;
      final json = user.toJson();
      await userRef.update(json);
    } else {
      throw Exception("User not found!");
    }
  }



  static Future sendOffer(
      {String? workerID, String? requesterID, String? name, String? location, String? email, String? serviceType}) async {
    final userRef = FirebaseFirestore.instance.collection('user').doc(workerID);
    final userSnapshot = await userRef.get();
    final user;

    if (userSnapshot.exists) {
      if (userSnapshot.data()!['offers'] == null ||
          userSnapshot.data()!['offers'].isEmpty) {
        user = AppUser.fromJson(userSnapshot.data()!);
      }
      else {
        user = AppUser.fromJsonOffers(userSnapshot.data()!);
      }

      final json = user.toJson();
      final offersMap = json['offers'] ?? {};

      int newKeyNum = 1;
      while (offersMap.containsKey('offer$newKeyNum')) {
        newKeyNum++;
      }
      final newKey = 'offer$newKeyNum';

      final newOffer = {
        'requester': requesterID,
        'worker': workerID,
        'location': location,
        'name': name,
        'email': email,
        'serviceType': serviceType,
        'status': "Not checked"
      };

      offersMap[newKey] = newOffer;
      json['offers'] = offersMap;
      await userRef.update(json);
    } else {
      throw Exception("User not found!");
    }
  }


  static Future<void> updateOfferStatus(
      {String? workerID, String? offerKey, String? newStatus}) async {
    final userRef = FirebaseFirestore.instance.collection('user').doc(workerID);
    final userSnapshot = await userRef.get();

    if (userSnapshot.exists) {
      final user = AppUser.fromJsonOffers(userSnapshot.data()!);
      final json = user.toJson();
      final offersMap = json['offers'] ?? {};

      if (offersMap.containsKey(offerKey)) {
        final offerToUpdate = offersMap[offerKey];
        offerToUpdate['status'] = newStatus;

        json['offers'] = offersMap;
        await userRef.update(json);
      } else {
        throw Exception("Offer not found!");
      }
    } else {
      throw Exception("User not found!");
    }
  }


  static Future<
      List<QueryDocumentSnapshot<Map<String, dynamic>>>> getProvidersByType(
      String serviceType) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('service', isEqualTo: 'Service Provider')
        .where('tasks.$serviceType', isEqualTo: true)
        .get();

    return snapshot.docs;
  }


  static Future<List<Map<String, dynamic>>> getSubmitedOffersByStatus(
      String requesterId, String status) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('service', isEqualTo: 'Service Provider')
        .get();

    final offers = <Map<String, dynamic>>[];

    for (final userDoc in querySnapshot.docs) {
      if (userDoc.data()['offers'] != null &&
          userDoc.data()['offers'].isNotEmpty) {
        final user = AppUser.fromJsonOffers(userDoc.data());
        final offersMap = user.offers ?? {};

        final offersForUser = offersMap.entries.where((entry) =>
        entry.value['status'] == status &&
            entry.value['requester'] == requesterId)
            .map((entry) =>
        {
          "requester": entry.value['requester'],
          "worker": entry.value['worker'],
          "offer": entry.key,
          "email": entry.value['email'],
          "location": entry.value['location'],
          "name": entry.value['name'],
          "serviceType": entry.value['serviceType'],
          "status": entry.value['status']
        }).toList();

        offers.addAll(offersForUser);
      }
    }

    return offers;
  }


  static Future<List<Map<String, dynamic>>> getReceivedOffersByStatus(
      String workerId, String status) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('service', isEqualTo: 'Service Provider')
        .get();

    final offers = <Map<String, dynamic>>[];

    for (final userDoc in querySnapshot.docs) {
      if (userDoc.data()['offers'] != null &&
          userDoc.data()['offers'].isNotEmpty) {
        final user = AppUser.fromJsonOffers(userDoc.data());
        final offersMap = user.offers ?? {};

        final offersForUser = offersMap.entries.where((entry) =>
        entry.value['status'] == status &&
            entry.value['worker'] == workerId)
            .map((entry) =>
        {
          "requester": entry.value['requester'],
          "worker": entry.value['worker'],
          "offer": entry.key,
          "email": entry.value['email'],
          "location": entry.value['location'],
          "name": entry.value['name'],
          "serviceType": entry.value['serviceType'],
          "status": entry.value['status']
        }).toList();

        offers.addAll(offersForUser);
      }
    }

    return offers;
  }

  static Future<List<Map<String, dynamic>>> getReceivedOffers(
      String workerId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('service', isEqualTo: 'Service Provider')
        .get();

    final offers = <Map<String, dynamic>>[];

    for (final userDoc in querySnapshot.docs) {
      if (userDoc.data()['offers'] != null &&
          userDoc.data()['offers'].isNotEmpty) {
        final user = AppUser.fromJsonOffers(userDoc.data());
        final offersMap = user.offers ?? {};

        final offersForUser = offersMap.entries.where((entry) =>
        entry.value['worker'] == workerId)
            .map((entry) =>
        {
          "requester": entry.value['requester'],
          "worker": entry.value['worker'],
          "offer": entry.key,
          "email": entry.value['email'],
          "location": entry.value['location'],
          "name": entry.value['name'],
          "serviceType": entry.value['serviceType'],
          "status": entry.value['status']
        }).toList();

        offers.addAll(offersForUser);
      }
    }

    return offers;
  }
}