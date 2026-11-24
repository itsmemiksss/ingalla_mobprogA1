
import 'package:flutter/material.dart';
import 'package:ingalla_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'userName': 'Cyrus Robles',
        'postContent': 'Karmusta',
        'date': 'October 11',
        'numOfLikes': 100,
        'postImage': null,
      },
      {
        'userName': 'Roben Juanatas',
        'postContent': 'Kicking off the holiday season with CpE-NCR!',
        'date': 'December 2',
        'numOfLikes': 250,
        'postImage': null,
      },
      {
        'userName': 'Lego Spider-Man',
        'postContent': 'Friendly neighborhood Spider-Man! 🕷️',
        'date': '2 hours ago',
        'numOfLikes': 150,
        'postImage': null,
      },
      {
        'userName': 'Lego Batman',
        'postContent': 'I am vengeance. I am the night. 🦇',
        'date': '5 hours ago',
        'numOfLikes': 300,
        'postImage': 'assets/images/brucewayne.jpg',
      },
      {
        'userName': 'Peter Parker',
        'postContent': 'Another beautiful day in New York!',
        'date': 'Yesterday',
        'numOfLikes': 180,
        'postImage': null,
      },
      {
        'userName': 'Bruce Wayne',
        'postContent': 'Protecting Gotham, one night at a time.',
        'date': 'Yesterday',
        'numOfLikes': 420,
        'postImage': null,
      },
      {
        'userName': 'Tony Stark',
        'postContent': 'Innovation is the key to the future. 🚀',
        'date': '2 days ago',
        'numOfLikes': 500,
        'postImage': null,
      },
      {
        'userName': 'Steve Rogers',
        'postContent': 'Stay strong and never give up!',
        'date': '3 days ago',
        'numOfLikes': 275,
        'postImage': null,
      },
      {
        'userName': 'Natasha Romanoff',
        'postContent': 'Enjoying a peaceful day. ❤️',
        'date': '4 days ago',
        'numOfLikes': 320,
        'postImage': null,
      },
      {
        'userName': 'Thor Odinson',
        'postContent': 'A little thunder never hurts! ⚡',
        'date': '5 days ago',
        'numOfLikes': 600,
        'postImage': null,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 2, bottom: 10),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];

        return NewsfeedCard(
          userName: post['userName'],
          postContent: post['postContent'],
          date: post['date'],
          numOfLikes: post['numOfLikes'],
          hasImage: post['postImage'] != null,
          postImage: post['postImage'],
        );
      },
    );
  }
}
