function z = get_frequency(x, Fs, target_freq)
    % x is the vector of signal data
    % Fs is the sampling frequency of the data 
    % freq_granularity is the upper limit of the number of frequency points
    % you want to show in your graph. Adjust it according to the resolution
    % of the data and your desired range of frequency to be plotted. 
    
    % figure('rend','painters','pos',[10 10 1000 700])

    x = detrend(x,0);
    xdft = fft(x);
    freq = 0:Fs/length(x):Fs/2;

    y = fft(x);
    ly = length(y);
    f = (-ly/2:ly/2-1)/ly*Fs;
    a = abs(fftshift(y));
    
    x1= f(f>0); % this is used for plotting the frequency values. 
    y1 = a(f>0); % excluding the negative frequency values
    disp(x1);
    disp(y1);
    disp(y1(x1 == target_freq));
    z = y1(x1 == target_freq);
end