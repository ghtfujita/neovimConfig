-- vim.cmd([[
-- call lexima#add_rule({'char': '"', 'at': '\%#"', 'leave': 1, 'priority': 3})
-- call lexima#add_rule({'char': '"',
--             \ 'at': '[({[''`]\%#\<\@!\|\>\@<!\%#[)}\]''`]',
--             \ 'input_after': '"', 'priority': 2})
-- call lexima#add_rule({'char': '"', 'at': '\%#\S\|\S\%#', 'priority': 1})
-- call lexima#add_rule({'char': "'", 'at': '\%#''', 'leave': 1, 'priority': 3})
-- call lexima#add_rule({'char': "'",
--             \ 'at': '[({["`]\%#\<\@!\|\>\@<!\%#[)}\]"`]',
--             \ 'input_after': "'", 'priority': 2})
-- call lexima#add_rule({'char': "'", 'at': '\%#\S\|\S\%#', 'priority': 1})
-- call lexima#add_rule({'char': '`', 'at': '\%#`', 'leave': 1, 'priority': 3})
-- call lexima#add_rule({'char': '`',
--             \ 'at': '[({["'']\%#\<\@!\|\>\@<!\%#[)}\]"'']',
--             \ 'input_after': '`', 'priority': 2})
-- call lexima#add_rule({'char': '`', 'at': '\%#\S\|\S\%#', 'priority': 1})
-- ]])
