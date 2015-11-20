%%%% Document Type:      LaTeX
%%%% 
%%%% File              : umdiss.sty
%%%% Original author(s): James Dolter

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umdiss}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final,openany}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart          {\@Roman\c@part}
\renewcommand\thechapter       {\@arabic\c@chapter}
\renewcommand\thesection       {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection    {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection {\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph     {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph  {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{\cleardoublepage
                 \thispagestyle{plain}%
                 \if@twocolumn
                     \onecolumn
                     \@tempswatrue
                   \else
                     \@tempswafalse
                 \fi
                 \null\vfil
                 \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand\@chapapp{\appendixname}%
  \renewcommand\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\thechapter.\@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand\thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand\thetable{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname
        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%\RequirePackage{float}
%\RequirePackage{/usr/gnu/tex/inputs/latex/packages/amslatex/other/verbatim}
\RequirePackage{verbatim}
%\RequirePackage{rotatedfloat}

%\RequirePackage{epsfig}
%\RequirePackage{graphicx}

\def\UMDissName{DCO UMDiss Style}
\def\UMDissVersion{Version 1.0.6}

% Check to if we are already loaded...
\@ifundefined{@candidate}{}{\endinput}


%%%
%%% Utility Routines grabbed from tugboat.com
%%%

%%% The following allow for easier changes of category.  These require that
%%% the character be addressed as a control-sequence: e.g. \makeescape\/ will
%%% make the / an escape character.

\def\makeescape#1{\catcode`#1=0 }
\def\makebgroup#1{\catcode`#1=1 }
\def\makeegroup#1{\catcode`#1=2 }
\def\makemath#1{\catcode`#1=3 }
\def\makealign#1{\catcode`#1=4 }
\def\makeeol#1{\catcode`#1=5 }
\def\makeparm#1{\catcode`#1=6 }
\def\makesup#1{\catcode`#1=7 }
\def\makesub#1{\catcode`#1=8 }
\def\makeignore#1{\catcode`#1=9 }
\def\makespace#1{\catcode`#1=10 }
\def\makeletter#1{\catcode`#1=11 }
\def\makeother#1{\catcode`#1=12 }
\def\makeactive#1{\catcode`#1=13 }
\def\makecomment#1{\catcode`#1=14 }

\def\savecat#1{%
  \expandafter\xdef\csname\string#1savedcat\endcsname{\the\catcode`#1}}
\def\restorecat#1{\catcode`#1=\csname\string#1savedcat\endcsname}

%%%
%%% End Utility Routines grabbed from tugboat.com
%%%

\newwrite\@unused
\def\umdiss@typeout#1{{\let\protect\string\immediate\write\@unused{#1}}}

\savecat\$
\makeletter\$
\umdiss@typeout{\UMDissName \space \UMDissVersion}
\restorecat\$

%%%
%%% Some routines ``borrowed'' from seminar.sty
%%%

\def\addto@hook#1#2{#1\expandafter{\the#1\relax#2}}

\def\@umdisserr#1#2{%
  \edef\@tempc{#2}\expandafter\errhelp\expandafter{\@tempc}%
  \typeout{umdiss.sty error.\space\space\space
    Type \space H <return> \space for immediate help.}%
  \errmessage{#1}}

%%%
%%%
\newif\ifskipabstract\skipabstractfalse
\def\ds@noabstract{\skipabstracttrue}

%%%
%%% This style is based in part on the standard LaTeX report style
%%% which in now pulled in...
%%%


\def\contentsname{TABLE OF CONTENTS}
\def\listfigurename{LIST OF FIGURES}
\def\listtablename{LIST OF TABLES}
\def\listappendixname{LIST OF APPENDICES}
\def\bibname{BIBLIOGRAPHY}
\def\indexname{Index}
\def\figurename{Figure}
\def\tablename{Table}
\def\chaptername{CHAPTER}
\def\chapterheadname{CHAPTERS}
\def\appendixname{APPENDIX}
\def\appendixheadname{APPENDICES}
\def\partname{PART}
\def\abstractname{ABSTRACT}
\def\dedicationname{DEDICATION}
\def\prefacename{PREFACE}
\def\ackname{ACKNOWLEDGEMENTS}

\def\chapterlineheight{.1pt}

\def\prechaptertocskip{1.0em}
\def\chaptertocskip{1.0em}
\def\listoffloatsskip{0.1em}
\def\listofnonfloatsskip{0.1em}

\def\@titlefont{\Large\bf}
\def\@candidatefont{\large\bf}
\def\@chapterfont{\Large\bf}

%%%%
%%%% Addition: Time of Run (Extracted from layout.tex)
%%%%

\newcount\hours
\newcount\minutes
\minutes=\time
\hours=\time
\divide\hours   by 60
\divide\minutes by 60
\multiply\minutes by 60
\minutes=-\minutes
\advance\minutes by \time
\def\runtime{\number\hours:\ifnum\minutes<10{}0\fi\number\minutes}

%%%
%%% Line Spacing Macro -- Similar to the old troff .ls command
%%%                       The macro depends on NFSS  
%%%

% Check to see if we are already loaded...
\@ifundefined{@lsmacroloaded}{}{\endinput}
\typeout{Style-Option: `lsmacro'  (JWD)}
%\typeout{Style-Option: `lsmacro'
%   \fileversion \space <\filedate>  (JWD)}
\def\@lsmacroloaded{1}

\newcommand{\twoenfssls}[1]{%
  \renewcommand{\baselinestretch}{#1}%
% \setnew@baselineskip
% Latex2e doesn't define \setnew@baselineskip.  The following code was
% copied from doublespace.sty    Alan
  \ifx\undefined\setnew@baselineskip% HGS
    \baselineskip\f@baselineskip\relax%
  \else% HGS
    \setnew@baselineskip%
  \fi% HGS
  \baselineskip\baselinestretch\baselineskip
  \setbox\strutbox\hbox{\vrule\@height.7\baselineskip
    \@depth.3\baselineskip \@width\z@}%
  \normalbaselineskip\baselineskip}

\let\ls=\twoenfssls

\def\ssplinestretch{1.0}      %%% Single       spacing
\def\dsplinestretch{1.44}     %%% Double       spacing
\def\titlelinestretch{1.2}    %%% Title        spacing
\def\abstractlinestretch{1.3} %%% Abstract     spacing
\def\frontlinestretch{1.0}    %%% Front Matter spacing


%%%
%%% We need to redefine the following environment so that the will default
%%% to a single space lineskip as specified/suggested in the dissertation 
%%% handbook.  These modifications are enable/disable by the switch
%%% '\linestretchoverride' and may be enabled(disabled) by:
%%% \linestretchoverridetrue(\linestretchoverridefalse)
%%%
%%%

\newif\iflinestretchoverride\linestretchoverridefalse

\def\tabularlinestretch{\ssplinestretch}
\def\verselinestretch{\ssplinestretch}
\def\quotationlinestretch{\ssplinestretch}
\def\quotelinestretch{\ssplinestretch}
\def\footnotelinestretch{\ssplinestretch}


\def\tabular{% Provide linestretch override capability for tabular env.
        \iflinestretchoverride\ls{\tabularlinestretch}\fi%
        \let\@halignto\@empty\@tabular}

\def\verse{% Provide linestretch override capability for verse env.
        \iflinestretchoverride\ls{\verselinestretch}\fi%
        \let\\=\@centercr
        \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}

\def\quotation{% Provide linestretch override capability for quotation env.
        \iflinestretchoverride\ls{\quotationlinestretch}\fi%
        \list{}{\listparindent 1.5em
        \itemindent\listparindent
            \rightmargin\leftmargin\parsep \z@ plus\p@}\item[]}

\def\quote{% Provide linestretch override capability for quote env.
        \iflinestretchoverride\ls{\quotationlinestretch}\fi%
        \list{}{\rightmargin\leftmargin}\item[]}

%%%
%%% Macros to handle committee/title and other front matter garbage....
%%%

\newif\iffrontactive\frontactivefalse

%%DJM: added to detect when have gotten to second or later cochairs, for
%% use in abstract page.  not fixed for special members...
\newif\iffirstcochair\firstcochairtrue

\newtoks\chairtokenlist
\newtoks\committeetokenlist
\newtoks\abstokenlist
\chairtokenlist{}
\committeetokenlist{}
\abstokenlist{}

\def\chaircommitteemember{
  \@ifnextchar[{\@spchaircm}{\@regchaircm}}

\def\cochaircommitteemember{
  \@ifnextchar[{\@spcochaircm}{\@regcochaircm}}

\def\committeemember{%
  \@ifnextchar[{\@spcm}{\@regcm}}

\def\@spchaircm[#1]#2#3{%
   \def\abschairname{Chair:}%
   \addto@hook{\chairtokenlist}{& #3 #2, Chair, #1\\}%
   \addto@hook{\abstokenlist}{& #3 #2, #1}}

\def\@regchaircm#1#2{%
   \def\abschairname{Chair:}%
   \addto@hook{\chairtokenlist}{& #2 #1, Chair\\}%
   \addto@hook{\abstokenlist}{& #1\\}}

\def\@spcochaircm[#1]#2#3{%
   \def\abschairname{Co-Chairs:}%
   \addto@hook{\chairtokenlist}{& #3 #2, Co-Chair, #1\\}%
   \addto@hook{\abstokenlist}{& #3 #2, #1}}

\def\@regcochaircm#1#2{%
   \def\abschairname{Co-Chairs:}%
   \addto@hook{\chairtokenlist}{& #2 #1, Co-Chair\\}%
   \iffirstcochair\addto@hook{\abstokenlist}{& #1 }
        \else\addto@hook{\abstokenlist}{and #1 }\fi
   \firstcochairfalse}

\def\@spcm[#1]#2#3{\addto@hook{\committeetokenlist}{& #3 #2, #1\\}}
\def\@regcm#1#2{\addto@hook{\committeetokenlist}{& #2 #1\\}}

\def\committee{
        \begin{tabular}{p{0.5in}l}
        \multicolumn{2}{l}{Doctoral Committee:}\\
        \the\chairtokenlist
        \the\committeetokenlist
        \end{tabular}}


\def\title#1{\gdef\@title{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\program#1{\gdef\@program{#1}}
\def\candidate#1{\gdef\@candidate{#1}}

\def\maketitle{\begin{titlepage}%
   \let\footnotesize\small
   \let\footnoterule\relax
   \setcounter{page}{-1}%
   \ls{\titlelinestretch}
   \null
   \vspace*{\fill}
   \begin{center}%
      {\@titlefont \@title \par}%
   \end{center}
   \vfill
   \centerline{\bf by}
   \vspace{1ex}
   \begin{center}%
      {\@candidatefont \@candidate}
   \end{center}
   \vfill
   \ls{\ssplinestretch}
   \begin{center}%
     {\large \bf Doctoral Thesis Proposal}
 \end{center}
 \vfill
 \committee
\vspace*{\fill}
\null
\end{titlepage}%
\setcounter{footnote}{0}%
\gdef\@thanks{}\let\maketitle\relax}

\def\makecopyright{\begin{titlepage}%
   \let\footnotesize\small
   \let\footnoterule\relax
   \setcounter{page}{0}%
   \null
   \ls{\ssplinestretch}
   \vspace*{\fill}
   \centering
   \leavevmode
   \vbox{\hbox{\llap{\copyright \ }
   \underline{\@candidate}\hspace{0.125in}\number\year \hfil}
   \hbox{All Rights Reserved \hfil}}
   \vspace*{\fill}
   \null
   \end{titlepage}%
   \setcounter{footnote}{0}%
   \let\makecopyright\relax}

\def\abstract{\titlepage
   \null
   \begin{center}
      {\large\bf \abstractname}\@centercr
      \vspace{0.25in}
      \large \@title\@centercr
      \vspace{0.25in}
      by\@centercr
      \large \@candidate\@centercr
   \end{center}
   \vspace{0.5in}
   \noindent\begin{tabular}{ll}
       \abschairname
       \the\abstokenlist
       \end{tabular}\vspace{0.25in}\par}

\def\endabstract{\par\vfil\null\endtitlepage}

\def\frontpiece{\titlepage\null}
\def\endfrontpiece{\par\null\endtitlepage}

\def\dedication{%
   \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\else\newpage\fi%
   \global\frontactivetrue\thispagestyle{front}
   \setcounter{page}{2}%
   \addcontentsline{toc}{prechapter}{\bf \dedicationname}%
   \vspace*{\fill}\begingroup\centering}

\def\enddedication{\par\endgroup\vspace*{\fill}
  \if@restonecol\twocolumn \else \newpage \fi}


\def\acknowledgements{
  \iffrontactive\else\global\frontactivetrue\pagestyle{front}\setcounter{page}{2}\fi
  \chapter*{\ackname\@mkboth{\ackname}{\ackname}}
  \addcontentsline{toc}{prechapter}{\bf \ackname}}

\let\endacknowledgements=\relax

\def\preface{
  \iffrontactive\else\frontactivetrue\pagestyle{front}\setcounter{page}{2}\fi
  \chapter*{\prefacename\@mkboth{\prefacename}{\prefacename}}
  \addcontentsline{toc}{prechapter}{\bf \prefacename}}

\let\endpreface=\relax

%%%%
%%%% Section redefinitions per point size....
%%%%

\ifcase\@ptsize\relax
   \def\section{%
      \@startsection{section}{1}{\z@}%
          {3.5ex plus-1ex minus-.2ex}{2.3ex plus.2ex}%
          {\reset@font\Large\bf}}
   \def\subsection{%
      \@startsection{subsection}{2}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\large\bf}}
   \def\subsubsection{%
      \@startsection{subsubsection}{3}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\normalsize\bf}}
    \def\paragraph{\@startsection{paragraph}{4}{\z@}%
          {3.25ex plus1ex minus.2ex}{-1em}%
          {\reset@font\normalsize \bf}}
    \def\subparagraph{\@startsection{subparagraph}{4}{\parindent}%
          {3.25ex plus1ex minus.2ex}%
          {-1em}{\reset@font\normalsize\bf}}
\or
   \def\section{%
      \@startsection{section}{1}{\z@}%
          {3.5ex plus-1ex minus-.2ex}{2.3ex plus.2ex}%
          {\reset@font\Large\bf}}
   \def\subsection{%
      \@startsection{subsection}{2}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\large\bf}}
   \def\subsubsection{%
      \@startsection{subsubsection}{3}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\normalsize\bf}}
   \def\paragraph{%
      \@startsection{paragraph}{4}{\z@}%
          {3.25ex plus1ex minus.2ex}{-1em}%
          {\reset@font\normalsize\bf}}
   \def\subparagraph{%
      \@startsection{subparagraph}{4}{\parindent}%
          {3.25ex plus1ex minus.2ex}{-1em}%
          {\reset@font\normalsize\bf}}
\or
   \def\section{%
      \@startsection{section}{1}{\z@}%
          {3.5ex plus-1ex minus-.2ex}{2.3ex plus.2ex}%
          {\reset@font\Large\bf}}
   \def\subsection{%
      \@startsection{subsection}{2}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\large\bf}}
   \def\subsubsection{%
      \@startsection{subsubsection}{3}{\z@}%
          {3.25ex plus-1ex minus-.2ex}{1.5ex plus.2ex}%
          {\reset@font\normalsize\bf}} %HHL Here control the size
   \def\paragraph{%
      \@startsection{paragraph}{4}{\z@}%
         {3.25ex plus1ex minus.2ex}{-1em}%
         {\reset@font\normalsize\bf}}
   \def\subparagraph{%
      \@startsection{subparagraph}{4}{\parindent}%
          {3.25ex plus1ex minus .2ex}{-1em}%
          {\reset@font\normalsize\bf}}
\fi


%%%%
%%%% Page Size Parameters per point size
%%%%

\ifcase\@ptsize\relax
   \if@twoside
%%fix      \oddsidemargin  0.5in                 %%% Default: 44pt
%      \oddsidemargin  0.4375in                 %%% Default: 44pt
      \oddsidemargin  0.5125in                 %%% Default: 44pt
      \evensidemargin 0.0in                 %%% Default: 82pt
      \marginparwidth 0pt                   %%% Default: 107pt 
   \else
%%fix      \oddsidemargin  0.5in                 %%% Default: 63pt
%      \oddsidemargin  0.4375in                 %%% Default: 63pt
      \oddsidemargin  0.5125in                 %%% Default: 63pt
      \evensidemargin 0.5in                 %%% Default: 63pt
      \marginparwidth 0pt                   %%% Default: 90pt 
   \fi
   \marginparsep  11pt                      %%% Default: 11pt
%%fix   \topmargin     -36pt                     %%% Default: 27pt
   \topmargin     -47pt                     %%% Default: 27pt
   \headheight    12pt                      %%% Default: 12pt
   \advance\headheight     7.6pt            %%% Adjustment for default headers
   \headsep       25pt                      %%% Default: 25pt
   \topskip =     10pt                      %%% Default: 10pt
   \footskip      30pt                      %%% Default: 30pt
   \textheight =  9.0truein                 %%% Default: 43\baselineskip
                                            %%% Default: \advance\textheight by \topskip
   \textwidth     6.0truein                 %%% Default: 345pt
   \columnsep     10pt                      %%% Default: 10pt
   \columnseprule 0pt                       %%% Default: 0pt
   \footnotesep   6.65pt                    %%% Default: 6.65pt
   \skip\footins  9pt plus 4pt minus 2pt    %%% Default: 9pt plus 4pt minus 2pt
\or   %%% 11 pt parameters ...
   \if@twoside
%%fix      \oddsidemargin  0.5in                 %%% Default: 36pt
%      \oddsidemargin  0.4375in                 %%% Default: 36pt
      \oddsidemargin  0.5125in                 %%% Default: 36pt
      \evensidemargin 0.0in                 %%% Default: 74pt
      \marginparwidth 0pt                   %%% Default: 100pt
   \else
%%fix      \oddsidemargin  0.5in                 %%% Default: 54pt
%      \oddsidemargin  0.4375in                 %%% Default: 54pt
      \oddsidemargin  0.5125in                 %%% Default: 36pt
      \evensidemargin 0.5in                 %%% Default: 54pt
      \marginparwidth 0pt                   %%% Default: 83pt 
   \fi
   \marginparsep  10pt                      %%% Default: 10pt
%%fix   \topmargin     -36pt                     %%% Default: 27pt
   \topmargin     -47pt                     %%% Default: 27pt
   \headheight    12pt                      %%% Default:  12pt
   \advance\headheight     7.6pt            %%% Ajustment for default headers
   \headsep       25pt                      %%% Default: 25pt
   \topskip =     11pt                      %%% Default: 11pt
   \footskip      30pt                      %%% Default: 30pt
   \textheight =  9.0truein                 %%% Default: 38\baselineskip
                                            %%% Default: \advance\textheight by \topskip
   \textwidth     6.0truein                 %%% Default: 360pt
   \columnsep     10pt                      %%% Default: 10pt
   \columnseprule 0pt                       %%% Default: 0pt
   \footnotesep   7.7pt                     %%% Default: 7.7pt
   \skip\footins  10pt plus 4pt minus 2pt   %%% Default: 10pt plus 4pt minus 2pt
\or   %%% 12 pt parameters
   \if@twoside
%      \oddsidemargin  0.5in                 %%% Default: 21pt
      \oddsidemargin  0.5125in                 %%% Default: 36pt
      \evensidemargin 0.0in                 %%% Default: 59pt
      \marginparwidth 0pt                   %%% Default: 85pt
   \else
%      \oddsidemargin  0.5in                 %%% Default: 39.5pt
      \oddsidemargin  0.5125in                 %%% Default: 36pt
      \evensidemargin 0.5in                 %%% Default: 39.5pt
      \marginparwidth 0pt                   %%% Default: 68pt 
   \fi
   \marginparsep  10pt                      %%% Default: 10pt
   \topmargin     -36pt                     %%% Default: 27pt
   \headheight    12pt                      %%% Default: 12pt
   \advance\headheight     7.6pt            %%% Adjustment for default headers
   \headsep       25pt                      %%% Default: 25pt
   \topskip =     12pt                      %%% Default: 12pt
   \footskip      30pt                      %%% Default: 30pt
   \textheight =  9.0truein                 %%% Default: 36\baselineskip
                                            %%% Default: \advance\textheight by \topskip
   \textwidth     6.0truein                 %%% Default: 390pt
   \columnsep     10pt                      %%% Default: 10pt
   \columnseprule 0pt                       %%% Default: 0pt
   \footnotesep   8.4pt                     %%% Default: 8.4pt
   \skip\footins  10.8pt plus 4pt minus 2pt %%% Default: 10.8pt plus 4pt minus 2pt
\fi

%% DJM: new boolean to tell when we are within the appendices of the document.
%% - used w/in chapter to decide whether to add stuff to the loa.
%%
%% JDOLTER: new boolean to handle first appendix as regular chapter and 
%% then after that they dont mess with numbering.
\newif\ifinappendix\inappendixfalse
\newif\iffirstappendix\firstappendixtrue
\newif\iffirstchapter\firstchaptertrue
\def\ext@chapter{toc}
\def\@chaptertype{chapter}

\def\chapter{\clearpage      % Starts new page.
   \ifinappendix\iffirstappendix\thispagestyle{chapter}\firstappendixfalse%
                 \else\thispagestyle{appendix}\fi%
   \else\thispagestyle{chapter}\fi%    % Page style of chapter page is 'plain'
   \global\@topnum\z@        % Prevents figures from going
                             % at top of page.
   \@afterindenttrue        % Allow indent in first paragraph.
   \secdef\@chapter\@schapter}   % Change to \@afterindenttrue to
                                 % have indent.

\def\@chapter[#1]#2{
   \iffirstchapter
      \firstchapterfalse
      \setcounter{chapter}{0}
      \setcounter{page}{1}
      \renewcommand{\thepage}{\arabic{page}}
      \addtocontents{toc}{\protect\vskip 1.0em plus\p@
                {\parindent\z@ \bf \chapterheadname}}
      \pagestyle{regular}
   \fi
   \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{\ext@chapter}{\@chaptertype}{\protect
        \numberline{\thechapter}#1}\else
      \addcontentsline{\ext@chapter}{\@chaptertype}{#1}\fi
   \chaptermark{#1}%
   \if@twocolumn                   % Tests for two-column mode.  
           \@topnewpage[\@makechapterhead{#2}]%
     \else \@makechapterhead{#2}%
           \@afterheading          % Routine called after chapter and
     \fi}                          % section heading.
 
\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]%
        \else \@makeschapterhead{#1}%
              \@afterheading\fi}

\def\@chaptertopskip{0.8in}

%
% BAR 5/1/95 - remove lines from above and below chapter title
%
%\def\@makechapterhead#1{
%    \vspace*{\@chaptertopskip}
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \vspace*{20pt} { \parindent \z@ \centering
%        \ifnum \c@secnumdepth >\m@ne \@chapterfont \@chapapp{} \thechapter \par 
%        \vskip 10pt \fi \@chapterfont #1\par 
%        \nobreak
%        \vskip  20pt
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \hrule width\textwidth height\chapterlineheight \vskip1pt
%        \vskip 20pt } }

\def\@makechapterhead#1{
    \vspace*{\@chaptertopskip}
        \vspace*{20pt} { \parindent \z@ \centering
        \ifnum \c@secnumdepth >\m@ne \@chapterfont \@chapapp{} \thechapter \par 
        \vskip 10pt \fi \@chapterfont #1\par 
        \nobreak
        \vskip  20pt
        \vskip 20pt } }

\def\@makeschapterhead#1{%
   \vspace*{\@chaptertopskip}%
   {\parindent \z@ \centering
   \@chapterfont #1\par 
   \nobreak \vskip 40pt } }

\def\appendix{\par
  \newpage
  \addcontentsline{toc}{prechapter}{\bf \appendixheadname}
  $\vspace{4in}$
  {\Large \begin{center} \textbf{\appendixheadname} \end{center}}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\Alph{chapter}}%
  \gdef\ext@chapter{loa}%
  \gdef\@chaptertype{appendix}
  \inappendixtrue
  \pagestyle{appendix}
% \addcontentsline{toc}{prechapter}{\bf \appendixheadname}
  }

%%% Redefintion of @sect def to use \ext@chapter

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname\hskip 1em}\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {\ext@chapter}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {\ext@chapter}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}

\setbox0=\hbox{\bf CHA}
\newdimen\toc@chapterindent
\toc@chapterindent\wd0
\newdimen\toc@chapternumwidth
\setbox0=\hbox{\bf 9}
\toc@chapternumwidth\wd0
\advance\toc@chapternumwidth by 1em

\def\l@prechapter{\protect\vskip\prechaptertocskip plus\p@      % space above prechapter line
        \@dottedtocline{0}{\z@}{\toc@chapternumwidth}}

\def\l@chapter{\protect\vskip\chaptertocskip plus\p@         % space above chapter line
        \@dottedtocline{0}{\toc@chapterindent}{\toc@chapternumwidth}}

\def\l@appendix{\protect\vskip \listofnonfloatsskip plus\p@
        \@dottedtocline{0}{1.5em}{2.3em}}


\newdimen\toc@sectindent
\newdimen\toc@subsectindent
\newdimen\toc@subsubsectindent
\newdimen\toc@paraindent
\newdimen\toc@subparaindent
\newdimen\toc@listindent

\toc@sectindent=\toc@chapternumwidth
\advance\toc@sectindent by 1em
\toc@listindent=\toc@sectindent
\advance\toc@sectindent\toc@chapterindent
\toc@subsectindent=\toc@sectindent
\advance\toc@subsectindent by 2.3em
\toc@subsubsectindent=\toc@subsectindent
\advance\toc@subsubsectindent by 3.2em
\toc@paraindent=\toc@subsubsectindent
\advance\toc@paraindent by 4.1em
\toc@subparaindent=\toc@paraindent
\advance\toc@subparaindent by 5em

\def\l@figure{\protect\vskip \listoffloatsskip plus\p@ \@dottedtocline{1}{1.5em}{2.3em}}

\def\l@table{\protect\vskip \listoffloatsskip plus\p@ \@dottedtocline{1}{1.5em}{2.3em}}

\def\l@section{\@dottedtocline{1}{\toc@sectindent}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{\toc@subsectindent}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{\toc@subsubsectindent}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{\toc@paraindent}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{\toc@subparaindent}{6em}}

\def\umdisstableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\contentsname\@mkboth{\contentsname}{\contentsname}}%
  {\ls{\ssplinestretch}\@starttoc{toc}}%
  \if@restonecol\twocolumn\fi}


%%%%
%%%% List support for floats ...
%%%% Example: \umdisslistoffloats{table}{\listtablename}{\tablename}
%%%%

\def\umdisslistoffloats#1#2#3{\expandafter\ifx\csname
    ext@#1\endcsname\relax\float@error{#1}%
  \else
    \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
    \chapter*{#2\@mkboth{#2}{#2}}
    \addcontentsline{toc}{prechapter}{\bf #2}%
    \vskip 1.0em plus\p@
    {\parindent \z@ \raggedright \bf #3{}\par}
    \begingroup
%    \expandafter\def\csname l@#1\endcsname{\protect\vskip \listoffloatsskip plus\p@ \@dottedtocline{1}{1.5em}{2.3em}}%
    \ls{\ssplinestretch}\@starttoc{\csname ext@#1\endcsname}
   \endgroup
    \if@restonecol \twocolumn\fi
  \fi}


%%%%
%%%% List support for non-floats ...
%%%% Example: \umdisslistofnonfloats{loa}{LIST OF APPENDICES}{\appendixname}
%%%%

\def\umdisslistofnonfloats#1#2#3{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{#2\@mkboth{#2}{#2}}
  \addcontentsline{toc}{prechapter}{\bf #2}%
  \vskip 1.0em plus\p@
  {\parindent \z@ \raggedright \bf #3{}\par}
  \begingroup
%    \expandafter\def\csname l@#1\endcsname{\protect\vskip \listofnonfloatsskip plus\p@ \@dottedtocline{1}{1.5em}{2.3em}}%
  \ls{\ssplinestretch}\setcounter{tocdepth}{0}\@starttoc{#1}
  \endgroup
  \if@restonecol \twocolumn\fi}


%%%%
%%%% Modified bibliography environment
%%%%

\def\thebibliography#1{%
  \newpage
  \addcontentsline{toc}{prechapter}{\bf \bibname}
  $\vspace{4in}$
  {\Large \begin{center} \textbf{\bibname} \end{center}}
  \gdef\@chapapp{\chaptername}%
  \gdef\ext@chapter{toc}%
  \gdef\@chaptertype{chapter}
  \inappendixfalse
  \pagestyle{regular}
  \chapter*{\bibname\@mkboth{\uppercase{\bibname}}{\uppercase{\bibname}}}%
%  \addcontentsline{toc}{prechapter}{\bf \bibname}
  \list{\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m%
    \ls{\ssplinestretch}}


%%%%
%%%% Special headers patterned after the fancyheader style 
%%%%
%%%% Fancy headers and footers.
%%%% Piet van Oostrum, Dept of Computer Science, University of Utrecht
%%%% Padualaan 14, P.O. Box 80.089, 3508 TB Utrecht, The Netherlands
%%%% Telephone: +31-30-531806. piet@cs.ruu.nl (mcvax!hp4nl!ruuinf!piet)
%%%% March, 1989.

\newdimen\headwidth

%%%%
%%%% Macros for front page style headers and footers
%%%%
\newdimen\frontheadrulewidth\frontheadrulewidth\z@
\newdimen\frontfootrulewidth\frontfootrulewidth\z@

\def\frontlhead{\@ifnextchar[{\@front@xlhead}{\@front@ylhead}}
\def\@front@xlhead[#1]#2{\gdef\@front@elhead{#1}\gdef\@front@olhead{#2}}
\def\@front@ylhead#1{\gdef\@front@elhead{#1}\gdef\@front@olhead{#1}}

\def\frontchead{\@ifnextchar[{\@front@xchead}{\@front@ychead}}
\def\@front@xchead[#1]#2{\gdef\@front@echead{#1}\gdef\@front@ochead{#2}}
\def\@front@ychead#1{\gdef\@front@echead{#1}\gdef\@front@ochead{#1}}

\def\frontrhead{\@ifnextchar[{\@front@xrhead}{\@front@yrhead}}
\def\@front@xrhead[#1]#2{\gdef\@front@erhead{#1}\gdef\@front@orhead{#2}}
\def\@front@yrhead#1{\gdef\@front@erhead{#1}\gdef\@front@orhead{#1}}

\def\frontlfoot{\@ifnextchar[{\@front@xlfoot}{\@front@ylfoot}}
\def\@front@xlfoot[#1]#2{\gdef\@front@elfoot{#1}\gdef\@front@olfoot{#2}}
\def\@front@ylfoot#1{\gdef\@front@elfoot{#1}\gdef\@front@olfoot{#1}}

\def\frontcfoot{\@ifnextchar[{\@front@xcfoot}{\@front@ycfoot}}
\def\@front@xcfoot[#1]#2{\gdef\@front@ecfoot{#1}\gdef\@front@ocfoot{#2}}
\def\@front@ycfoot#1{\gdef\@front@ecfoot{#1}\gdef\@front@ocfoot{#1}}

\def\frontrfoot{\@ifnextchar[{\@front@xrfoot}{\@front@yrfoot}}
\def\@front@xrfoot[#1]#2{\gdef\@front@erfoot{#1}\gdef\@front@orfoot{#2}}
\def\@front@yrfoot#1{\gdef\@front@erfoot{#1}\gdef\@front@orfoot{#1}}

\frontlhead{}
\frontrhead{}
\frontchead{}
\frontlfoot{}
\frontrfoot{}
\frontcfoot{\thepage}

\def\@front@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\@front@headrule}}#5}


\def\@front@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\@front@footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\@front@headrule{{%
\hrule\@height\frontheadrulewidth\@width\headwidth \vskip-\frontheadrulewidth}}

\def\@front@footrule{{%
\vskip-0.3\normalbaselineskip\vskip-\frontfootrulewidth
\hrule\@width\headwidth\@height\frontfootrulewidth\vskip0.3\normalbaselineskip}}

\def\ps@front{
\let\@mkboth\markboth
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\uppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}
{\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\uppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}
\def\@oddhead{\@front@fancyhead\relax\@front@olhead\@front@ochead\@front@orhead\hss}
\def\@oddfoot{\@front@fancyfoot\relax\@front@olfoot\@front@ocfoot\@front@orfoot\hss}
\def\@evenhead{\@front@fancyhead\hss\@front@elhead\@front@echead\@front@erhead\relax}
\def\@evenfoot{\@front@fancyfoot\hss\@front@elfoot\@front@ecfoot\@front@erfoot\relax}
\headwidth\textwidth}

%%%%
%%%% Macros for regular page style headers and footers
%%%%

\newdimen\regularheadrulewidth\regularheadrulewidth\z@
\newdimen\regularfootrulewidth\regularfootrulewidth\z@

\def\regularlhead{\@ifnextchar[{\@regular@xlhead}{\@regular@ylhead}}
\def\@regular@xlhead[#1]#2{\gdef\@regular@elhead{#1}\gdef\@regular@olhead{#2}}
\def\@regular@ylhead#1{\gdef\@regular@elhead{#1}\gdef\@regular@olhead{#1}}

\def\regularchead{\@ifnextchar[{\@regular@xchead}{\@regular@ychead}}
\def\@regular@xchead[#1]#2{\gdef\@regular@echead{#1}\gdef\@regular@ochead{#2}}
\def\@regular@ychead#1{\gdef\@regular@echead{#1}\gdef\@regular@ochead{#1}}

\def\regularrhead{\@ifnextchar[{\@regular@xrhead}{\@regular@yrhead}}
\def\@regular@xrhead[#1]#2{\gdef\@regular@erhead{#1}\gdef\@regular@orhead{#2}}
\def\@regular@yrhead#1{\gdef\@regular@erhead{#1}\gdef\@regular@orhead{#1}}

\def\regularlfoot{\@ifnextchar[{\@regular@xlfoot}{\@regular@ylfoot}}
\def\@regular@xlfoot[#1]#2{\gdef\@regular@elfoot{#1}\gdef\@regular@olfoot{#2}}
\def\@regular@ylfoot#1{\gdef\@regular@elfoot{#1}\gdef\@regular@olfoot{#1}}

\def\regularcfoot{\@ifnextchar[{\@regular@xcfoot}{\@regular@ycfoot}}
\def\@regular@xcfoot[#1]#2{\gdef\@regular@ecfoot{#1}\gdef\@regular@ocfoot{#2}}
\def\@regular@ycfoot#1{\gdef\@regular@ecfoot{#1}\gdef\@regular@ocfoot{#1}}

\def\regularrfoot{\@ifnextchar[{\@regular@xrfoot}{\@regular@yrfoot}}
\def\@regular@xrfoot[#1]#2{\gdef\@regular@erfoot{#1}\gdef\@regular@orfoot{#2}}
\def\@regular@yrfoot#1{\gdef\@regular@erfoot{#1}\gdef\@regular@orfoot{#1}}

\regularlhead{}
\regularrhead{}
%\regularchead{\thepage}        % BAR 5/1/95 - move page number
\regularchead{}                 % from header to footer
\regularlfoot{}
\regularrfoot{}
\regularcfoot{\thepage}
%\regularcfoot{}

\def\@regular@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\@regular@headrule}}#5}


\def\@regular@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\@regular@footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\@regular@headrule{{%
\hrule\@height\regularheadrulewidth\@width\headwidth \vskip-\regularheadrulewidth}}

\def\@regular@footrule{{%
\vskip-0.3\normalbaselineskip\vskip-\regularfootrulewidth
\hrule\@width\headwidth\@height\regularfootrulewidth\vskip0.3\normalbaselineskip}}

\def\ps@regular{
\let\@mkboth\markboth
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\uppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}
{\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\uppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}
\def\@oddhead{\@regular@fancyhead\relax\@regular@olhead\@regular@ochead\@regular@orhead\hss}
\def\@oddfoot{\@regular@fancyfoot\relax\@regular@olfoot\@regular@ocfoot\@regular@orfoot\hss}
\def\@evenhead{\@regular@fancyhead\hss\@regular@elhead\@regular@echead\@regular@erhead\relax}
\def\@evenfoot{\@regular@fancyfoot\hss\@regular@elfoot\@regular@ecfoot\@regular@erfoot\relax}
\headwidth\textwidth}
%%%%
%%%% Macros for chapter page style headers and footers
%%%%
\newdimen\chapterheadrulewidth\chapterheadrulewidth\z@
\newdimen\chapterfootrulewidth\chapterfootrulewidth\z@

\def\chapterlhead{\@ifnextchar[{\@chapter@xlhead}{\@chapter@ylhead}}
\def\@chapter@xlhead[#1]#2{\gdef\@chapter@elhead{#1}\gdef\@chapter@olhead{#2}}
\def\@chapter@ylhead#1{\gdef\@chapter@elhead{#1}\gdef\@chapter@olhead{#1}}

\def\chapterchead{\@ifnextchar[{\@chapter@xchead}{\@chapter@ychead}}
\def\@chapter@xchead[#1]#2{\gdef\@chapter@echead{#1}\gdef\@chapter@ochead{#2}}
\def\@chapter@ychead#1{\gdef\@chapter@echead{#1}\gdef\@chapter@ochead{#1}}

\def\chapterrhead{\@ifnextchar[{\@chapter@xrhead}{\@chapter@yrhead}}
\def\@chapter@xrhead[#1]#2{\gdef\@chapter@erhead{#1}\gdef\@chapter@orhead{#2}}
\def\@chapter@yrhead#1{\gdef\@chapter@erhead{#1}\gdef\@chapter@orhead{#1}}

\def\chapterlfoot{\@ifnextchar[{\@chapter@xlfoot}{\@chapter@ylfoot}}
\def\@chapter@xlfoot[#1]#2{\gdef\@chapter@elfoot{#1}\gdef\@chapter@olfoot{#2}}
\def\@chapter@ylfoot#1{\gdef\@chapter@elfoot{#1}\gdef\@chapter@olfoot{#1}}

\def\chaptercfoot{\@ifnextchar[{\@chapter@xcfoot}{\@chapter@ycfoot}}
\def\@chapter@xcfoot[#1]#2{\gdef\@chapter@ecfoot{#1}\gdef\@chapter@ocfoot{#2}}
\def\@chapter@ycfoot#1{\gdef\@chapter@ecfoot{#1}\gdef\@chapter@ocfoot{#1}}

\def\chapterrfoot{\@ifnextchar[{\@chapter@xrfoot}{\@chapter@yrfoot}}
\def\@chapter@xrfoot[#1]#2{\gdef\@chapter@erfoot{#1}\gdef\@chapter@orfoot{#2}}
\def\@chapter@yrfoot#1{\gdef\@chapter@erfoot{#1}\gdef\@chapter@orfoot{#1}}

\chapterlhead{}
\chapterrhead{}
\chapterchead{}
\chapterlfoot{}
\chapterrfoot{}
\chaptercfoot{\thepage}

\def\@chapter@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\@chapter@headrule}}#5}


\def\@chapter@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\@chapter@footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\@chapter@headrule{{%
\hrule\@height\chapterheadrulewidth\@width\headwidth \vskip-\chapterheadrulewidth}}

\def\@chapter@footrule{{%
\vskip-0.3\normalbaselineskip\vskip-\chapterfootrulewidth
\hrule\@width\headwidth\@height\chapterfootrulewidth\vskip0.3\normalbaselineskip}}

\def\ps@chapter{
\let\@mkboth\markboth
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\uppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}
{\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\uppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}
\def\@oddhead{\@chapter@fancyhead\relax\@chapter@olhead\@chapter@ochead\@chapter@orhead\hss}
\def\@oddfoot{\@chapter@fancyfoot\relax\@chapter@olfoot\@chapter@ocfoot\@chapter@orfoot\hss}
\def\@evenhead{\@chapter@fancyhead\hss\@chapter@elhead\@chapter@echead\@chapter@erhead\relax}
\def\@evenfoot{\@chapter@fancyfoot\hss\@chapter@elfoot\@chapter@ecfoot\@chapter@erfoot\relax}
\headwidth\textwidth}
%%%%
%%%% Macros for appendix page style headers and footers
%%%%
\newdimen\appendixheadrulewidth\appendixheadrulewidth\z@
\newdimen\appendixfootrulewidth\appendixfootrulewidth\z@

\def\appendixlhead{\@ifnextchar[{\@appendix@xlhead}{\@appendix@ylhead}}
\def\@appendix@xlhead[#1]#2{\gdef\@appendix@elhead{#1}\gdef\@appendix@olhead{#2}}
\def\@appendix@ylhead#1{\gdef\@appendix@elhead{#1}\gdef\@appendix@olhead{#1}}

\def\appendixchead{\@ifnextchar[{\@appendix@xchead}{\@appendix@ychead}}
\def\@appendix@xchead[#1]#2{\gdef\@appendix@echead{#1}\gdef\@appendix@ochead{#2}}
\def\@appendix@ychead#1{\gdef\@appendix@echead{#1}\gdef\@appendix@ochead{#1}}

\def\appendixrhead{\@ifnextchar[{\@appendix@xrhead}{\@appendix@yrhead}}
\def\@appendix@xrhead[#1]#2{\gdef\@appendix@erhead{#1}\gdef\@appendix@orhead{#2}}
\def\@appendix@yrhead#1{\gdef\@appendix@erhead{#1}\gdef\@appendix@orhead{#1}}

\def\appendixlfoot{\@ifnextchar[{\@appendix@xlfoot}{\@appendix@ylfoot}}
\def\@appendix@xlfoot[#1]#2{\gdef\@appendix@elfoot{#1}\gdef\@appendix@olfoot{#2}}
\def\@appendix@ylfoot#1{\gdef\@appendix@elfoot{#1}\gdef\@appendix@olfoot{#1}}

\def\appendixcfoot{\@ifnextchar[{\@appendix@xcfoot}{\@appendix@ycfoot}}
\def\@appendix@xcfoot[#1]#2{\gdef\@appendix@ecfoot{#1}\gdef\@appendix@ocfoot{#2}}
\def\@appendix@ycfoot#1{\gdef\@appendix@ecfoot{#1}\gdef\@appendix@ocfoot{#1}}

\def\appendixrfoot{\@ifnextchar[{\@appendix@xrfoot}{\@appendix@yrfoot}}
\def\@appendix@xrfoot[#1]#2{\gdef\@appendix@erfoot{#1}\gdef\@appendix@orfoot{#2}}
\def\@appendix@yrfoot#1{\gdef\@appendix@erfoot{#1}\gdef\@appendix@orfoot{#1}}

\appendixlhead{}
\appendixrhead{}
%\appendixchead{\thepage}      % BAR 5/1/95 - move page number from
\appendixchead{}               % header to footer
\appendixlfoot{}
\appendixrfoot{}
%\appendixcfoot{}
\appendixcfoot{\thepage}

\def\@appendix@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\@appendix@headrule}}#5}


\def\@appendix@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\@appendix@footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\@appendix@headrule{{%
\hrule\@height\appendixheadrulewidth\@width\headwidth \vskip-\appendixheadrulewidth}}

\def\@appendix@footrule{{%
\vskip-0.3\normalbaselineskip\vskip-\appendixfootrulewidth
\hrule\@width\headwidth\@height\appendixfootrulewidth\vskip0.3\normalbaselineskip}}

\def\ps@appendix{
\let\@mkboth\markboth
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\uppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}
{\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\uppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}
\def\@oddhead{\@appendix@fancyhead\relax\@appendix@olhead\@appendix@ochead\@appendix@orhead\hss}
\def\@oddfoot{\@appendix@fancyfoot\relax\@appendix@olfoot\@appendix@ocfoot\@appendix@orfoot\hss}
\def\@evenhead{\@appendix@fancyhead\hss\@appendix@elhead\@appendix@echead\@appendix@erhead\relax}
\def\@evenfoot{\@appendix@fancyfoot\hss\@appendix@elfoot\@appendix@ecfoot\@appendix@erfoot\relax}
\headwidth\textwidth}
%%%%
%%%% Macros for umdiss page style headers and footers
%%%%

\newdimen\umdissheadrulewidth\umdissheadrulewidth\z@
\newdimen\umdissfootrulewidth\umdissfootrulewidth\z@

\def\umdisslhead{\@ifnextchar[{\@umdiss@xlhead}{\@umdiss@ylhead}}
\def\@umdiss@xlhead[#1]#2{\gdef\@umdiss@elhead{#1}\gdef\@umdiss@olhead{#2}}
\def\@umdiss@ylhead#1{\gdef\@umdiss@elhead{#1}\gdef\@umdiss@olhead{#1}}

\def\umdisschead{\@ifnextchar[{\@umdiss@xchead}{\@umdiss@ychead}}
\def\@umdiss@xchead[#1]#2{\gdef\@umdiss@echead{#1}\gdef\@umdiss@ochead{#2}}
\def\@umdiss@ychead#1{\gdef\@umdiss@echead{#1}\gdef\@umdiss@ochead{#1}}

\def\umdissrhead{\@ifnextchar[{\@umdiss@xrhead}{\@umdiss@yrhead}}
\def\@umdiss@xrhead[#1]#2{\gdef\@umdiss@erhead{#1}\gdef\@umdiss@orhead{#2}}
\def\@umdiss@yrhead#1{\gdef\@umdiss@erhead{#1}\gdef\@umdiss@orhead{#1}}

\def\umdisslfoot{\@ifnextchar[{\@umdiss@xlfoot}{\@umdiss@ylfoot}}
\def\@umdiss@xlfoot[#1]#2{\gdef\@umdiss@elfoot{#1}\gdef\@umdiss@olfoot{#2}}
\def\@umdiss@ylfoot#1{\gdef\@umdiss@elfoot{#1}\gdef\@umdiss@olfoot{#1}}

\def\umdisscfoot{\@ifnextchar[{\@umdiss@xcfoot}{\@umdiss@ycfoot}}
\def\@umdiss@xcfoot[#1]#2{\gdef\@umdiss@ecfoot{#1}\gdef\@umdiss@ocfoot{#2}}
\def\@umdiss@ycfoot#1{\gdef\@umdiss@ecfoot{#1}\gdef\@umdiss@ocfoot{#1}}

\def\umdissrfoot{\@ifnextchar[{\@umdiss@xrfoot}{\@umdiss@yrfoot}}
\def\@umdiss@xrfoot[#1]#2{\gdef\@umdiss@erfoot{#1}\gdef\@umdiss@orfoot{#2}}
\def\@umdiss@yrfoot#1{\gdef\@umdiss@erfoot{#1}\gdef\@umdiss@orfoot{#1}}

\umdisslhead{}
\umdissrhead{}
\umdisschead{\thepage}
\umdisslfoot{}
\umdissrfoot{}
\umdisscfoot{}

\def\@umdiss@fancyhead#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\hbox
{\rlap{\parbox[b]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[b]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[b]{\headwidth}{\raggedleft#4\strut}}}\@umdiss@headrule}}#5}


\def\@umdiss@fancyfoot#1#2#3#4#5{#1\hbox to\headwidth{\vbox{\@umdiss@footrule
\hbox{\rlap{\parbox[t]{\headwidth}{\raggedright#2\strut}}\hfill
\parbox[t]{\headwidth}{\centering#3\strut}\hfill
\llap{\parbox[t]{\headwidth}{\raggedleft#4\strut}}}}}#5}

\def\@umdiss@headrule{{%
\hrule\@height\umdissheadrulewidth\@width\headwidth \vskip-\umdissheadrulewidth}}

\def\@umdiss@footrule{{%
\vskip-0.3\normalbaselineskip\vskip-\umdissfootrulewidth
\hrule\@width\headwidth\@height\umdissfootrulewidth\vskip0.3\normalbaselineskip}}

\def\ps@umdiss{
\let\@mkboth\markboth
\@ifundefined{chapter}{\def\sectionmark##1{\markboth
{\uppercase{\ifnum \c@secnumdepth>\z@
 \thesection\hskip 1em\relax \fi ##1}}{}}
\def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
 \thesubsection\hskip 1em\relax \fi ##1}}}
{\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}
\def\sectionmark##1{\markright{\uppercase{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}
\def\@oddhead{\@umdiss@fancyhead\relax\@umdiss@olhead\@umdiss@ochead\@umdiss@orhead\hss}
\def\@oddfoot{\@umdiss@fancyfoot\relax\@umdiss@olfoot\@umdiss@ocfoot\@umdiss@orfoot\hss}
\def\@evenhead{\@umdiss@fancyhead\hss\@umdiss@elhead\@umdiss@echead\@umdiss@erhead\relax}
\def\@evenfoot{\@umdiss@fancyfoot\hss\@umdiss@elfoot\@umdiss@ecfoot\@umdiss@erfoot\relax}
\headwidth\textwidth}


%%%%
%%%% Fix footnote size spacing
%%%%

\long\def\@footnotetext#1{\insert\footins{\reset@font\footnotesize%
    \ls{\ssplinestretch}
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%%%%
%%%% Fix figure caption formating and spacing.
%%%% Note: This assumes that float.sty has already been loaded.
%%%%
%%%%  Figure Captions modifications  - modified by DJM
%%%% - boldifies the "Figure#:" part only
%%%% - puts multiline caption in better list environment
%%%%   this version is for use with float.sty, which munges the caption
%%%%   stuff.

%%\def\floatc@plain#1#2{\setbox\@tempboxa\hbox{{\@fs@cfont #1:} #2}%
%% \ifdim \wd\@tempboxa >\hsize%
%%        \setbox\@tempboxa\hbox{\bf#1:}% THEN indent caption
%%        \begin{list}{}{\labelwidth\wd\@tempboxa%
%%                       \addtolength{\leftmargin}{\labelwidth}}
%%        \item[{\@fs@cfont #1:}] #2
%%        \end{list}
%%   \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}


%%\def\floatc@plain#1#2{\setbox\@tempboxa\hbox{{\@fs@cfont #1:} {\bf#2}}%
%%  \ifdim \wd\@tempboxa >\hsize%
%%        \setbox\@tempboxa\hbox{\bf#1:}% THEN indent caption
%%       \begin{list}{}{\labelwidth\wd\@tempboxa%
%%                     \addtolength{\leftmargin}{\labelwidth}}
%%        \item[{\@fs@cfont #1:}] {\bf#2}
%%        \end{list}
%%   \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}

%%\long\def\float@caption#1[#2]#3{\addcontentsline{\csname
%%  ext@#1\endcsname}{#1}{\protect\numberline{\csname
%%    the#1\endcsname}{\ignorespaces #2}}
%%  \global\setbox\@floatcapt\vbox\bgroup\@parboxrestore
%%    \normalsize\ls{\ssplinestretch}%
%%        \@fs@capt{\csname fnum@#1\endcsname}{\ignorespaces #3}%
%%    \@ifnextchar[{\float@ccon}{\egroup}}

%%\def\fs@plain{\def\@fs@cfont{\bf}\let\@fs@capt\floatc@plain
%%  \def\@fs@pre{}\def\@fs@post{}\def\@fs@mid{\vskip10pt\relax}%
%%  \let\@fs@iftopcapt\iffalse}


%%%%
%%%% Default Starting parameters
%%%%

\renewcommand{\thepage}{\roman{page}}
\pagestyle{front}

%%%%
%%%% Create the ``default'' rotated styles that we use assume are available....
%%%%

%\newrotatedfloat{rotatedtable}{table}
%\newrotatedfloat{rotatedfigure}{figure}

%%%%
%%%% Read in override parameters.
%%%%
\openin1 umdiss.con
\ifeof1\else\closein1 \relax\@@input umdiss.con\fi

\endinput


