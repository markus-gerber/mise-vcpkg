function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    -- Using tags for the registry snapshots
    local repo_url = "https://api.github.com/repos/microsoft/vcpkg/tags"

    local resp, err = http.get({
        url = repo_url,
    })

    if err ~= nil then
        error("Failed to fetch versions: " .. err)
    end
    if resp.status_code ~= 200 then
        error("GitHub API returned status " .. resp.status_code .. ": " .. resp.body)
    end

    local tags = json.decode(resp.body)
    local result = {}

    for _, tag_info in ipairs(tags) do
        local version = tag_info.name
        table.insert(result, {
            version = version,
        })
    end

    return result
end
