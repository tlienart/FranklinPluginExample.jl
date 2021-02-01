module FranklinPluginExample

using FranklinUtils      # useful `@lx`, `@env` macros

export lx_box            # watch the name!


@lx function box(; text="", kw...)
    opts = prod("$(replace(string(k), '_'=>'-')): $v; " for (k, v) in kw)
    return html("""
        <div style="text-align:center; $opts">
          $text
        </div>""")
end


function plugin_config()
    config_path = normpath(joinpath(@__FILE__, "..", "config.md"))
    if isdefined(Main, :Franklin)
        Main.Franklin.convert_md(read(config_path, String); isconfig=true)
    end
end

end # module
