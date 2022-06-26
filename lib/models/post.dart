class Post {
  String id;
  String profileImagrUrl;
  String comment;
  String foodPictureUrl;
  String timeStamp;

  Post(
      {required this.id,
      required this.profileImagrUrl,
      required this.comment,
      required this.foodPictureUrl,
      required this.timeStamp});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      profileImagrUrl: json['profileImageUrl'] ?? '',
      comment: json['comment'] ?? '',
      foodPictureUrl: json['foodPictureUrl'] ?? '',
      timeStamp: json['timeStamp'] ?? '',
    );
  }
}
