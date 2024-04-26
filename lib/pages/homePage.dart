import 'package:flutter/material.dart';
import 'package:us/pages/questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('الصفحه الرئيسيه'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'مرحبا يا حلو',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'نبذه تعريفية بسيطه',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                          'اللعبه تتكون من عده اسئله مواقف محرجه حجات حصلت لك بالماضي إلخ.. '),
                    ),
                    Text(
                      'يجب الإجابه علي كل الأسئله في حاله عدم الإجابه علي السؤال هيكون في عقاب تحت السؤال لازم تنفذه',
                      style: TextStyle(
                          // fontSize: 40,
                          // color: Colors.redAccent,
                          ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ElevatedButton.icon(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(300, 40),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Questions(),
                          ));
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('بدايه '),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
