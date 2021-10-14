clearvars
close all
clc

%Image processing code. Uses cropped images, and performs projection ot
%account for uneven camera - cell mounting. It then copies images at
%selected times (based on breakthrough times in the excel files). 

root_folder = 'M20v4';
image_folder = 'time_lapse_processed';
save_folder = 'time_lapse_final';
image_root = root_folder;
start_file = 1000;
end_file = 1419;

im1_name = [image_root, ' (',int2str(start_file),').bmp'];

im1_filename = [root_folder, '/', image_folder, '/', im1_name];

im1 = imread(im1_filename);

h = cpselect(im1,im1);

tform = fitgeotrans(fixedPoints,movingPoints,'projective');

for i = start_file:end_file
    
    im2_name = [image_root, ' (',int2str(i),').bmp'];
    im2_filename = [root_folder, '/', image_folder, '/', im2_name];
    
    if isfile(im2_filename)
        im2_savename = [root_folder, '/', save_folder, '/', im2_name];
        im2 = imread(im2_filename);
        im_shifted = imwarp(im2,tform,'OutputView',imref2d(size(im1)));
        
        if (i == start_file)
            b1 = mean2(rgb2gray(im_shifted));
        end
        
        b2 = mean2(rgb2gray(im_shifted));
        im_corr = im_shifted + (b1 - b2);
        
        imwrite(im_corr,im2_savename)
    else
        % File does not exist.
    end
    
    
end
close(h)


image_folder1 = 'time_lapse_final';
image_folder2 = 'time_lapse_raw';
save_folder1 = 'selected_PV/final';
save_folder2 = 'selected_PV/raw';

image_root = root_folder;

frame_lims(1) =   1023;

frames_nn  = [1091	1159	1227	1296];
breakthrough = {1090	0.246};

frame_lims(2) =   breakthrough{1};

crop_border = 25;

frames = round((frame_lims(2) - frame_lims(1))*linspace(0, 1, 7)) + frame_lims(1);
frame_names = {'_tb_0_6_cropped', '_tb_1_6_cropped', '_tb_2_6_cropped', '_tb_3_6_cropped','_tb_4_6_cropped','_tb_5_6_cropped','_tb_6_6_cropped'};
frame_names_nn = {'_pvi_0_2_cropped', '_pvi_0_50_cropped', '_pvi_0_75_cropped', '_pvi_1_00_cropped'};
breakthrough_name = ['_breakthrough_', num2str(breakthrough{2}),'_PVI_cropped'];

for i = 1:4
    
    im1_name = [image_root, ' (',int2str(frames_nn(i)),').bmp'];
    im1_filename = [root_folder, '/', image_folder1, '/', im1_name];
    im1 = imread(im1_filename);
    im1_savename = [root_folder, '/', save_folder1, '/', image_root, frame_names_nn{i}, '.png'];
    imwrite(im1(crop_border:end-crop_border,crop_border:end-crop_border, :),im1_savename)
  
end

for i = 1:7
    
    im1_name = [image_root, ' (',int2str(frames(i)),').bmp'];
    im1_filename = [root_folder, '/', image_folder1, '/', im1_name];
    im1 = imread(im1_filename);
    im1_savename = [root_folder, '/', save_folder1, '/', image_root, frame_names{i}, '.png'];
    im_cropped = im1(crop_border:end-crop_border,crop_border:end-crop_border, :);
    imwrite(im_cropped,im1_savename)

end

