\version "2.24.3"
\include "global.ly"
KeyandTime = {
  \time 2/2
  %Tonart
  \key g \major
  \tempo 2 = 55
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  \partial 4
  g4 g2 d4 g a2 d, h'4 a h c h2 a4 g g2 fis4 e fis( g) a h8 g fis2( e4.) d8 d2. r4
  d'2 c4 h c2 h a4 h g a fis( e) d \break
  g g fis g a g2 d4 h' h a h c h2 a4 d c h a g fis2 g4 c h2 a4. g8 g2 r4
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

ist heute erschienen in unserm FLeisch: / Gott ist geboren als eein Kind

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
    \layout{}
    \midi {}
  }
  \markup {
    \vspace #2
    \column {
      \wordwrap-string \zweiteStrophe 
      \vspace #2
      \wordwrap-string \dritteStrophe 
      \vspace #2
      \wordwrap-string \vierteStrophe 
    }
  }

}  