function [alpha, beta, gamma, delta] = icpsettings()

%user interface for the settings that provides defaults
%and rules for each.

prompt = {'Enter alpha value (alpha > 0)', 'Enter gamma (gamma > beta)',
    'Enter beta (beta > 1)', 'Enter delta (delta > 0)'};
dlg_title = 'Model Settings';
defaultans = {'99999', '4', '8', '0.1'};

setdi = inputdlg(prompt, dlg_title, 1, defaultans, 'on');

alpha = setdi{1};
beta = setdi{2};
gamma = setdi{3};
delta = setdi{4};
end