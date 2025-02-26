{erl_opts, [no_debug_info]}.

{deps, [
    {lfe, "2.1.2"},
    {ltest, "0.13.4"}
]}.

{plugins, [
    {rebar3_lfe, "0.4.4"}
]}.

{provider_hooks, [
    {pre, [{compile, {lfe, compile}}]}
]}.

{xref_checks,[
    undefined_function_calls,undefined_functions,locals_not_used,
    deprecated_function_calls,deprecated_functions
]}.

{escript_incl_apps, [lfe, '{{name}}']}.
{escript_main_app, '{{name}}'}.
{escript_name, '{{name}}'}.
{escript_emu_args, "%%! +sbtu +A1\n"}.

{profiles, [
    {test, [
        {deps, [
            {proper, "1.3.0"}
        ]},
        {plugins, [
            {rebar3_proper, "0.12.0"}
        ]},
        {eunit_opts, [verbose]},
        {erl_opts, [{src_dirs, ["src", "test"]}]}
    ]}
]}.

{alias, [
    {coverage, [
        {proper, "-c"},
        {cover, "-v --min_coverage=0"}
    ]},
    {check, [
        compile,
        xref,
        %%dialyzer,
        eunit,
        coverage
    ]}
]}.
