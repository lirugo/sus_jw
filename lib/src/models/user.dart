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

  factory User.fromInitData(Map<String, dynamic> map) {
    final data = map['user'];
    final user = User(
      id: data['id'],
      firstName: data['first_name']!,
      lastName: data['last_name'],
      username: data['username'],
      isBot: data['is_bot'] == 'true',
      languageCode: data['language_code'],
      isPremium: data['is_premium'] == 'true',
      photoUrl: data['photo_url'],
      authDate: int.tryParse(data['auth_date'] ?? ''),
      hash: data['hash'],
    );

    return user;
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, username: $username, isBot: $isBot, languageCode: $languageCode, isPremium: $isPremium, photoUrl: $photoUrl, authDate: $authDate, hash: $hash}';
  }
}
