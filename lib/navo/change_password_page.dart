import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangePasswordForm(),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _oldPasswordController,
            decoration: InputDecoration(labelText: 'Old Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your old password';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _newPasswordController,
            decoration: InputDecoration(labelText: 'New Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a new password';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _confirmNewPasswordController,
            decoration: InputDecoration(labelText: 'Confirm New Password'),
            obscureText: true,
            validator: (value) {
              if (value != _newPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  try {
                    // Check if user exists in clients collection
                    DocumentSnapshot<Map<String, dynamic>> clientDoc =
                        await FirebaseFirestore.instance
                            .collection('clients')
                            .doc(user.uid)
                            .get();
                    if (clientDoc.exists) {
                      // Update password in clients collection
                      await clientDoc.reference.update({
                        'password': _newPasswordController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Password changed successfully')),
                      );
                      Navigator.pop(context);
                      return;
                    }

                    // Check if user exists in counselors collection
                    DocumentSnapshot<Map<String, dynamic>> counselorDoc =
                        await FirebaseFirestore.instance
                            .collection('counselors')
                            .doc(user.uid)
                            .get();
                    if (counselorDoc.exists) {
                      // Update password in counselors collection
                      await counselorDoc.reference.update({
                        'password': _newPasswordController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Password changed successfully')),
                      );
                      Navigator.pop(context);
                      return;
                    }

                    // User not found in clients or counselors collection
                    print(
                        'Error: User not found in clients or counselors collection.');
                  } catch (error) {
                    print('Error updating password: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating password')),
                    );
                  }
                }
              }
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}
