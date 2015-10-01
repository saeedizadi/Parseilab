
function classDir =  getClassRootiLab20M(classIdx)  
    
    rootdir = getRootiLab20M;
    classNames = getClassNameiLab20M;
    classDir = fullfile(rootdir, classNames{classIdx});

end