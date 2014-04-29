CREATE TABLE Accounts(
  account_id SERIAL PRIMARY KEY,
  account_name text
);

CREATE TABLE Bugs(
  bug_id SERIAL PRIMARY KEY,
  bug_name text
);

CREATE TABLE Comments(
  comment_id SERIAL PRIMARY KEY,
  parent_id BIGINT,
  bug_id BIGINT NOT NULL,
  author BIGINT NOT NULL,
  comment_date TIMESTAMP NOT NULL,
  comment TEXT NOT NULL,
  FOREIGN KEY(parent_id) REFERENCES Comments(comment_id),
  FOREIGN KEY(bug_id) REFERENCES Bugs(bug_id),
  FOREIGN KEY(author) REFERENCES Accounts(account_id)
);

-- Accounts Data
INSERT INTO Accounts(account_name) VALUES('Fran');
INSERT INTO Accounts(account_name) VALUES('Oille');
INSERT INTO Accounts(account_name) VALUES('Kukla');

-- Bugs Data
INSERT INTO Bugs(bug_name) VALUES('Papilio xuthus');

-- Comments
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(null, 1, 1, CURRENT_TIMESTAMP, 'What''s the bug reason?');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(1, 1, 2, CURRENT_TIMESTAMP, 'Null pointer?');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(2, 1, 1, CURRENT_TIMESTAMP, 'No, I''ve already checked');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(1, 1, 3, CURRENT_TIMESTAMP, 'How about invalid input?');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(4, 1, 2, CURRENT_TIMESTAMP, 'Oh, that''s the reason.');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(4, 1, 1, CURRENT_TIMESTAMP, 'Right, could you create Check function?');
INSERT INTO Comments(parent_id, bug_id, author, comment_date, comment) VALUES(6, 1, 3, CURRENT_TIMESTAMP, 'OK. DONE.');

