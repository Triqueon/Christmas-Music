\version "2.24.3"
\include "global.ly"
KeyandTime = {
  \time 6/8
  %Tonart
  \key c \major
  \tempo 8 = 90
  
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  c4 a8 c4 a8 d f e d e c a4. a
  g4 g8 c d c g4 g8 a4 a8 d,4. d
  c'4 a8 c4 a8 d f e d e c a4. a
  c4 c8 g4 g8 a4 a8 g a g d4. d
  \bar "|."
}

ersteStrophe = \lyricmode {
  Wärst du Kind -- chen, im _ Ka -- schu _ -- ben -- lan -- de
  wärst du Kind _ -- chen, doch bei uns ge -- bo -- ren!
  Sieh, du hät -- test nicht _ auf Heu _ ge -- le -- gen,
  wärst auf Dau -- nen weich ge -- bet _ -- tet wor -- den.
}


zweiteStrophe = "
Nimmer wärst du in den Stall gekommen, dicht am Ofen stünde warm dein Bettchen,

der Herr pfarrer käme selbst gelaufen, dich und deine Mutter zu verehren."

dritteStrophe = "
Kindchen wie wir dich gekleidet hätten! Müßtest eine

Schaffellmütze tragen, blauen Mantel von kaschubischem Tuche 

pelzgefüttert und mit Bänderschleifen"

vierteStrophe = "
Hätten die den eignen Gurt gegeben, rote Schuhchen

für die kleinen Füße, fest und blank, mit Nägelchen 

beschlagen. Kindchen, wie wir dich gekleidet hätten!"

fünfteStrophe = "
Kindchen, wie wir dich gefüttert hätten! Früh am Morgen weißes Brot mit Honig,

frische Butter, wunderweiches Schmorfleisch, - mittags Gerstegrütze, gelbe Tunke"

sechsteStrophe = "
Gänsefleisch und Kuttelfleck mit Ingwer, fette Wurst und goldnen

Eierkuchen, Krug um Krug das starke Bier aus Putzig! -

Kindchen wie wir dich gefüttert hätten!"

siebteStrophe = "
Und wie wir das Herz dir schenken wollten!

Sie wir wären alle from geworden, alle Knie würden sich

dir beugen, alle Füße Himmelswege gehen!"

achteStrophe = "
Niemals würde eine Scheune brennen, Sonntags nie ein trunkner Schädel bluten,

wärst du Kindchen im Kaschubenlande, wärst du Kindchen doch bei uns geboren!"
\bookpart {
  \score {
    \new ChoirStaff = "firstStaff"
    <<
      \new Voice = "Melodie" {
        \KeyandTime
        \Melodie
        \addlyrics { \ersteStrophe }
      }
    >>
    \layout{}
    \midi {}
  }
  \markup { 
    \column {
      \vspace #1
      \wordwrap-string \zweiteStrophe 
      \vspace #1
      \wordwrap-string \dritteStrophe 
      \vspace #1
      \wordwrap-string \vierteStrophe 
      \vspace #1
      \wordwrap-string \fünfteStrophe 
      \vspace #1
      \wordwrap-string \sechsteStrophe 
      \vspace #1
      \wordwrap-string \siebteStrophe
      \vspace #1
      \wordwrap-string \achteStrophe
    }
  }

}  