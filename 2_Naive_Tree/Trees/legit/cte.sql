WITH RECURSIVE CommentTree
  (comment_id, bug_id, parent_id, author, comment, depth)
AS(
  SELECT comment_id, bug_id, parent_id, author, comment, 0 AS depth FROM Comments
    WHERE parent_id IS NULL
  UNION ALL
  SELECT c.comment_id, c.bug_id, c.parent_id, c.author, c.comment, ct.depth + 1 AS depth FROM CommentTree ct
  JOIN Comments c ON ct.comment_id = c.parent_id
)
SELECT * FROM CommentTree WHERE bug_id = 1;
