Summary - Basic version and Branch Management

Di dalam git ada yang namanya versioning. Versioning adalah cara untuk mengatur versi dari source code suatu program. Git adalah sebuah version control system yang terkenal yang sudah banyak digunakan oleh para developer untuk mengembangkan software mereka secara kolaborasi tim. Git akan memantau setiap perubahan yang terjadi di dalamnya. Pada Git, terdapat fitur bernama commit, commit berfungsi untuk menyimpan perubahan yang nantinya akan dilakukan tetapi tidak akan terjadi perubahan pada repository tersebut (catatan perubahan).

Cara instalasi GIT di Apple:

    1. Download git terbaru untuk versi Mac di website git
    2. Install
    3. Buka terminal dan ketik "git --version"

Cara instalasi GIT di Windows:

    1. Download git terbaru untuk versi Windows di website git
    2. Setelah selesai download git nya, jalankan installer bernama "Git Setup" lalu ikuti dan finish.
    3. Jalankan command prompt dan ketik "git --version"

Notes: Perintah dasar di GIT

    1. git config: Untuk mengatur konfigurasi sesuai keinginan. Contoh : buka terminal lalu ketik "git config --global namaUser emailUser@gmail.com"
    2. git init: Untuk membuat repository baru. 
    3. git add: Perintah yang biasa digunakan untuk menambah file ke index/StagingArea. Digunakan jika ingin memasukkan semua perubahan file yang ada di repo tersebut.
    4. git commit: Perintah untuk melakukan commit pada perubahan, perubahan yang dilakukan di commit tidak akan langsung masuk ke remote repository.
    5. git status: Perintah untuk menampilakn daftar file yang berubah. Contoh : ketikkan "git status"
    6. git checkout: Perintah untuk membuat branch ataupun berpindah branch.
    7. git pull: Perintah untuk menggabungkan semua perubahan yang ada di remote repository ke dalam direktori lokal. 
    8. git merge: Perintah untuk menggabungkan satu ke branch lain yang aktif. 
    9. git reset: Perintah untuk mengulang/reset index. Di git reset ini terdapat dua opsi yaitu reset hard ataupun reset soft. 
    10. git rm: Perintah untuk menghapus/remove file dari index dan direkotri. Contoh: "git rm namaFile"
