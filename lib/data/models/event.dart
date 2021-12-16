import 'package:equatable/equatable.dart';

import 'category.dart';

class Event extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<Category> categories;
  final String address;
  final DateTime dateTime;
  final int volunteersNeeded;
  final int volunteersJoined;
  final String authorId;
  final String imageUrl;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.categories,
    required this.address,
    required this.dateTime,
    required this.volunteersNeeded,
    required this.volunteersJoined,
    required this.authorId,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        categories,
        address,
        dateTime,
        volunteersNeeded,
        volunteersJoined,
        authorId,
        imageUrl,
      ];
}
