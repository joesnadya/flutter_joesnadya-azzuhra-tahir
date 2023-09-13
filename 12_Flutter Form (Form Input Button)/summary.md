Summary - Flutter Form

1. Form
Form digunakan untuk mengumpulkan data dari pengguna, dan pengguna dapat mengisi lebih dari satu data. Untuk membuat Form, kita perlu menggunakan StatefulWidget, dan keadaan Form akan disimpan menggunakan GlobalKey.

2. Input
    - TextField: TextField digunakan untuk menerima input teks dari pengguna dan memungkinkan pengguna mengisi lebih dari satu data. Untuk menggunakan TextField, kita perlu menggunakan TextEditingController untuk mengambil data yang diisi pengguna.
    - Radio: Radio digunakan untuk memberikan pilihan kepada pengguna di mana mereka hanya dapat memilih satu opsi. Untuk membuat Radio, kita harus menggunakan properti dengan tipe data yang sesuai dengan nilai (value) pada Radio, dan tindakan akan terjadi saat onChanged dipanggil.
    - Checkbox: Checkbox adalah widget yang memungkinkan pengguna memilih beberapa opsi sekaligus. Saat membuat Checkbox, kita perlu menggunakan properti dengan tipe data boolean.
    - Dropdown Button: Dropdown Button memberikan opsi kepada pengguna di mana mereka hanya dapat memilih satu opsi, dan opsi tersebut tidak ditampilkan secara permanen. Opsi akan muncul saat widget ini ditekan. Untuk mengambil data dari Dropdown Button, kita menggunakan properti dengan tipe data yang sesuai dengan nilai (value) pada DropdownMenuItem.

3. Button
Tombol digunakan untuk menjalankan tindakan tertentu ketika ditekan oleh pengguna.
    - ElevatedButton: ElevatedButton adalah tombol yang menonjol dan akan menjalankan tindakan yang ditentukan saat onPressed dipanggil.
    - IconButton: IconButton adalah tombol yang hanya menampilkan ikon, dan tindakan akan terjadi saat tombol ini ditekan, seperti yang terjadi pada ElevatedButton. Untuk menggunakan IconButton, kita perlu menggunakan properti Icon.