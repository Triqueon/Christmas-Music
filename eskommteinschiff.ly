\version "2.24.3"
Melodie = \relative c' { \set Staff.midiInstrument = #"choir aahs"
  \time 3/2
  %Tonart
  \key c \major
  \tempo 2 = 55
  \partial 4
  d4 d2 d4 e2 e4 f( g a) a2 a4 g2 g4 d2 e4 \time 2/2 f2 r4 f4
  <<
    { \voiceOne a c d d c8( bes a g) f4 g a g f e d2. }
    \new Voice {\voiceTwo r4 f2 bes4 a c, d e f a,4. b8 cis4 d2.}
  >>
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Es kommt ein Schiff, ge -- la -- den bis an sein' höch -- sten Bord,
  trägt Got -- tes Sohn voll Gna -- den, des Va -- ters e -- wigs Wort.
}

zweiteStrophe = "
2. Dies schönste der menschlichen Kinder 

ist Gott, in die Menschheit gehüllt;

es weiht sich zum Mittler der Sünder,

von himmlischer Liebe erfüllt.

Dies große Geheimnis erklären

die Engel den Hirten im Feld.

Sie singen dem Schöpfer zu Ehren,

sie singen vom Frieden der Welt."

\bookpart {
  \score {
    \new ChoirStaff = "firstStaff"
    <<
      \new Voice = "Melodie" {
        \Melodie
        \addlyrics { \ersteStrophe }
      }
    >>
    \layout{}
    \midi {}
  }
  \markup { 
    \wordwrap-string \zweiteStrophe 
  }

}  