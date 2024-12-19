\version "2.24.3"
\include "global.ly"

\paper {
  system-system-spacing =
    #'((basic-distance . 25) 
       (minimum-distance . 15)
       (padding . 4)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
}

KeyandTime = {
  \time 6/4
  %Tonart
  \key g \major
  \tempo 2. = 50
}

Melodie = \relative c'' {
  \set Staff.midiInstrument = #"choir aahs"
  \partial 4
  g4 g2 g4 h2 c4 d2( e4 d2) d4 g,2 g4 h2 c4 d2( e4 d2) h4\rest
  d2 e4 d2 c4 h2. g2 g4 a2 a4 h2 a4 g2( a4 h2) h4 d2 e4 d2 c4 h2. g2 g4 a2 a4 h2 a4 g2( a4 h2) h4\rest
  e,2 e4 fis2 fis4 g2.( d'2) h4\rest h2 h4 a2 a4 g2.~ g2
  \bar "|."
}

BassEins = \relative c {
  \voiceThree
  \set Staff.midiInstrument = #"choir aahs"

  \partial 4
  h'4\rest h2.\rest g2. a a h g a1. h2.\rest
  a g fis e fis g1. h2.\rest
  a g fis e fis g1.
  c2. h2( a4) g2. a h( c d~ d2)
  \bar "|." 
}

BassZwei = \relative c {
  \voiceFour
  \partial 4
  s4 s2. e d d g e d1. s2. 
  d e d c h e1. s2.
  d e d c h e1.
  c2. d e fis g( a h~ h2)
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  In dul -- ci ju -- bi -- lo __
  nun sin -- get und seid froh! __
  Un -- sers Her -- zens Won -- ne leit in prae -- se -- pi -- o __
  und leuch -- tet als die Son -- ne ma -- tris in gre -- mi -- o __
  Al -- pha es et O. __
  Al -- pha es et O. __
}

bassErsteStrophe = \lyricmode {
  \set stanza = "1."
  In dul -- ci ju -- bi -- lo,
  nun sin -- get und seid froh!
  nun sin -- get und seid froh!
  Al -- pha es et O. __
}


zweiteStrophe = "2. O Jesu parvule, nach Dir ist mir so weh. Tröst mir mein Gemüte, o puer optime, durch alle Deine Güte,

o princeps gloriae. |: Trahe me post te! :|"


dritteStrophe = "3. Ubi sunt gaudia? Nirgend mehr denn da, da die Engel singen nova cantica und die Schellen klingen

in regis curia. |: Eia wärn wir da! :|"

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
      >>
      \new Staff = "secondStaff"
      <<
        \clef "treble_8"
        \new Voice = "BassEins" {
          \KeyandTime
          \BassEins
        }
        \new Lyrics = "TextBass" \with { alignBelowContext = "secondStaff"} {
          \lyricsto "BassEins" { \bassErsteStrophe }
        }
        \new Voice = "BassZwei" {
          \BassZwei
        }
      >>
    >>
    \layout{}
    \midi {}
  }
  \markup { 
    \vspace #2
    \wordwrap-string \zweiteStrophe
  }
  \markup {
    \vspace #2
    \wordwrap-string \dritteStrophe
  }
}  