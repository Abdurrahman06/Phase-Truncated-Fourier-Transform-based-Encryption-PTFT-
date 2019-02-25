clear all; close all; clc;
imx=imread('cameraman.tif');
fx=im2double(imx);

Rx=rand(256,256);
R1=exp(1i*Rx);%mask2
% R1=exp(1i*2*pi*Rx);%mask1
Ry=rand(256,256);
R2=exp(1i*Ry);%mask2
% R2=exp(1i*2*pi*Ry);%mask2

FTfx=fft2(R1.*fx);
gx=abs(FTfx);
P2x=angle(FTfx);
P2=exp(1i*P2x);
% P2=exp(-1i*2*pi*P2x);

IFTgx=ifft2(R2.*gx);
cx=abs(IFTgx); %encrypted image
P1x=angle(IFTgx);
P1=exp(1i*P1x);
% P1=exp(-1i*2*pi*P1x);

figure, imshow(cx);
%%
guv=abs(fft2(cx.*P1));
frec=abs(ifft2(guv.*P2));
figure, imshow(frec); %decrypted image
