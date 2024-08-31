%% course-fr.cls
%% Copyright 2024 RONDEAU Felix
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2024 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is RONDEAU Felix.
%
% This work consists of the files course.cls and course-fr.cls

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{course}[A LaTeX class for typesetting courses.]

\LoadClass{article}


%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{amsmath, amsfonts, mathtools, amsthm, thmtools, amssymb}
\usepackage{bm, cancel, nicefrac}
\usepackage[dvipsnames]{xcolor}
\usepackage[many]{tcolorbox}
\usetikzlibrary{decorations.pathmorphing}
\usepackage[b]{esvect}
\usepackage{siunitx}
\sisetup{locale = FR}
\usepackage{titlesec} % Title formatting
\usepackage{enumitem}
\usepackage{array}

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry}

\geometry{
	paper=a4paper,
	top=1.75cm,
	bottom=1.75cm,
	left=3.5cm,
	right=2cm,
	headheight=0.75cm,
	footskip=0.5cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	marginparwidth=.2\paperwidth,
	%showframe, % Uncomment to show how the type block is set on the page
}

% Header and Footer setup
\def\title#1{\gdef\@title{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\author#1{\gdef\@author{#1}}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhf[lh]{\@title}
\fancyhf[rh]{\itshape\nouppercase{\leftmark}}
\fancyhf[rf]{\thepage}


%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage{raleway}
\usepackage{libertine}

% For \Re and \Im
\usepackage[scr=boondox,  % heavily sloped
	cal=esstix]   % slightly sloped
{mathalpha}

% Set Linux Libertine as the default roman font
\renewcommand{\rmdefault}{LinuxLibertineT-LF}

% Set Raleway as the default sans-serif font
\renewcommand{\sfdefault}{Raleway-TLF}


%----------------------------------------------------------------------------------------
%   CAPTION
%----------------------------------------------------------------------------------------

\renewcommand\maketitle{
	\thispagestyle{empty}
	\begin{center}
		\fbox{\bfseries\sffamily\LARGE\parbox{\dimexpr\linewidth-2\fboxsep-2\fboxrule\relax}{\centering\@title}}
	\end{center}
	\vspace{-8pt}
	{\bfseries\itshape\sffamily\footnotesize \@subtitle\hfill\@author}
	\if\relax\@subtitle\relax
		\if\relax\@another\relax
			\vspace{-\baselineskip}
		\fi
	\fi
	\\
}

%----------------------------------------------------------------------------------------
%   USEFUL MATHS COMMANDS
%----------------------------------------------------------------------------------------

% Common sets
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\U}{\mathbb{U}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\K}{\mathbb{K}}

% Complex numbers
\let\conj\overline
\newcommand{\Arg}[1]{\arg\left(#1\right)}
\renewcommand{\Re}{\mathscr{R\!e}}
\renewcommand{\Im}{\mathscr{I\!\!m}}

% Arithmetic
\newcommand{\Set}[1]{\{\,#1\,\}}
\newcommand{\cgm}[2]{\equiv #1 \left[#2\right]} % ConGruent Modulo
\newcommand{\ncgm}[2]{\not\equiv #1 \left[#2\right]}
\def\congru\cgm % For backward comptibility
\def\ncongru\ncgm

% Vectors
\renewcommand{\vec}{\vv}
% TODO: Change font
\newcommand\norm[1]{\left\lVert#1\right\rVert}

% Other
\let\leq\leqslant
\let\geq\geqslant
\newcommand{\induction}[3]{
	\begin{list}{}{\leftmargin10pt}
		\item \textbf{Initialisation:} #1
		\item \textbf{Hérédité:} #2
		\item \textbf{Conclusion:} #3
	\end{list}
}


%----------------------------------------------------------------------------------------
%   SECTION / SUBSECTION STYLE
%----------------------------------------------------------------------------------------

\newlength{\spacelength}
\settowidth{\spacelength}{\normalfont\ }

\titleformat{\section}[block]
{\bfseries\sffamily\Large}
{}
{0pt}
{\makebox[0pt][r]{Section \thesection\hspace{\marginparsep-2\spacelength}}}

\titleformat{\subsection}[block]
{\bfseries\sffamily\large}
{}
{0pt}
{\makebox[0pt][r]{Partie \thesubsection\hspace{\marginparsep-2\spacelength}}}

\titleformat{\subsubsection}[block]
{\bfseries\sffamily}
{}
{0pt}
{\makebox[0pt][r]{\thesubsubsection\hspace{\marginparsep-2\spacelength}}}


%----------------------------------------------------------------------------------------
%   LISTS STYLE
%----------------------------------------------------------------------------------------

% Enumerate without top margin
\newlist{enumerate-}{enumerate}{3}
\setlist[enumerate-]{nosep, itemsep=4pt, leftmargin=*, label=\arabic*.}

% Itemize without top margin
\newlist{itemize-}{itemize}{3}
\setlist[itemize-]{label=\textbullet, nosep, itemsep=4pt, leftmargin=*}


%----------------------------------------------------------------------------------------
%   THEOREM STYLE
%----------------------------------------------------------------------------------------

\declaretheoremstyle[
	headfont={\bfseries\sffamily\footnotesize},
	notefont={\bfseries\sffamily\footnotesize},
	bodyfont={\normalfont},
	headpunct={\relax},%\newline,
	notebraces={}{},
	headformat={%
			\makebox[0pt][r]{\ifthenelse{\equal{\NOTE}{}}{\NAME}{\NOTE}\ \NUMBER\hspace{\marginparsep}}\hspace{-\spacelength}},
]{numbered}
\declaretheoremstyle[
	headfont={\bfseries\sffamily\footnotesize},
	notefont={\bfseries\sffamily\footnotesize},
	bodyfont={\normalfont},
	headpunct={\relax},%\newline,
	notebraces={}{},
	headformat={%
			\makebox[0pt][r]{\ifthenelse{\equal{\NOTE}{}}{\NAME}{\NOTE}\hspace{\marginparsep}}\hspace{-\spacelength}},
]{unnumbered}
\declaretheoremstyle[
	headfont={\footnotesize\itshape},
	notefont={\normalfont},
	bodyfont={\normalfont},
	headpunct={\relax},
	headformat={%
			\makebox[0pt][r]{\ifthenelse{\equal{\NOTE}{}}{\NAME}{\NOTE}\hspace{\marginparsep}}\hspace{-\spacelength}},
]{claim}


% Theorem
\declaretheorem[name=Proposition, style=numbered]{theorem}
\tcolorboxenvironment{theorem}{
	boxrule=0pt,
	boxsep=0pt,
	enhanced jigsaw,
	opacityback=0,
	colframe=black,borderline={1pt}{0mm}{black},
	sharp corners,
	before skip=8pt,
	after skip=8pt,
	left=5pt,
	right=5pt,
	breakable,
}

\newenvironment{theorems}
{\begin{theorem}[Propositions]}{\end{theorem}}

\newenvironment{theoremlist}
{\begin{theorems}\begin{enumerate-}}{\end{enumerate-}\end{theorems}}


% Proof and building
\let\proof\relax
\declaretheorem[
	name=Preuve,
	style=unnumbered,
	qed=\qedsymbol]{proof}

\tcolorboxenvironment{proof}{
	boxrule=0pt,
	boxsep=0pt,
	blanker,
	borderline west={0.5pt}{0pt}{black!60!white},
	before skip=8pt,
	after skip=8pt,
	left=5pt,
	right=5pt,
	breakable,
}

\newenvironment{building}
{\begin{proof}[Construction]}{\end{proof}}

\newenvironment{proofs}
{\begin{proof}[Preuves]}{\end{proof}}

\newenvironment{prooflist}
{\begin{proofs}\begin{enumerate-}}{\end{enumerate-}\end{proofs}}


% Definition
\theoremstyle{numbered}
\newtheorem{definition}{Définition}

\newenvironment{definitions}
{\begin{definition}[Définitions]}{\end{definition}}

\newenvironment{deflist}
{\begin{definitions}\begin{itemize}[nosep, itemsep=4pt, leftmargin=*]}{\end{itemize}\end{definitions}}

\tcolorboxenvironment{definition}{
	boxrule=0pt,
	boxsep=0pt,
	enhanced jigsaw,
	opacityback=0,
	colframe=black,borderline={1pt}{0mm}{black,dashed},
	sharp corners,
	before skip=8pt,
	after skip=8pt,
	left=5pt,
	right=5pt,
	breakable,
}

% Properties
\theoremstyle{numbered}
\newtheorem{property}{Propriété}

\newenvironment{properties}
{\begin{property}[Propriétés]}{\end{property}}

\newenvironment{proplist}
{\begin{property}\begin{itemize}[nosep, itemsep=4pt, leftmargin=*]}{\end{itemize}\end{property}}

\tcolorboxenvironment{properties}{
	boxrule=0pt,
	boxsep=0pt,
	enhanced jigsaw,
	opacityback=0,
	colframe=black,borderline={1pt}{0mm}{black},
	sharp corners,
	before skip=8pt,
	after skip=8pt,
	left=5pt,
	right=5pt,
	breakable,
}

% Lemma
\theoremstyle{numbered}
\newtheorem{lemma}{Lemme}
\tcolorboxenvironment{lemma}{
	boxrule=0pt,
	boxsep=0pt,
	blanker,
	borderline west={0.8pt}{0pt}{decoration={snake,aspect=0.3,segment length=3mm,amplitude=1pt},decorate},
	before skip=8pt,
	after skip=8pt,
	sharp corners,
	left=5pt,
	right=5pt,
	breakable,
}

% Corollary
\theoremstyle{numbered}
\newtheorem{corollary}{Corollaire}
\tcolorboxenvironment{corollary}{
	boxrule=0pt,
	boxsep=0pt,
	blanker,
	borderline west={0.8pt}{0pt}{decoration={zigzag,amplitude=1pt,pre=moveto,segment length=5pt,angle=42},decorate},
	before skip=8pt,
	after skip=8pt,
	sharp corners,
	left=5pt,
	right=5pt,
	breakable,
}

% Remarks
\theoremstyle{unnumbered}
\newtheorem{remark}{Remarque}

\newenvironment{remarks}
{\begin{remark}[Remarques]}{\end{remark}}

\newenvironment{remarklist}
{\begin{remarks}\begin{itemize}[nosep, itemsep=4pt, leftmargin=*]}{\end{itemize}\end{remarks}}

\tcolorboxenvironment{remark}{
	boxrule=0pt,
	boxsep=0pt,
	blanker,
	borderline west={1pt}{0pt}{black,dotted},
	before skip=8pt,
	after skip=8pt,
	sharp corners,
	left=5pt,
	right=5pt,
	breakable,
}

% Example
\theoremstyle{numbered}
\newtheorem{example}{Exemple}

\newenvironment{examples}
{\begin{example}[Exemples]}{\end{example}}

\newenvironment{exlist}
{\begin{examples}\begin{itemize}[nosep, itemsep=4pt, leftmargin=*]}{\end{itemize}\end{examples}}

\tcolorboxenvironment{example}{
	boxrule=0pt,
	boxsep=0pt,
	blanker,
	borderline west={1pt}{0pt}{black},
	sharp corners,
	before skip=8pt,
	after skip=8pt,
	left=5pt,
	right=5pt,
	breakable,
}

