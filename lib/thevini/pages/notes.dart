import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/thevini/services/firestore.dart';


class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  final FirestoreServices firestoreServices = FirestoreServices();

  final TextEditingController textController = TextEditingController();

  void openNotebox(String? docID){
    showDialog(context: context, builder: (context) =>  AlertDialog(
      title: const Text('Add Note'),
      titleTextStyle: const TextStyle(
        color: Colors.orange,
        fontFamily: 'Calistoga',
      ),
      content: TextField(controller: textController,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            //new note
            if(docID == null){
              firestoreServices.addNote(textController.text);
            }
             //update note
            else{
              firestoreServices.updateNote(docID, textController.text);
            }
            textController.clear();
            Navigator.pop(context);
          },
          child:const Text(
            'Add',
          style: TextStyle(
            color: Color.fromARGB(255, 250, 154, 0),
            fontFamily: 'Calistoga',
          ),
         ),   
        ),
      ],
    ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Color.fromARGB(222, 222, 133, 24),
            fontFamily: 'Calistoga',
            fontWeight: FontWeight.bold,
            fontSize: 25
            ), 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNotebox(null),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getNoteStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: ()=> openNotebox(docID),
                        icon: const Icon(Icons.edit),
                        color: Colors.orange,
                      ),

                      IconButton(
                        onPressed: () => firestoreServices.deleteNotes(docID),
                        icon: const Icon(Icons.delete),
                        color: Colors.orange,
                      )
                    ],
                  ),
                );
              },
            );
          }
          else{
            return const Text('No notes available ....!');
          }
        },
      ),
    );
  }
}