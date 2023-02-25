import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.lightGreen[600],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text("Armaan"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text("armaan33000@gmail.com"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.red,
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('https://via.placeholder.com/350x150'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
