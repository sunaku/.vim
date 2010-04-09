let test#strategy = 'dispatch'

Shortcut (test) run test under cursor
      \ nnoremap <silent> <Space>,tn :TestNearest<CR>

Shortcut (test) run all tests in buffer
      \ nnoremap <silent> <Space>,tb :TestFile<CR>

Shortcut (test) run all tests in suite
      \ nnoremap <silent> <Space>,ts :TestSuite<CR>

Shortcut (test) repeat recent test run
      \ nnoremap <silent> <Space>,.t :TestLast<CR>

Shortcut (test) expose recently ran test
      \ nnoremap <silent> <Space>e.t :TestVisit<CR>
