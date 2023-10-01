abstract class GalleryState {}

// State awal ketika galeri belum dimuat
class InitiateGalleryState extends GalleryState {}

// State yang menunjukkan gambar yang dipilih dalam galeri ditampilkan
class ShowGalleryState extends GalleryState {
  final String selectedImage;

  ShowGalleryState({
    required this.selectedImage,
  });
}