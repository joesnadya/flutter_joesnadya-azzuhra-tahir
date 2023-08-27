Summary - Advance Function - Async-Await - Collection

1. Fungsi Lanjutan
    - Anonymous Function: Tidak memiliki nama, fungsi/function dijadikan sebagai data.
    - Arrow Function: Dapat menuliskan funtion menjadi lebih ringkas, dapat memiliki nama atau tidak, berisi satu data (dari proses maupun data statis), nilai return fungsi ini diambil dari data tersebut.

2. Async-Await

Dengan async-await, kita dapat menjalankan beberapa proses secara bersamaan tanpa harus menunggu satu selesai sebelum menjalankan yang lain. Kita menulis proses-proses ini dalam bentuk fungsi, dan await digunakan untuk menunggu hingga proses async selesai. Sebagai contoh, jika kita memiliki dua fungsi, P1 dan P2, di mana P1 memiliki proses async yang memakan waktu 1 detik, maka P1 akan menunggu selama 1 detik sebelum dijalankan. Namun, jika P2 tidak memiliki proses async, itu akan dijalankan segera.

Dengan kata lain, P2 akan dijalankan terlebih dahulu, dan kemudian setelah menunggu 1 detik (menggunakan Future-delayed), P1 akan dijalankan. Ini memungkinkan kita menggunakan async-await dan Future untuk mengatur proses async dengan cara yang lebih mirip dengan proses syncronous. Proses syncronous berjalan dari atas ke bawah, satu per satu, sedangkan proses async memungkinkan beberapa proses untuk berjalan secara bersamaan tanpa harus menunggu satu sama lain.

3. Tipe Data Future

Dengan menggunakan future dapat menggunakan proses yang dapat ditunggu atau diberikan durasi lalu membawa data return dari fungsi async. Pada Future sendiri berjalan secara asyncronus. 

4. Collection

Strukture data yang lebih canggih untuk menangani masalah yang lebih kompleks, Collection bisa menyimpan kumpulan data dalam satu tempat.
    - List: Menyimpan data secara berbaris, tiap data memiliki index.
    - Map: Menyimpan data secara key-value, setiap key memiliki valuenya masing - masing. Key berguna selayaknya index pada list.
