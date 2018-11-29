from ICP import *


a, codi = ICP(['B3', 'D4', 'G4'], ['C4', 'E4', 'G4'],
              roots=('G4', 'C4'), alpha=50)

a     # 0.731
codi  # 'SM'
