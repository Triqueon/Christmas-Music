\version "2.24.3"
\include "global.ly"

KeyandTime = {
  \time 6/4
  %Tonart
  \key d \major
  \tempo 2. = 45
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  a2 fis4 d2 fis4 a2 h4 a2.
  a2 fis4 d2 fis4 a2 h4 a2.
  g2 g4 g2 a4 g2 fis4 e2
  fis4 a2 fis4 d2 fis4 e2 d4 e2 fis4 d2. d2 r4 
  d2 e4 fis2 g4 fis2 e4 fis2 g4 e2 e4 d2 r4
  a'2. fis a fis d2 e4 fis2 g4 fis2 e4 fis2.
  d2 e4 fis2 g4 fis2 e4 fis2 g4 e2 e4 d2 r4
  a'2 a4 a2 a4 d2 cis4 h2 a4 d2 cis4 h2 a4 a2 gis4 a2.
  d,2 e4 fis2 g4 a2 g4 fis2 g4 e2 e4 d2.
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Sin -- gen wir mit Fröh -- lich -- keit,
  lo -- ben Gott in E -- wig -- keit,
  sei -- nen Sohn gibt er uns heut:
  \set stanza = "1.-4."
  Er -- schie -- nen ist, den uns ge -- born Ma -- ri -- a.
  Nun er -- füllt sich was ver -- kün -- det Ga -- bri -- el.
  E -- ja, e -- ja, ei -- ne Jung -- frau wun -- der -- bar
  Gott den Hei -- land uns ge -- bar nach ew -- gem Rat.
  Heut, ja heut er -- schie -- nen ist,
  er -- schie -- nen ist der Chri -- sten -- heit
  Got -- tes Sohn, den lo -- ben wir in E -- wig -- keit.
}


zweiteStrophe = "
2. Freue dich Jerusalem, / Licht stahlt auf in Betlehem,

wie verheißen ehedem."

dritteStrophe = "
3. Zion, preis den Herren dein, / der uns macht von Sünden

rein / und der Menschen Heil will sein:"

vierteStrophe = "
4. Der im Himmelreich regiert, / kam zu uns als guter

Hirt, / heimzuführn was sich verirrt:"

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
    \column {
      \wordwrap-string \zweiteStrophe 
      \vspace #0.5
      \wordwrap-string \dritteStrophe 
      \vspace #0.5
      \wordwrap-string \vierteStrophe 
    }
  }

}  