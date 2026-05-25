function PLUGIN:PostInstall(ctx)
    local sdkInfo = ctx.sdkInfo[PLUGIN.name]
    local path = sdkInfo.path
    local version = sdkInfo.version
    local os_type = RUNTIME.osType:lower()

    print("Cloning vcpkg repository...")
    local clone_cmd = "git clone https://github.com/microsoft/vcpkg.git " .. path
    local res = os.execute(clone_cmd)
    if res ~= 0 then
        error("Failed to clone vcpkg repository")
    end

    print("Checking out version " .. version .. "...")
    local checkout_cmd = "cd " .. path .. " && git checkout " .. version
    res = os.execute(checkout_cmd)
    if res ~= 0 then
        error("Failed to checkout version " .. version)
    end

    print("Bootstrapping vcpkg...")
    local bootstrap_cmd = ""
    if os_type == "windows" then
        bootstrap_cmd = "cd " .. path .. " && .\\bootstrap-vcpkg.bat -disableMetrics"
    else
        bootstrap_cmd = "cd " .. path .. " && ./bootstrap-vcpkg.sh -disableMetrics"
    end

    res = os.execute(bootstrap_cmd)
    if res ~= 0 then
        error("Failed to bootstrap vcpkg")
    end
end
