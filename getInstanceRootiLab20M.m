
function instanceDir =  getInstanceRootiLab20M(classIdx, instanceIdx)  
    
    rootdir = getRootiLab20M;
    classNames = getClassNameiLab20M;
    if classIdx < 1 || classIdx > length(classNames)
        fprintf(1, 'classIdx should lie within (%d %d)\n', 1, length(classNames));
        instanceDir = [];
        return;
    end
    instanceNames = getInstanceNameiLab20M(classIdx);
    if instanceIdx < 1 || instanceIdx > length(instanceNames)
        fprintf(1, 'class: %s\n instanceIdx should lie within (%d %d)\n', ...
                          classNames{classIdx},  1, length(instanceNames));
        instanceDir = [];
        return;
    end
    instanceDir = fullfile(rootdir, classNames{classIdx}, instanceNames{instanceIdx});

end
