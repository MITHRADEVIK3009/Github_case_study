-- Minimal schema for storing unsent comment drafts
CREATE TABLE pr_comment_drafts (
  draft_id TEXT PRIMARY KEY,
  pr_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  status TEXT DEFAULT 'PENDING', -- PENDING, FAILED, SENT
  created_at INTEGER NOT NULL
);
