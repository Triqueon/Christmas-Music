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
  \tempo 4 = 80
}
Melodie = \relative c'' { 
  \voiceOne
  \set Staff.midiInstrument = #"choir aahs"

  \partial 4
  c,4 f4. g8 a4 g f2 e4 f g f8 g <f a>4 <e g>4 f2 r4
  c' c a b c d2 b4 b a b c b8 a g2. b4\rest
  c2 g a g4 a c f,8 g a4 g f2.
  \bar "|."
}

Alt = \relative c'' {
  \voiceTwo
  \partial 4
  s4 s1 s s d,4 c8 b a4 r4
  f'2 es2 d4 e f g c,2 d f4 e8 d c4 s4
  e2 f c d4 e f f f e a,2.
}

Bass = \relative c {
  \partial 4
  r4 r4 c f4. g8 a4 g a d c2 a4 b a g f e d2 c 
  b4 c d e f g a b c2 r4
  b,4 a b8 c d4 e f g8 a b4 c d2 c4 c, f c f,
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Zu Beth -- le -- hem ge -- bo -- ren ist uns ein _ Kin -- de -- lein.
  Das hab ich aus -- er -- ko -- ren, sein ei -- gen will ich _ sein.
  Ei -- a, Ei -- a, sein ei -- gen _ will ich sein.
}

zweiteStrophe = "
2. In seine Lieb versenken

will ich mich ganz hinab,

Mein Herz will ich ihm schenken

Und alles, was ich hab."

dritteStrophe = "
3. O Kindelein von Herzen

will ich Dich lieben sehr

in Freuden und in Schmerzen

je länger mehr und mehr."

vierteStrophe = "
4. Dazu Dein Gnad mir gebe,

bitt ich aus Herzens Grund

daß ich allein Dir lebe

jetzt und zu aller Stund."

fünfteStrophe = "
5. Dich, wahren Gott ich finde

in meinem Fleisch und Blut,

darum ich fest mich binde

an Dich, mein höchstes Gut."

sechsteStrophe = "
6. Laß mich von Dir nicht scheiden

knüpf zu, knüpf zu das Band

der Liebe zwischen beiden.

Nimm hin mein Herz zum Pfand."

\bookpart {
  \score {
    \new ChoirStaff
    <<
       \new Staff = "firstStaff"
      <<
        \new Voice = "Melodie" {
          \KeyandTime
          \Melodie
          
        }
        \new Lyrics \with { alignAboveContext = "firstStaff" } {
          \lyricsto "Melodie" { \ersteStrophe }
        }
        \new Voice = "Alt" {
          \Alt
        }
      >>
      \new Staff = "secondStaff"
      <<
          \clef "bass"
          \new Voice = "Bass" {
          \KeyandTime
          \Bass
        }
      >>
    >>
    \layout{}
    \midi {}
  }
  \markup {
    \vspace #1
      \column {
        \wordwrap-string \zweiteStrophe 
        \vspace #1
        \wordwrap-string \dritteStrophe 
      }
      \hspace #2
      \column {
        \wordwrap-string \vierteStrophe 
        \vspace #1
        \wordwrap-string \fünfteStrophe 
      }
  }
  \markup {
    \vspace #1
    \wordwrap-string \sechsteStrophe
  }


}  