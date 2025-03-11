<h1>Menggabungkan ts/mp4 ke mkv untuk hasil unduhan UC Browser</h1><br/>
Jika kamu pernah mengunduh video yang hasilnya berformat m3u8 dari UC Browser.
<br/>sebenarnya itu hanya file berisi baris informasi beberapa bagian ts video yang berada di subfolder, foldernya biasa berakhir dengan nama "_contents"<br/>
Misalnya Lalu kamu ingin mengubahnya ke dalam 1 berkas video.<br/><h2>Caranya:</h2><br/>

1. Unduh semua script di atas. ubah chrome ke tampilan desktop lalu unduh sebagai zip, lalu ekstrak/unzip ke folder Unduhan/Downloads.<br/>Install aplikasi <a href="https://mt-manager.en.uptodown.com/android">MT manager</a>.<br/>Unduh/install <a href="https://github.com/Magisk-Modules-Repo/busybox-ndk">busybox</a>.<br/>Buka Mt manager, arahkan ke folder busybox berada,kalau kamu mengunduh via Chrome pasti ada di folder Unduhan/Downloads<br/>Install busybox dengan ketik:<br/><pre>bash busyboxInstaller.sh</pre><br/>Memasang Busybox ini hanya sekali<br/>
Setelah busybox terpasang, lalu install
<a href="https://github.com/jendraljack/ffmpeg-static-installer-mtmanager/tree/main"> ffmpeg untuk mt manager</a>.<br/>
2. Hasil Unduhan semua script di atas tadi,simpanlah ke folder "UCdownloads/video" tersimpan. kecuali berkas busyboxInstaller.sh
<br/>3. Buka terminalnya.
ketik perintah<br/>
<pre>bash m3u8.mergerBlackskull.sh berkas.m3u8</pre>
<br/>Hasilnya adalah hanya salinan berformat mkv.(mode cepat)<br/>
Tapi setidaknya kita sudah membuat 1 kontainer mkv berisi ts video.<br/>Kamu bisa convert lagi mkv ke mp4 via online.
