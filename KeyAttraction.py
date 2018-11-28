import csv

from ICP import *


def KA(chord, scale, root='N', type='major'):
    """Calculates Key Attraction (KA) of chord towards a specified scale

    Uses specified scale tonic (ie 'C') and scaleFind() function to generate
    list of notes in scale
    Then loops through each note in scale and calculates ICP from chord to scale

    Returns data in a dictionary (KA for each note in scale)
    """
    TA = dict()
    for note in scaleFind(scale, type):
        a, codi = ICP([chord, note])
        TA[note] = a
    return TA


def KAmean(chord, scale, type='major'):
    """Calculates average Key Attraction (KA) of a chord to the notes in a scale

    Retuns single average value
    """
    ka = KA(chord, scale)
    return sum(ka.values())/len(ka.values())


def KAacrossScales(chord):
    """Calculates average Key Attraction (KA) across all possible scales

    Retuns a dictionary, with each entry being {scale: average KA}
    """
    ls = dict()
    for note in scaleCycle():
        ls[note] = KAmean(chord, note)
    return ls


def progression(chords):
    """Calculates average Key Attraction (KA) across scales for a progression
    of chords.

    Retuns a list of dictionaries. Each index of list is an ordered chord, and
    its attraction to every possible scale
    """
    ls = list()
    for chord in chords:
        ls.append(KAacrossScales(chord))
    return ls


def WildModel(chords):
    """Key Finding Algorithm as described by Brandon Wild (2016)
    Uses ICP model to calculate Key Attraction of chord to possible scales and
    determine most perceptually salient matching scale.

    This model applies a crude memory decay where as new chords are played,
    effect of previous chords decay according to harmonic series
    ie (1 + 1/2 + 1/3 + ... + 1/n)

    Retuns a dictionary of scales and KA of ordered Chords
    ie {scale: [chord1, chord2,...]}

    For instance, if you want to see attraction of the chord progression towards
    the C key, you can do so by WildModel(chords)['C']. This will return a list.

    TODO:
    - Determine Key Confirmation (KC) and Key Prolongation (KP)
    - "At KC the maximum KA is multiplied by a reward factor"
    - "all other KAs are suppressed by a related factor"
    """
    prog = progression(chords)
    c_sum = dict()
    for note in scaleCycle():  # For every possible scale (major)
        note_sum = list()
        kas = list()
        for p in prog:  # For each chord in progression
            kas.append(p[note])  # Keep track of progression of KAs
            s = 0
            for i, ka in enumerate(list(reversed(kas))):  # For each KA in our progression
                s = s + ka/(i+1)  # calculate cumulative sum of what's been "heard", applying our harmonic decay
            note_sum.append(s)
        c_sum[note] = note_sum
    return c_sum
