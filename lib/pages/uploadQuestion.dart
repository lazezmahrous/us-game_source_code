import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:us/widgets/showSnakBar.dart';

class UploadQuestion extends StatefulWidget {
  const UploadQuestion({super.key});
  @override
  State<UploadQuestion> createState() => _UploadQuestionState();
}

class _UploadQuestionState extends State<UploadQuestion> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _question.clear();
    _punishment.clear();
    _publishedBy.clear();
  }

  GlobalKey<FormState> formkay = GlobalKey();
  final TextEditingController _question = TextEditingController();
  final TextEditingController _punishment = TextEditingController();
  final TextEditingController _publishedBy = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('نشر سؤال'),
      ),
      body: Form(
        key: formkay,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLength: 60,
                decoration: const InputDecoration(
                  hintText: 'السؤال',
                ),
                controller: _question,
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'ماينفعش تسيب هنا فاضي';
                  } else if (data.length < 6) {
                    return 'اقل حاجه 6 حروف ';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLength: 60,
                decoration: const InputDecoration(
                  hintText: 'العقاب',
                ),
                controller: _punishment,
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'ماينفعش تسيب هنا فاضي';
                  } else if (data.length < 6) {
                    return 'اقل حاجه 6 حروف ';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLength: 24,
                decoration: const InputDecoration(
                  hintText: 'إسمك',
                ),
                controller: _publishedBy,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    if (formkay.currentState!.validate()) {
                      FirebaseFirestore.instance
                          .collection('questions')
                          .doc()
                          .set({
                        'question': _question.text,
                        'punishment': _punishment.text,
                        'publishedBy': _publishedBy.text,
                        'dataPublished': DateTime.now(),
                      });

                      _question.clear();
                      _punishment.clear();
                      _publishedBy.clear();

                      showSnackBarBlue(context, 'تم رفع سؤالك');
                    } else {
                      showSnackBar(
                          context, 'في مشكله إتأكد إنك كاتب كل حاجه صح');
                    }
                  },
                  child: const Text('رفع السؤال')),
            ),
          ],
        ),
      ),
    );
  }
}
