import 'package:flutter/material.dart';
import 'package:learning_path_ai/Models/user_details.dart';
import 'package:learning_path_ai/intro_pages/education_page.dart';

class ProfessionPage extends StatefulWidget {
  final UserDetails user;

  const ProfessionPage({super.key, required this.user});

  @override
  _ProfessionPageState createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context)
          .requestFocus(nameFocusNode); // Request focus after the build
    });
  }

  final FocusNode nameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final maxWidth = 400.0;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal:
                screenWidth > maxWidth ? (screenWidth - maxWidth) / 2 : 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '>',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Just a few more steps...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.event, size: 24),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        focusNode: nameFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Enter your profession',
                          //labelText: 'Name',
                          border: InputBorder.none, // Remove border
                        ),
                        onSubmitted: (value) {
                          widget.user.profession = value;
                          // Save the value and navigate to the AgePage
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EducationPage(
                              user: widget.user,
                            ),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }
}