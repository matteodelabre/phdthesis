%! TeX root = ./main.tex
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

\RequirePackage[autostyle=true]{csquotes}
\RequirePackage{polyglossia}
\setmainlanguage{french}
\setotherlanguage{english}

% Bibliographie

\RequirePackage[style=authoryear]{biblatex}
\addbibresource{references.bib}

% Typographie

%% Police
\RequirePackage{fontspec}
\setmainfont{Libertinus Serif}
\RequirePackage[stretch=10, shrink=10]{microtype}

%% Décorations
\RequirePackage{adforn}

%% Structure
\RequirePackage{enumitem}
\newlist{compactitemize}{itemize}{2}
\setlist[compactitemize]{label=\textbullet, itemsep=0pt, parsep=0.5ex}
\renewcommand{\paragraph}[1]{\noindent\textit{#1.}\enspace}
\setlength{\columnsep}{2em}

%% Désactive les numéros de page en début de chapitre
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                      \thispagestyle{empty}%
                      \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter}

%% En-têtes
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhead[L,C,R]{}
\fancyhead[L]{\leftmark\quad\hrulefill}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[L,C,R]{}
\fancyfoot[C]{\oldstylenums{\thepage}}

\renewcommand{\chaptermark}[1]{\markboth{\textsc{\oldstylenums{%
    \MakeLowercase{\chaptername}\ \thechapter\ %
    --\ \MakeLowercase{#1}%
}}}{}}

\setlength{\headheight}{14pt}

% Révision

\newcommand{\tk}[1]{\textcolor{red}{\textsc{tk:}\enspace#1}}

% Mathématiques

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{amssymb}
\RequirePackage{mleftright}

%% Police
\RequirePackage{unicode-math}
\setmathfont{Libertinus Math}

%% Théorèmes/définitions
\newcommand{\manu@name@definition}{}
\declaretheorem[
    style=definition,
    qed=\(\blacklozenge\),
    numberwithin=section,
    name={\noexpand\noexpand\noexpand\manu@name@definition},
]{definition}

\newcommand{\manu@name@example}{}
\declaretheorem[
    style=remark,
    qed=\(\lozenge\),
    numberwithin=section,
    name={\noexpand\noexpand\noexpand\manu@name@example},
]{example}

\newcommand{\manu@name@remark}{}
\declaretheorem[
    style=remark,
    numberwithin=section,
    name={\noexpand\noexpand\noexpand\manu@name@remark},
]{remark}

\newcommand{\manu@name@theorem}{}
\declaretheorem[
    style=theorem,
    numberwithin=section,
    name={\noexpand\noexpand\noexpand\manu@name@theorem},
]{theorem}

\newcommand{\manu@name@lemma}{}
\declaretheorem[
    style=theorem,
    numberwithin=section,
    name={\noexpand\noexpand\noexpand\manu@name@lemma},
]{lemma}

%% Notations
\input{notations}

% Figures

%% Tables
\RequirePackage{booktabs}

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
\usetikzlibrary{positioning,calc}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{shapes.geometric,shapes.misc}
\usetikzlibrary{fit}
\usetikzlibrary{patterns,patterns.meta}
\usetikzlibrary{graphs,graphdrawing}
\usegdlibrary{trees}
\usegdlibrary{phylogenetics}

\RequirePackage{luacode}
% Disable edge bending in rectangular phylogenetic layout
\begin{luacode*}
    local maeusle = require 'pgf.gd.phylogenetics.Maeusle2012'
    maeusle.bendEdge90Degree = function () end
\end{luacode*}

\tikzset{
    separator rule/.style={
        draw=black!25,
    },
    % Reconciliation edges
    associate edge/.style={
        draw, thick, #1,
        shorten <=4pt, shorten >=3pt,
        ->, >=Latex,
    },
    overlaid associate edge/.style={
        draw, line width=4pt, white,
        shorten <=8pt, shorten >=8pt,
        postaction={associate edge=#1},
    },
    associate/.style={every edge/.style={associate edge=#1}},
    overlaid associate/.style={every edge/.style={overlaid associate edge=#1}},
    % Directed edges
    directed edge/.style={
        draw,
        postaction={decorate},
        decoration={
            markings,
            mark=at position 0.5 with {
                \fill (2.5pt, 0) -- (-2.1pt, 2pt) -- (-2.1pt, -2pt) -- cycle;
            },
        },
    },
    directed/.style={every edge/.style={directed edge}},
    marked directed edge/.style={
        ultra thick, draw=marking,
        shorten >=0.11pt, shorten <=0.11pt,
        postaction={
            directed edge, thin, black,
            decoration={
                markings,
                mark=at position 0.5 with {
                    \fill[marking, blend mode=darken]
                        (3.7pt, 0) -- (-2.9pt, 3.2pt) -- (-2.9pt, -3.2pt) -- cycle;
                    \fill[black]
                        (2.5pt, 0) -- (-2.1pt, 2pt) -- (-2.1pt, -2pt) -- cycle;
                },
            },
        },
    },
    marked directed/.style={every edge/.style={marked directed edge}},
    marked edge/.style={
        ultra thick, draw=marking,
        shorten >=0.11pt, shorten <=0.11pt,
        postaction={
            draw, thin, black,
        },
    },
    marked/.style={every edge/.style={marked edge}},
    % Tree layout
    /graph drawing/evolutionary unit length=.66cm,
    /graph drawing/sibling distance=.4cm,
    % Generic shapes
    graph node/.style={
        circle, draw, fill,
        inner sep=1pt, outer sep=0pt,
    },
    hollow graph node/.style={
        circle, draw,
        inner sep=1pt, outer sep=0pt,
        font={\bfseries\small},
    },
    % Event shapes
    speciation/.style={
        circle, draw, fill=white,
        inner sep=3pt,
    },
    duplication/.style={
        rectangle, draw, fill=white,
        inner sep=4pt,
    },
    transfer/.style={
        chamfered rectangle, draw, fill=white,
        inner sep=2.5pt,
    },
    transfer edge/.style={dashed},
    transfer edge cleft/.style={
        ->, >=Latex,
        bend left,
    },
    transfer edge cright/.style={
        transfer edge cleft,
        bend right,
    },
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
    % Reconciliation layout
    host node/.style={
        ellipse,
        fill=#1!10,
    },
    host node/.default={black},
    host leaf node/.style={
        host node={#1},
        inner sep=0pt,
    },
    host edge/.style={
        fill=#1!5,
    },
    host edge/.default={black},
    host edge terminal/.style={
        host edge={#1},
        rounded corners,
    },
    host edge unsampled/.style={
        host edge terminal,
        pattern={Lines[
            distance=.125cm,
            angle=30,
            line width=.05cm,
        ]},
        pattern color=#1!5,
    },
    host edge unsampled/.default={black},
    % Adjacencies
    adjacency edge/.style={
        draw, black, thick,
        line cap=round,
        dash pattern=on 0pt off 1.75\pgflinewidth,
    },
    adjacency/.style={every edge/.style={adjacency edge}},
}

\pgfdeclarelayer{hostnodes}
\pgfdeclarelayer{hostedges}
\pgfsetlayers{hostedges,hostnodes,main}

\DeclareRobustCommand{\showspeciation}{\,\tikz[baseline=-.75ex] \node[speciation] {};\,}
\DeclareRobustCommand{\showduplication}{\,\tikz[baseline=-.75ex] \node[duplication] {};\,}
\DeclareRobustCommand{\showtransfer}{\,\tikz[baseline=-.75ex] \node[transfer] {};\,}
\DeclareRobustCommand{\showloss}{\,×\,}

\definecolor{color1}{HTML}{2E47D8}
\definecolor{reccolor1}{HTML}{5960F5}
\definecolor{color2}{HTML}{C82F30}
\definecolor{reccolor2}{HTML}{E84D48}
\definecolor{color3}{HTML}{2B9500}
\definecolor{reccolor3}{HTML}{4DB028}
\definecolor{color4}{HTML}{CE7112}
\definecolor{reccolor4}{HTML}{EB8A2F}

\colorlet{marking}{reccolor2!35}

%% Légendes
\RequirePackage{caption}
\DeclareCaptionLabelFormat{oldstyle}{\textsc{\MakeLowercase{#1}} \oldstylenums{#2}}
\captionsetup{labelformat=oldstyle, labelsep=endash, margin=2em}

\addto\captionsfrench{\renewcommand{\figurename}{Figure}}
\renewcommand{\AlCapSty}[1]{\textsc{\MakeLowercase{\oldstylenums{#1}}}}
\SetAlgoCaptionSeparator{--}

% Liens et hyperliens

\definecolor{lightblue}{HTML}{0074D9}
\colorlet{linkhg}{lightblue}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=linkhg,
    citecolor=linkhg,
    urlcolor=linkhg,
}
\RequirePackage{hypcap}
\RequirePackage[nameinlink,noabbrev]{cleveref}

\crefname{problem}{x}{y}

% Traductions

\addto\captionsfrench{%
    \renewcommand{\crefrangeconjunction}{ à~}%
    \renewcommand{\crefpairconjunction}{ et~}%
    \renewcommand{\crefmiddleconjunction}{, }%
    \renewcommand{\creflastconjunction}{, }%
    \renewcommand{\manu@name@definition}{Définition}%
    \crefname{definition}{définition}{définitions}%
    \Crefname{definition}{Définition}{Définitions}%
    \renewcommand{\manu@name@example}{Exemple}%
    \crefname{example}{exemple}{exemples}%
    \Crefname{example}{Exemple}{Exemples}%
    \renewcommand{\manu@name@remark}{Remarque}%
    \crefname{remark}{remarque}{remarques}%
    \Crefname{remark}{Remarque}{Remarques}%
    \renewcommand{\manu@name@theorem}{Théorème}%
    \crefname{theorem}{théorème}{théorèmes}%
    \Crefname{theorem}{Théorème}{Théorèmes}%
    \renewcommand{\manu@name@lemma}{Lemme}%
    \crefname{lemma}{lemme}{lemmes}%
    \Crefname{lemma}{Lemme}{Lemmes}%
    \renewcommand{\manu@name@problem}{Problème}%
    \crefname{problem}{problème}{problèmes}%
    \Crefname{problem}{Problème}{Problèmes}%
    \renewcommand{\manu@name@problem@input}{Entrée}%
    \renewcommand{\manu@name@problem@output}{Sortie}%
    \renewcommand{\manu@name@problem@query}{Question}%
    \crefname{chapter}{chapitre}{chapitres}%
    \Crefname{chapter}{Chapitre}{Chapitres}%
    \crefname{enumi}{point}{points}%
    \Crefname{enumi}{Point}{Points}%
}
\addto\captionsenglish{%
    \renewcommand{\crefrangeconjunction}{ to~}%
    \renewcommand{\crefpairconjunction}{ and~}%
    \renewcommand{\crefmiddleconjunction}{, }%
    \renewcommand{\creflastconjunction}{, }%
    \renewcommand{\manu@name@definition}{Definition}%
    \crefname{definition}{definition}{definitions}%
    \Crefname{definition}{Definition}{Definitions}%
    \renewcommand{\manu@name@example}{Example}%
    \crefname{example}{example}{examples}%
    \Crefname{example}{Example}{Examples}%
    \renewcommand{\manu@name@remark}{Remark}%
    \crefname{remark}{remark}{remarks}%
    \Crefname{remark}{Remark}{Remarks}%
    \renewcommand{\manu@name@theorem}{Theorem}%
    \crefname{theorem}{theorem}{theorems}%
    \Crefname{theorem}{Theorem}{Theorems}%
    \renewcommand{\manu@name@lemma}{Lemma}%
    \crefname{lemma}{lemma}{lemmas}%
    \Crefname{lemma}{Lemma}{Lemmas}%
    \renewcommand{\manu@name@problem}{Problem}%
    \crefname{problem}{problem}{problems}%
    \Crefname{problem}{Problem}{Problems}%
    \renewcommand{\manu@name@problem@input}{Input}%
    \renewcommand{\manu@name@problem@output}{Output}%
    \renewcommand{\manu@name@problem@query}{Question}%
    \crefname{chapter}{chapter}{chapters}%
    \Crefname{chapter}{Chapter}{Chapters}%
    \crefname{enumi}{item}{items}%
    \Crefname{enumi}{Item}{Items}%
}

% Pages liminaires

%% Métadonnées
\newcommand{\@institution}{}\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\@school}{}\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\@subtitle}{}\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@documentkind}{}\newcommand{\documentkind}[1]{\renewcommand{\@documentkind}{#1}}
\newcommand{\@jurypres}{}\newcommand{\jurypres}[1]{\renewcommand{\@jurypres}{#1}}
\newcommand{\@jurydirec}{}\newcommand{\jurydirec}[1]{\renewcommand{\@jurydirec}{#1}}
\newcommand{\@jurymember}{}\newcommand{\jurymember}[1]{\renewcommand{\@jurymember}{#1}}
\newcommand{\@juryext}{}\newcommand{\juryext}[1]{\renewcommand{\@juryext}{#1}}

%% Page de titre
\RequirePackage{catchfile}
\RequirePackage{xstring}

\CatchFileDef{\@headfull}{.git/HEAD}{}
\StrGobbleRight{\@headfull}{1}[\@head]
\StrBehind[2]{\@head}{/}[\@branch]
\CatchFileDef{\@commit}{.git/refs/heads/\@branch}{}
\StrLeft{\@commit}{7}[\@shortcommit]

\newcommand{\personref}[1]{\large\textbf{#1}}

\renewcommand{\maketitle}{{
    % \newgeometry{textwidth=8in}
    \clearpage
    \thispagestyle{empty}
    \centering

    \@institution

    \vfill
    {\Large\textbf{\@title}\\[.1em]
    \large\emph{\@subtitle}\par}

    \vfill
    par

    {\personref{\@author}\par}

    \vfill
    {\large\adforn{45}}

    \vfill
    \@school

    \vfill
    \@documentkind

    \vfill
    \@date\\
    Numéro de révision \@shortcommit

    \vfill
    © \@author, \the\year

    \clearpage
    % \restoregeometry
}}

%% Page de jury
\newcommand{\makejury}{{
    % \newgeometry{textwidth=8in}
    \clearpage
    \thispagestyle{empty}
    \centering

    \@institution\\
    \@school

    \vfill
    Cette thèse intitulée

    \vfill
    {\Large\textbf{\@title}\\[.1em]
    \large\emph{\@subtitle}\par}

    \vfill
    présentée par

    \personref{\@author}

    \vfill
    a été évaluée par un jury composé des personnes suivantes

    \vspace{1ex}
    \personref{\@jurypres}\\
    Présidente

    \personref{\@jurydirec}\\
    Directrice de recherche

    \personref{\@jurymember}\\
    Membre du jury

    \personref{\@juryext}\\
    Examinatrice externe

    \clearpage
}}

%% Pages d’articles
\newenvironment{abstract}{\small\list{}{\rightmargin.5in\leftmargin.5in}\item[]\textbf{Abstract:}}{\endlist}

\newcommand{\keywords}[1]{\textbf{Keywords:}\renewcommand{\and}{~·~} #1}

\newcommand{\inst}[1]{\textsuperscript{#1}}
\newcommand{\@institute}{}
\newcommand{\institute}[1]{\renewcommand{\@institute}{#1}}

\newcommand{\makearticlehead}{{%
    \newpage
    \centering
    {\Large\@title\par}

    \renewcommand{\and}{\quad}
    \@author

    \renewcommand{\and}{\\}
    {\small\@institute\par}

}}
