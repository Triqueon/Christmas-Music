\version "2.24.3"
\include "global.ly"
KeyandTime = {
  \time 3/4
  %Tonart
  \key es \major
  \tempo 4 = 95
}

Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  b4 b as g2 r4 g4 g f es2 r4
  \repeat volta 2 {
    g4 g as b b c as as g g f r4 \break
    f g a b c d c b a b2 r4
  }
  \repeat volta 2 {
    b4 c d es b b as as g f2 r4
  }
  \break
  g4 f g as g f f g as b as g b g f es2 r4
  \bar "|."
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Hei -- lig -- ste Nacht! Hei -- lig -- ste Nacht!
  << 
    { Fin -- ster -- nis wei -- chet es strah -- let hie -- nie -- den 
      lieb -- lich und präch -- tig vom Him -- mel ein Licht,
      Kom -- met ihr Chri -- sten o kom -- met ge -- schwind }
  
    \new Lyrics {
      \set associatedVoice = "Melodie"
      En -- gel er -- schei -- nen, ver -- kün -- den den Frie -- den:
      Frie -- den den Men -- schen wer freu -- et sich nicht?
      se -- het die Hir -- ten wie ei -- lig sie sind.
    }
  >>
  Eilt mit nach Da -- vids Stadt, den Gott ver -- hei -- ßen hat,
  liegt dort als Kind
}


zweiteStrophe = "
2. Göttliches Kinde, göttliches Kind, du, der gottseligen Väter

Verlangen, Zweig, der dem Stamme des Jesse entsprießt,

laß dich mit inniger Liebe umgangen, sei uns mit herzlicher

Freude gegrüßt. Göttlicher Heiland, der Christenheit Haupt,

du gibst uns neu, was die Sünde geraubt, du nimmst auf dich

die Schuld und schenkest deine Huld jedem, der glaubt."

dritteStrophe = "
3. Liebvolles Kind, liebvolles Kind! Liebe und Treue dir

bring ich zur Gabe, suche bei dir all mein Leben und Heil.

Jesus dich lieb ich und wenn ich dich habe, hab ich den

besten, den göttlichen Teil. Wenn ich in dir bin, wird alles

mich freun, darum verlang ich vereinigt zu sein mit dir,

mein Gott und Heil, du bist mein ewig Teil und ich bin

dein."

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
    \vspace #2
    \wordwrap-string \zweiteStrophe 
    \hspace #2
    \wordwrap-string \dritteStrophe 
  }

}  