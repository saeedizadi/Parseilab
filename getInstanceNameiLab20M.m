function instances = getInstanceNameiLab20M(classIdx)
    
    dataroot = getRootiLab20M;
    classes = getSubfolders(dataroot);
    if classIdx < 1 || classIdx > length(classes)
        fprintf(1, 'classIdx should be within (%d %d)\n', 1, length(classes));
        instances = [];
        return;
    end
    
    instanceroot = fullfile(dataroot, classes{classIdx});
    instances = getSubfolders(instanceroot);
end