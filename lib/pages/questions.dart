import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:us/pages/uploadQuestion.dart';
import 'package:us/widgets/question.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});
  @override
  State<Questions> createState() => _QuttionsState();
}

class _QuttionsState extends State<Questions> {
  PageController _pageController = PageController(
      initialPage: 0); // Updated to start from the first question
  int questionLength = 0;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _pageController = PageController(initialPage: 0);
    currentPage = 0;
    print(currentPage);
    print(_pageController);
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  //   currentPage = 0;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('الأسئلة'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadQuestion(),
                    ));
              },
              icon: const Icon(Icons.upload),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('questions')
                .orderBy('dataPublished', descending: true)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: CircularProgressIndicator());
              }

              return Center(
                child: PageView.builder(
                  controller: _pageController,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  onPageChanged: (index) {
                    currentPage = index;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    questionLength = snapshot.data!.docs.length;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                        'دا السؤال رقم ${questionLength - currentPage} من أصل $questionLength',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        buildQuestion(
                          snapshot.data!.docs[index].data()['question'],
                          snapshot.data!.docs[index].data()['punishment'],
                          snapshot.data!.docs[index].data()['publishedBy'],
                          snapshot.data!.docs[index].data()['dataPublished'],
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
