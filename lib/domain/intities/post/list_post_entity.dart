import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/data/model/post/list_post_model.dart';

class ListPostEntity extends Equatable {
  ListPostEntity({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.owner,
    this.updatedDate = "",
  });
  late final String id;
  late final String image;
  late final int likes;
  late final List<String> tags;
  late final String text;
  late final String publishDate;
  late final String? updatedDate;
  late final OwnerModel owner;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        image,
        likes,
        tags,
        text,
        publishDate,
        updatedDate,
        owner,
      ];
}

class OwnerEntity extends Equatable {
  OwnerEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  late final String id;
  late final String firstName;
  late final String lastName;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
      ];
}
