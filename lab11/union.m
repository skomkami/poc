function new_id = union(p,q,id)

new_id = id;

new_id(root(p,id)) = id(root(q,id));

end

