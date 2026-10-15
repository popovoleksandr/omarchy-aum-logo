-- >>> omarchy-aum-logo >>>
-- Omarchy's defaults put its own bin directory first on PATH, ahead of the
-- omarchy-aum-logo override of omarchy-show-logo (the floating Omarchy
-- terminal's logo). This moves the override back in front; it takes effect the
-- next time you log in. `omarchy-aum-logo reset` removes it, and it does nothing
-- once the override is gone.
do
  local dir = "@OVERRIDE_DIR@"
  local override = io.open(dir .. "/omarchy-show-logo")
  if override then
    override:close()
    local path = { dir }
    for entry in (os.getenv("PATH") or ""):gmatch("[^:]+") do
      if entry ~= dir then table.insert(path, entry) end
    end
    hl.env("PATH", table.concat(path, ":"))
  end
end
-- <<< omarchy-aum-logo <<<
