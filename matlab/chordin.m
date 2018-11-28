function [chord1, chord2, root1, root2] = chordin()

%User interface that asks for two chords that may be of 1-n length.
%Function must be able to divide and save the notes of the chords
%individually for further processing.
%It also identifies the root of the chord, if any.

prompt = {'Input note/chord 1:',...
    'What is the root? N if none.',...
    'Input note/chord 2:',...
    'What is the root? N if none.'};
dlg_title = 'ICP';
defaults = {'B3 D4 G4', 'G4', 'c4 e4 g4', 'c4'};

chords = inputdlg(prompt, dlg_title, 1, defaults, 'on');

chord1 = strsplit(chords{1});
chord2 = strsplit(chords{3});
root1 = chords{2};
root2 = chords{4};


end