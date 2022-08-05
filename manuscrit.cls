\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manuscrit}[2022-07-19 Manuscrit de thèse]

\LoadClass[letterpaper, 11pt]{book}

% Format
\RequirePackage{geometry}
\RequirePackage[skip=.75\baselineskip]{parskip}
\RequirePackage{setspace}
\onehalfspacing

% Langage

\RequirePackage{csquotes}
\RequirePackage{polyglossia}
\setmainlanguage{french}

% Bibliographie

\RequirePackage[style=ieee, citestyle=numeric-comp]{biblatex}
\addbibresource{references.bib}

% Liens et hyperliens

\RequirePackage{hyperref}
\hypersetup{colorlinks=true,allcolors=black}
\RequirePackage{hypcap}

\renewcommand{\figureautorefname}{fig.}

% Typographie

%% Police
\RequirePackage{fontspec}
\setmainfont{Libertinus Serif}

%% Décorations
\RequirePackage{adforn}

%% Sectionnage
\renewcommand{\paragraph}[1]{\noindent\textit{#1.}\enspace}

% Mathématiques

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

%% Police

\RequirePackage{unicode-math}
\setmathfont{Libertinus Math}

%% Théorèmes/définitions

\theoremstyle{plain}
\newtheorem{theorem}{Théorème}[chapter]
\newtheorem{lemma}[theorem]{Lemme}

\theoremstyle{definition}
\newtheorem{definition}{Définition}[chapter]
\newtheorem{remark}[definition]{Remarque}

%% Notations

%%% Général
\newcommand{\onto}{\rightarrow}
\newcommand{\suchthat}{\mathrel{:}}

%%% Arbres
\newcommand{\tnodes}{V}
\newcommand{\tleavs}{L}
\newcommand{\tinner}{I}
\newcommand{\tedges}{E}
\newcommand{\tdesc}{\preceq}
\newcommand{\nottdesc}{\mathrel{/\preceq}}
\newcommand{\tdescneq}{\prec}
\newcommand{\tancs}{\succeq}
\newcommand{\nottancs}{\mathrel{\makebox[0pt]{\(\:\:\succeq\)}/}}
\newcommand{\tancsneq}{\succ}
\newcommand{\lchild}{_\mathit{\ell}}
\newcommand{\rchild}{_r}
\newcommand{\lca}{\mathrm{lca}}
\newcommand{\subtree}[2]{#1\!\left[#2\right]}
\newcommand{\tpath}{\mathbin{\leadsto}}

%%% Réconciliations
\newcommand{\llmap}{s}
\newcommand{\rec}{\tilde\llmap}

% Figures

\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{calc}
\usetikzlibrary{arrows.meta}

% Métadonnées

\newcommand{\@institution}{}\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\@school}{}\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\@subtitle}{}\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@documentkind}{}\newcommand{\documentkind}[1]{\renewcommand{\@documentkind}{#1}}

% Page de titre

\renewcommand{\maketitle}{{
    \clearpage
    \thispagestyle{empty}
    \centering

    \@institution

    \vfill
    {\Large\textbf{\@title}\\[.1em]
    \large\emph{\@subtitle}\par}

    \vfill
    par\\
    {\large\@author\par}

    \vfill
    {\large\adforn{45}}

    \vfill
    \@school

    \vfill
    \@documentkind

    \vfill
    \@date

    \vfill
    © \@author, \the\year

    \clearpage
}}