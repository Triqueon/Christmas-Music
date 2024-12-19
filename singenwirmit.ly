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
  a2. fis a fis d2 e4 fis2 g4 fis2 e4 fis2.
  d2 e4 fis2 g4 fis2 e4 fis2.
  d2 e4 fis2 g4 fis2 e4 fis2 g4 e2 e3 d2 r4
  a2 a4 a2 a4 d2 cis4 h2 a4 d2 cis4 h2 a4 a2 gis4 a2.
  d,2 e4 fis2 g4 a2 g4 fis2 g4 e2 e4 d2.
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Nun freut euch, ihr Chri -- sten, sin -- get Ju -- bel -- lie -- der
  und kom -- met und kom -- met nach _ Bet -- le -- hem.
  Chri -- stus der Hei -- land stieg zu uns her -- nie -- der.
  \set stanza = "1.-4."
  Kommt, las -- set uns an -- be -- ten, kommt, las -- set uns an -- be -- ten,
  kommt, las -- set uns an -- be -- ten den Kö -- nig, den Herrn.
}


zweiteStrophe = "
2. O sehet, die Hirten / eilen von den Herden / und suchen

das Kind nach des Engels Wort; / gehn wir mit ihnen, Friede

soll uns werden."

dritteStrophe = "
3. Der Abglanz des Vaters, / Herr der Herren alle, / ist heute

ist heute erschienen in unserm FLeisch: / Gott ist geboren als ein Kind

im Stalle."

vierteStrophe = "
Kommt, singet dem Herren, / singt ihr Engelchöre. / Froh-

locket, frohlocket, ihr Selien. / Himmel und Erde bringen

Gott die Ehre."

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