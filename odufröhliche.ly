\version "2.24.3"
\include "global.ly"

KeyandTime = {
  \time 4/4
  %Tonart
  \key d \major
  \tempo 2 = 55
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  a2 h a4.( g8) fis4 g a2 h a4.( g8) fis4 g a2 a h cis4 d c2 h a2. r4
  e4.( fis8) e4 fis g4.( a8) g2 fis4.( g8) gis4 g a4.( h8) a2
  d4( cis) h( a) d h a g fis2 e d2. r4
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  O du fröh -- li -- che o du se -- li -- ge,
  gna -- den -- bring -- en -- de Weih -- nachts -- zeit!
  Welt__ ging ver -- lo -- ren, Christ __ ist ge -- bo -- ren:
  Freu -- e, __ freu -- e dich, o Chri -- sten -- heit! 
}


zweiteStrophe = "
2. O du fröhliche, o du selige,

Gnadenbringende Weihnachtszeit!

Christ ist erschienen,

Uns zu versöhnen,

Freue, freue dich o Christenheit!"

dritteStrophe = "
3. O du fröhliche, o du selige,

Gnadenbringende Weihnachtszeit!

Himmlische Heere

jauchzen dir Ehre

Freue, freue dich o Christenheit!"


\bookpart {
    \score {
    \new ChoirStaff = "firstStaff"
    <<
      \new Voice = "Melodie" {
        \KeyandTime
        \Melodie
        \addlyrics { \ersteStrophe }
      }
    >>
    \layout{

    }
    \midi {}
  }
  \markup {
    \vspace #3
    \wordwrap-string \zweiteStrophe 
    \hspace #2
    \wordwrap-string \dritteStrophe 
  }

}  