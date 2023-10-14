import 'package:flutter/material.dart';
import '../models/gallery_model.dart';

class MyImageProvider extends ChangeNotifier {
  List<ImageModel> _images = [];

  List<ImageModel> get images => _images;

  void addImage(ImageModel image) {
    _images.add(image);
    notifyListeners();
  }
}
