local map, m = {
    ["đặt tên"] = "local", ["hàm"] = "function",
    ["là"] = "=", ["nếu"] = "if", ["hoặc nếu"] = "elseif", ["thì"] = "then",
    ["trừ"] = "-", ["cộng"] = "+", ["nhân"] = "*", ["chia"] = "/",
    ["in ra"] = "print(",
    ["xong"] = ")", ["kết thúc"] = "end"
}, {}

function m.translate_codes(s)
    for name, origin in next, map do
        if s:match(name) then
            s = s:gsub(name, origin)
        end
    end return s
end

return m
