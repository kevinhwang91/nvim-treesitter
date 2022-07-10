((function_call
  name: [
    (identifier) @_cdef_identifier
    (_ _ (identifier) @_cdef_identifier)
  ]
  arguments: (arguments (string content: _ @c)))
  (#eq? @_cdef_identifier "cdef"))

((function_call
  name: (_) @_vimcmd_identifier
  arguments: (arguments (string content: _ @vim)))
  (#any-of? @_vimcmd_identifier "vim.cmd" "vim.api.nvim_command" "vim.api.nvim_exec"))

((function_call
  name: (_) @_vimcmd_identifier
  arguments: (arguments (string content: _ @query) .))
  (#eq? @_vimcmd_identifier "vim.treesitter.query.set_query"))
(
  (function_call
    (identifier) @_vimcmd_identifier
    (arguments
      (string) @vim)
  )

  (#any-of? @_vimcmd_identifier "cmd" "api.nvim_command" "api.nvim_exec")
  (#lua-match? @vim "^[\"']")
  (#offset! @vim 0 1 0 -1)
)

(
  (function_call
    (identifier) @_vimcmd_identifier
    (arguments
      (string) @vim)
  )

  (#any-of? @_vimcmd_identifier "cmd" "api.nvim_command" "api.nvim_exec")
  (#lua-match? @vim "^%[%[")
  (#offset! @vim 0 2 0 -2)
)
