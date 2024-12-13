\version "2.24.3"
\include "global.ly"
KeyandTime = {
    \time 6/4
  %Tonart
  \key f \major
  \tempo 2. = 40
}
Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"

  \partial 2.
  f,2 a4 c2 a4 b( c) d c g2 a4( b) c b( a) g f2 d4 e c2
  a' b4 c2 d4 c2 g4 a f2 b b4 a( g) f f( d) e f2.\bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Hört, es singt und klingt mit Schal -- le: Fürcht' euch nicht, ihr Hir -- ten al -- le!
  Macht euch auf, geht hin zum Stal -- le: Gott ward Mensch, des freut euch sehr.
}

zweiteStrophe = "
2. Seht ein Stern ist aufgegangen / denen die in Nacht gefangen. /

Zu dem Kinde voll Verlangen / ziehn von fern die Könige her."

dritteStrophe = "
3. Mit den Hohen und Geringen / wolln auch wir ihm Gaben bringen, /

Gloria voll Freude singen / mit der Engel großem Heer."

vierteStrophe = "
4. Denn er ist zur Welt gekommen / für die Sünder und die Frommen, /

hat uns alle angenommen, / uns zum Heil und Gott zur Ehr."

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
    \column {
      \vspace #1
      \wordwrap-string \zweiteStrophe 

      \vspace #1
      \wordwrap-string \dritteStrophe 

      \vspace #1
      \wordwrap-string \vierteStrophe 
    }
  }

}  