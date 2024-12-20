\version "2.24.3"
\include "global.ly"

KeyandTime = {
  \time 3/2
  %Tonart
  \key c \major
  \tempo 2 = 45
}
Melodie = \relative c' { \set Staff.midiInstrument = #"choir aahs"
  \KeyandTime
  \partial 4
  d4 d2 d4 e2 e4 f( g a) a2 a4 g2 g4 d2 e4 \time 2/2 f2 r4 f4 \break
  <<
    { \voiceOne a c d d c8( b a g) f4 g a g f e d2. }
    \new Voice {\voiceTwo r4 f2 b4 a c, d e f a,4. h8 cis4 d2.}
  >>
  \bar "|."
}

BassEins = \relative c { \set Staff.midiInstrument = #"choir aahs"
  \partial 4
  r4 f2. g f4 e2 r4 c d e(d) e f g2 \time 2/2 r4 c,
  f a c a b d f s2. r2 r4 a, fis2. \bar "|." 
}

BassZwei = \relative c {
  \partial 4
  r4 d2. c2. d2 c4 a2 r4 c2. b2 c4 \time 2/2 f,1
  f' f r4 c4 d a d2.
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Es kommt ein Schiff, ge -- la -- den bis an sein' höch -- sten Bord,
  trägt Got -- tes Sohn voll Gna -- den, des Va -- ters e -- wigs Wort.
}

zweiteStrophe = "2. Das Schiff geht still im Triebe,

es trägt ein teure Last;

das Segel ist die Liebe,

der Heilig Geist der Mast"

dritteStrophe = "3. Der Anker haft' auf Erden

und das Schiff ist am Land.

Gotts Wort tut uns Fleisch werden,

der Sohn ist uns gesandt."

vierteStrophe = "4. Zu Bethlehem geboren,

im Stall ein Kindelein,

gibt sich für uns verloren;

gelobet muss es sein"

fünfteStrophe = "5. Und wer dies Kind mit Freuden

küssen, umfangen will,

der muß vor mit ihm leiden

groß Pein und Marter viel."

sechsteStrophe = "6. darnach mit ihm auch sterben

und geistlich auferstehn.

ewigs Leben zu erben,

wie an ihm ist geschehn."

\bookpart {
  \score {

    \new ChoirStaff <<
      \new Staff = "firstStaff"
        <<
          \new Voice = "Melodie" {
            \Melodie
          }
          \new Lyrics = "Text" \with { alignAboveContext = "firstStaff" } {
            \lyricsto "Melodie" { \ersteStrophe }    
          }
        >>
      \new Staff = "secondStaff"
      <<
        \clef "bass"
        \new Voice = "BassEins" {
          \voiceOne
          \BassEins
        }
        \new Voice = "BassZwei" {
          \voiceTwo
          \BassZwei
        }
      >>
    >>
    \layout{}
    \midi {}
  }
  \markup {
    \larger
    \vspace #2
    \column{    
    \wordwrap-string \zweiteStrophe
    \vspace #1
    \wordwrap-string \dritteStrophe
    }
    \hspace #4
    \column{    
    \wordwrap-string \vierteStrophe
    \vspace #1
    \wordwrap-string \fünfteStrophe
    }
    \hspace #4
    \column{    
    \wordwrap-string \sechsteStrophe
    }
  }

}  