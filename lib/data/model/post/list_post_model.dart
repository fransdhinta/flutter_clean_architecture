import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/domain/intities/post/list_post_entity.dart';

class ListPostModel extends Equatable {
  ListPostModel({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    this.updatedDate = "",
    required this.owner,
  });
  late final String id;
  late final String image;
  late final int likes;
  late final List<String> tags;
  late final String text;
  late final String publishDate;
  late final String? updatedDate;
  late final OwnerModel owner;

  ListPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = List.castFrom<dynamic, String>(json['tags']);
    text = json['text'];
    publishDate = json['publishDate'];
    updatedDate = json['updatedDate'];
    owner = OwnerModel.fromJson(json['owner']);
  }

  ListPostEntity toEntity() => ListPostEntity(
      id: id,
      image: image,
      likes: likes,
      tags: tags,
      text: text,
      publishDate: publishDate,
      updatedDate: updatedDate,
      owner: owner);

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

class OwnerModel extends Equatable {
  OwnerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  late final String id;
  late final String firstName;
  late final String lastName;

  OwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        lastName,
      ];
}
