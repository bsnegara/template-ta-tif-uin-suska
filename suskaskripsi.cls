%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% suskaskripsi.cls
%% Templat LaTeX Proposal & Laporan Tugas Akhir
%% Jurusan Teknik Informatika, Fakultas Sains dan Teknologi
%% Universitas Islam Negeri Sultan Syarif Kasim Riau (UIN Suska Riau)
%%
%% ------------------------------------------------------------------
%% Pembuat (Creator)  : Benny Sukma Negara
%%                      Jurusan Teknik Informatika, Fakultas Sains dan
%%                      Teknologi, UIN Sultan Syarif Kasim Riau
%%                      bsnegara@uin-suska.ac.id
%% Hak Cipta (c) 2026 Benny Sukma Negara. Seluruh hak dilindungi.
%% Pemegang hak cipta source LaTeX ini adalah Benny Sukma Negara.
%%
%% Mahasiswa diperkenankan memakai dan mengubah templat ini untuk
%% menulis proposal/laporan tugas akhir. Pernyataan pembuat dan hak
%% cipta ini tidak boleh dihapus atau diubah dari berkas source.
%% ------------------------------------------------------------------
%%
%% Format mengikuti "Template Laporan Tugas Akhir" Jurusan Teknik
%% Informatika UIN Suska Riau (kertas A4; margin kiri 4 cm, atas 4 cm,
%% kanan 3 cm, bawah 3 cm; Times New Roman 12 pt; spasi 1,5).
%%
%% Kompilator : XeLaTeX (atau LuaLaTeX) + Biber
%% Opsi kelas : laporan       -> Laporan Tugas Akhir (default: Proposal)
%%              ieee          -> sitasi numerik IEEE (default: APA 7)
%%              nomoratas     -> nomor halaman kanan atas
%%                               (default: bawah tengah, sesuai templat)
%%              tanpapetunjuk -> sembunyikan semua penanda \isi{...}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{suskaskripsi}[2026/11/03 v2.0 Templat Proposal/Laporan TA TIF UIN Suska Riau (c) Benny Sukma Negara]

\newcommand{\SUSKA@pembuat}{Benny Sukma Negara}
\newcommand{\SUSKA@hakcipta}{Hak Cipta (c) 2026 Benny Sukma Negara}
\typeout{suskaskripsi.cls -- Pembuat: \SUSKA@pembuat. \SUSKA@hakcipta.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. OPSI KELAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\iflaporan         \laporanfalse   % dipakai juga di main.tex
\newif\ifSUSKA@ieee      \SUSKA@ieeefalse
\newif\ifSUSKA@numatas   \SUSKA@numatasfalse
\newif\ifSUSKA@petunjuk  \SUSKA@petunjuktrue
\DeclareOption{proposal}{\laporanfalse}
\DeclareOption{laporan}{\laporantrue}
\DeclareOption{apa}{\SUSKA@ieeefalse}
\DeclareOption{ieee}{\SUSKA@ieeetrue}
\DeclareOption{nomoratas}{\SUSKA@numatastrue}
\DeclareOption{tanpapetunjuk}{\SUSKA@petunjukfalse}
\DeclareOption*{\ClassWarning{suskaskripsi}{Opsi `\CurrentOption' tidak dikenal}}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,oneside,openany]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. PARAMETER FORMAT  (sesuai Template Laporan Tugas Akhir TIF)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\SUSKA@marginkiri}{40mm}
\newcommand{\SUSKA@marginkanan}{30mm}
\newcommand{\SUSKA@marginatas}{40mm}
\newcommand{\SUSKA@marginbawah}{30mm}
% Spasi 1,5 seperti pada pengolah kata (Times New Roman 12 pt -> 20,7 pt)
\newcommand{\SUSKA@spasi}{1.43}
% Jarak antarparagraf (paragraf tanpa inden baris pertama, seperti templat)
\newcommand{\SUSKA@jarakparagraf}{8pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. PAKET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fontspec}
\RequirePackage[provide=*, main=indonesian]{babel}
\RequirePackage[a4paper,
  left=\SUSKA@marginkiri, right=\SUSKA@marginkanan,
  top=\SUSKA@marginatas,  bottom=\SUSKA@marginbawah,
  headheight=15pt, headsep=10mm, footskip=12mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[titles]{tocloft}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta, positioning}
\RequirePackage{microtype}
\RequirePackage[style=english]{csquotes}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. FONT  (Times New Roman; cadangan otomatis bila tidak terpasang)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{%
  \IfFontExistsTF{Liberation Serif}{\setmainfont{Liberation Serif}}{%
    \setmainfont{TeX Gyre Termes}}}
\IfFontExistsTF{Courier New}{\setmonofont[Scale=MatchLowercase]{Courier New}}{%
  \IfFontExistsTF{Liberation Mono}{\setmonofont[Scale=MatchLowercase]{Liberation Mono}}{%
    \setmonofont[Scale=MatchLowercase]{TeX Gyre Cursor}}}

% Ukuran huruf judul (pt): 16 = judul bab/halaman, 14 = subbab/judul TA
\newcommand{\SUSKA@enambelas}{\fontsize{16}{19.3}\selectfont}
\newcommand{\SUSKA@empatbelas}{\fontsize{14}{16.9}\selectfont}
\newcommand{\SUSKA@duabelas}{\fontsize{12}{14.5}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5. DAFTAR PUSTAKA  (biblatex + biber; APA 7 seperti templat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% biblatex tidak menyediakan berkas bahasa Indonesia (indonesian.lbx),
% sehingga bahasa naskah (indonesian) dipetakan ke string bahasa Inggris
% gaya APA/IEEE. Tanpa pemetaan ini, sitasi tampil rusak, mis.
% "(LeCun andothers, labelyearlabelyeardivision...)".
\ifSUSKA@ieee
  \RequirePackage[backend=biber, style=ieee, sorting=none,
    doi=true, isbn=false, url=true, eprint=false]{biblatex}
  \DeclareLanguageMapping{indonesian}{english}
\else
  \RequirePackage[backend=biber, style=apa, sorting=nyt,
    maxcitenames=2, maxbibnames=99,
    doi=true, isbn=false, url=true, eprint=false]{biblatex}
  \DeclareLanguageMapping{indonesian}{english-apa}
  \DeclareLanguageMapping{english}{english-apa}
\fi
% Opsional: pakai "dkk." alih-alih "et al." (hapus tanda % di bawah)
% \DefineBibliographyStrings{indonesian}{andothers={dkk\adddot}}
\addbibresource{bibliography/references.bib}

\setlength{\bibitemsep}{\SUSKA@jarakparagraf}
\setlength{\bibhang}{36pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6. METADATA  (diisi pada metadata.tex)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\SUSKA@defmeta}[2]{%
  \expandafter\newcommand\csname #1\endcsname[1]{\expandafter\gdef\csname SUSKA@#1\endcsname{##1}}%
  \expandafter\gdef\csname SUSKA@#1\endcsname{#2}}

\SUSKA@defmeta{judul}{}
\SUSKA@defmeta{nama}{}
\SUSKA@defmeta{nim}{}
\SUSKA@defmeta{sebutanprodi}{Jurusan}
\SUSKA@defmeta{prodi}{Teknik Informatika}
\SUSKA@defmeta{fakultas}{Sains dan Teknologi}
\SUSKA@defmeta{universitas}{Universitas Islam Negeri Sultan Syarif Kasim Riau}
\SUSKA@defmeta{kota}{Pekanbaru}
\SUSKA@defmeta{tahun}{\the\year}
\SUSKA@defmeta{gelar}{Sarjana Teknik}
\SUSKA@defmeta{pembimbingsatu}{}
\SUSKA@defmeta{nippembimbingsatu}{}
\SUSKA@defmeta{pembimbingdua}{}
\SUSKA@defmeta{nippembimbingdua}{}
\SUSKA@defmeta{tanggalpersetujuan}{}
% Khusus laporan
\SUSKA@defmeta{dekan}{}
\SUSKA@defmeta{nipdekan}{}
\SUSKA@defmeta{kaprodi}{}
\SUSKA@defmeta{nipkaprodi}{}
\SUSKA@defmeta{ketuapenguji}{}
\SUSKA@defmeta{pengujisatu}{}
\SUSKA@defmeta{pengujidua}{}
\SUSKA@defmeta{tanggalsidang}{}
\SUSKA@defmeta{tanggalpernyataan}{}

% Jenis naskah (otomatis dari opsi kelas)
\iflaporan
  \gdef\SUSKA@jenis{Tugas Akhir}
  \gdef\SUSKA@jenislengkap{Laporan Tugas Akhir}
\else
  \gdef\SUSKA@jenis{Proposal Tugas Akhir}
  \gdef\SUSKA@jenislengkap{Proposal Tugas Akhir}
\fi

% Judul dalam satu baris (pemenggal \\ diganti spasi), mis. di Lembar Pernyataan
\newcommand{\SUSKA@judulsebaris}{{\def\\{\unskip\space\ignorespaces}\SUSKA@judul}}
\AtBeginDocument{\pdfstringdefDisableCommands{\def\\{ }}}

% Memanggil isi metadata di dalam naskah, mis. \tampil{judul}, \tampil{jenis}
\newcommand{\tampil}[1]{\csname SUSKA@#1\endcsname}

% Titik-titik untuk diisi tangan bila suatu data dikosongkan
\newcommand{\SUSKA@atautitik}[2]{%
  \expandafter\ifx\csname SUSKA@#1\endcsname\@empty
    \makebox[#2]{\dotfill}\else\csname SUSKA@#1\endcsname\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 7. TATA LETAK, SPASI, PARAGRAF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setstretch{\SUSKA@spasi}
\setlength{\parindent}{0pt}
\setlength{\parskip}{\SUSKA@jarakparagraf}
\setlength{\emergencystretch}{3em}
\raggedbottom
\widowpenalty=10000
\clubpenalty=10000

% Tabel berspasi tunggal (seperti templat)
\AtBeginEnvironment{tabular}{\setstretch{1}}
\AtBeginEnvironment{tabularx}{\setstretch{1}}
\AtBeginEnvironment{longtable}{\setstretch{1}}

% Penomoran bertingkat: 1. -> a. -> i.  (maksimal 3 tingkat)
\setlist{topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate]{labelindent=18pt, leftmargin=36pt, labelsep=0pt,
  labelwidth=18pt, align=left}
\setlist[enumerate,1]{label=\arabic*.}
\setlist[enumerate,2]{label=\alph*.}
\setlist[enumerate,3]{label=\roman*., align=right, labelsep=6pt,
  labelwidth=18pt, leftmargin=42pt}
\setlist[itemize]{labelindent=18pt, leftmargin=36pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 8. KATA-KATA BAKU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\SUSKA@chaptitle}{BAB}
\newcommand{\SUSKA@appword}{LAMPIRAN}

\addto\captionsindonesian{%
  \renewcommand{\contentsname}{DAFTAR ISI}%
  \renewcommand{\listfigurename}{DAFTAR GAMBAR}%
  \renewcommand{\listtablename}{DAFTAR TABEL}%
  \renewcommand{\bibname}{DAFTAR PUSTAKA}%
  \renewcommand{\figurename}{Gambar}%
  \renewcommand{\tablename}{Tabel}%
  \renewcommand{\appendixname}{LAMPIRAN}}
\floatname{algorithm}{Algoritma}
\algrenewcommand\algorithmicrequire{\textbf{Masukan:}}
\algrenewcommand\algorithmicensure{\textbf{Keluaran:}}
\renewcommand{\lstlistingname}{Kode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 9. PENOMORAN  (BAB 1; 1.1; 1.1.1; Gambar 1; Tabel 1; (1))
%%    Gambar, tabel, dan rumus bernomor urut satu naskah, seperti templat.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\thechapter}{\arabic{chapter}}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\theequation}{\arabic{equation}}
\lstset{numberbychapter=false}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 10. JUDUL BAB / SUBBAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BAB 1 / PENDAHULUAN  -> 16 pt tebal, tengah, huruf kapital
\titleformat{\chapter}[display]
  {\centering\bfseries\SUSKA@enambelas}
  {\SUSKA@chaptitle\ \thechapter}
  {-\parskip}
  {\MakeUppercase}
\titleformat{name=\chapter, numberless}[block]
  {\centering\bfseries\SUSKA@enambelas}
  {}
  {0pt}
  {\MakeUppercase}
\titlespacing*{\chapter}{0pt}{-32pt}{21pt}
\titlespacing*{name=\chapter, numberless}{0pt}{-32pt}{24pt}

% 1.1 Subbab -> 14 pt tebal; 1.1.1 -> 12 pt tebal; 1.1.1.1 -> 12 pt tebal miring
\titleformat{\section}[hang]{\bfseries\SUSKA@empatbelas}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\bfseries\SUSKA@duabelas}{\thesubsection}{1.5em}{}
\titleformat{\subsubsection}[hang]{\bfseries\itshape\SUSKA@duabelas}{\thesubsubsection}{1.5em}{}
\titlespacing*{\section}{0pt}{-1pt}{-6pt}
\titlespacing*{\subsection}{0pt}{-1pt}{-6pt}
\titlespacing*{\subsubsection}{0pt}{-1pt}{-6pt}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 11. KEPALA/KAKI HALAMAN  (nomor halaman bawah tengah)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\thepage}}
\fancypagestyle{fancy}{%
  \fancyhf{}%
  \ifSUSKA@numatas\fancyhead[R]{\thepage}\else\fancyfoot[C]{\thepage}\fi}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 12. KETERANGAN GAMBAR/TABEL  (10 pt tebal; "Gambar 1 Judul")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\captionsetup{font={footnotesize,bf,stretch=1}, labelfont=bf,
  labelsep=space, skip=6pt}
\captionsetup[figure]{position=below, justification=centering}
\captionsetup[table]{position=above, justification=raggedright,
  singlelinecheck=false}
\captionsetup[lstlisting]{position=above, justification=raggedright,
  singlelinecheck=false}
\captionsetup[algorithm]{font={footnotesize,bf}}
\setlength{\abovecaptionskip}{6pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 13. DAFTAR ISI, DAFTAR GAMBAR, DAFTAR TABEL, DAFTAR RUMUS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Daftar Rumus (lor): diisi otomatis oleh lingkungan \begin{rumus}{Nama}
\newlistof{rumus}{lor}{DAFTAR RUMUS}
\renewcommand{\therumus}{\arabic{rumus}}

% Semua entri tidak tebal, bertitik-titik, rapat seperti templat
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappresnum}{\SUSKA@chaptitle\ }
\renewcommand{\cftdotsep}{1.5}
\setlength{\cftbeforechapskip}{5pt}
\setlength{\cftbeforesecskip}{5pt}
\setlength{\cftbeforesubsecskip}{5pt}
\setlength{\cftbeforesubsubsecskip}{5pt}
\setlength{\cftbeforefigskip}{5pt}
\setlength{\cftbeforetabskip}{5pt}
\setlength{\cftbeforerumusskip}{5pt}
\cftsetindents{section}{12pt}{30pt}
\cftsetindents{subsection}{24pt}{40pt}
\cftsetindents{subsubsection}{36pt}{50pt}

\renewcommand{\cftfigpresnum}{\figurename\ }
\renewcommand{\cfttabpresnum}{\tablename\ }
\renewcommand{\cftrumuspresnum}{}
\cftsetindents{figure}{0pt}{60pt}
\cftsetindents{table}{0pt}{50pt}
\cftsetindents{rumus}{0pt}{30pt}

% Lebar kotak "BAB 1 " di daftar isi mengikuti teksnya
\AtBeginDocument{%
  \settowidth{\cftchapnumwidth}{\SUSKA@chaptitle\ 88}%
  \addtolength{\cftchapnumwidth}{0.3em}}
% Entri bab di Daftar Isi ditulis kapital: BAB 1 PENDAHULUAN
\let\SUSKA@lchapter\l@chapter
\renewcommand*{\l@chapter}[2]{\SUSKA@lchapter{\MakeUppercase{#1}}{#2}}
% Tanpa jarak tambahan antarbab pada Daftar Gambar/Tabel/Rumus
\newcommand{\SUSKA@tanpajarakbab}[1]{\begingroup\let\addvspace\@gobble#1\endgroup}

% Dipanggil dari berkas .toc saat memasuki lampiran
\newcommand{\SUSKA@toclampiran}{%
  \renewcommand{\cftchappresnum}{\SUSKA@appword\ }%
  \settowidth{\cftchapnumwidth}{\SUSKA@appword\ M}%
  \addtolength{\cftchapnumwidth}{0.3em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 14. HYPERREF  (metadata PDF memuat pembuat templat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[hidelinks, bookmarksnumbered]{hyperref}
\RequirePackage{xurl}

\AtBeginDocument{%
  \hypersetup{pdftitle={\SUSKA@judul}, pdfauthor={\SUSKA@nama},
    pdfsubject={\SUSKA@jenislengkap\space\SUSKA@sebutanprodi\space\SUSKA@prodi, \SUSKA@universitas},
    pdfcreator={LaTeX suskaskripsi.cls oleh Benny Sukma Negara; \SUSKA@hakcipta}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 15. PERINTAH BANTU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Penanda bagian yang belum ditulis / petunjuk pengisian (abu-abu miring).
\newcommand{\isi}[1]{%
  \ifSUSKA@petunjuk\textcolor{gray}{\textit{[#1]}}\fi}

% Gambar dari folder images/. Bila berkas belum ada, tampil kotak penanda.
\newcommand{\gambar}[2][\textwidth]{%
  \IfFileExists{images/#2}%
    {\includegraphics[width=#1]{images/#2}}%
    {\fbox{\parbox[c][35mm][c]{0.8\textwidth}{\centering\small
      Gambar belum diunggah:\\\texttt{images/\detokenize{#2}}}}}}

% Halaman tanpa nomor bab yang masuk Daftar Isi (LEMBAR ..., ABSTRAK, dst.)
\newcommand{\bagianawal}[1]{%
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \chapter*{#1}%
  \thispagestyle{plain}}

% Rumus bernomor yang tercantum di Daftar Rumus:
%   \begin{rumus}{Nama Rumus} x = ... \label{eq:..} \end{rumus}
\NewDocumentEnvironment{rumus}{m}
  {\begin{equation}}
  {\end{equation}%
   \addcontentsline{lor}{rumus}{\protect\numberline{(\theequation)}#1}%
   \ignorespacesafterend}

% Blok tanda tangan rata kiri pada sisi kanan halaman
\newcommand{\SUSKA@blokkanan}[1]{%
  \par\noindent\hspace*{0.64\textwidth}%
  \begin{minipage}[t]{0.36\textwidth}\raggedright#1\end{minipage}\par}

% Gaya kode program
\lstdefinestyle{kode}{basicstyle=\ttfamily\small\setstretch{1}, numbers=left,
  numberstyle=\tiny\color{gray}, numbersep=6pt, frame=single,
  breaklines=true, breakatwhitespace=false, tabsize=4,
  showstringspaces=false, keywordstyle=\bfseries,
  commentstyle=\itshape\color{gray}, xleftmargin=1.6em,
  framexleftmargin=1.6em}
\lstset{style=kode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 16. HALAMAN SAMPUL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Judul TA: 14 pt tebal kapital, tengah
\newcommand{\SUSKA@judulbesar}{%
  {\SUSKA@empatbelas\bfseries\MakeUppercase{\SUSKA@judul}\par}}
% Jenis naskah: TUGAS AKHIR / PROPOSAL TUGAS AKHIR
\newcommand{\SUSKA@jenisbesar}[1]{%
  {#1\bfseries\MakeUppercase{\SUSKA@jenis}\par}}
% Oleh / NAMA (garis bawah) / NIM
\newcommand{\SUSKA@oleh}{%
  Oleh\par\vspace{7pt}
  {\bfseries\underline{\MakeUppercase{\SUSKA@nama}}\par
   NIM.\ \SUSKA@nim\par}}

\newcommand{\HalamanSampul}{%
  \clearpage\thispagestyle{empty}%
  \begingroup\centering\setlength{\parskip}{0pt}%
  \vspace*{-24pt}
  \SUSKA@judulbesar
  \vspace{26pt}
  \SUSKA@jenisbesar{\SUSKA@enambelas}
  \vspace{33pt}
  \iflaporan
    Disusun Sebagai Salah Satu Syarat\par
    Untuk Memperoleh Gelar \SUSKA@gelar\par
  \else
    Diajukan Sebagai Salah Satu Syarat\par
    Untuk Melaksanakan Penelitian Tugas Akhir\par
  \fi
  Pada \SUSKA@sebutanprodi\ \SUSKA@prodi\par
  \vspace{29pt}
  \SUSKA@oleh
  \vspace{26pt}
  \includegraphics[width=46mm]{images/logo-uin-suska.png}\par
  \vfill
  {\bfseries
    FAKULTAS \MakeUppercase{\SUSKA@fakultas}\par
    \MakeUppercase{\SUSKA@universitas}\par
    \MakeUppercase{\SUSKA@kota}\par
    \SUSKA@tahun\par}
  \vspace*{14pt}
  \endgroup
  \clearpage}

% Kompatibilitas versi lama (templat kini hanya memakai satu sampul)
\newcommand{\HalamanJudul}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 17. LEMBAR PERSETUJUAN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \SUSKA@ttd{jabatan}{nama}{nip}  -- kolom tanda tangan (tengah)
\newcommand{\SUSKA@ttd}[3]{%
  \begin{minipage}[t]{0.5\textwidth}\centering
    #1\par\vspace{65pt}
    {\bfseries
    \ifx#2\@empty \makebox[55mm]{\dotfill}\else #2\fi\par
    NIP.\ \ifx#3\@empty \makebox[40mm]{\dotfill}\else #3\fi\par}
  \end{minipage}}

\newcommand{\LembarPersetujuan}{%
  \bagianawal{LEMBAR PERSETUJUAN}%
  \begingroup\centering\setlength{\parskip}{0pt}%
  \vspace*{-2pt}
  \SUSKA@judulbesar
  \vspace{29pt}
  \SUSKA@jenisbesar{\SUSKA@empatbelas}
  \vspace{32pt}
  \SUSKA@oleh
  \vspace{37pt}
  Telah diperiksa dan disetujui sebagai \SUSKA@jenislengkap\par
  di \SUSKA@kota, pada tanggal \SUSKA@atautitik{tanggalpersetujuan}{45mm}\par
  \vspace{8pt}
  \endgroup
  \noindent
  \SUSKA@ttd{Pembimbing I,}{\SUSKA@pembimbingsatu}{\SUSKA@nippembimbingsatu}%
  \SUSKA@ttd{Pembimbing II,}{\SUSKA@pembimbingdua}{\SUSKA@nippembimbingdua}%
  \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 18. LEMBAR PENGESAHAN  (laporan)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Kolom tanda tangan rata kiri (Dekan / Ketua Jurusan)
\newcommand{\SUSKA@ttdkiri}[4]{%
  \begin{minipage}[t]{#4}\raggedright
    #1\par\vspace{65pt}
    {\bfseries
    \ifx#2\@empty \makebox[50mm]{\dotfill}\else #2\fi\par
    NIP.\ #3\par}
  \end{minipage}}

% Baris dewan penguji; garis tanda tangan berselang-seling
\newcommand{\SUSKA@penguji}[3]{%
  #1 & : \ifx#2\@empty\makebox[55mm]{\dotfill}\else#2\fi &
  \ifnum#3=1 \hfill\rule{22mm}{0.4pt}\else\rule{22mm}{0.4pt}\hfill\fi\\}

\newcommand{\LembarPengesahan}{%
  \bagianawal{LEMBAR PENGESAHAN}%
  \begingroup\setlength{\parskip}{0pt}%
  {\centering
  \vspace*{-2pt}
  \SUSKA@judulbesar
  \vspace{32pt}
  \SUSKA@oleh
  \vspace{8pt}
  Telah dipertahankan di depan sidang dewan penguji\par
  sebagai salah satu syarat untuk memperoleh gelar \SUSKA@gelar\par
  pada \SUSKA@universitas\par}
  \vspace{8pt}
  \noindent\hspace*{0.58\textwidth}\SUSKA@kota, \SUSKA@atautitik{tanggalsidang}{30mm}\par
  \noindent\hspace*{0.58\textwidth}Mengesahkan,\par
  \noindent
  \SUSKA@ttdkiri{Dekan,}{\SUSKA@dekan}{\SUSKA@nipdekan}{0.58\textwidth}%
  \SUSKA@ttdkiri{Ketua \SUSKA@sebutanprodi,}{\SUSKA@kaprodi}{\SUSKA@nipkaprodi}{0.42\textwidth}\par
  \vspace{14pt}
  \noindent{\SUSKA@empatbelas\bfseries DEWAN PENGUJI\par}
  \vspace{6pt}
  \noindent
  {\renewcommand{\arraystretch}{1.43}%
  \begin{tabularx}{\textwidth}{@{}p{32mm}@{}X@{}p{48mm}@{}}
    \SUSKA@penguji{Ketua}{\SUSKA@ketuapenguji}{1}
    \SUSKA@penguji{Pembimbing I}{\SUSKA@pembimbingsatu}{2}
    \SUSKA@penguji{Pembimbing II}{\SUSKA@pembimbingdua}{1}
    \SUSKA@penguji{Penguji I}{\SUSKA@pengujisatu}{2}
    \SUSKA@penguji{Penguji II}{\SUSKA@pengujidua}{1}
  \end{tabularx}}
  \endgroup
  \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 19. LEMBAR HAK ATAS KEKAYAAN INTELEKTUAL & LEMBAR PERNYATAAN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\LembarHAKI}{%
  \bagianawal{LEMBAR HAK ATAS KEKAYAAN INTELEKTUAL}%
  \SUSKA@jenis\ yang tidak diterbitkan ini terdaftar dan tersedia di
  Perpustakaan \SUSKA@universitas\ adalah terbuka untuk umum dengan
  ketentuan bahwa hak cipta pada penulis. Referensi kepustakaan
  diperkenankan dicatat, tetapi pengutipan atau ringkasan hanya dapat
  dilakukan seizin penulis dan harus disertai dengan kebiasaan ilmiah
  untuk menyebutkan sumbernya.

  Penggandaan atau penerbitan sebagian atau seluruh \SUSKA@jenis\ ini
  harus memperoleh izin dari Dekan Fakultas \SUSKA@fakultas\
  \SUSKA@universitas. Perpustakaan yang meminjamkan \SUSKA@jenis\ ini
  untuk anggotanya diharapkan untuk mengisi nama, tanda peminjaman dan
  tanggal pinjam.
  \clearpage}

\newcommand{\LembarPernyataan}{%
  \bagianawal{LEMBAR PERNYATAAN}%
  Dengan ini saya menyatakan bahwa:
  \begin{enumerate}
    \item \SUSKA@jenis\ ini dengan judul ``\SUSKA@judulsebaris'' adalah gagasan
      asli dari saya sendiri dan belum pernah dijadikan \SUSKA@jenis\
      atau sejenisnya di \SUSKA@universitas\ maupun di perguruan tinggi lain.
    \item Dalam \SUSKA@jenis\ ini TIDAK terdapat karya atau pendapat yang
      telah dipublikasikan orang lain, kecuali tertulis dengan jelas dan
      dicantumkan sebagai referensi di dalam Daftar Pustaka.
    \item Dalam \SUSKA@jenis\ ini TIDAK terdapat penggunaan Kecerdasan
      Buatan Generatif (\textit{Generative AI}) yang bertentangan dengan
      ketentuan dan peraturan yang berlaku.
    \item Saya bersedia menerima sanksi sesuai ketentuan yang berlaku
      apabila di kemudian hari terbukti bahwa \SUSKA@jenis\ ini melanggar
      kode etik maupun peraturan yang berlaku, termasuk plagiat ataupun
      pelanggaran hak cipta.
  \end{enumerate}

  Demikianlah pernyataan ini dibuat dengan sebenarnya.

  \vspace{12pt}
  \SUSKA@blokkanan{\SUSKA@kota, \SUSKA@atautitik{tanggalpernyataan}{30mm}\\
    Yang membuat pernyataan,\\[46pt]
    \textbf{\SUSKA@nama}\\
    \textbf{NIM.\ \SUSKA@nim}}
  \clearpage}

% Tanda tangan penutup Kata Pengantar
\newcommand{\TandaTanganPenulis}[1]{%
  \vspace{8pt}
  \SUSKA@blokkanan{\SUSKA@kota, #1\\[46pt] Penulis}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 20. DAFTAR ISI / GAMBAR / TABEL / RUMUS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\SUSKA@daftar}[2]{%  #1 judul, #2 perintah daftar
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  #2\thispagestyle{plain}}

\newcommand{\DaftarIsi}{\SUSKA@daftar{\contentsname}{\tableofcontents}}
\newcommand{\DaftarGambar}{\SUSKA@daftar{\listfigurename}{\SUSKA@tanpajarakbab\listoffigures}}
\newcommand{\DaftarTabel}{\SUSKA@daftar{\listtablename}{\SUSKA@tanpajarakbab\listoftables}}
\newcommand{\DaftarRumus}{\SUSKA@daftar{DAFTAR RUMUS}{\SUSKA@tanpajarakbab\listofrumus}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 21. DAFTAR PUSTAKA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\DaftarPustaka}{%
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{\bibname}%
  \printbibliography[heading=bibnumbered, title={\bibname}]}
\defbibheading{bibnumbered}[\bibname]{\chapter*{#1}\thispagestyle{plain}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 22. LAMPIRAN  (LAMPIRAN A, B, ...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Lampiran}{%
  \clearpage
  \@mainmattertrue
  \setcounter{chapter}{0}\setcounter{section}{0}%
  \renewcommand{\SUSKA@chaptitle}{\SUSKA@appword}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \renewcommand{\theHchapter}{app.\Alph{chapter}}%
  \immediate\write\@auxout{\string\@writefile{toc}{\string\SUSKA@toclampiran}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Akhir suskaskripsi.cls -- (c) 2026 Benny Sukma Negara
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
