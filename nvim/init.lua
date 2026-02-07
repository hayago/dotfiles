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

-- Pythonファイル保存時にuvx ruff checkを実行（uvがインストールされている場合のみ）
if vim.fn.executable("uv") == 1 then
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    callback = function()
      local filepath = vim.fn.expand("%:p")
      local output = vim.fn.system({ "uvx", "ruff", "check", filepath })
      if vim.v.shell_error ~= 0 then
        vim.notify(output, vim.log.levels.WARN)
      end
    end,
  })
end

