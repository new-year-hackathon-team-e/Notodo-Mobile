import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<String> future = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'NoTodo',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '검색',
                suffix: GestureDetector(
                  onTap: () {
                    print('search');
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  crossAxisCount: 4,
                ),
                itemCount: 8,
                itemBuilder: ((context, index) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Home',
                      ),
                    ],
                  );
                }),
              ),
            ),
            FutureBuilder(
              future: future,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
