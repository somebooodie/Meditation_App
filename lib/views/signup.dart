import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<String> signup(String username, String password, File image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://coded-meditation.eapi.joincoded.com/signup'))
      ..fields['username'] = username
      ..fields['password'] = password
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Error';
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign Up"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Pick Image"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_image != null) {
                  signup(usernameController.text, passwordController.text,
                          _image!)
                      .then((result) {
                    if (result == 'Success') {
                      context.pushNamed("signin");
                    } else {
                      // Handle error
                    }
                  });
                } else {
                  // Handle no image selected
                }
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
