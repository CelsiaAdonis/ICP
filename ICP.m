function attraction = ICP()

%Calculates the attraction betwen two notes or chords
%that are inputed by the user.
%Goes through a series of mathematical steps to output a single
%attraction value.


%step 1: Grab chords
userchords = chordin();
global chord1
global chord2

%step 2: Grab settings
settings = icpsettings();
global alpha
global beta
global gamma
global delta

%step 3: get number of columns of cells
[chorow1, chocol1] = size(chord1);

%step 4: translate chords into MIDI
for note = 1:chocol1
    currentNote = chord1{note};
    firstmidi(note) = translate(currentNote);
end
firstmidi
% firstmidi = translate('DB2')
end