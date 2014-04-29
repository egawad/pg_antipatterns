SELECT comment_id FROM Comments WHERE parent_id = 4; --return 5,6
SELECT comment_id FROM Comments WHERE parent_id = 5; --return nothing
SELECT comment_id FROM Comments WHERE parent_id = 6; --return 7
SELECT comment_id FROM Comments WHERE parent_id = 7; --return 8
SELECT comment_id FROM Comments WHERE parent_id = 8; --return nothing
DELETE FROM Comments WHERE comment_id IN (8);
DELETE FROM Comments WHERE comment_id IN (7);
DELETE FROM Comments WHERE comment_id IN (5,6);
DELETE FROM Comments WHERE comment_id = 4;

