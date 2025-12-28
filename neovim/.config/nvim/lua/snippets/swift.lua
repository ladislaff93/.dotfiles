local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- TCA Reducer boilerplate
  -- Trigger: "reducer"
  s("reducer", fmt([[
public typealias {}Store = StoreOf<{}Reducer>

@Reducer
public struct {}Reducer {{
    @ObservableState
    public struct State: Equatable {{
        {}

        public init() {{}}
    }}

    @CasePathable
    public enum Action: Equatable {{
        {}
    }}

    public init() {{}}

    public var body: some ReducerOf<Self> {{
        Reduce {{ state, action in
            {}
        }}
    }}
}}
]], {
    i(1, "Name"),        -- Name placeholder (position 1)
    rep(1),              -- Repeat Name for StoreOf
    rep(1),              -- Repeat Name for struct
    i(2, ""),            -- State body (position 2)
    i(3, ""),            -- Action body (position 3)
    i(4, ""),            -- Reduce body (position 4)
  })),
}
