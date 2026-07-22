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
\newlist{condition}{enumerate}{2}
\setlist[condition]{ref=(\arabic*), label=\arabic*., itemsep=0pt, parsep=0.5ex}
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

%% Colonnes et grilles
\newcommand{\sidecols}[4]{%
    \noindent\hspace*{\fill}%
    \begin{minipage}[b]{#1}\vspace*{0pt}#3\end{minipage}\hfill%
    \begin{minipage}[b]{#2}\vspace*{0pt}#4\end{minipage}\hspace*{\fill}%
}
\newcommand{\threecols}[6]{%
    \noindent\hspace*{\fill}%
    \begin{minipage}[b]{#1}\vspace*{0pt}#4\end{minipage}\hfill%
    \begin{minipage}[b]{#2}\vspace*{0pt}#5\end{minipage}\hfill%
    \begin{minipage}[b]{#3}\vspace*{0pt}#6\end{minipage}\hspace*{\fill}%
}

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
\RequirePackage{multirow}
\RequirePackage{makecell}

%% Code
\RequirePackage[chapter]{minted}
\setminted{
    bgcolor=black!3,
    bgcolorpadding=2ex,
}

%% Algorithmes
\RequirePackage[plain]{algorithm}
\RequirePackage[commentColor=black!60,endLComment={}]{algpseudocodex}
\counterwithin{algorithm}{chapter}
\renewcommand{\mathellipsis}{.\kern.4pt.\kern.4pt.\kern.6pt}
\renewcommand{\algorithmicindent}{.8em}
\algrenewcommand{\alglinenumber}[1]{\color{gray}\scriptsize#1}

\tikzset{ % style des boîtes dessinées par algpseudocodex dans des algorithmes
    algpxDefaultBox/.style={
        fill=black!10,
        draw=black!40,
        inner xsep=1pt,
        inner ysep=1.5pt,
        rounded corners=2pt,
    },
}

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

\RequirePackage{forest}
\useforestlibrary{edges}
\input{fig/defs}

%% Diagrammes
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

%% Légendes
\RequirePackage{caption}
\DeclareCaptionLabelFormat{oldstyle}{\textsc{\MakeLowercase{#1}} \oldstylenums{#2}}
\captionsetup{labelformat=oldstyle, labelsep=endash, margin=2em}

% Liens et hyperliens

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

% Traductions

\crefname{problem}{problem}{problems}
\crefname{property}{property}{properties}
\crefname{conditioni}{condition}{conditions}
\newcommand{\listingname}{}

\addto\captionsfrench{%
    \renewcommand{\figurename}{Figure}%
    \renewcommand{\listingname}{Programme}%
    \crefname{listing}{programme}{programmes}%
    \Crefname{listing}{Programme}{Programmes}%
    \renewcommand{\listoflistingscaption}{Liste des programmes}%
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
    \crefname{property}{propriété}{propriétés}%
    \Crefname{property}{Propriété}{Propriétés}%
    \renewcommand{\tablename}{Tableau}%
    \crefname{table}{tableau}{tableaux}%
    \Crefname{table}{Tableau}{Tableaux}%
    \captionsetup[algorithm]{name=Algorithme}%
    \crefname{algorithm}{algorithme}{algorithmes}%
    \Crefname{algorithm}{Algorithme}{Algorithmes}%
    \renewcommand{\listalgorithmname}{Liste des algorithmes}%
    \algrenewcommand{\algorithmicforall}{\textbf{pour chaque}}
    \algrenewcommand{\algorithmicrequire}{\textbf{Entrée:}}
    \algrenewcommand{\algorithmicensure}{\textbf{Sortie:}}
    \algrenewcommand{\algorithmicfunction}{\textbf{fonction}}
    \algrenewcommand{\algorithmicreturn}{\textbf{retourner}}
    \algrenewcommand{\algorithmicif}{\textbf{si}}
    \algrenewcommand{\algorithmicthen}{\textbf{alors}}
    \algrenewcommand{\algorithmicelse}{\textbf{sinon}}
    \crefname{chapter}{chapitre}{chapitres}%
    \Crefname{chapter}{Chapitre}{Chapitres}%
    \crefname{enumi}{point}{points}%
    \Crefname{enumi}{Point}{Points}%
    \crefname{conditioni}{condition}{conditions}%
    \Crefname{conditioni}{Condition}{Conditions}%
}
\addto\captionsenglish{%
    \renewcommand{\figurename}{Figure}%
    \renewcommand{\listingname}{Listing}%
    \renewcommand{\listoflistingscaption}{List of Listings}%
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
    \crefname{property}{property}{properties}%
    \Crefname{property}{Property}{Properties}%
    \renewcommand{\tablename}{Table}%
    \crefname{table}{table}{tables}%
    \Crefname{table}{Table}{Tables}%
    \captionsetup[algorithm]{name=Algorithm}%
    \crefname{algorithm}{algorithm}{algorithms}%
    \Crefname{algorithm}{Algorithm}{Algorithms}%
    \renewcommand{\listalgorithmname}{List of Algorithms}%
    \algrenewcommand{\algorithmicforall}{\textbf{for each}}
    \algrenewcommand{\algorithmicrequire}{\textbf{Input:}}
    \algrenewcommand{\algorithmicensure}{\textbf{Output:}}
    \algrenewcommand{\algorithmicfunction}{\textbf{function}}
    \algrenewcommand{\algorithmicreturn}{\textbf{return}}
    \algrenewcommand{\algorithmicif}{\textbf{if}}
    \algrenewcommand{\algorithmicthen}{\textbf{then}}
    \algrenewcommand{\algorithmicelse}{\textbf{else}}
    \crefname{chapter}{chapter}{chapters}%
    \Crefname{chapter}{Chapter}{Chapters}%
    \crefname{enumi}{item}{items}%
    \Crefname{enumi}{Item}{Items}%
    \crefname{conditioni}{condition}{conditions}%
    \Crefname{conditioni}{Condition}{Conditions}%
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
    Présidente rapporteuse

    \personref{\@jurydirec}\\
    Directrice de recherche

    \personref{\@jurymember}\\
    Membre du jury

    \personref{\@juryext}\\
    Examinatrice externe

    \clearpage
}}

%% Métadonnées d’articles
\newcommand{\@articlemeta}[5]{%
    \begin{tabular}{@{}rp{3.5cm}p{8cm}@{}}
        \toprule
        \textsc{titre original} &
        \multicolumn{2}{l}{\emph{\textenglish{#2}}} \\
        \midrule
        \textsc{date d’écriture} &
        \multicolumn{2}{l}{#3} \\
        \midrule
        \textsc{dissémination} &
        \multicolumn{2}{p{11.5cm}}{#4} \\
        \midrule
        #1 #5 \\
        \bottomrule
    \end{tabular}%
}
\newcommand{\articlemetasingle}{\@articlemeta{\textsc{auteur}}}
\newcommand{\articlemeta}{\@articlemeta{\makecell[tr]{\textsc{auteur.e.s et}\\[-.5ex]\textsc{contributions}}}}
