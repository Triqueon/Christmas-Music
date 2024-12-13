\version "2.24.3"
\include "global.ly"
\paper {
  system-system-spacing =
    #'((basic-distance . 15) 
       (minimum-distance . 10)
       (padding . 2)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
}

KeyandTime = {
  \time 4/4
  %Tonart
  \key c \major
  \tempo 4 = 110
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  \repeat volta 2 { g8 c h a g4 f8 e d e f g f4 e c e a h8 c d,4 fis g r4 }
  g g f d e8 g f e e4 d g g f d e8 g f e e4 d 
  g a8 b a4 r4 a h8 c h4 r4 c c8 c c4 a8 f e4( d) c r4
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Men _ -- schen _ die ihr _ wart _ ver _ -- lo -- ren, le -- bet auf er _ -- freu -- et euch!
  Laßt uns vor ihm nie _ -- der _ -- fal -- len, ihm soll un --ser Lob _ er _ -- schal -- len:
  Eh -- re sei Gott, Eh -- re sei Gott, Eh -- re sei Gott in der Hö -- he!
}

ersteStropheWiederholung = \lyricmode {
  Euch _ ist _ Got -- tes _ Sohn _ ge _ -- bo -- ren, heu -- te ward er _ Men -- schen -- gleich.
}

zweiteStrophe = "2. V Ihr trugt Adams schwere Bande in des Satans

Dienstbarkeit; Jesus hat von dieser Schande, diesem

Joche euch befreit A Laßt uns \ellipse"

dritteStrophe = "3. V Welche Wunder, reich an Segen, stellt uns dies

Geheimnis dar! Sehr, der kann sich selbst nicht regen,

durch den alles ist und war! A Laßt uns \ellipse"

vierteStrophe = "4. V Sehr, der Urquell aller Gaben leidet solche Dürftig-

keit; welche Liebe muß der haben, der sich euch so

ganz geweiht! A Laßt uns \ellipse"

\bookpart {
  \score {
    \new ChoirStaff = "firstStaff"
    <<
      \new Voice = "Melodie" {
        \KeyandTime
        \Melodie
        \addlyrics { \ersteStrophe }
        \addlyrics { \ersteStropheWiederholung }
      }
    >>
    \layout{}
    \midi {}
  }
  \markup { 
    \column {
    \vspace #2
    \wordwrap-string \zweiteStrophe 
    \vspace #2
    \wordwrap-string \dritteStrophe 
    \vspace #2
    \wordwrap-string \vierteStrophe 
    }
  }

}  