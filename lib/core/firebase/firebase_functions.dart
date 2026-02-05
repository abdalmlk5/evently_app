import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static CollectionReference<EventModel> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson(),
        );
  }

  static Future<void> createUser({required UserModel user}) async {
    await getUserCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> readUser() async {
    var userDoc = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return userDoc.data();
  }

  static Future<void> createUserByEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      await createUser(
        user: UserModel(
          name: name,
          email: emailAddress,
          id: credential.user!.uid,
        ),
      );

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError("Something went wrong");
    }
  }

  static Future<void> loginByEmailAndPassword({
    required String emailAddress,
    required String password,
    required Function onSuccess,
    required Function onError,
    required Function onLoading,
  }) async {
    try {
      onLoading();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (_) {
      onError("email or password is incorrect");
    } catch (e) {
      onError("Something went wrong");
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> resetPassword({
    required String emailAddress,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError("Something went wrong");
    }
  }

  static Future<void> addEventToFirestore({
    required EventModel event,
    required Function(String e) onError,
  }) {
    try {
      var eventsCollectionRef = getEventsCollection();
      var eventDocRef = eventsCollectionRef.doc();

      /// Create a new document for the event.
      /// It automatically generates a unique ID.

      event.id = eventDocRef.id;
      return eventDocRef.set(event);
    } catch (e) {
      return onError(e.toString());
    }
  }

  // static Future<List<EventModel>> getEventsFromFirestore({
  //   String? categoryName,
  // }) async {
  //   var querySnapshot = await getEventsCollection().get();
  //
  //   List<EventModel> events = categoryName == 'all' || categoryName == null
  //       ? querySnapshot.docs.map((doc) {
  //           return doc.data();
  //         }).toList()
  //       : querySnapshot.docs
  //             .map((doc) {
  //               return doc.data();
  //             })
  //             .toList()
  //             .where((event) {
  //               return event.categoryName == categoryName;
  //             })
  //             .toList();
  //
  //   return events;
  // }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
  getStreamEventsFromFirestore() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  // static Future<List<EventModel>> getFilterEventsFromFirestore({
  //   required String categoryName,
  // }) async {
  //   var querySnapshot = await getEventsCollection().get();
  //
  //   List<EventModel> events = querySnapshot.docs
  //       .map((doc) {
  //         return doc.data();
  //       })
  //       .toList()
  //       .where((event) {
  //         return event.categoryName == categoryName;
  //       })
  //       .toList();
  //
  //   return events;
  // }

  static void updateEventFavourite({required EventModel event}) {
    getEventsCollection().doc(event.id).update({
      "isFavourite": event.isFavourite,
    });
  }

  static void updateEvent({required EventModel event}) {
    getEventsCollection().doc(event.id).update(event.toJson());
  }

  static void deleteEvent({required EventModel event}) {
    getEventsCollection().doc(event.id).delete();
  }
}
