
if not require("lazy.core.config").plugins["jai.vim"] then
    return
end


-- remove note highlighting
vim.api.nvim_exec([[
    
    syntax clear jaiCommentNote

    " syntax match jaiLineComment "//.*" contains=jaiCommentNote,jaiCommentTagHack
    "
    " syntax match jaiCommentNote "@\<\w\+\>\|\<\w\+\>:"  contained display
    " syntax match jaiCommentTagHack "@\<hack\>\|\<hack\>:" contained display
    "
    " highlight def link jaiCommentNotee Todo
    " highlight def link jaiCommentTagHack Error
]], false)
