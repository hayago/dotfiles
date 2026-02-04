-- ターミナルのカラーモードを利用(tmuxの背景色に合わせるために設定している)
vim.opt.termguicolors = false

-- 行番号を表示
vim.opt.number = true

-- マウスホイールで1行ずつスクロールしてスムーズにスクロールする
vim.opt.mousescroll = "ver:1,hor:1"

-- 外部でファイルが変更されたら自動でリロード
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

