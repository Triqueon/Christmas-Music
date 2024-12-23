\version "2.24.3"
\include "global.ly"
Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  \time 4/4
  %Tonart
  \key d \major
  \tempo 4 = 90
  \partial 4
  \repeat volta 2 { a4 d a8 a g4 fis8 e fis4( e) d d'
  cis h8 a h4 a8 gis a2 } \break
  r4 fis8 g a4 a8 a a4 g8 fis fis4 e r cis'8 d
  e4 g,8 g g4 fis8 e fis2 r4 a
  b a8 a8 h4 cis8 cis cis d d4 r g,
  fis e8 d e4 d8 cis d2 r4 \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Auf Chri -- sten singt fest -- li -- che Lie -- der und
  jauch -- zet mit fröh -- li -- chem Klang! Im _
  Stal -- le bei Beth -- le -- hems To -- ren hat _
  mit -- ten in nächt -- li -- cher Zeit Ma -- ri -- a,
  die Jung -- frau, ge -- bo _ -- ren den
  Hei -- land, der al -- le er -- freut.
}

ersteStropheWiederholung = \lyricmode {
  Es schal -- le auf Er -- den laut wi -- der
  süß -- tö -- nen -- der Ju -- bel -- ge -- sang!
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
        \addlyrics { \ersteStropheWiederholung }
      }
    >>
    \layout{}
    \midi {}
  }
  \markup { 
    \vspace #4
    \wordwrap-string \zweiteStrophe 
  }

}  