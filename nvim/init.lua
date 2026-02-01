-- ターミナルのカラーモードを利用(tmuxの背景色に合わせるために設定している)
vim.opt.termguicolors = false

-- 行番号を表示
vim.opt.number = true

-- 外部でファイルが変更されたら自動でバッファを更新
vim.opt.autoread = true
local reload_timer = vim.uv.new_timer()
reload_timer:start(0, 200, vim.schedule_wrap(function()
  vim.cmd("checktime")
end))

