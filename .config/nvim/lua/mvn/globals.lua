function P(value)
  print(vim.inspect(value))
  return value;
end

function ReRequire(...)
  local function rerequire(package_name)
    package.loaded[package_name] = nil
    return require(package_name)
  end

  for _, p in ipairs({ ... }) do
    rerequire(p)
  end
end
