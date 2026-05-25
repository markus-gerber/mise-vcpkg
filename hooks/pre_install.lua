function PLUGIN:PreInstall(ctx)
    return {
        version = ctx.version,
        note = "Preparing to clone vcpkg registry " .. ctx.version,
    }
end
