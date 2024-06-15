-------------- Subtitle Track Selection --------------

local External = true  --Toggle external subtitle

--script-message-to Subtitle_Track_Selection toggleExternal false
--or
--script-message toggleExternal true

function toggleExternal(value)
    if value == "true" then
        External = true
    else
        External = false
    end
end

mp.register_script_message("toggleExternal", toggleExternal)


local function select_sub()
    local track_list = mp.get_property_native("track-list")
    local selected_sid = ""

    for _, sub in ipairs(track_list) do
        if sub.type == "sub" then
            if sub.forced and sub.default then
                selected_sid = sub.id
                break
            end
		end
	end

	if selected_sid == "" then
		for _, sub in ipairs(track_list) do
			if sub.type == "sub" then
				if sub.forced and not sub.default then
					selected_sid = sub.id
					break
				end
			end
		end
	end
	
	if selected_sid == "" then
		for _, sub in ipairs(track_list) do
			if sub.type == "sub" then
				if sub.default and not sub.forced then
					selected_sid = sub.id
					break
				end
			end
		end
	end

	if selected_sid == "" and External then
		for _, sub in ipairs(track_list) do
			if sub.type == "sub" then
				if sub.external then
					selected_sid = sub.id
					break
				end
			end
		end
	end
	
	if selected_sid == "" then
		for _, sub in ipairs(track_list) do
			if sub.type == "sub" then
				selected_sid = "no"
				break
			end
		end
	end

    if selected_sid ~= "" then
        mp.set_property("sid", selected_sid)
    end
end

mp.register_event("file-loaded", select_sub)