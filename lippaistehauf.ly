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
  \time 3/4
  %Tonart
  \key f \major
  \tempo 4 = 80
}

Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  f,4 f8( g) a( b) c4.\( d8\) c4 c,4.( e8--) g\( e\) f2
  c4 f f8( g) a( b) c4.\( d8\) c4 c,4.( e8) g( e) f2 r4
  c'4\( a\) a b b8( d) g,4 b\( g\) g a d8( c) c4
  f, f8( g) a( b) c4.\( d8\) c4 c,4.( e8) g( e) f2.
  \bar "|."
}

Alt = \relative c' {
  \voiceTwo
  r2. r2. r2. s2 c8( b) a4 a8 c f4~ f8 e f2 s2. s2.
  r4 c c r4 g'8( d) d( e) f4( e8 d) c4 f b8 a g4 r4 r4 f~ f8 e f2 s2. s2.  
}

BassEins = \relative c {
  r4 f f8( g) a( g a b) a4 b( c,) b' a( f) r4 r4
  f f8( g) a( g a b) a4 <<
    { \voiceThree g2 b4 a2 r4 }
    \new Voice {
      \voiceFour
      \relative c { e4( d) c f,( c) f}
    }
  >>
  \oneVoice
  a,4( f') d g,( f') b, g( c) e f,8( c') f4 c r4 f f8( g) a( g a b) a4 <<
    { \voiceThree g2 b4 a2.}
    \new Voice {
      \voiceFour
      \relative c { e4( d) c <c f,>2. }
    }
  >> 
  \bar "|." 
}

%TODO Rollenverteilung
ersteStrophe = \lyricmode {
  \set stanza = "1."
  'Lip -- pai steh auf vom Schlaf!' 'Was ist denn da?'
  'Mich wun -- derts daß d'schla -- fen kannst!' 'Ich schlaf schon.'
  'Geh mit mir auf die Weid, schau, was's für Wun -- der geit.
  S'ist so licht wie am Tag.' 'Was war das?'
}

zweiteStrophe = "2. \"Die Musik währt schon lang.\"

\"Ich hör nicht.\"

\"Trag deine Pfeifn auch mit dir!\"

\"Bin schon gericht.\"

\"D'Engel die singen obn:

Es ist ein Kind geborn.

Wenns der Messias wär!\"

\"Das wär rar.\""


dritteStrophe = "3. \"Bethlehem heißt der Ort.\"

\"Wer hat's gesagt?\"

() \"Ich habs vom Engel ghört!\"

\"Hastn gefragt?\"

\"Ein Jungfrau keusch und rein

soll seine Mutter sein

dort, wo der Stern brinnt.\"

\"Geh nur geschwind!\""

vierteStrophe = "4. \"So schön ist keins geborn\"

\"wie das Kind!\"

() \"Daßs auf dem Heu muß liegen\"

\"ist rechte Sünd!\"

\"Ich tu die Mutter fragn,

ob ichs mit mir darf tragn,

ich hätt die größte Freud.\"

\"Du redst gescheit.\""

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
    \hspace #2
    \wordwrap-string \vierteStrophe
  }
}  