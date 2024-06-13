// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  
  //Get
    final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //Insert
    Future<void> addNote(String note) async {
      await notes.add({
        'note': note,
        'timestamp': Timestamp.now(),
      });
    }

  //Read
    Stream<QuerySnapshot> getNoteStream() {
      final notestream = notes.orderBy('timestamp', descending: true).snapshots();
      return notestream;
    }

  //Update
    Future<void> updateNote( String docID, String newNote) {
      return notes.doc(docID).update({
       'note': newNote,
       'timestamp': Timestamp.now(),
    });
  }

  //Delete
    Future<void> deleteNotes(String docID) {
      return notes.doc(docID).delete();
  }
}