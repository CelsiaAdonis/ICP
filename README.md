# Interval Cycle Proximity Model Toolbox

Ref: *Woolhouse, M. (2009). Modelling tonal attraction between adjacent musical elements. Journal of New Music Research, 38(4), 357-379.*

ICP is a model of tonal attraction based on musical interval cycles.

## Organization
This code is split into two streams. The first stream is written in MatLab code by Joanna Spyra (found under the /matlab directory). The second stream is written in Python by Kyle Gauder.

## Python Usage
To use this toolbox in Python, simply include the module in your import statements like so
```
from ICP import *
```

### ICP()
The main function `ICP()` calculates the tonal attraction between two chords. This is fairly flexible as you can you can input anything from single notes to highly complex chords. The function typically expects input in *music* notation as strings, for instance you would write a C-Major Triad chord as `['C', 'E', 'G']`. *(note that this can also take straight MIDI notation)*

#### Input Examples:
- C-Major Triad to F-Major Triad = `ICP(['C', 'E', 'G'], ['F', 'A', 'C'])`
- G note to C-Major Triad = `ICP('G', ['F', 'A', 'C'])`
- C note to F note = `ICP('C', 'F')`
- G-Major triad to C-Major Triad in MIDI = `ICP([59, 62, 67], [60, 64, 67])`

#### Variables
- pastchord, preschord : Past and Present chords/notes to be compared
- roots=('A', 'B') : Which note in the chord is the root? If blank, will assume first note is the tonic root.
- alpha : Voice Leading Variable
- beta & gamma : Root Salience Variables
- delta : consonance/dissonance strength

#### Returns:
`ICP()` will always return an average attraction value (from 0-1) and a string indicating whether the comparison is consonant or dissonant. As such, the best way to call this function is to handle both these variables immediately.

#### Example
Below is a full example and output following the example in Woolhouse (2009):
```
from ICP import *


a, codi = ICP(['B3', 'D4', 'G4'], ['C4', 'E4', 'G4'], roots=('G4', 'C4'), alpha=50)

a     # 0.731
codi  # 'SM'
```

Variables in the `ICP()` function are named similarly to those found in Woolhouse (2009), so refer to this paper for further understanding of the calculations.

### Key-Finding Algorithm
Also included is work on a new Key-Finding Algorithm based on the ICP model, first developed by Brandon Wild in 2015. This extension of the model applies it to a progression of chords, comparing each chord to possible scales it belongs to.

You can find a working example of this by running `example.py`. Note that this is a work-in-progress...
