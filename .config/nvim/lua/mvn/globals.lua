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

--function SPLIT(text, separator)
--  local strings = {}
--  local currentString = ""
--
--  local index = 0;
--  while (index < string.len(text))
--  do
--    print(index)
--    if text[index] == separator then
--      if string.len(currentString) > 0 then
--        table.insert(strings, currentString)
--        currentString = ""
--      end
--    else
--      print("CURRENT STRING: ", currentString, " TEXT[INDEX]: ", text)
--      currentString = currentString .. text[index]
--    end
--    index = index + 1
--  end
--
--  if string.len(currentString) > 0 then
--    table.insert(strings, currentString)
--  end
--
--  return strings
--end
