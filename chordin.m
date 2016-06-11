function [chord1, chord2] = chordin()

%User interface that asks for two chords.
%Chords may be of any length from 1-??

%Function must be able to divide and save the notes of the chords
%individually for further processing.

prompt = {'Input note/chord 1:', 'Input note/chord 2:'};
dlg_title = 'ICP';
defaults = {'A Cb E', 'c e g#'};

chords = inputdlg(prompt, dlg_title, 1, defaults, 'on');

global chord1
global chord2
chord1 = strsplit(chords{1});
chord2 = strsplit(chords{2});
end