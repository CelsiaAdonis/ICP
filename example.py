from KeyAttraction import *
import matplotlib.pyplot as plt


chords = [['C', 'E', 'G'], ['F', 'A', 'C'], ['G', 'B', 'D'], ['C', 'E', 'G'],
          ['A', 'C', 'E'], ['G', 'B', 'D'], ['C', 'E', 'G']]

M = WildModel(chords)

print(M)
print(KFA(chords))

plt.fill_between([1,2,3,4,5,6,7], M['C'], color="blue", alpha=0.25)
plt.fill_between([1,2,3,4,5,6,7], M['F'], color="green", alpha=0.25)
plt.fill_between([1,2,3,4,5,6,7], M['G'], color="red", alpha=0.25)

plt.show()
