tr = {c002_Membrane_Voltage_1,
    c003_Membrane_Voltage_1,
    c004_Membrane_Voltage_1,
    c005_Membrane_Voltage_1,
    c006_Membrane_Voltage_1,
    c007_Membrane_Voltage_1,
    c008_Membrane_Voltage_1,
    c009_Membrane_Voltage_1,
    c010_Membrane_Voltage_1,
    c011_Membrane_Voltage_1,
    c012_Membrane_Voltage_1,
    c013_Membrane_Voltage_1,
    c014_Membrane_Voltage_1,
    c015_Membrane_Voltage_1,
    c016_Membrane_Voltage_1
    };
fir_i = [];
fir_n = [];

for n = 2:2
    inj = (n-4)*30;
    scaledT = c001_Time*1000-300;
    scaledV = (tr{n-1}*1000-70);
    p = plot(scaledT,scaledV);
    [L, numberOfPeaks] = bwlabel(scaledV>0);
    fir_i = [fir_i inj];
    fir_n = [fir_n numberOfPeaks];
    xlabel('Time (ms)')
    ylabel('Voltage (mV)')
    ttl = sprintf('Experimental PV Interneuron (%d pA injection)-(%d spikes)',inj,numberOfPeaks);
    title(ttl)
    file = sprintf('pv_int_%d_pa.png',inj);
    saveas(p,file)
end

for n = 4:16
    inj = (n-3)*30;
    scaledT = c001_Time*1000-300;
    scaledV = (tr{n-1}*1000-70);
    p = plot(scaledT,scaledV);
    [L, numberOfPeaks] = bwlabel(scaledV>0);
    fir_i = [fir_i inj];
    fir_n = [fir_n numberOfPeaks];
    xlabel('Time (ms)')
    ylabel('Voltage (mV)')
    ttl = sprintf('Experimental PV Interneuron (%d pA injection)-(%d spikes)',inj,numberOfPeaks);
    title(ttl)
    file = sprintf('pv_int_%d_pa.png',inj);
    saveas(p,file)
end
fir_n_model = [0 0 0 0 0 0 0 0 0 0 0 0 3 7 9]
f = figure
p = plot(fir_i(1,:),fir_n(1,:),'DisplayName','Experimental')
set(p,'Marker','.')
hold on
p = plot(fir_i(1,:),fir_n_model(1,:),'DisplayName','Model');


set(p,'Marker','.')
xlabel('Current (pA)')
ylabel('Frequency')
ttl = sprintf('PV Inter FIR Curve',inj,numberOfPeaks);
title(ttl)
file = sprintf('PV_Inter_FIR_REAL_NOLABELS.png',inj);
saveas(p,file)

%strValues = strtrim(cellstr(num2str([fir_i(:) fir_n(:)],'(%d,%d)')));
%text(fir_i,fir_n,strValues,'VerticalAlignment','bottom');
leg = legend('show')
set(leg, 'Location', 'Best')
file = sprintf('chandelier_FIR_both.png',inj);
saveas(p,file)