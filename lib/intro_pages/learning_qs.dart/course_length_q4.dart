import 'package:flutter/material.dart';
import 'package:learning_path_ai/Models/promt_details.dart';
import 'package:learning_path_ai/Models/user_details.dart';
import 'package:learning_path_ai/intro_pages/age_page.dart';
import 'package:learning_path_ai/intro_pages/learning_qs.dart/goal_q5.dart';
import 'package:learning_path_ai/intro_pages/learning_qs.dart/hours_per_week_q3.dart';
import 'package:learning_path_ai/prompt_creation_pages/learning_form.dart';

class courseLengthQuestionFour extends StatefulWidget {
  final UserDetails user;
  final PromptDetails promptDetails;

  const courseLengthQuestionFour(
      {super.key, required this.user, required this.promptDetails});

  @override
  _courseLengthQuestionFourState createState() =>
      _courseLengthQuestionFourState();
}

class _courseLengthQuestionFourState extends State<courseLengthQuestionFour> {
  final TextEditingController nameController = TextEditingController();
  int? selectedCourseLength;

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
    String? selectedExperienceLevel;
    final List<int> courseLengthOptions =
        List.generate(16, (index) => index + 1);

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
                '4/7',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Select your preferred course length (in weeks)',
                style: TextStyle(fontSize: 18, color: Colors.grey),
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
                      child: DropdownButtonFormField<int>(
                        value: selectedCourseLength,
                        items: courseLengthOptions.map((weeks) {
                          return DropdownMenuItem<int>(
                            value: weeks,
                            child: Text('$weeks weeks'),
                          );
                        }).toList(),
                        hint: Text('Ex. 2 weeks, 3 weeks...'),
                        onChanged: (value) {
                          setState(() {
                            selectedCourseLength = value;
                            widget.promptDetails.preferredCourseLength =
                                value!; // Update the promptDetails object
                          });

                          // Automatically navigate to the next page
                          Future.delayed(Duration.zero, () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => goalQuestionFive(
                                  promptDetails: widget.promptDetails,
                                  user: widget.user,
                                ),
                              ),
                            );
                          });
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
