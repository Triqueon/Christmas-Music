\version "2.24.3"
\include "global.ly"
KeyandTime = {
  \time 4/4
  %Tonart
  \key b \major
  \tempo 4 = 80
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  \partial 4
  \repeat volta 2 { f,4 f g b b a g f b a g b f g es f2 \once \override Staff.BarLine.stencil = #point-stencil r4 }
  \break \autoBeamOn
  \partial 4
  b4 b c d b c8 b a g f4 f f es d f g es f2 \once \override Staff.BarLine.stencil = #point-stencil r4
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Mit ei -- nem Stern führt Got -- tes Hand die Wei -- sen aus dem Mor -- gen -- land.
  Gott, führ auch uns zu die _ -- sem _ Kind, mach, daß wir sei -- ne Die -- ner sind 
}

ersteStropheWiederholung = \lyricmode {
  Er führt sie durch Je -- ru -- sa -- lem hin zu dem Kind nach Bet -- le -- hem.
}


zweiteStrophe = "
2. Aus Morgenland sind unverweilt viel weite Länder sie 

durcheilt, bergauf, bergab, durch Reif und Schnee Gott su-

chend über Land und See. Zu dir o Gott, kein Pilgerfahrt,

kein Weg uns sei zu steil und hart."

dritteStrophe = "
3. Herodes sie gar fürstlich ehrt, doch andre Freud ihr Herz

begehrt; den Königshof sie lassen stehn, gesschwind sie hin

zum Kinde gehn. Laß keinen Wohlstand, keine Not uns

bringen ab von dir o Gott."

vierteStrophe = "
4. Gold, Weihrauch, Myrrh'n sie bringen dar dem Gott, der

Mensch geworden war; so ehren sie den Herrn der Welt,

der uns zu seinem Dienst bestellt. Gott nimm von uns als

Gaben hin uns selbst und was du uns verliehn."

fünfteStrophe = "
5. Durch Weihrauch stellten fromm sie dar, daß dieses Kind

Gott selber war; die Myrrh auf seine Menschheit wies, das

Gold das Kind als König pries. Gott laß uns glauben Jesus

Christ, der Gott und Mensch und König ist."

sechsteStrophe = "
6. So laßt uns preisen Gott, den Herrn, der uns geführt

durch seinen Stern, der sich in Liebe zu uns neigt und uns

den Weg des Heiles zeigt. Gott, geh mit uns durch diese

Zeit und führ uns hin zur Seligkeit."

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
    \layout{
    }
    \midi {}
  }
  \markup {
    \vspace #2
    \column {
      \wordwrap-string \zweiteStrophe 
      \vspace #0.5
      \wordwrap-string \dritteStrophe 
      \vspace #0.5
      \wordwrap-string \vierteStrophe
      
    }
    \hspace #2
    \column {
      \wordwrap-string \fünfteStrophe 
      \vspace #0.5
      \wordwrap-string \sechsteStrophe 
    }
  }

}  