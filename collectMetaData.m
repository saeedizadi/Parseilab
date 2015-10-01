function metaData = collectMetaData

rootDir = getRootiLab20M;
nClasses = numel(getClassNameiLab20M);
tnInstances = 0;
for i=1:nClasses
    classDir = getClassRootiLab20M(i);
    tnInstances = tnInstances + numel(getSubfolders(classDir));
end

end