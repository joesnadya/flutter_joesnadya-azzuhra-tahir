Summary - Flutter State Management (Provider)

Provider menggunakan konsep InheritedWidget, yang memungkinkan berbagi data dalam hierarki widget. Ketika ada perubahan dalam status, Provider akan secara otomatis memperbarui semua widget yang bergantung pada status tersebut.

Provider memiliki berbagai fitur yang berguna untuk mengelola status dalam aplikasi Flutter. Beberapa fitur tersebut mencakup:

    - ChangeNotifier: Ini adalah kelas yang dapat mengubah status dan memberi tahu widget yang menggunakannya tentang perubahan tersebut. Ketika ada perubahan dalam status, ChangeNotifier akan memberi tahu widget yang mengandalkan status tersebut untuk memperbarui tampilan mereka.

    - notifyListeners(): Ini digunakan untuk memberi tahu semua pendengar (widget) yang terhubung ke provider bahwa ada perubahan dalam data yang disediakan oleh provider. Ketika Anda memanggil fungsi notifyListeners(), semua widget yang terhubung ke provider akan diperbarui sesuai dengan data terbaru dari provider.

    - Provider: Ini adalah widget yang memasukkan status ke dalam pohon widget dan memungkinkan widget lain untuk mengaksesnya.

    - Provider.of(): Ini digunakan untuk mengambil nilai dari status yang disediakan oleh provider. Namun, sebaiknya tidak menggunakannya hanya untuk mengakses nilai status karena ini dapat menyebabkan pembaruan yang tidak perlu pada seluruh widget yang menggunakan provider. Sebaliknya, lebih baik menggunakan Consumer untuk mengoptimalkan kinerja aplikasi.

    - Consumer: Ini adalah widget yang digunakan untuk menampilkan widget yang bergantung pada nilai status dari provider. Consumer akan memperbarui widget di dalamnya ketika ada perubahan dalam status yang diambil dari provider.

    - context.watch<T>(): Ini membuat widget mendengarkan perubahan dalam T dan akan memperbarui seluruh widget dalam build() jika ada perubahan.

    - context.read<T>(): Ini mengembalikan nilai T tanpa mendengarkan perubahan, dan digunakan saat Anda ingin mengakses nilai dari widget yang terbungkus dalam widget Consumer.