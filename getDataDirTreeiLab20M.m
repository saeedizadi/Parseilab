
function dirTree =  getDataDirTreeiLab20M

    dataroot        = getRootiLab20M;
    classNames      = getClassNameiLab20M;
    nClasses        = length(classNames);
    dirTree.root    = dataroot;
    dirTree.classNames = classNames;
    
    instanceNames = cell(nClasses,1);
    for i=1:nClasses
        instanceNames{i} = getInstanceNameiLab20M(i);
    end    
     
    % each instance, extract: background info
    classInfo = struct('instanceNames', {}, 'instanceInfo', {});
    for i=1:nClasses
        nInstances = length(instanceNames{i});
        c_instances = struct('instanceName', {}, 'instanceDir', {}, 'backgroundNames', {}); 
        for j=1:nInstances
            instName = instanceNames{i}{j};
            instDir = fullfile(dataroot, classNames{i}, instName);
            backgrounds = getSubfolders(instDir);            
            c_instances(j).instanceName = instName;
            c_instances(j).instanceDir = instDir;
            c_instances(j).backgroundNames = backgrounds;
        end
        classInfo(i).instanceNames = instanceNames{i};
        classInfo(i).instanceInfo = c_instances;
        
    end
    
    dirTree.classInfo = classInfo;
    
end


