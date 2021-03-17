function q = SNRcalc(name,SignalBox,NoiseBox1,NoiseBox2,singleDouble)

close all;
filename = name;
kspace = loadfid(filename);
kspace_real = real(kspace);
image1 = fftshift(ifft2(fftshift(kspace)));
image1abs = abs(image1);
image1phase = atan2(imag(image1),real(image1))*180/pi;

figure;
imagesc(image1abs)
watermark_image('3172')
title('Image Magnitude')
xlabel('Phase encode step')
ylabel('Frequency encode step')
colormap(gray)
brighten(0.5)

SP1 = SignalBox;
rectangle('position',SP1,'EdgeColor','r')
Signal1 = image1abs(SP1(2):SP1(2)+SP1(4),SP1(1):SP1(1)+SP1(3));

NP1 = NoiseBox1;
rectangle('position',NP1,'EdgeColor','y')
Noise1 = image1abs(NP1(2):NP1(2)+NP1(4),NP1(1):NP1(1)+NP1(3));

NP2 = NoiseBox2;
rectangle('position',NP2,'EdgeColor','y')
Noise2 = image1abs(NP2(2):NP2(2)+NP2(4),NP2(1):NP2(1)+NP2(3));

if singleDouble == 1
    
    NoiseAvg = (Noise1+Noise2)./2;

    MeanSignal = mean2(Signal1)
    MeanNoise = mean2(NoiseAvg)
    STDNoise = std2(NoiseAvg)

    SNRmean = MeanSignal/(sqrt(2/pi)*MeanNoise)
    SNRstd = MeanSignal/(sqrt(2/(4-pi))*STDNoise)
end

    