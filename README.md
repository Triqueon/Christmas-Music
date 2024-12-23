# Christmas-Music

Weihnachtsmusik der Familien Stein und Karst

## Mettefrühstücksheft

Das Mettefrühstücksheft hat schon eine sehr lange Tradition und liegt hier jetzt endlich in digital vor.

Die Vorlage ist ein [LaTeX](https://www.latex-project.org/)-Dokument,
das einige [Lilypond](https://lilypond.org/)-Segmente hat, die die jeweiligen Lieder enthalten.

Passende installierte Software (Latex/Lilypond) vorausgesetzt,
lässt sich die Vorlage mit folgenden Befehlen in ein PDF umwandeln:

```
lilypond-book --output out --pdf Mettefrühstücksheft.LaTeX
cd out
pdflatex Mettefrühstücksheft.tex
```

Zur korrekten Generierung des Inhaltsverzeichnis muss der letzte Befehl eventuell zweimal ausgeführt werden.

Danach findet sich im Unterordner "out" die Datei "Mettefrühstücksheft.pdf"

Einzelne Lieder lassen sich mit `lilypond DATEINAME.ly` in PDFs konvertieren,
dabei fällt auch noch jeweils eine MIDI Version des Lieds heraus.
