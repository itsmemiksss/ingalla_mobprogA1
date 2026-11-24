
import 'package:flutter/material.dart';
import 'package:ingalla_mobprog/constants.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int? numOfLikes;
  final bool? hasImage;
  final String? profileImage;
  final String? postImage;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.hasImage,
    this.profileImage,
    this.postImage,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  final TextEditingController _commentController =
      TextEditingController();

  final List<String> _comments = [];

  bool _isLiked = false;
  bool _showComments = false;

  void _addComment() {
    final comment = _commentController.text.trim();

    if (comment.isEmpty) return;

    setState(() {
      _comments.add(comment);
      _commentController.clear();
      _showComments = true;
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appCardColor,
      elevation: 1,
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: widget.profileImage != null
                      ? AssetImage(widget.profileImage!)
                      : null,
                  child: widget.profileImage == null
                      ? const Icon(Icons.person)
                      : null,
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.date,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.public,
                            size: 13,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.more_horiz),
              ],
            ),

            const SizedBox(height: 10),

            // Post Description
            Text(
              widget.postContent,
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 8),

            // Optional Post Image
            if (widget.hasImage == true &&
                widget.postImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  widget.postImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),

            // Like, Comment, Share
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  icon: Icon(
                    _isLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_alt_outlined,
                    color: fbPrimary,
                    size: 18,
                  ),
                  label: Text(
                    '${(widget.numOfLikes ?? 0) +
                        (_isLiked ? 1 : 0)}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: fbDarkPrimary,
                    ),
                  ),
                ),

                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _showComments = !_showComments;
                    });
                  },
                  icon: const Icon(
                    Icons.comment,
                    color: fbDarkPrimary,
                    size: 18,
                  ),
                  label: const Text(
                    'Comment',
                    style: TextStyle(fontSize: 12),
                  ),
                ),

                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Share button clicked!'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: fbDarkPrimary,
                    size: 18,
                  ),
                  label: const Text(
                    'Share',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            // Comment Input
            Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                  child: Icon(Icons.person, size: 17),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: const TextStyle(fontSize: 11),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _addComment(),
                  ),
                ),
                IconButton(
                  onPressed: _addComment,
                  icon: const Icon(
                    Icons.send,
                    color: fbPrimary,
                    size: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // View Comments
            GestureDetector(
              onTap: () {
                setState(() {
                  _showComments = !_showComments;
                });
              },
              child: Text(
                _comments.isEmpty
                    ? 'View all comments'
                    : 'View all ${_comments.length} comments',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Comment List
            if (_showComments)
              ..._comments.map(
                (comment) => Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.person, size: 15),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            comment,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
