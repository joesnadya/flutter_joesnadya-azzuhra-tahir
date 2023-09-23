Summary - Dialog Bottom Sheet

Dialog dan BottomSheet adalah dua widget yang digunakan dalam Flutter untuk menampilkan konten yang tumpang tindih dengan konten utama.

1. Alert Dialog

Dialog adalah elemen tampilan yang menampilkan konten dalam jendela pop-up di atas konten utama. Dialog sering digunakan untuk menampilkan pesan, konfirmasi, atau meminta input dari pengguna. Flutter menyediakan berbagai jenis dialog, termasuk AlertDialog, SimpleDialog, dan CupertinoAlertDialog, masing-masing dengan penampilan dan perilaku yang berbeda untuk memenuhi kebutuhan aplikasi.  Cara membuatnya:

    showDialog(
        context: context,
        builder: (context) => DialogSheet(
        image: image,
        name: name,
    ));

2. Bottom Sheet

BottomSheet adalah elemen tampilan yang menampilkan konten di bagian bawah layar, menutupi sebagian dari konten utama. BottomSheet biasanya digunakan untuk menampilkan menu, filter, atau opsi tambahan. Flutter menyediakan berbagai jenis BottomSheet, seperti PersistentBottomSheet dan ModalBottomSheet, masing-masing dengan perilaku yang berbeda. Cara membuatnya:

    showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            context: context,
        builder: (context) => BottomSheetComponent(
        image: items[index].image, name: items[index].name),
    );

Kedua widget ini dapat disesuaikan dengan gaya dan perilaku aplikasi menggunakan properti dan metode yang disediakan oleh Flutter, termasuk pengaturan ukuran, warna, jenis huruf, dan animasi sesuai dengan desain aplikasi.