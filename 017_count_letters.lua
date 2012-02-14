-- work in progress
local ones  = {3, 3, 5, 4, 4, 3, 5, 5, 4, [0]=0}
local tens  = {0, 6, 6, 5, 5, 5, 7, 6, 6, [0]=0}
local teens = {6, 6, 8, 8, 7, 7, 9, 8, 8, [0]=3}

function digits(val)
  local g = string.gmatch(string.reverse(val),'%d')
  return tonumber(g()), tonumber(g() or 0),tonumber(g() or 0)
end

local total = 1 --'one thousand'
for i=1, 999 do
  local o, t, h = digits(i)
  local hc = 0
  local tc = 0
  local oc = 0

  if h > 0 then
    hc = ones[h]+7
    hc = hc + (t > 0 and 3 or 0)
  end

  if t == 1 then
    tc = teens[o]
  else
    tc = tens[t]
    oc = ones[o]
  end
  total = total + hc + tc + oc
  print(string.format('i:%d -- hc:%d tc:%d oc:%d',i, hc, tc, oc))
end

print(total)
