import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  final String initialName; // Define initialName parameter
  final Function(String) onUpdateName; // Define onUpdateName parameter

  const EditProfilePage({
    Key? key,
    required this.initialName,
    required this.onUpdateName,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _imagePath = 'assets/profile.png';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  late String fname = '';
  late String lname = '';
  late String mail = '';
  late String number = '';
  late String interest = '';
  late String special = '';
  bool _isLoading = true;
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _mailController = TextEditingController();
  final _numberController = TextEditingController();
  final _interestController = TextEditingController();
  final _specialController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _fnameController.text = widget.initialName; // Set initial name
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _mailController.dispose();
    _numberController.dispose();
    _interestController.dispose();
    _specialController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    _user = _auth.currentUser!;
    DocumentSnapshot<Map<String, dynamic>> doc;
    if (_user != null) {
      doc = await _firestore.collection('Clients').doc(_user.uid).get();
      if (doc.exists) {
        setState(() {
          fname = doc['FirstName'] ?? '';
          lname = doc['LastName'] ?? '';
          mail = doc['email'] ?? '';
          number = doc['mobilenumber'] ?? '';
          interest = doc['interestedin'] ?? '';
          _isLoading = false;
        });
      } else {
        doc = await _firestore.collection('Counselors').doc(_user.uid).get();
        if (doc.exists) {
          setState(() {
            fname = doc['FirstName'] ?? '';
            lname = doc['LastName'] ?? '';
            mail = doc['email'] ?? '';
            number = doc['mobilenumber'] ?? '';
            special = doc['specializedin'] ?? '';
            _isLoading = false;
          });
        }
      }
      _lnameController.text = lname;
      _mailController.text = mail;
      _numberController.text = number;
      _interestController.text = interest;
      _specialController.text = special;
    }
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final clientDoc = _firestore.collection('Clients').doc(_user.uid);
      final counselorDoc = _firestore.collection('Counselors').doc(_user.uid);

      if (interest.isNotEmpty &&
          await clientDoc.get().then((doc) => doc.exists)) {
        await clientDoc.update({
          'FirstName': _fnameController.text,
          'LastName': _lnameController.text,
          'email': _mailController.text,
          'mobilenumber': _numberController.text,
          'interestedin': _interestController.text,
        });
      } else if (special.isNotEmpty &&
          await counselorDoc.get().then((doc) => doc.exists)) {
        await counselorDoc.update({
          'FirstName': _fnameController.text,
          'LastName': _lnameController.text,
          'email': _mailController.text,
          'mobilenumber': _numberController.text,
          'specializedin': _specialController.text,
        });
      }

      // Update the name using setState
      setState(() {
        fname = _fnameController.text;
      });

      // Call onUpdateName to update the name
      widget.onUpdateName(_fnameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopupMenu(context);
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 124, right: 20, top: 25),
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 1, 39, 70),
                            radius: 60,
                            backgroundImage: AssetImage('assets/profile.png'),
                          ),
                        ),
                        Positioned(
                          top: 105,
                          left: 220,
                          child: GestureDetector(
                            onTap: () {
                              showPopupMenu(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: const Color.fromARGB(255, 233, 129, 60),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _fnameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _lnameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _mailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _numberController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        if (interest.isNotEmpty)
                          TextFormField(
                            controller: _interestController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.list,
                                  color: Color.fromARGB(255, 233, 129, 60),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 233, 129, 60),
                                        width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 1.0)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: 'Interested In',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 233, 129, 60))),
                          ),
                        const SizedBox(height: 20),
                        if (special.isNotEmpty)
                          TextFormField(
                            controller: _specialController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.list,
                                  color: Color.fromARGB(255, 233, 129, 60),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 233, 129, 60),
                                        width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 1.0)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: 'Specialized In',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 233, 129, 60))),
                          ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _saveChanges,
                              child: const Text('Save'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _saveProfilePicture(String imagePath) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${_user.uid}.jpg');
      UploadTask uploadTask = ref.putFile(File(imagePath));
      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      await _firestore.collection('users').doc(_user.uid).update({
        'profile_picture': imageUrl,
      });
      setState(() {
        _imagePath = imagePath;
      });
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  void showPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Edit Profile'),
                onTap: () {
                  // Close the alert dialog
                  Navigator.pop(context);
                  // Open the gallery
                  _getImageFromGallery(context);
                },
              ),
              ListTile(
                title: const Text('View Profile'),
                onTap: () {
                  // Close the alert dialog
                  Navigator.pop(context);
                  // Show the image
                  _showProfileImage(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Update the image path
      setState(() {
        _imagePath = pickedFile.path!;
      });
      // Save the profile picture
      _saveProfilePicture(pickedFile.path!);
    }
  }

  void _showProfileImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Image'),
          content: Image.asset(_imagePath),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class ImagePickerPage extends StatelessWidget {
  final String imagePath;
  final Function(String) onSaveImage;

  const ImagePickerPage({
    Key? key,
    required this.imagePath,
    required this.onSaveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.file(File(imagePath))),
          ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                onSaveImage(pickedFile.path);
                Navigator.pop(context);
              }
            },
            child: const Text('Choose a new image'),
          ),
        ],
      ),
    );
  }
}
