function root_id = root(index, id)

root_id = index;

while root_id ~= id(root_id)
    root_id = id(root_id);
end

