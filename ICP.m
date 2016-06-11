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

%step 3: translate chords into MIDI
% for note = chord1
%     firstmidi = translate(chord1)
% end

firstmidi = translate('f')
end