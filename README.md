# Templat LaTeX Proposal & Laporan Tugas Akhir — Teknik Informatika UIN Suska Riau

Templat LaTeX untuk **Proposal Tugas Akhir** dan **Laporan Tugas Akhir** Jurusan Teknik Informatika,
Fakultas Sains dan Teknologi, UIN Sultan Syarif Kasim Riau. Formatnya disesuaikan dengan
*Template Laporan Tugas Akhir* jurusan (versi Word/PDF).

**Pembuat (Creator):** Benny Sukma Negara — Jurusan Teknik Informatika, FST UIN Suska Riau (bsnegara@uin-suska.ac.id)
**Hak Cipta © 2026 Benny Sukma Negara.** Pemegang hak cipta source LaTeX ini adalah Benny Sukma Negara. Lihat `HAK_CIPTA.md`.

## Kompilasi
- **Overleaf**: Menu → Compiler **XeLaTeX**. Biber dipakai otomatis untuk daftar pustaka.
- **Lokal**: `latexmk -xelatex main.tex` (TeX Live lengkap + `biber`).
- Font: Times New Roman (otomatis beralih ke Liberation Serif / TeX Gyre Termes bila tidak terpasang).

## Proposal atau Laporan
Ubah baris pertama `main.tex`:

| Baris | Hasil |
|---|---|
| `\documentclass{suskaskripsi}` | **PROPOSAL TUGAS AKHIR**: sampul, lembar persetujuan, daftar isi/gambar/tabel/rumus, Bab 1–3 (+ jadwal), daftar pustaka, lampiran |
| `\documentclass[laporan]{suskaskripsi}` | **TUGAS AKHIR**: + lembar pengesahan, HAKI, pernyataan, persembahan, abstrak/abstract, kata pengantar, Bab 4–5, daftar riwayat hidup |

Opsi lain (dapat digabung, mis. `[laporan,tanpapetunjuk]`): `ieee` (sitasi numerik), `nomoratas` (nomor halaman kanan atas), `tanpapetunjuk` (menyembunyikan teks petunjuk abu-abu `\isi{...}`).

## Cara pakai singkat
1. Isi `metadata.tex` (judul, nama, NIM, pembimbing, tanggal, dan—untuk laporan—dekan, ketua jurusan, dewan penguji). Data yang dikosongkan `{}` tampil sebagai titik-titik untuk diisi tangan.
2. Tulis isi bab di `chapters/`. Teks abu-abu `\isi{...}` adalah petunjuk; hapus setelah diisi.
3. Tambahkan pustaka di `bibliography/references.bib`; sitasi dengan `\parencite{kunci}` → (Penulis, tahun) atau `\textcite{kunci}` → Penulis (tahun).

## Format yang diterapkan (sesuai templat jurusan)
| Unsur | Format |
|---|---|
| Kertas, margin | A4; kiri 4 cm, atas 4 cm, kanan 3 cm, bawah 3 cm |
| Huruf, spasi | Times New Roman 12 pt; spasi 1,5; paragraf tanpa inden dengan jarak antarparagraf; rata kiri-kanan |
| Judul bab | `BAB 1` dan `PENDAHULUAN` 16 pt tebal, tengah, kapital |
| Subbab | `1.1` 14 pt tebal; `1.1.1` 12 pt tebal |
| Penomoran butir | 1. → a. → i. (maksimal tiga tingkat) |
| Gambar/tabel/rumus | Bernomor urut satu naskah: `Gambar 1`, `Tabel 1`, `(1)`; keterangan 10 pt tebal (gambar di bawah, tengah; tabel di atas, rata kiri); tabel bergaris penuh |
| Halaman awal | Sampul (i), lalu ii, iii, ... (romawi kecil); semua lembar masuk Daftar Isi |
| Nomor halaman | Bawah tengah; isi mulai 1 pada BAB 1 |
| Daftar pustaka | APA 7 (biblatex-apa), inden gantung |

## Perintah bantu
- `\begin{rumus}{Nama Rumus} ... \end{rumus}` — rumus bernomor yang otomatis tercantum di **Daftar Rumus**.
- Ingin "dkk." alih-alih "et al." pada sitasi: hapus tanda `%` pada baris `\DefineBibliographyStrings{indonesian}{andothers={dkk\adddot}}` di `suskaskripsi.cls`.
- `\gambar[0.7\textwidth]{berkas.png}` — sisipkan dari `images/`; bila belum ada tampil kotak penanda (tidak error).
- `\bagianawal{JUDUL}` — halaman tanpa nomor bab yang masuk Daftar Isi.
- `\tampil{judul}`, `\tampil{nama}`, `\tampil{jenis}`, ... — memanggil isi metadata di naskah.
- `\Lampiran` — mulai penomoran LAMPIRAN A, B, ...

## Struktur
```
main.tex                 berkas utama (urutan bagian naskah)
metadata.tex             data judul/nama/NIM/pembimbing/penguji/tanggal
suskaskripsi.cls         kelas dokumen (seluruh format)
chapters/                bab1_pendahuluan, bab2_kajian_pustaka, bab3_metodologi,
                         bab4_pembahasan, bab5_penutup (bab 4-5 khusus laporan)
frontmatter/             persembahan, abstrak, kata_pengantar, riwayat_hidup,
                         daftar_singkatan, daftar_simbol
appendices/              lampiran_a.tex, dst.
bibliography/            references.bib
contoh/contoh_elemen.tex gambar, subgambar, tabel, diagram alir TikZ, rumus, algoritma, kode
images/                  logo-uin-suska.png dan gambar naskah
```

## Cara mengutip
Negara, B. S. (2026). *Templat LaTeX Proposal dan Laporan Tugas Akhir Teknik Informatika UIN Sultan Syarif Kasim Riau* (Versi 2.0.0) [Perangkat lunak]. Zenodo. https://doi.org/DOI-ANDA

Klik **Cite this repository** di halaman GitHub untuk format APA/BibTeX.

## Hak Cipta dan Lisensi
Hak Cipta © 2026 **Benny Sukma Negara**. Pembuat dan pemegang hak cipta source LaTeX ini adalah Benny Sukma Negara.
Dilisensikan di bawah **CC BY-NC 4.0** (lihat `LICENSE` dan `HAK_CIPTA.md`): boleh dipakai, dibagikan, dan diubah untuk keperluan non-komersial dengan mencantumkan nama pembuat.
Pernyataan pembuat dan hak cipta pada setiap berkas source tidak boleh dihapus.
Logo UIN Suska Riau adalah milik universitas dan tidak termasuk dalam lisensi ini.
