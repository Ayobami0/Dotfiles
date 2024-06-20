local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  s({
    trig = '#!',
    dscr = 'Insert python header',
  }, { t { '#!/usr/bin/env python3' } }),
  s({
    trig = 'docs',
    dscr = 'Plain Docmentation',
  }, fmt('"""{}"""', { i(1) })),
  s(
    {
      trig = 'docfn',
      dscr = 'Snippet for documenting a function without arguments',
    },
    fmt(
      [["""{}
	{}
	Return:
		{}: {}
"""]],
      { i(1), i(0), i(2, 'return_type'), i(3) }
    )
  ),
  s(
    {
      trig = 'docfa',
      dscr = 'Snippet for documenting a function with arguments',
    },
    fmt(
      [["""{}
	{}
	Args:
		{}: {} 
	Returns:
		{}
"""]],
      { i(1), i(0), i(2, 'arg_name'), i(3, 'arg_desc'), i(4, 'return') }
    )
  ),
  s(
    {
      trig = 'docm',
      dscr = 'Snippet for documenting a module',
    },
    fmt(
      [["""{}

{}

Typical usage example:
  {}
"""]],
      { i(1, 'summary'), i(2, 'description'), i(3) }
    )
  ),

  s(
    {
      trig = 'docls',
      dscr = 'Snippet for documenting a class',
    },
    fmt(
      [["""{}

    {}

    Attributes:
      {}: {}
    """
]],
      { i(1, 'summary'), i(0, 'description'), i(2, 'attr'), i(3, 'attr_desc') }
    )
  ),
}
