class User {
  final String userName;
  final String uid;
  final String email;
  final String bio;
  final String photoURL;
  final List followers;
  final List following;

  User(
      {required this.userName,
      required this.uid,
      required this.email,
      required this.bio,
      required this.photoURL,
      required this.followers,
      required this.following});
  Map<String,dynamic> toJson() => {
    'userName': userName,
    'uid': uid,
    'email': email,
    'bio': bio,
    'photoURL': photoURL,
    'followers': followers,
    'following': following,

  };
}
