\version "2.24.3"
\include "global.ly"

\paper {
  system-system-spacing =
    #'((basic-distance . 18) 
       (minimum-distance . 12)
       (padding . 2)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
}

KeyandTime = {
  \time 3/4
  %Tonart
  \key f \major
  \tempo 4 = 100
}

Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  \repeat volta 2 {c4 c8( a) d( b) c4 c8( a) d( b) c4 a8( c) g( a) f2 b4\rest }
  f4 a8 f a c f,4 a8 f g c, f4 a8 f a c f,4 a8 f g c,
  \tempo 4 = 70
  c'4 a8( c) g( a) f2 b4\rest
  \bar "|."
}

Alt = \relative c' {
  \voiceTwo
  \repeat volta 2 {a'4 a8( f) b( g) a4 a8( f) b( g) a4 f c a2 s4 }
  a4 f'8-. c-. f-. c-. a4 c8-. d-. e4 a, f'8-. c-. f-. c-. a4 c8-. d-. e4
  \tempo 4 = 70
  r8 f f( e) d( e) c2
}

BassEins = \relative c {
  \voiceThree
  \repeat volta 2 { c2. c c4 d e f2 d4\rest}
  c2. c c c
  \tempo 4 = 70
  f4 c' b a2 d,4\rest
  \bar "|." 
}

BassZwei = \relative c {
  \voiceFour
  \repeat volta 2 { f,2. f f <f c'>2 s4 }
  f2. f f f
  \tempo 4 = 70
  a4 c2 f,2 s4
}

%TODO Rollenverteilung
ersteStrophe = \lyricmode {
  \set stanza = "1."
  Kom -- met ihr Hir -- ten, ihr Män -- ner und Fraun,
  Chri -- stus der Herr ist heu -- te ge -- bo -- ren,
  den Gott zum Hei -- land hat euch er -- ko -- ren.
  Fürch -- tet__ euch nicht.
}

ersteStropheWiederholung = \lyricmode {
  kom -- met, das lieb -- li -- che Kind -- lein zu schaun.
}

zweiteStrophe = "2. Lasset uns sehen in Bethlehems Stall,

was uns verheißen der himmlische Schall.

Was wir dort finden, lasset uns künden,

lasset uns preisen in frommen Weisen:

Halleluja."


dritteStrophe = "3. Wahrlich, die Engel verkündigen heut

Bethlehems Hirtenvolk gar große Freud

Nun soll es werden Friede auf Erden,

den Menschen allen ein Wohlgefallen:

Ehre sei Gott."

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
          \Alt
        }
      >>
      \new Staff = "secondStaff"
      <<
        \clef "bass"
        \new Voice = "BassEins" {
          \KeyandTime
          \BassEins
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
      \hspace #6
      \wordwrap-string \dritteStrophe
  }
}  