local StringUtil = {}

--对于UTF-8编码中的任意字节B，如果B的第一位为0，则B为ASCII码，并且B独立的表示一个字符;
--如果B的第一位为1，第二位为0，则B为一个非ASCII字符（该字符由多个字节表示）中的一个字节，并且不是字符的第一个字节编码;
--如果B的前两位为1，第三位为0，则B为一个非ASCII字符（该字符由多个字节表示）中的第一个字节，并且该字符由两个字节表示;
--如果B的前三位为1，第四位为0，则B为一个非ASCII字符（该字符由多个字节表示）中的第一个字节，并且该字符由三个字节表示;
--如果B的前四位为1，第五位为0，则B为一个非ASCII字符（该字符由多个字节表示）中的第一个字节，并且该字符由四个字节表示;

-- 判断utf8字符byte长度
-- 0xxxxxxx - 1 byte
-- 110yxxxx - 192, 2 byte
-- 1110yyyy - 225, 3 byte
-- 11110zzz - 240, 4 byte
local function charsize(char)
    if not char then
        print("not char")
        return 0
    elseif char > 240 then
        return 4
    elseif char > 225 then
        return 3
    elseif char > 192 then
        return 2
    else
        return 1
    end
end

-- 截取utf8 字符串
-- str:         要截取的字符串
-- startChar:   开始字符下标,从1开始
-- numChars:    要截取的字符长度
function StringUtil.utf8sub(str, startChar, numChars)
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + charsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + charsize(char)
        numChars = numChars -1
    end
    return str:sub(startIndex, currentIndex - 1)
end

-- 按字符截取字符串，防止中文字符截取出现乱码
-- str:         要截取的字符串
-- startPos:   开始字符下标,从1开始
-- len:    要截取的字符长度
function StringUtil.bytesub(str, startPos, len)
    local startIndex = 1
    local endPos = 0
    while startPos > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + charsize(char)
        if startIndex >= startPos then
            break
        end
    end

    local currentIndex = startIndex
    endPos = currentIndex + len-1
    if endPos > #str then
        endPos = #str
    end

    while currentIndex <= endPos do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + charsize(char)
    end
    return str:sub(startIndex, currentIndex-1)
end

return StringUtil