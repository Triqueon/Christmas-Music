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
  \time 2/2
  %Tonart
  \key es \major
  \tempo 4 = 90
}

Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  b2 g4.( as8) b2 es, f8( g as b as4) g f1
  g8( as b c b4) b es2 b as4( g f4.) es8 es1
  g8( f g as g4) g f2 es2 as4( g f) es d1
  es8( d es f es4) es c'2 a b4( c8 b a4.) b8 b1
  b2 g4.( as8) b2 es, f8( g as b as4) g f1
  g8( as b c b4) b es2 b as4( g f4.) es8 es1
  \bar "|."
}

Alt = \relative c' {
  \voiceTwo
  es2 es4.( d8) es2 b d8( es f g f4) es d1
  es2. es4 es2 es d4( es2) d4 es1
  es8( d es f es4) es d2 c f4( es d) c h1
  c8( h c d c4) c es2. es4 d( es8 d c4) f f1
  es2 es4.( d8) es2 b d8( es f g f4) es d1
  es2. es4 es2 es d4( es2) d4 es1
}

BassEins = \relative c {
  \voiceThree
  \set Staff.midiInstrument = #"choir aahs"
  g'2 b4.( as8) g2 b as4( f b) b b1
  b2. b4 b2 g as4( b2) as4 g1
  b2. b4 as2 g h4( c as) g g1
  g2. g4 f2 c'2 b4( g c) c d1
  g,2 b4.( as8) g2 b as4( f b) b b1
  b2. b4 b2 g as4( b2) as4 g1
    \bar "|." 
}

BassZwei = \relative c {
  \voiceFour
  e2 g4.( f8) es2 g f4.( es8 d4) es b1
  es8( f g as g4) g g2 es f4( g8 as b4) b, es1
  es2. es4 b2 c d4( es f) c g'1
  c,2. b4 a2 f' g4(es f) f b,1
  es2 g4.( f8) es2 g f4.( es8 d4) es b1
  es8( f g as g4) g g2 es f4( g8 as b4) b, es1
  
}

%TODO Rollenverteilung
ersteStrophe = \lyricmode {
  \set stanza = "1."
  Toch -- ter Zi -- on, freu -- e dich,
  jauch -- ze laut, Je -- ru -- sa -- lem!
  Sieh, dein Kö -- nig kommt zu dir,
  ja __ er kommt der Frie -- de -- fürst
  Toch -- ter Zi -- on, freu -- e dich,
  jauch -- ze laut, Je -- ru -- sa -- lem!
}

zweiteStrophe = "2. Hosianna, Davids Sohn, / sei gesegnet deinem Volk!

Gründe nun dein ewig Reich, / Hosianna in der Höh!

Hosianna Davids Sohn, / sei gesegnet deinem Volk!"


dritteStrophe = "3. Hosianna, Davids Sohn, / sei gegrüßet, König mild!

Ewig steht dein Friedensthron, / du des ewgen Vaters Kind.

Hosianna, Davids Sohn, / sei gegrüßet, König mild!"

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
  \markup { 
    \vspace #2
    \wordwrap-string \zweiteStrophe
    \hspace #2
    \wordwrap-string \dritteStrophe
  }
}  