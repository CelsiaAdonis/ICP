import numpy as np


def note2MIDI(note, MIDI=''):
    """Converts a note string into MIDI notation
    function(a) -> int

    note must be a string

    Refers to a predefined dictionary of notes and their corresponding MIDI
    values, from C to C8.
    If for some reason you want to refer to an altered MIDI reference table,
    you can do so in the declaration and override the default one.
    """

    if MIDI is '':
        MIDI = {'C': 0, 'C#': 1, 'DB': 1, 'D': 2, 'D#': 3, 'EB': 3,
                'E': 4, 'F': 5, 'F#': 6, 'GB': 6, 'G': 7, 'G#': 8, 'AB': 8,
                'A': 9, 'A#': 10, 'BB': 10, 'B': 11,

                'C0': 12, 'C#0': 13, 'DB0': 13, 'D0': 14, 'D#0': 15, 'EB0': 15,
                'E0': 16, 'F0': 17, 'F#0': 18, 'GB0': 18, 'G0': 19, 'G#0': 20,
                'AB0': 20, 'A0': 21, 'A#0': 22, 'BB0': 22, 'B0': 23,

                'C1': 24, 'C#1': 25, 'DB1': 25, 'D1': 26, 'D#1': 27, 'EB1': 27,
                'E1': 28, 'F1': 29, 'F#1': 30, 'GB1': 30, 'G1': 31, 'G#1': 32,
                'AB1': 32, 'A1': 33, 'A#1': 34, 'BB1': 34, 'B1': 35,

                'C2': 36, 'C#2': 37, 'DB2': 37, 'D2': 38, 'D#2': 39, 'EB2': 39,
                'E2': 40, 'F2': 41, 'F#2': 42, 'GB2': 42, 'G2': 43, 'G#2': 44,
                'AB2': 44, 'A2': 45, 'A#2': 46, 'BB2': 46, 'B2': 47,

                'C3': 48, 'C#3': 49, 'DB3': 49, 'D3': 50, 'D#3': 51, 'EB3': 51,
                'E3': 52, 'F3': 53, 'F#3': 54, 'GB3': 54, 'G3': 55, 'G#3': 56,
                'AB3': 56, 'A3': 57, 'A#3': 58, 'BB3': 58, 'B3': 59,

                'C4': 60, 'C#4': 61, 'DB4': 61, 'D4': 62, 'D#4': 63, 'EB4': 63,
                'E4': 64, 'F4': 65, 'F#4': 66, 'GB4': 66, 'G4': 67, 'G#4': 68,
                'AB4': 68, 'A4': 69, 'A#4': 70, 'BB4': 70, 'B4': 71,

                'C5': 72, 'C#5': 73, 'DB5': 73, 'D5': 74, 'D#5': 75, 'EB5': 75,
                'E5': 76, 'F5': 77, 'F#5': 78, 'GB5': 78, 'G5': 79, 'G#5': 80,
                'AB5': 80, 'A5': 81, 'A#5': 82, 'BB5': 82, 'B5': 83,

                'C6': 84, 'C#6': 85, 'DB6': 85, 'D6': 86, 'D#6': 87, 'EB6': 87,
                'E6': 88, 'F6': 89, 'F#6': 90, 'GB6': 90, 'G6': 91, 'G#6': 92,
                'AB6': 92, 'A6': 93, 'A#6': 94, 'BB6': 94, 'B6': 95,

                'C7': 96, 'C#7': 97, 'DB7': 97, 'D7': 98, 'D#7': 99, 'EB7': 99,
                'E7': 100, 'F7': 101, 'F#7': 102, 'GB7': 102, 'G7': 103,
                'G#7': 104, 'AB7': 104, 'A7': 105, 'A#7': 106, 'BB7': 106,
                'B7': 107, 'C8': 108}

    return MIDI[note.upper()]


def chord2MIDI(chord):
    """Convert a chord into MIDI notation.
    function(a) -> list(ints)

    chord must be a list of strings. Calls note2MIDI
    """

    return list(map(note2MIDI, chord))


def findRoot(chord, root):
    """Return position of root within chord.
    function(a,b) -> int

    chord = list()
    root = int

    chord and root must be MIDI in numbers, not strings
    If these are string, they will be converted according to note2MIDI
    and chord2midi
    """

    if type(root) is str:
        root = note2MIDI(root)

    if type(chord[0]) is str:
        chord = chord2MIDI(chord)

    if root in chord:
        return chord.index(root)
    else:
        return 1


def gcd(x, y):
    """Calculates greatest common divisor between two numbers
    function(a,b) -> int
    """

    while(y):
        x, y = y, x % y
    return x


def diffarray(array):
    """Finds absolute difference between each value in a 1D array
    function(array(1D)) -> array(2D)

    Requires: numpy

    Array must be a Python list
    """
    size = len(array)
    holder = np.zeros(shape=(size, size))
    for i in range(0, size):
        for j in range(0, size):
            holder[i, j] = abs(array[i] - array[j])

    return holder


def con_dis(pastchord, preschord):
    """Returns whether chord pair is consonant or dissonant.
    function(list, list) -> str

    chords must be lists of integers (MIDI format for notes). If they are
    lists of strings, they will be converted using chord2MIDI
    """
    semi_con = {0: 'Y', 1: 'N', 2: 'N', 3: 'Y', 4: 'Y', 5: 'Y', 6: 'N',
                7: 'Y', 8: 'Y', 9: 'Y', 10: 'N', 11: 'N', 12: 'Y'}

    chordX, chordY = 'cons', 'cons'

    if type(pastchord[0]) is str:
        pastchord = chord2MIDI(pastchord)

    if type(preschord[0]) is str:
        preschord = chord2MIDI(preschord)

    for diff in np.nditer(diffarray(pastchord)):
        if semi_con[int(diff)] is 'N':
            chordX = 'diss'

    for diff in np.nditer(diffarray(preschord)):
        if semi_con[int(diff)] is 'N':
            chordY = 'diss'

    if chordX is chordY:
        codi = 'SM'
    elif chordX is 'cons' and chordY is 'diss':
        codi = 'CD'
    elif chordX is 'diss' and chordY is 'cons':
        codi = 'DC'
    else:
        codi = 'error'

    return codi


def ICP(chords, roots=('N', 'N'), alpha=50, beta=4, gamma=8, delta=0.1):
    """Calculates Tonal attractions between two chords
    ref: Woolhouse, M. (2009). Modelling Tonal Attraction Between Adjacent
    Musical Elements. Journal of New Music Research.

    Returns Attraction ratio and consonance/dissonance state

    EXAMPLE:
        chords = [['B3', 'D4', 'G4'], ['c4', 'E4', 'g4']]
        roots = ['G4', 'c4']
        ICP(chords, roots)


    """

    # Translate Chords
    X = chord2MIDI(chords[0])
    Y = chord2MIDI(chords[1])

    # Translate Roots
    placeX = findRoot(X, roots[0])
    placeY = findRoot(Y, roots[1])

    # Pitch Distance, IC, Voice Leading
    PD = np.zeros(shape=(len(X), len(Y)))
    IC = np.zeros(shape=(len(X), len(Y)))
    VL = np.zeros(shape=(len(X), len(Y)))

    for i, noteX in enumerate(X):
        for j, noteY in enumerate(Y):
            pd = abs(noteX - noteY)  # Pitch Distances
            PD[i, j] = pd
            IC[i, j] = 12 / (gcd(pd, 12))
            VL[i, j] = alpha / (pd + alpha)

    # IC & Voice Leading
    ICVL = IC * VL

    # Root Salience
    RS2 = np.ones(shape=(len(X), len(Y)))

    RS2[placeX, 0:len(Y)] = RS2[placeX, 0:len(Y)] * beta
    RS2[0:len(X), placeY] = RS2[0:len(X), placeY] * gamma

    RSsum = np.sum(RS2)
    RS3 = RS2 * 1 / RSsum

    # Consonance and Dissonance
    codi = con_dis(X, Y)

    if codi is 'SM':
        CD = RS3
    elif codi is 'CD':
        CD = ((1 - delta) * RS3)
    elif codi is 'DC':
        CD = ((1 + delta) * RS3)
    else:
        CD = 'error: could not calculat codi'

    # Tonal Attraction
    TA = ICVL * CD
    S = np.sum(TA)
    attraction = S / 12

    return attraction, codi
