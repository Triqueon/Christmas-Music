\version "2.24.3"
\include "global.ly"

KeyandTime = {
  \time 4/4
  %Tonart
  \key c \major
  \tempo 4 = 90
}
Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  c4 c8 h a4 g a h c2 c4 c8 h a4 g a h c2
  c4 h8 h a4 h8 h a2 c4 d e2 e4 d8 c h4 a8( h) c4 h a1
  \bar "|."
}

Alt = \relative c' {
  e4 g f c f2 g e8 f g4 f g f2 e e4 g f2 e a4 h c2 g f e cis1
}

BassEins = \relative c { 
  g'2 c,8 d e4 f d e g c1 c4 f, g2 c1 c2 c g g4 f8 e f g a2 gis4 e1 
  \bar "|." 
}

BassZwei = \relative c {
  c1 c c2 f4 e f d c2 c4 e f d a'2 f8 e d4 c2 c d8 e f4 c8 d e4 a,1
}

ersteStrophe = \lyricmode {
  \set stanza = "1."
  Als ich bei mei -- nen Scha -- fen wacht,
  ein En -- gel mir die Bot -- schaft bracht.
  Des bin ich froh, bin ich froh, froh, froh, froh!
  Be -- ne -- di -- ca -- mus Do -- mi -- no!
}

zweiteStrophe = "2. Er sagt, es soll geboren sein

zu Betlehem ein Kindelein.

Des bin ich froh..."

dritteStrophe = "3. Er sagt, das Kind läg da im Stall

und soll die Welt erlösen all.

Des bin ich froh..."

vierteStrophe = "4. Als ich das Kind im Stall gesehn,

nicht wohl konnt ich von dannen gehn.

Des bin ich froh..."

fünfteStrophe = "5. Als ich heimging, das Kind wollt mit,

es wollt von meiner Seite nit.

Des bin ich froh..."

sechsteStrophe = "6. Den Schatz muß ich bewahren wohl,

so bleibt mein Herz der Freuden voll.

Des bin ich froh..."

\bookpart {
  \score {

    \new ChoirStaff <<
      \new Staff = "firstStaff"
        <<
          \KeyandTime
          \new Voice = "Melodie" {
            \voiceOne
            \Melodie
          }
          \new Lyrics = "Text" \with { alignAboveContext = "firstStaff" } {
            \lyricsto "Melodie" { \ersteStrophe }    
          }
          \new Voice = "Alt" {
            \voiceTwo
            \Alt
          }
        >>
      \new Staff = "secondStaff"
      <<
        \clef "bass"
        \KeyandTime
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