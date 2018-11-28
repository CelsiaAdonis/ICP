from ICP import *


def KA(chord, root='N', scale=['C', 'D', 'E', 'F', 'G', 'A', 'B']):
    TA = dict()
    for note in scale:
        a, codi = ICP([chord, note])
        TA[note] = a
    return TA


def KAmean(chord, scale):
    ka = KA(chord, scale)
    return sum(ka.values())/len(ka.values())


def progression(chords, scale):
    ls = list()
    for chord in chords:
        ls.append(KAmean(chord, scale))
    return ls
