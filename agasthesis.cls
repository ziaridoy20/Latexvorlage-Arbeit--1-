%%
%% agasthesis.cls
%%
%% $Id: agasthesis.cls 354 2009-05-12 13:43:09Z droege $
%%
\NeedsTeXFormat{LaTeX2e}              % Latex format
\ProvidesClass{agasthesis}            % class name
\def\BaseClass{book}                  % define base class

% pass options to base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\BaseClass}} 
\ProcessOptions                       % process options
\LoadClass[twoside,12pt,a4paper]{\BaseClass}  % load base class with arguments
\RequirePackage{a4}                   % a4 page layout (former a4wide)
\RequirePackage{german}               % german hyphenation etc.
\RequirePackage{amsmath}              % standard math notation (vectors/sets/...)
\RequirePackage{amssymb}              % AMS math symbols
\RequirePackage{math}                 % standard math notation (vectors/sets/...)
\RequirePackage{graphicx}             % eps graphics support
\usepackage[small,bf]{caption}        % for small captions in figures, tables etc.
%\RequirePackage{subfig}           	  % for multiple images in one figure
%\RequirePackage{palatino}            % use palatino font
%\RequirePackage{times}               % use times font
\RequirePackage{listings}             % for source code and algorithms
\usepackage{psfrag}                   % for eps figure manipulation

\usepackage[latin1]{inputenc} % Deutsche Spache verwenden, ansonsten nächste Zeile reinkommentieren
%\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}
\usepackage{graphicx}
\usepackage{color}

\usepackage{lipsum}

\usepackage[pdfborder={0.1 0.1 0.0},colorlinks=true,pagebackref,bookmarksopen,bookmarksnumbered]{hyperref}
\usepackage[left=2.5cm, right=2.5cm, top=3cm]{geometry}

\definecolor{black}{rgb}{0.0,0.0,0.0}
\definecolor{dark-blue}{rgb}{0.15,0.15,0.4}
\definecolor{dark-green}{RGB}{18,71,7}
\definecolor{medium-blue}{rgb}{0,0,0.5}
\hypersetup{
	colorlinks, linkcolor={dark-blue},
	citecolor={medium-blue}, urlcolor={medium-blue}
}

\usepackage{hypcap}

% EMail klickbar
\usepackage{url}

% U.a. fï¿½r Zeilenabstand
\usepackage{setspace}

% Fï¿½r Tabellen
\usepackage{booktabs}
\usepackage{array} % for extrarowheight

% Fï¿½r auf der selben Seite lassen
\interfootnotelinepenalty = 10000

\clubpenalty = 10000                  % against clubs
\widowpenalty = 10000                 % against
\displaywidowpenalty = 10000          % widows

% Vor neuen Sections immer das
%\FloatBarrier

%\usepackage{prelim2e}
%\renewcommand{\PrelimText}{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\aaa}

% Das Spacing so sieht meist besser aus, siehe https://tex.stackexchange.com/questions/10743/why-does-latex-stretch-small-sections-across-the-whole-page-vertically 
\raggedbottom

% clear double page on new chapter
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}

\let\oldChapter=\chapter
\def\chapter{\clearemptydoublepage\oldChapter}

%% Test ob PDF-Ausgabemodus aktiv ist, dann PDF, PNG und JPG zulassen
\newif\ifmakepdf
\makepdffalse
\ifx\pdfoutput\undefined
  % (z.B., wenn gar nicht pdfTeX laeuft)
\else
  \ifx\pdfoutput\relax
    % (z.B. nach vorigem \@ifundefined{pdfoutput})
  \else
    \ifcase\pdfoutput
      % (pdfTeX: DVI-Modus)
    \else
      % Jetzt erst ist der PDF-Modus-Test positiv
      \makepdftrue
    \fi
  \fi
\fi

%% pdflatex-specific settings
\ifmakepdf
  \relax
\else
  \usepackage{microtype}
\fi
%%%%%
\endinput
