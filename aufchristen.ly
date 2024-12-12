\version "2.24.3"
Melodie = \relative c'' { \set Staff.midiInstrument = #"choir aahs"
  \time 4/4
  %Tonart
  \key d \major
  \partial 4
  a4 d a8 a g4 fis8 e fis4( e) d d'
  cis b8 a b4 a8 gis a2 r4 fis8 g
  a4 a8 a a4 gis8 fis fis4 e r cis'8 d
  e4 g,8 g g4 fis8 e fis2 r4 a
  b a8 a8 b4 cis8 cis cis d d4 r g,
  fis e8 d e4 d8 cis d2 r
}

\bookpart {
  \new ChoirStaff = "firstStaff"
  <<
    \new Voice = "Melodie" {
      \Melodie
    }
  >>
}  