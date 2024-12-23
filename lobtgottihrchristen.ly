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
  \key f \major
  \tempo 4 = 90
}
Melodie = \relative c'' {
  \voiceOne 
  \set Staff.midiInstrument = #"choir aahs"
  r2 r4 f,4 c' c c c d c8 b a4 a b c d d c2 r4
  c4 c c c a c b8 a g4 c a g8 f g4 g f2 a c4 b8 a g4 g f1
  \bar "|."
}

Alt = \relative c' {
  \voiceTwo
  r2 r4 c c c8 d e4 f f e f c f e d f e2 r4
  f e f g f f d e e f c d c c2 c c4 c d c8 b a1
}

BassEins = \relative c { \set Staff.midiInstrument = #"choir aahs"
  \voiceThree
  r2 r4 a' g a g a b g f f f g2 g4 g2 r4
  a g a g c c f, c' g f f2 e4 f2 f f4 f2 e4 f1
  \bar "|." 
}

BassZwei = \relative c {
  \voiceFour
  r2 r4 f e f c f b, c f, f'8 e d4 c2 h4 c2 r4
  f4 c f e f a, b c c d a b c f,2 f4 g a a b c f,1
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Lobt Gott ihr Chri -- sten al -- le _ gleich in sei -- nem höch -- sten Thron,
  der heut schleußt auf sein Him -- mel _ -- reich und schenkt uns _ sei -- nen Sohn,
  und schenkt uns _ sei -- nen Sohn.
}

zweiteStrophe = "2. Er kommt aus seines Vaters Schoß

und wird ein Kindlein klein,

er liegt dort elend nackt und bloß

in einem Krippelein."

%TODO seiner Gewalt unterbinden
dritteStrophe = "3. Er äußert sich all seiner Gewalt,

wird niedrig und gering

und nimmt an eines Knechts Gestalt,

der Schöpfer aller Ding."

vierteStrophe = "4. Er liegt an seiner Mutter Brust,

ihr Milch die ist sein Speis --

an dem die Engel sehn ihr Lust,

denn er ist Davids Reis,"

fünfteStrophe = "5. das aus seim Stamm entsprießen sollt

in dieser letzten Zeit -- 

durch welchen Gott aufrichten wollt

sein Reich, die Christenheit."

sechsteStrophe = "6. Er wechselt mit uns wunderlich:

Fleisch und Blut nimmt er an

und gibt uns ein seins Vaters Reich

die klare Gottheit dran."

siebteStrophe = "7. Er wird ein Knecht und ich ein Herr,

das mag ein Wechsel sein!

Wie könnt er doch sein freundlicher,

das herze Jesulein."

achteStrophe = "8. Heut schleußt er wieder auf die Tür

zum schönen Paradeis:

der Cherub steht nicht mehr dafür,

Gott sei Lob Ehr und Preis!"

\bookpart {
  \score {

    \new ChoirStaff <<
      \new Staff = "firstStaff"
      <<
        \new Voice = "Melodie" {
          \KeyandTime
          \Melodie
        }
        \new Lyrics  {
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
    \vspace #1
    \column{    
      \wordwrap-string \zweiteStrophe
      \vspace #0.75
      \wordwrap-string \dritteStrophe
    }
    \hspace #6
    \column{    
      \wordwrap-string \vierteStrophe
      \vspace #0.75
      \wordwrap-string \fünfteStrophe
    }
    \hspace #6
    \column{    
      \wordwrap-string \sechsteStrophe
      \vspace #0.75
      \wordwrap-string \siebteStrophe
    }
  }
  \markup {
    \vspace #0.75
    \wordwrap-string \achteStrophe
  }

}  