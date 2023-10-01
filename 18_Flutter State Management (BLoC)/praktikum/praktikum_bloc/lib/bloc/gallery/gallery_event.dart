abstract class GalleryEvent {}

// Event AddGalleryEvent untuk menambahkan gambar ke galeri
class AddGalleryEvent extends GalleryEvent {
  final String selectedImage;

  AddGalleryEvent({
    required this.selectedImage
  });
}