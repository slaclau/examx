%%
%% This is file `examx.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% examx.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% SVN keywords: $Revision$
%% 
%% Copyright (C) 2022 by Sebastien Laclau
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3c of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2021/06/01]
\ProvidesClass{examx}
[2022/02/02 v1.2.1]
 Adds features to the exam class]



\RequirePackage{kvoptions}
\SetupKeyvalOptions {
    family = examx
    prefix = examx@
}

\DeclareVoidOption{book}{\AtEndOfClass{\input{book.clo}}}


\DeclareBoolOption[true]{formulae}
\DeclareComplementaryOption{noformulae}{formulae}

\newcommand{\formulaesheet}{}

\DeclareBoolOption[false]{shortpaper}
\DeclareComplementaryOption{longpaper}{shortpaper}

\ifexamx@shortpaper
    \AtBeginDocument{\soln}
\fi

\DeclareStringOption{style}[\relax]
\AtEndOfClass{\input{default.clo}}
\AtEndOfClass{
    \if\examx@style\relax\else
        \InputIfFileExists{\examx@style.clo}{}{
            \ClassWarning{examx}{Style {\examx@style} not found}}
    \fi
}
\DeclareStringOption{coverstyle}[\relax]
\AtEndOfClass{
    \if\examx@coverstyle\relax\else
    \InputIfFileExists{{\examx@coverstyle}covers.clo}{}{
        \ClassWarning{examx}{Cover style {\examx@coverstyle} not
        found}}
    \fi
}
\DeclareStringOption{answerbookstyle}[\relax]
\AtEndOfClass{
    \if\examx@answerbookstyle\relax\else
    \InputIfFileExists{{\examx@answerbookstyle}answerbook.clo}{}{
        \ClassWarning{examx}{Answer book style
        {\examx@answerbookstyle}  not found}}
    \fi
}
\DeclareStringOption{solutionstyle}[\relax]
\def\nosolspace{blank}
\AtEndOfClass{
    \ifx\examx@solutionstyle\nosolspace
        \soln
    \fi
    \if\examx@solutionstyle\relax\else
        \csname soln\examx@solutionstyle \endcsname
    \fi
}

\DeclareVoidOption{markscheme}{\PassOptionsToClass{answers}{exam}}
\DeclareVoidOption{answers}{\PassOptionsToClass{answers}{exam}}


\ProcessKeyvalOptions*


\LoadClass[12pt,a4paper]{exam}

\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage[subpreambles=true]{standalone}
\RequirePackage{import}
\RequirePackage{pgfplots}
\RequirePackage{pgf,tikz,tkz-euclide}
\usetikzlibrary{arrows}
\usetikzlibrary{patterns}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{shapes}
\usetikzlibrary{decorations.markings}
\input{tikzconfigforworkbook}
\RequirePackage{mathrsfs}
\RequirePackage{amsmath}
\RequirePackage{gensymb}
\RequirePackage{siunitx}
    \sisetup{inter-unit-product = \ensuremath { { } \cdot { } } }
    \sisetup{per-mode = power}
\RequirePackage{mathtools}
\RequirePackage{bigints}
\RequirePackage{mathdots}
\RequirePackage{maths-macros}
\RequirePackage{tabularx}
\RequirePackage{array}
    \newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\RequirePackage{multicol}
\RequirePackage{hhline}
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{color}
\RequirePackage{geometry}
    \savegeometry{default}
    \savegeometry{main}
\RequirePackage{titlesec}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
    \def\coverfont{Arial}
\setromanfont[Ligatures=TeX]{TeX Gyre Termes}
\RequirePackage{unicode-math}
\setmathfont[math-style=ISO,bold-style=ISO]{TeX Gyre Termes Math}
\renewcommand{\vec}[1]{\mathbf{#1}}
\RequirePackage{hieroglf}
\RequirePackage{tabstackengine}
\stackMath
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{refcount}



\def\examtitle#1{\gdef\@examtitle{#1}} \examtitle{\@title}
\def\examtopic#1{\gdef\@examtopic{#1}} \examtopic{}
\def\examdate#1{\gdef\@examdate{#1}} \examdate{}
\def\examtime#1{\gdef\@examtime{#1}} \examtime{}

\newif\ifcalculator
\calculatortrue
\newcommand{\nocalculator}{\calculatorfalse}
\newcommand{\calculator}{\calculatortrue}

\pointpoints{mark}{marks}
\vpword{Marks}
\vsword{Question total}
\bvpword{Marks}
\bvsword{Question total}

\addpoints

\newcommand{\examcover}{
\savegeometry{previous}
\loadgeometry{default}
\thispagestyle{empty}
\begin{center}
\includegraphics[scale=0.5]{Welly} \par
\vspace{0.25in}
\huge\textsc{{Wellington College}} \par
\huge\textsc{{Mathematics Department}} \par
\vspace{0.25in}
\LARGE \@examtitle \par
\large \@examtopic \par
\LARGE \@examdate \par
\normalsize
\vspace{0.25in}
\ifprintanswers
\huge{\textcolor{red}{MARKSCHEME}}\end{center}
\else
\begin{tabular}{|C{1.5cm}|C{10cm}|}
\hline
Name: &\\[0.3cm]
\hline
Teacher: & \\[0.3cm]
\hline
\end{tabular}
\end{center}
\fi
You have {\@examtime} to complete the test.\\
There are \pointsinrange{Core} marks available.\\
\ifcalculator You may use a calculator.
\else You may not use a calculator. \fi \\
\vspace{0.25in}
\begin{flushright}
\ifprintanswers \else
\partialgradetable{Core}
\fi
\end{flushright}
\loadgeometry{previous}
}



\def\@questionorpartnumber{{}}
\def\@lines{{}}
\def\@partlevel{{}}

\newcommand{\@storequestiondata}[3]{
    \xdef\@questionorpartnumber{\@questionorpartnumber,#1}
    \xdef\@lines{\@lines,#2}
    \xdef\@partlevel{\@partlevel,#3}
}


\newif\if@drop
\@dropfalse

\newcommand{\@droppoints}{}

\newcommand{\@alwaysdroppointsatright}{
    \pointsdroppedatright
    \renewcommand{\@droppoints}{
        \if@drop
        \vspace{-\parskip-\baselineskip}

        \droppoints

        \@dropfalse
        \fi
    }
}
\BeforeBeginEnvironment{subparts}{\@droppoints}
\BeforeBeginEnvironment{parts}{\@droppoints}
\BeforeBeginEnvironment{questions}{\@droppoints}

\AtEndEnvironment{subparts}{\@droppoints}
\AtEndEnvironment{parts}{\@droppoints}
\AtEndEnvironment{questions}{\@droppoints}


\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}[
    \@storequestiondata{\arabic{section}}{1}{-1}
    \label{sec:\Alph{section}}
]
\appto{\questions}{
    \let\oldquestion\question
    \RenewDocumentCommand{\question}{o O{\@linesperpart} O{}}{
        \@droppoints

        \IfNoValueTF{#1}
        {\oldquestion \@storequestiondata{\thequestion}{0}{0}}
        {\ifnum #1<0
            \oldquestion
        \else
            \oldquestion[#1] \@droptrue
        \fi
        \@storequestiondata{\thequestion}{#2}{0}}
    }
}
\newcommand{\examx@partshook}{
    \let\oldpart\part
    \RenewDocumentCommand{\part}{o O{\@linesperpart}}{
        \@droppoints

        \IfNoValueTF{##1}
        {\oldpart \@storequestiondata{\arabic{partno}}{0}{1}}
        {\ifnum ##1<0 \oldpart \else \oldpart[##1] \@droptrue \fi
        \@storequestiondata{\arabic{partno}}{##2}{1}}
    }
}

\newcommand{\examx@subpartshook}{
    \let\oldsubpart\subpart
    \RenewDocumentCommand{\subpart}{o O{\@linesperpart}}{
        \@droppoints

        \IfNoValueTF{##1}
        {\oldsubpart}
        {\ifnum ##1<0 \oldsubpart \else \oldsubpart[##1] \@droptrue \fi
        }
    }
}
\appto{\parts}{
    \examx@partshook
}
\appto{\subparts}{
    \examx@subpartshook
}

\renewcommand{\subpartlabel}{(\thesubpart)}
\pointsinrightmargin
\bracketedpoints
\totalformat{\textbf{Total \totalpoints\ marks}}
\newcommand{\questionpaperstart}{}
\newcommand{\questionpaperend}{}

\AtBeginEnvironment{questions}{\begingradingrange{Core}
    \questionpaperstart}
\AtEndEnvironment{questions}{\endgradingrange{Core}\questionpaperend
    \label{lastpageofquestionpaper}}


\newcommand{\msexamnewpage}{
    \@droppoints
    \ifexamx@shortpaper \else \clearpage \fi
}

\newcommand{\examnewpage}{
    \@droppoints
    \ifexamx@shortpaper \else \ifprintanswers \else \newpage \fi \fi
}


\newif\ifsoln
\newif\ifsolnspace
\newif\ifsolndots
\newif\ifsolnlines
\newif\ifsolngrid

\newcommand{\soln}{
    \solntrue\solnspacefalse\solndotsfalse\solnlinesfalse\solngridfalse}
\newcommand{\solnspace}{
    \solnfalse\solnspacetrue\solndotsfalse\solnlinesfalse\solngridfalse}
\newcommand{\solndots}{
    \solnfalse\solnspacefalse\solndotstrue\solnlinesfalse\solngridfalse}
\newcommand{\solnlines}{
    \solnfalse\solnspacefalse\solndotsfalse\solnlinestrue\solngridfalse}
\newcommand{\solngrid}{
    \solnfalse\solnspacefalse\solndotsfalse\solnlinesfalse\solngridtrue}

\solndots

\newcommand{\solnorhook}{}
\newcommand{\@solnorhook}{
    \renewcommand{\examx@partshook}{}
    \renewcommand{\examx@subpartshook}{}
    \solnorhook
}
\renewcommand{\solutiontitle}{}
\newcommand{\solnor}[2][1]{%
    \@droppoints
    \begingroup
    \@solnorhook
    \ifsoln
    \begin{solution}
        #2
    \end{solution}
    \else \ifsolnspace
    \begin{solution}[\stretch{#1}]
        #2
    \end{solution}
    \else \ifsolndots
    \begin{solutionordottedlines}[\stretch{#1}]
        #2
    \end{solutionordottedlines}
    \else \ifsolnlines
    \begin{solutionorlines}[\stretch{#1}]
        #2
    \end{solutionorlines}
    \else \ifsolngrid
    \begin{solutionorgrid}[\stretch{#1}]
        #2
    \end{solutionorgrid}
    \fi\fi\fi\fi\fi
    \endgroup
}

\newcommand{\solnordots}[2][1]{%
    \@solnorhook
    \ifsoln
    \begin{solution}
        #2
    \end{solution}
    \else
    \begin{solutionordottedlines}[\stretch{#1}]
        #2
    \end{solutionordottedlines}
    \fi
}

\newcommand{\solnpage}{
    \@droppoints
    \ifexamx@shortpaper \else \ifprintanswers \else \ifsoln\else
        \newpage
    \ifsolnspace
        \mbox{}
    \else \ifsolndots
        \fillwithdottedlines{\stretch{1}}
    \else \ifsolnlines
        \fillwithlines{\stretch{1}}
    \else \ifsolngrid
        \fillwithgrid{\stretch{1}}
    \fi\fi\fi\fi
        \newpage
    \fi\fi\fi
}

\newcommand{\exmark}[1][A1]{\text{\textcolor{red}{[#1]}}}
\newcommand{\bmark}[1][A1]{\text{\textcolor{blue}{[#1]}}}


\def\linesperpart#1{\gdef\@linesperpart{#1}} \linesperpart{5}
\def\spaceperpart#1{\gdef\@spaceperpart{#1}} \spaceperpart{2.5in}
\def\pagesperquestion#1{\gdef\@pagesperquestion{#1}} \pagesperquestion{1}
\newif\ifanswerbook
\answerbookfalse

\newcommand{\answerbook}{
    \ifprintanswers \else
        \answerbooktrue
        \cleardoublepage
        \setcounter{page}{1}
        \answerbookcover
        \answerbookpages
        \clearpage
        \oddeven{\doubleanswerbookbackcover}{\answerbookbackcover}
        \label{lastpageofanswerbook}
    \fi
}

\newcommand{\answerbookcover}{
    \savegeometry{previous}
    \loadgeometry{default}
    \thispagestyle{empty}
    \begin{center}
        \includegraphics[scale=0.5]{Welly} \par
        \vspace{0.25in}
        \huge\textsc{{Wellington College}} \par
        \huge\textsc{{Mathematics Department}} \par
        \vspace{0.25in}
        \LARGE \@examtitle \par
        \large \@examtopic \par
        \LARGE \@examdate \par
        \normalsize
        \vspace{0.25in}
        \huge ANSWER BOOKLET \par
        \vspace{0.25in}
        \normalsize
        \begin{tabular}{|m{1.5cm}|m{10cm}|}
            \hline
            Name: &\\[0.3cm]
            \hline
            Teacher: & \\[0.3cm]
            \hline
        \end{tabular}
    \end{center}
    You have {\@examtime} to complete the test.\\
    There are \pointsinrange{Core} marks available.\\
    \ifcalculator You may use a calculator.
    \else You may not use a calculator. \fi \\
    \vspace{0.25in}
    \begin{flushright}
        \partialgradetable{Core}
    \end{flushright}
    \newpage
    \loadgeometry{previous}
}

\newcommand{\answerbookpages}{
    \newcounter{int}
    \newcounter{iint}
    \setcounter{int}{0}
    \loop
    \addtocounter{int}{1}
    \theint.

    \setcounter{iint}{\@pagesperquestion}
    {\loop
        \addtocounter{iint}{-1}
        \fillwithdottedlines{\stretch{1}}
        \newpage
        \ifnum \theiint>0
        \repeat}
    \ifnum \theint<\numquestions
    \repeat
}

\newcommand{\answerbookbackcover}{}
\newcommand{\doubleanswerbookbackcover}{}
\endinput
%%
%% End of file `examx.cls'.
