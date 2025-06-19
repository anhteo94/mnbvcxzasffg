repeat wait() until game:IsLoaded()

-- Thông báo khi tải script
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang tải menu Min Gaming đã chỉnh sửa...",
    Duration = 3
})

-- Tải bản Min Gaming gốc
local ok, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXoE"))()
end)
if not ok then warn("Lỗi tải GUI gốc:", err) return end

-- Sau khi GUI được tạo, tùy chỉnh ngay lập tức
spawn(function()
    wait(5)  -- đợi UI chính sẵn sàng
    local gui = game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui", true)
    if not gui then return end

    -- Thay tên header, button… chứa chữ "Min Gaming" thành "Phạm Nghĩa IOS"
    for _, v in ipairs(gui:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            if v.Text and v.Text:find("Min Gaming") then
                v.Text = v.Text:gsub("Min Gaming", "Phạm Nghĩa IOS")
            end
        end
    end

    -- Thay ảnh bất kỳ thành Obito
    for _, v in ipairs(gui:GetDescendants()) do
        if v:IsA("ImageLabel") or v:IsA("ImageButton") then
            v.Image = "https://i.imgur.com/JrgPMTO.jpeg"
        end
    end
end)
