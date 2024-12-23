class User {
  final int id;
  final String firstName;
  final String? lastName;
  final String? username;
  final bool? isBot;
  final String? languageCode;
  final bool? isPremium;
  final String? photoUrl;
  final int? authDate;
  final String? hash;

  User(
      {required this.id,
      required this.firstName,
      this.lastName,
      this.username,
      this.isBot,
      this.languageCode,
      this.isPremium,
      this.photoUrl,
      this.authDate,
      this.hash});
}
