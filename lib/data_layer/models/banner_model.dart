import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/domain/entities/banner.dart';

class BannerModel extends BannerEntity implements Equatable {
  BannerModel(
      {required int id,
      required String title,
      required String content,
      required String imageUrl})
      : super(id, title, content, imageUrl);

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        imageUrl: json['image_url']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, content, imageUrl];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
