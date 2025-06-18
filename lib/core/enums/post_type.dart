enum PostType {
  facebook('facebook', 'comment_no', 'likes_no'),
  instagram('instagram', 'comment_no', 'likes_no'),
  tiktok('tiktok', 'comments', 'likes');

  final String title;
  final String commentNo;
  final String likesNo;
  const PostType(this.title, this.commentNo, this.likesNo);
}