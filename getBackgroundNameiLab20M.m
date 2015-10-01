function backgrounds = getBackgroundNameiLab20M(classIdx,instanceIdx,varargin)

dataroot = getRootiLab20M;
classes = getSubfolders(dataroot);
instances = getInstanceNameiLab20M(classIdx);

if classIdx < 1 || classIdx > length(classes)
    fprintf(1, 'classIdx should be within (%d %d)\n', 1, length(classes));
    backgrounds = [];
    return;
end

if instanceIdx < 1 || instanceIdx > length(instances)
    fprintf(1, 'instanceIdx should be within (%d %d)\n', 1, length(instances));
    backgrounds = [];
    return;
end


bgRoot = fullfile(dataroot, classes{classIdx},instances{instanceIdx});
backgrounds = getSubfolders(bgRoot);

%Use this code to specify the background models
% if nargin > 2
%     
%     strPattern = ['\W*00(' varargin{1} ')\W*'];   
%     myindices = ~cellfun(@isempty,regexp(backgrounds,strPattern));
%     backgrounds = backgrounds(myindices);
% end
end