local gui = script.Parent.Parent.Parent
local plr = game.Players.LocalPlayer
local code_enter = plr.PlayerGui.ScreenGui.Frame.code_entering_box.Text
local codes = {
	plr.PlayerGui.ScreenGui.Codes.code1.Value,
	plr.PlayerGui.ScreenGui.Codes.code2.Value,
	plr.PlayerGui.ScreenGui.Codes.code3.Value,
}
local codjinwuiyeobu = true

local message_correct = gui.codeCorrect
local message_incorrect = gui.codeIncorrect

script.parent.FocusLost:connect(function()
	if code_enter == codes[1] then
		codjinwuiyeobu = true
	elseif code_enter ~= codes[1] then
		codjinwuiyeobu = false
	end
end)

script.parent.FocusLost:connect(function()
	if codjinwuiyeobu == true then --코드 맞았을때
		message_correct.Visible = true
		wait(1)
		message_correct.Visible = false
		
	elseif codjinwuiyeobu == false then -- 코드 틀렸을 때
		message_incorrect.Visible = true
		wait(1)
		message_incorrect.Visible = false
	end
end)

print(codes[1])
