function totheuser(alpha, beta, gamma, delta)

%user interface for the settings that provides defaults
%and rules for each.

prompt = {'Enter alpha value (alpha > 0)', 'Enter gamma (gamma > beta)',
    'Enter beta (beta > 1)', 'Enter delta (delta > 0)'};
dlg_title = 'Model Settings';
defaultans = {'99999', '4', '8', '0.1'};

icpsettings = inputdlg(prompt, dlg_title, 1, defaultans, 'on');
end