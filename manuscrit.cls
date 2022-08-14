% vim: set ft=tex:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manuscrit}[2022-07-19 Manuscrit de thèse]

\LoadClass[letterpaper, oneside, 11pt]{book}

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

\RequirePackage[style=authoryear]{biblatex}
\addbibresource{references.bib}

% Typographie

%% Police
\RequirePackage{fontspec}
\setmainfont{Libertinus Serif}[BoldFont=Libertinus Serif SemiBold]
\RequirePackage{microtype}

%% Décorations
\RequirePackage{adforn}

%% Structure
\RequirePackage{enumitem}
\newlist{compactitemize}{itemize}{1}
\setlist[compactitemize]{label=\textbullet, itemsep=0pt, parsep=0.5ex}
\renewcommand{\paragraph}[1]{\noindent\textit{#1.}\enspace}

%% En-têtes
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\oldstylenums{\thepage}}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[L,C,R]{}

\renewcommand{\chaptermark}[1]{\markboth{\textsc{\MakeLowercase{\chaptername}\ \oldstylenums{\thechapter}}\ --\ #1}{}}

\setlength{\headheight}{14pt}

% Révision

\newcommand{\tk}[1]{\textcolor{red}{\textsc{tk:}\enspace#1}}

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
\newcommand{\nat}{\mathbb{N}}

%%% Arbres
\newcommand{\tnodes}{V}
\newcommand{\tleavs}{L}
\newcommand{\tinner}{I}
\newcommand{\tedges}{E}
\newcommand{\troot}{r}
\newcommand{\lchild}{_\mathit{\ell}}
\newcommand{\rchild}{_r}
\newcommand{\child}{_c}

\newcommand{\tdesc}{\preceq}
\newcommand{\nottdesc}{\mathrel{/\preceq}}
\newcommand{\tdescneq}{\prec}
\newcommand{\tancs}{\succeq}
\newcommand{\nottancs}{\mathrel{\makebox[0pt]{\(\:\:\succeq\)}/}}
\newcommand{\tancsneq}{\succ}
\newcommand{\tcomp@base}{\makebox[0pt]{\raisebox{-2pt}{\(\mspace{12mu}\prec\)}}\raisebox{2pt}{\(\succ\)}}
\newcommand{\tcomp}{\mathrel{\tcomp@base}}
\newcommand{\nottcomp}{\mathrel{\makebox[0pt]{\(\:\:\:/\)}\tcomp@base}}

\newcommand{\subtree}[2]{#1[#2]}
\newcommand{\lca}{\mathrm{lca}}
\newcommand{\tpath}{\mathbin{\leadsto}}
\newcommand{\tdist}{\mathrm{dist}}

%%% Réconciliations
\newcommand{\llmap}{s}
\newcommand{\rec}{\tilde\llmap}
\newcommand{\reclca}{\rec_{\,\lca}}
\newcommand{\exrec}{\hat\llmap}
\newcommand{\rectree}{\mathcal{R}}
\newcommand{\rectreeDL}{\rectree_{\mathrm{DL}}}

%%% Modèles de réconciliation
\newcommand{\recmodel}{\mathcal{M}}
\newcommand{\cost}{\delta}
\newcommand{\treecost}{\Delta}
\newcommand{\evt}{\mathcal{E}}

\newcommand{\evtE}{\varepsilon}
\newcommand{\evtS}{\mathrm{S}}
\newcommand{\evtD}{\mathrm{D}}
\newcommand{\evtL}{\mathrm{L}}
\newcommand{\evtR}{\mathrm{R}}
\newcommand{\evtT}{\mathrm{T}}
\newcommand{\evtTL}{\mathrm{TL}}
\newcommand{\evtTX}{\mathrm{TX}}

\newcommand{\recmodelDL}{\evtD\evtL}
\newcommand{\recmodelDTL}{\evtD\evtT\evtL}
\newcommand{\recmodelDTLx}{\evtD\evtT\evtL\mathrm{x}}

%%% Réconciliations multiples
\newcommand{\gtrees}{\mathcal{T}}

%%%% Adjacences
\newcommand{\alladjs}{\mathcal{A}}
\newcommand{\lladjset}{A}
\newcommand{\adjset}{\tilde\lladjset}

%% Algorithmes et complexité

\newcommand{\problem}[3]{
    \par\textbf{Problème} \textsc{#1}\textbf{.}\\[1ex]
    \begin{tabular}{@{}p{3em}@{\hskip .7em}|@{\hskip .7em}p{\dimexpr\linewidth-4.4em-1pt}@{}}
        \textbf{Entrée} & #2\\
        \textbf{Sortie} & #3
    \end{tabular}\par
}
\newcommand{\refproblem}[1]{\textsc{#1}}
\newcommand{\bigo}{\mathcal{O}}

% Figures

%% Algorithmes

\RequirePackage[algochapter, plainruled, vlined, linesnumbered, french, onelanguage]{algorithm2e}

\SetKwInput{KwIn}{Entrée}
\SetKwInput{KwOut}{Sortie}
\SetKwProg{Fn}{Fonction}{}{}

\DontPrintSemicolon
\SetNlSty{normalfont}{}{\enspace}

%%% Style des noms d’algos
\SetAlgoCaptionLayout{centerline}
\setlength{\interspacetitleruled}{1ex}
\setlength{\interspacealgoruled}{1ex}

%% Dessin

\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{calc}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{graphs}
\usetikzlibrary{graphdrawing}
\usegdlibrary{trees}
\usegdlibrary{phylogenetics}

\RequirePackage{luacode}
% Disable edge bending in rectangular phylogenetic layout
\begin{luacode*}
    local maeusle = require 'pgf.gd.phylogenetics.Maeusle2012'
    maeusle.bendEdge90Degree = function () end
\end{luacode*}

\tikzset{
    % Reconciliation edges
    associate edge/.style={
        draw, thick, #1,
        shorten <=4pt, shorten >=3pt,
        ->, >=Latex,
    },
    overlaid associate edge/.style={
        draw, line width=4pt, white,
        shorten <=8pt, shorten >=16pt,
        postaction={associate edge=#1},
    },
    associate/.style={every edge/.style={associate edge=#1}},
    overlaid associate/.style={every edge/.style={overlaid associate edge=#1}},
    % Tree layout
    /graph drawing/evolutionary unit length=.66cm,
    /graph drawing/sibling distance=.4cm,
    % Event shapes
    speciation/.style={
        circle, draw,
        inner sep=3pt,
    },
    duplication/.style={
        rectangle, draw,
        inner sep=4pt,
    },
    transfer/.style={
        chamfered rectangle, draw,
        inner sep=2.5pt,
    },
    transfer edge/.style={dashed},
    loss/.style={
        inner sep=2pt,
        execute at end node={\textup{×}},
    },
    dependent/.style={
        font=\small\itshape,
    },
    host/.style={
        font=\small\bfseries,
    },
}

\DeclareRobustCommand{\showspeciation}{\tikz[baseline=-.75ex] \node[speciation] {};}
\DeclareRobustCommand{\showduplication}{\tikz[baseline=-.75ex] \node[duplication] {};}
\DeclareRobustCommand{\showtransfer}{\tikz[baseline=-.75ex] \node[transfer] {};}
\DeclareRobustCommand{\showloss}{\,×\,}

\definecolor{reccolor1}{HTML}{5960F5}
\definecolor{reccolor2}{HTML}{E84D48}
\definecolor{reccolor3}{HTML}{4DB028}
\definecolor{reccolor4}{HTML}{EB8A2F}

%% Légendes

\RequirePackage{caption}
\DeclareCaptionLabelFormat{oldstyle}{\textsc{\MakeLowercase{#1}} \oldstylenums{#2}}
\captionsetup{labelformat=oldstyle, labelsep=endash, margin=2em}

\addto\captionsfrench{\renewcommand{\figurename}{Figure}}
\renewcommand{\AlCapSty}[1]{\textsc{\MakeLowercase{\oldstylenums{#1}}}}
\SetAlgoCaptionSeparator{--}

% Liens et hyperliens

\RequirePackage{hyperref}
\hypersetup{colorlinks=true,allcolors=black}
\RequirePackage{hypcap}
\RequirePackage[nameinlink,noabbrev]{cleveref}

% Métadonnées

\newcommand{\@institution}{}\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\@school}{}\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\@subtitle}{}\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@documentkind}{}\newcommand{\documentkind}[1]{\renewcommand{\@documentkind}{#1}}

% Page de titre

\RequirePackage{catchfile}
\RequirePackage{xstring}

\CatchFileDef{\@headfull}{.git/HEAD}{}
\StrGobbleRight{\@headfull}{1}[\@head]
\StrBehind[2]{\@head}{/}[\@branch]
\CatchFileDef{\@commit}{.git/refs/heads/\@branch}{}
\StrLeft{\@commit}{7}[\@shortcommit]

\renewcommand{\maketitle}{{
    \newgeometry{textwidth=8in}
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
    % \@date
    \textcolor{red}{%
        Brouillon compilé le \today\\
        Révision n°~\@shortcommit
    }

    \vfill
    © \@author, \the\year

    \clearpage
    \restoregeometry
}}
