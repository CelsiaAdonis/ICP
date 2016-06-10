function totheuser()

%user interface for the settings that provides defaults
%and rules for each.

prompt = {'Enter alpha value (alpha > 0)', 'Enter gamma (gamma > beta)',
    'Enter beta (beta > 1)', 'Enter delta (delta > 0)'};
dlg_title = 'Model Settings';
defaultans = {'99999', '4', '8', '0.1'};

icpsettings = inputdlg(prompt, dlg_title, 1, defaultans, 'on');

alpha = icpsettings{1};
beta = icpsettings{2};
gamma = icpsettings{3};
delta = icpsettings{4};
end