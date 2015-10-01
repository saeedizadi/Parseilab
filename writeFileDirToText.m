function writeFileDirToText()

fprintf('Loading model or getting the names of images ...\n');
%fullfileDir = getAllFileNames;
load('boat_all_list');

fprintf('Computing the labels ...\n')
fullfileDirCat = fullFileDirs{:};
%Insert he pattern for retrieving the appropriate images
strPattern = '\W*b00(00)-c(00|10)-r0[0-7]-l0-f0\W*';
myindices = ~cellfun(@isempty,regexp(fullfileDirCat,strPattern)); 

%Retrieve images and store them in new variable
subfullfileDirCat = fullfileDirCat(myindices);
%Replace spaces with \space
subfullfileDirCat = strrep(subfullfileDirCat,' ','\ ');
label = zeros(sum(myindices),1);

%Compute the labels for images according to param y
for i=1:numel(label)

    rotationStr = regexp(subfullfileDirCat, '(?<=r)[0-9]*(?=-)','match','once');
    cameraStr = regexp(subfullfileDirCat, '(?<=c)[0-9]*(?=-)','match','once');
    
    cameraNum = str2num(cameraStr{i});
    
    if cameraNum <=4
        rotationNum = str2double(rotationStr{i});
        label(i) = rotationNum;
    else
        rotationNum = str2double(rotationStr{i});
        label(i) = 8 + rotationNum;
    end    
end

fid = fopen('boat_b00_c_r_l0_f0.dat','w');
fprintf(fid,'%s\n',subfullfileDirCat{:});

fid = fopen('boat_lable_b00_c_r_l0_f0.dat','w');
fprintf(fid,'%d\n',label);


end
