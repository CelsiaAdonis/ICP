function [chord1, chord2, root1, root2] = chordin()

%User interface that asks for two chords.
%Chords may be of any length from 1-??
%Function must be able to divide and save the notes of the chords
%individually for further processing.

prompt = {'Input note/chord 1:',...
    'Does chord 1 have an identifiable root? Y/N',...
    'Input note/chord 2:',...
    'Does chord 2 have an identifiable root? Y/N'};
dlg_title = 'ICP';
defaults = {'B3 D4 G4', 'Y', 'c4 e4 g4', 'Y'};

chords = inputdlg(prompt, dlg_title, 1, defaults, 'on');

chord1 = strsplit(chords{1});
chord2 = strsplit(chords{3});
root1 = chords{2};
root2 = chords{4};

end