function writeFileDirToText()

fprintf('Loading model or getting the names of images ...\n');
%fullfileDir = getAllFileNames;
load('boat_all_list');

fprintf('Retrieving desired images ...\n')
fullfileDirCat = fullFileDirs{:};
%Insert he pattern for retrieving the appropriate images
strPattern = '\W*b[0-9]*-c[0-9]*-r0[0-7]-l0-f0\W*';
myindices = ~cellfun(@isempty,regexp(fullfileDirCat,strPattern)); 

%Retrieve images and store them in new variable
subfullfileDirCat = fullfileDirCat(myindices);
%Replace spaces with \space
subfullfileDirCat = strrep(subfullfileDirCat,' ','\ ');
label = zeros(sum(myindices),1);
fprintf('Computing labels ...')
for i=0:4
  cameraPat=sprintf('\\W*c%02d\\W*',i);
  camIdx = ~cellfun(@isempty,regexp(subfullfileDirCat,cameraPat));
  for j=0:7
      rotatePat=sprintf('\\W*r%02d\\W*',j);
      rotateIdx = ~cellfun(@isempty,regexp(subfullfileDirCat,rotatePat));
      jointIdx = logical(camIdx .* rotateIdx);
      label(jointIdx) = j;
  end
end

for i=5:10
  cameraPat=sprintf('\\W*c%02d\\W*',i);
  camIdx = ~cellfun(@isempty,regexp(subfullfileDirCat,cameraPat));
  for j=0:7
      rotatePat=sprintf('\\W*r%02d\\W*',j);
      rotateIdx = ~cellfun(@isempty,regexp(subfullfileDirCat,rotatePat));
      jointIdx = logical(camIdx .* rotateIdx);
      label(jointIdx) = 8 + j;
  end
end

fid = fopen('boat_b00_c_r_l0_f0.dat','w');
fprintf(fid,'%s\n',subfullfileDirCat{:});

fid = fopen('boat_lable_b00_c_r_l0_f0.dat','w');
fprintf(fid,'%d\n',label);


end
