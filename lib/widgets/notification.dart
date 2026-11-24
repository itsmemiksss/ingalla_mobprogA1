
import 'package:flutter/material.dart';
import 'package:ingalla_mobprog/constants.dart';

class NotificationWidget extends StatelessWidget {
  final String name;
  final String post;
  final String description;

  const NotificationWidget({
    super.key,
    required this.name,
    required this.post,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.person,
            size: 35,
            color: appTextColor,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Posted: $post',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.more_horiz,
            size: 20,
          ),
        ],
      ),
    );
  }
}
