clearvars
close all
clc

%Code for processing simulation images to rotate, crop+ save

root_folder = 'Fig 11';

rotation_angle = 45;
crop_position = [507 507 395 395];
crop_lims =  [crop_position(1), crop_position(1) + crop_position(3)...
              ,crop_position(2), crop_position(2) + crop_position(4)];

im0 = imread('Pressure image for boundaries.png');
im0_rot = imrotate(im0,45, 'bilinear');

figure
imshow(im0_rot)
rectangle('Position',crop_position, 'EdgeColor','r')

file_data= dir(root_folder);

N_images = length(file_data);
for i = 3:N_images
    im_name = file_data(i).name;
    im_filename = [root_folder, '/',im_name ];
    im = imread(im_filename);
    im_rot = imrotate(im,45, 'bilinear');
    im_crop = im_rot(crop_lims(1):crop_lims(2),crop_lims(3):crop_lims(4), :);
    
    im_savename = [root_folder, '/',im_name(1:end-4), '_cropped.png' ];

    figure
    imshow(im_crop)

    imwrite(im_crop,im_savename)

end


%%Code for rectangular images, just to crop

root_folder = 'Fig 8';


crop_position = [317 118 561 561];
crop_lims =  [crop_position(2), crop_position(2) + crop_position(4),...
                 crop_position(1), crop_position(1) + crop_position(3)];

im0 = imread('Fig 8/Fig 8 M2 p25PVI diag.png');

figure
imshow(im0)
rectangle('Position',crop_position, 'EdgeColor','r')
%%
file_data= dir(root_folder);

N_images = length(file_data);
for i = 3:N_images
    im_name = file_data(i).name;
    im_filename = [root_folder, '/',im_name ];
    im = imread(im_filename);
    im_crop = im(crop_lims(1):crop_lims(2),crop_lims(3):crop_lims(4), :);
    
    im_savename = [root_folder, '/',im_name(1:end-4), '_cropped.png' ];

    figure
    imshow(im_crop)

    imwrite(im_crop,im_savename)

end
