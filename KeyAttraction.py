from ICP import *


def KA(chord, scale, root='N', type='major'):
    TA = dict()
    for note in scaleFind(scale, type):
        a, codi = ICP([chord, note])
        TA[note] = a
    return TA


def KAmean(chord, scale, type='major'):
    ka = KA(chord, scale)
    return sum(ka.values())/len(ka.values())


def KAacrossScales(chord):
    ls = dict()
    for note in scaleCycle():
        ls[note] = KAmean(chord, note)
    return ls


def progression(chords):
    ls = list()
    for chord in chords:
        ls.append(KAacrossScales(chord))
    return ls
