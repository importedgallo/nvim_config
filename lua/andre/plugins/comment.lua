-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup()

-- mappings at https://github.com/numToStr/Comment.nvim
-- :h comment.config
