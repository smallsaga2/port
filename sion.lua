local gui = script.Parent.Parent.Parent
local plr = game.Players.LocalPlayer
local codes = {
    plr.PlayerGui.ScreenGui.Codes.code1.Value,
    plr.PlayerGui.ScreenGui.Codes.code2.Value,
    plr.PlayerGui.ScreenGui.Codes.code3.Value,
}

local message_correct = gui.codeCorrect
local message_incorrect = gui.codeIncorrect

-- FocusLost 이벤트
script.Parent.FocusLost:Connect(function()
    -- 입력값 가져오기
    local code_enter = plr.PlayerGui.ScreenGui.Frame.code_entering_box.Text
    local isCorrect = false

    -- 입력값과 코드 목록 비교
    for _, code in ipairs(codes) do
        if code_enter == code then
            isCorrect = true
            break
        end
    end

    -- 메시지 표시
    if isCorrect then
        message_correct.Visible = true
        wait(1)
        message_correct.Visible = false
    else
        message_incorrect.Visible = true
        wait(1)
        message_incorrect.Visible = false
    end
end)
