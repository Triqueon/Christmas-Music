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
  \key f \major
  \tempo 4 = 70
}
Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  \partial 2
  \repeat volta 2 {c2 c4 c d c c2 a b a4 g~ g f2 e4 f2 }
  h4\rest a g e f d c2 h'4\rest c c c d c c2 a b a4 g~ g f2 e4 f2
  \bar "|."
}

Alt = \relative c'' {
  \partial 2
  \repeat volta 2 {a2 a4 f f f e2 d d c d4. a8 c2 <c a>}
  s4 f d c c h c8( d e4) s4 e g f f f e2 d d <c f>4 <b d> e4 f c2 <c a>
}

BassEins = \relative c { \set Staff.midiInstrument = #"choir aahs"
  \partial 2
  \repeat volta 2 {c'2 c4 a b a g2 f f a4 c b( a2) g4 s2}
  d4\rest c' b a a g g2 d4\rest g g a b a g2 fis g s2 a2 g s2
  \bar "|." 
}

BassZwei = \relative c {
  \partial 2
  \repeat volta 2 {f2 f4 f b f c2 d b f'4 e d2 c f,}
  s4 f' g a f g c,2 s4 c e f b, f' c2 d g, a4 b c2 c f,
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Es is ein Ros ent -- sprun -- gen aus ei -- ner Wur -- zel zart,
  und hat ein Blüm -- lein bracht mit -- ten im kal -- ten Win -- ter
  wohl zu der hal -- ben Nacht.
}

ersteStropheWiederholung = \lyricmode {
  als uns die Al -- ten sun -- gen: von Jes -- se kam die Art.
}

zweiteStrophe = "2. Das Röslein, das ich meine,

davon Jesaias sagt,

hat uns gebracht alleine

Marie die reine Magd.

Aus Gottes ewgem Rat

hat sie ein Kind geboren,

welches uns selig macht."

dritteStrophe = "3. Das Blümelein so kleine

das duftet uns so süß;

mit seinem hellen Scheine

vertreibts die Finsternis:

wahr' Mensch und wahrer Gott,

hilft uns aus allem Leide,

rettet von Sünd und Tod"

vierteStrophe = "4. \"O Jesu, bis zum Scheiden

aus diesem Jammertal

laß Dein Hilf uns geleiten

hin in den Freudensaal,

in Deines Vaters Reich,

da wir Dich ewig loben.

O Gott uns das verleih.\""

\bookpart {
  \score {

    \new ChoirStaff <<
      \new Staff = "firstStaff"
      <<
        \new Voice = "Melodie" {
          \KeyandTime
          \Melodie
        }
        \new Lyrics = "Text" \with { alignAboveContext = "firstStaff" } {
          \lyricsto "Melodie" { \ersteStrophe }
          
        }
        \new Lyrics \with { alignBelowContext = "Text"} {
          \lyricsto "Melodie" { \ersteStropheWiederholung }
        }
        \new Voice = "Alt" {
          \voiceTwo
          \Alt
        }
      >>
      \new Staff = "secondStaff"
      <<
        \clef "bass"
        \new Voice = "BassEins" {
          \KeyandTime
          \voiceThree
          \BassEins
        }
        \new Voice = "BassZwei" {
          \voiceFour
          \BassZwei
        }
      >>
    >>
    \layout{}
    \midi {}
  }
  \markup {
    \large
    \vspace #2
    \column{    
    \wordwrap-string \zweiteStrophe
    }
    \hspace #4
    \column{    
    \wordwrap-string \dritteStrophe
    }
    \hspace #4
    \column{    
    \wordwrap-string \vierteStrophe
    }
  }

}  