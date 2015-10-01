function bgDir =  getBackgroundRootiLab20M(classIdx, instanceIdx, bgIdx)  
    
    rootdir = getRootiLab20M;
    classNames = getClassNameiLab20M;
    instanceNames = getInstanceNameiLab20M(classIdx);
    backgroundNames = getBackgroundNameiLab20M(classIdx,instanceIdx);
    if classIdx < 1 || classIdx > length(classNames)
        fprintf(1, 'classIdx should lie within (%d %d)\n', 1, length(classNames));
        bgDir = [];
        return;
    end
    
    if instanceIdx < 1 || instanceIdx > length(instanceNames)
        fprintf(1, 'class: %s\n instanceIdx should lie within (%d %d)\n', ...
                          classNames{classIdx},  1, length(instanceNames));
        bgDir = [];
        return;
    end
    
    if bgIdx < 1 || bgIdx > length(backgroundNames)
        fprintf(1, 'class: %s\n bgIdx should lie within (%d %d)\n', ...
                          classNames{classIdx},  1, length(backgroundNames));
        bgDir = [];
        return;
    end
    bgDir = fullfile(rootdir, classNames{classIdx}, instanceNames{instanceIdx},backgroundNames{bgIdx});
end