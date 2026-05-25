function PLUGIN:EnvKeys(ctx)
    return {
        {
            key = "VCPKG_ROOT",
            value = ctx.path,
        },
        {
            key = "PATH",
            value = ctx.path,
        },
    }
end
