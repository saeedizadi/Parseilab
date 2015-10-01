
function classes = getClassNameiLab20M
    if nargin ~= 0
        return;
    end    
    dataroot = getRootiLab20M;
    classes = getSubfolders(dataroot);
end