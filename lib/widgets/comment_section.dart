
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController =
      TextEditingController();

  final List<String> _comments = [];

  void _addComment() {
    final comment = _commentController.text.trim();

    if (comment.isEmpty) return;

    setState(() {
      _comments.add(comment);
      _commentController.clear();
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 16,
                child: Icon(Icons.person, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (_) => _addComment(),
                ),
              ),
              IconButton(
                onPressed: _addComment,
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),

        ..._comments.map(
          (comment) => Padding(
            padding: const EdgeInsets.only(
              left: 55,
              top: 10,
              right: 12,
            ),
            child: Text(comment),
          ),
        ),
      ],
    );
  }
}
