function fullFileDirs = getAllFileNames

classes = getClassNameiLab20M;

nClasses = numel(classes);
fullFileDirs = cell(1,nClasses);
for i=1:nClasses
    
    instances = getInstanceNameiLab20M(i);
    nInstances = numel(instances);
    
    for j=1:nInstances
    
        backgrounds = getBackgroundNameiLab20M(i,j);
        nBackgrounds = numel(backgrounds);
        
        for k=1:nBackgrounds
        
            dirBackground = getBackgroundRootiLab20M(i, j, k);
            imgNames = getImgFiles(dirBackground,'png');            
            fullDirImgFiles = fullfile(dirBackground,imgNames);
            %fullDirImgFiles = strcat(fullDirImgFiles,[' ' num2str(i-1)]);
            fullFileDirs{i} = [fullFileDirs{i}; fullDirImgFiles];
        
        end                
    end
end


end
