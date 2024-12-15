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
  \time 4/4
  %Tonart
  \key b \major
  \tempo 4 = 100
}

Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  \partial 4
  d,4 g4.\( a8\) b4 d b a8( g) a2 b4 b8 b c2 d r4
  b8( c) d4.\( c8\) d4 es8( d) c4.\( b8 c4\)
  d8( c) b4.\( a8\) b4 c8\( b\) a4.\( g8 a4\) a
  g4.\( a8\) b4 d b8( a) g2
  \bar "|."
}

Alt = \relative c' {
  \voiceTwo
  \partial 4
  r4 r4 d4. g4 d8~( d g) fis( e) fis2 g4 d8 b' a4.( g8) fis( g a g fis4)
  d8( f) b4 f b g8( b) a4.\( g8 a4\)
  f g d g es8\( g\) fis4.\( e8 fis4\) d8( c)
  b4 es d8( g4) f8 e4 d8( c h4)
}

BassEins = \relative c {
  \partial 4
  r4 r4 b8( d) g4 b8( a) g4 d2( b'4) r4 g4 \voiceThree r8 c8 a4~( a8 b c b) a4 \oneVoice  r4
  r8 b,( b' a) g4 c, f( f,2) r4 r8 g8( g' f) e4 a, d( d,2) r4
  es'8( d) c4 g b c g'( g,)
  \bar "|." 
}

BassZwei = \relative c {
  \partial 4
  \voiceFour s4 s1 s1 s2 f8( g) f( es) d2.
}

%TODO Rollenverteilung
ersteStrophe = \lyricmode {
  \set stanza = "1."
  Ma -- ri -- a durch ein Dorn -- wald ging, Ky -- rie e -- lei -- son,
  Ma -- ri -- a durch ein Dorn -- wald ging, der hat in siebn Jahrn kein Laub ge -- tra -- gen.
  Je -- sus und Ma -- ri -- a.
}

\bookpart {
  \score {

    \new ChoirStaff <<
      \new Staff = "firstStaff"
      <<
        \new Voice = "Melodie" {
          \KeyandTime
          \Melodie
        }
        \new Lyrics = "Text" \with { alignBelowContext = "firstStaff" } {
          \lyricsto "Melodie" { \ersteStrophe }
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
}  