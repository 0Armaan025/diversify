import 'package:diversify/common/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/weekly_challenge.dart';

class WeeklyChallengeScreen extends StatelessWidget {
  final List<Map<String, String>> _challenges = [
    {
      'title': 'Cook a Traditional Dish',
      'description':
          'Choose a traditional dish from a culture different than yours and prepare it at home.'
    },
    {
      'title': 'Learn a New Language',
      'description':
          'Learn a few phrases in a language different than your own and practice using them with someone who speaks that language.'
    },
    {
      'title': 'Explore a New Culture',
      'description':
          'Visit a cultural museum or landmark from a culture different than your own and learn more about it.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: _challenges.length,
          itemBuilder: (BuildContext context, int index) {
            return WeeklyChallengeWidget(
              title: _challenges[index]['title']!,
              description: _challenges[index]['description']!,
            );
          },
        ),
      ),
    );
  }
}
