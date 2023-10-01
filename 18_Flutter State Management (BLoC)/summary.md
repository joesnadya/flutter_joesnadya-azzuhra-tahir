Summary - Flutter State Management (BLoC)

Bloc (Business Logic Component) adalah sebuah konsep yang digunakan dalam state management di Flutter yang memisahkan logika bisnis dari tampilan widget. Bloc terdiri dari dua elemen utama, yaitu event dan state. Berikut adalah beberapa elemen penting terkait dengan konsep Bloc:

    - Cubit (Combination of Business Logic and Input Transformation) adalah sebuah konsep state management di Flutter yang digunakan untuk mengelola state dalam aplikasi. Berbeda dengan Bloc, Cubit lebih sederhana karena tidak menggunakan event dan hanya fokus pada perubahan state.

    - Event adalah tindakan atau peristiwa yang terjadi dalam aplikasi dan dapat memicu perubahan pada state. Event digunakan untuk mengirim informasi dari tampilan widget ke Bloc.

    - State adalah data yang dihasilkan oleh Bloc atau Cubit dan digunakan untuk mengontrol tampilan widget dalam aplikasi. State dapat berubah tergantung pada event atau input yang diterima oleh Bloc atau Cubit.

    - BlocProvider adalah sebuah widget yang digunakan untuk menyediakan Bloc ke seluruh aplikasi Flutter. Ini memudahkan pengembang dalam mengelola Bloc dalam aplikasi mereka.

    - BlocBuilder adalah widget yang digunakan untuk membangun tampilan widget dalam aplikasi berdasarkan state yang dihasilkan oleh Bloc atau Cubit. BlocBuilder secara otomatis akan memperbarui tampilan ketika terjadi perubahan pada state.

    - BlocListener adalah widget yang digunakan untuk mendengarkan perubahan pada Bloc atau Cubit dan melakukan tindakan tertentu ketika perubahan terjadi. Biasanya, BlocListener digunakan untuk menampilkan notifikasi atau pesan kesalahan dalam aplikasi.

    - BlocConsumer adalah gabungan antara BlocBuilder dan BlocListener yang digunakan untuk membangun tampilan widget dan mendengarkan perubahan pada Bloc atau Cubit. BlocConsumer dapat memperbarui tampilan widget dan menampilkan notifikasi atau pesan kesalahan ketika ada perubahan pada state.

    - context.watch(): Ini digunakan untuk membuat widget mendengarkan perubahan pada T dan akan memicu pengembalian render ulang untuk seluruh widget yang ada dalam Widget build().

    - context.read(): Ini mengembalikan T tanpa mendengarkan perubahan, dan digunakan ketika ingin mengakses nilai dari widget yang dibungkus oleh widget Consumer.