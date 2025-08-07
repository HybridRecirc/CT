clc; clear

%number of frames
frames = 360;

%starting height
height = 800;%bigger one
%end height
endheight = 100;

%output container

outputname = sprintf(".\\projection2\\Stacked728.tif");
%does some stuff
t=Tiff(outputname','w');
        tagstruct.ImageLength = 1000; % image height
        tagstruct.ImageWidth = 1000; % image width
        tagstruct.Photometric = Tiff.Photometric.MinIsBlack;
        tagstruct.BitsPerSample = 8;
        tagstruct.SamplesPerPixel = 1;
        tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky; % groups rgb values into a single pixel instead of saving each channel separately for a tiff image
        tagstruct.Software = 'MATLAB';
        setTag(t,tagstruct)
        write(t,squeeze(im2uint8(zeros(1000,1000))));

while (height > endheight)

    while (frames>0) %cycles for every angle for a given slice

        name = sprintf(".\\projection2\\image (%d).png",frames); %input image frame for given angle
        img = imread(name);
        imggrayscale = rgb2gray(img);
        imggrayscale2 = imadjust(imcomplement(imggrayscale));
        sinogram(:, (frames)) = improfile(imggrayscale2,[1 , 1000],[height,height]); %adds intensity projection to sinogram
        frames = frames - 1;
    end 

imshow(sinogram,[]) %flashes sinogram

i = iradon(sinogram, 1:360, "pchip", "Hann", 1, 1000); %generates slice
imshow(i,[]);  %shows slice

writeDirectory(t);
setTag(t,tagstruct)
write(t,squeeze(im2uint8(i))) %%%appends the next layer to the same tiff container
        
        
frames = 360; %resets frame counter for next slice
height = height -1;

fprintf("Slice %d\n", height)

end
close(t) %closes out the tiff container for access by other programs



%stuff
%i = iradon(sinogram, 1:360,"linear","Shepp-Logan");

%imshow(i,[]);

%volshow(randn(100, 100, 100));


