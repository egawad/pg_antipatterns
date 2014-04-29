CREATE TABLE Comments(
  comment_id SERIAL PRIMARY KEY,
  parent_id BIGINT,
  comment TEXT NOT NULL,
  FOREIGN KEY(parent_id) REFERENCES Comments(comment_id)
);



