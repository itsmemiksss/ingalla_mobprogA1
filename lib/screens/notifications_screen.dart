
import 'package:flutter/material.dart';
import 'package:ingalla_mobprog/widgets/notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'name': 'Test',
        'post': 'Post',
        'description': 'Description',
      },
      {
        'name': 'Cyrus Robles',
        'post': 'New Post',
        'description': 'Cyrus shared a new post.',
      },
      {
        'name': 'Roben Juanatas',
        'post': 'Photo',
        'description': 'Roben uploaded a new photo.',
      },
      {
        'name': 'Lego Spider-Man',
        'post': 'Status Update',
        'description': 'Shared a new status update.',
      },
      {
        'name': 'Lego Batman',
        'post': 'Post',
        'description': 'Batman shared a new post.',
      },
      {
        'name': 'Peter Parker',
        'post': 'Photo',
        'description': 'Peter uploaded a photo.',
      },
      {
        'name': 'Bruce Wayne',
        'post': 'Status Update',
        'description': 'Bruce updated his status.',
      },
      {
        'name': 'Tony Stark',
        'post': 'New Post',
        'description': 'Tony shared something new.',
      },
      {
        'name': 'Steve Rogers',
        'post': 'Post',
        'description': 'Steve shared a new post.',
      },
      {
        'name': 'Natasha Romanoff',
        'post': 'Photo',
        'description': 'Natasha uploaded a photo.',
      },
      {
        'name': 'Thor Odinson',
        'post': 'Status Update',
        'description': 'Thor shared a status update.',
      },
      {
        'name': 'Wanda Maximoff',
        'post': 'New Post',
        'description': 'Wanda created a new post.',
      },
      {
        'name': 'Clint Barton',
        'post': 'Photo',
        'description': 'Clint shared a new photo.',
      },
      {
        'name': 'Sam Wilson',
        'post': 'Post',
        'description': 'Sam shared a new post.',
      },
      {
        'name': 'Bucky Barnes',
        'post': 'Status Update',
        'description': 'Bucky updated his status.',
      },
      {
        'name': 'Doctor Strange',
        'post': 'New Post',
        'description': 'Strange shared a new post.',
      },
      {
        'name': 'Carol Danvers',
        'post': 'Photo',
        'description': 'Carol uploaded a new photo.',
      },
      {
        'name': 'Black Panther',
        'post': 'Post',
        'description': 'Wakanda forever!',
      },
      {
        'name': 'Scott Lang',
        'post': 'Status Update',
        'description': 'Scott shared a status update.',
      },
      {
        'name': 'Peter Quill',
        'post': 'New Post',
        'description': 'Peter shared a new post.',
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return Column(
          children: [
            NotificationWidget(
              name: notification['name']!,
              post: notification['post']!,
              description: notification['description']!,
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
