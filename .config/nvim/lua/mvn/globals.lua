function P(value)
  print(vim.inspect(value))
  return value;
end

function ReRequire(package_name)
  package.loaded[package_name] = nil
  return require(package_name)
end
