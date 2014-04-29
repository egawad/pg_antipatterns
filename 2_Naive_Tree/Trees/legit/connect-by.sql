-- Need to instal contrib/tablefunc
SELECT c.comment_id, c.bug_id, c.parent_id, c.author, c.comment, ct.depth
  FROM comments c, (
     SELECT * FROM
       connectby('comments', 'comment_id', 'parent_id', '1', 0) 
       AS cb(comment_id bigint, parent_id bigint, depth int)) ct
WHERE ct.comment_id = c.parent_id;


