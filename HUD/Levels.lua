LevelsMain =
{
	{
		-- map directory, name, sketch, card cond, card index, min. level
		{ "C1L4_Cemetery", Languages.Texts[283], "sketch_cmentarz", Languages.Texts[396], 6, 0, nil },
		{ "C1L2_Atrium_Complex", Languages.Texts[284], "sketch_atrium", Languages.Texts[397], 8, 0, nil },
		{ "C1L3_Catacombs", Languages.Texts[285], "sketch_katakumby", Languages.Texts[398], 14, 0, nil },
		{ "C1L1_Cathedral", Languages.Texts[286], "sketch_chaos", Languages.Texts[399], 11, 0, nil },
		{ "C1L5_Enclave", Languages.Texts[287], "sketch_enclave", Languages.Texts[400], 17, 0, "end_of_chapter_1.bik" },
	},

	{
		-- map directory, name, sketch
		{ "C2L2_Prison", Languages.Texts[288], "sketch_prison", Languages.Texts[401], 19, 2, nil },
		{ "C2L3_Opera", Languages.Texts[289], "sketch_opera", Languages.Texts[402], 1, 0, nil },
		{ "C2L4_Asylum", Languages.Texts[290], "sketch_asylum", Languages.Texts[403], 3, 0, nil },
		{ "C2L1_Bridge", Languages.Texts[291], "sketch_most", Languages.Texts[404], 16, 0, nil },
		{ "C2L5_Town", Languages.Texts[292], "sketch_town", Languages.Texts[405], 9, 0, nil },
		{ "C2L6_Swamp", Languages.Texts[293], "sketch_swamp_arena", Languages.Texts[406], 2, 0, "end_of_chapter_2.bik" },
	},

	{
		-- map directory, name, sketch
		{ "C3L1_Train_Station", Languages.Texts[294], "sketch_dworzec", Languages.Texts[407], 13, 0, nil },
		{ "C3L2_Factory", Languages.Texts[295], "sketch_fabryka", Languages.Texts[408], 21, 1, nil },
		{ "C3L3_Military_Base", Languages.Texts[296], "sketch_baza", Languages.Texts[409], 20, 0, nil },
		{ "C3L5_Ruins", Languages.Texts[297], "sketch_ruins", Languages.Texts[410], 7, 0, "end_of_chapter_3.bik" },
	},

	{
		-- map directory, name, sketch
		{ "C3L4_Castle", Languages.Texts[298], "sketch_zamek", Languages.Texts[411], 4, 0, nil },
		{ "C4L1_Oriental_Castle", Languages.Texts[299], "sketch_arabski", Languages.Texts[412], 18, 0, nil },
		{ "C4L2_Babel", Languages.Texts[300], "sketch_babel", Languages.Texts[413], 12, 0, nil },
		{ "C3L6_Forest", Languages.Texts[301], "sketch_forest", Languages.Texts[414], 23, 3, nil },
		{ "C4L4_Alastor", Languages.Texts[302], "sketch_alastor", Languages.Texts[415], 10, 0, "end_of_chapter_4.bik" },
	},

	{
		-- map directory, name, sketch
		{ "C5L1_City_On_Water", Languages.Texts[303], "sketch_wenecja", Languages.Texts[416], 24, 0, nil },
		{ "C5L2_Docks", Languages.Texts[304], "sketch_doki", Languages.Texts[417], 5, 0, nil },
		{ "C5L3_Monastery", Languages.Texts[305], "sketch_opactwo", Languages.Texts[418], 15, 0, nil },
		{ "C5L4_Hell", Languages.Texts[306], "sketch_pieklo", Languages.Texts[419], 22, 0, "end_of_chapter_5.bik" },
	},
	--[[
	-- Setup for demo

	{
		{ "", "", "", "", 0, 0, nil },
	},

	{
		{ "", "", "", "", 0, 0, nil },
	},

	{
		{ "C3L3_Military_Base", Languages.Texts[296], "sketch_baza", Languages.Texts[409], 20, 0, nil },
	},

	{
		{ "", "", "", "", 0, 0, nil },
	},

	{
		{ "", "", "", "", 0, 0, nil },
		--		{ "C5L1_City_On_Water", Languages.Texts[303], "sketch_wenecja", Languages.Texts[416], 24, 0, nil },
	},

	{
		--		{ "C2L5_Town", Languages.Texts[292], "sketch_town", Languages.Texts[405] },
		--		{ "", "", "", "" },
		--		{ "C4L1_Oriental_Castle", Languages.Texts[299], "sketch_arabski", Languages.Texts[412] },
		{ "", "", "", "" },
		--		{ "C3L5_Ruins", Languages.Texts[297], "sketch_ruins", Languages.Texts[410] },
	},
	]]--
}


LevelsAddOn =
{
	{
		-- map directory, name, sketch, card cond, card index, min. level
		{ "C6L1_Orphanage", Languages.Texts[816], "sketch_orphanage", Languages.Texts[812], 25, 0, nil },
		{ "C6L2_LoonyPark", Languages.Texts[817], "sketch_loony", Languages.Texts[806], 26, 0, nil },
		{ "C6L3_Lab", Languages.Texts[818], "sketch_lab", Languages.Texts[834], 27, 0, nil },
		{ "C6L4_Pentagon", Languages.Texts[822], "sketch_pentagon", Languages.Texts[814], 31, 2, nil },
		{ "C6L4_City", Languages.Texts[819], "sketch_city", Languages.Texts[811], 28, 0, nil },
		{ "C6L5_Leningrad", Languages.Texts[820], "sketch_leningrad", Languages.Texts[808], 33, 0, nil },
		{ "C6L6_Colloseum", Languages.Texts[821], "sketch_colloseum", Languages.Texts[809], 29, 0, nil },
		{ "C6L8_Mines", Languages.Texts[823], "sketch_underworld", Languages.Texts[807], 34, 0, nil },
		{ "C6L9_mine", Languages.Texts[824], "sketch_stonepit", Languages.Texts[810], 32, 0, nil },
		{ "C6L10_Shadowland", Languages.Texts[825], "sketch_shadowland", Languages.Texts[815], 30, 0, "booh_outro.bik" },
	},
}


Levels = LevelsMain


function Levels_FillMap()
	if not Game then return end

	if Game.AddOn then
		Levels = LevelsAddOn
	else
		Levels = LevelsMain
	end

	local current_set = false

	for i=1,table.getn(Levels) do
		for j=1,table.getn(Levels[i]) do
			if (i < 5 or Game.Difficulty < Difficulties.Trauma) and Levels[i][j][1] ~= "" then
				local dir = Levels[i][j][1]
				local diff = Levels[i][j][6]

				local status = 0 -- unavailable

				if Game.LevelsStats[Levels[i][j][1]] == nil then
					Game:MakeEmptyLevelStats(Levels[i][j][1])
				end

				if Game.LevelsStats[Levels[i][j][1]].Finished == true then
					status = 2 -- finished
				end

				if Game.Difficulty < diff then
					status = 3 -- not available
					Game.LevelsStats[Levels[i][j][1]].Finished = true
				end

				if status == 0 then
					if (i == 1 and j == 1) then
						status = 1
					elseif j > 1 and Game.LevelsStats[Levels[i][j-1][1]] and Game.LevelsStats[Levels[i][j-1][1]].Finished == true then
						status = 1
					elseif i > 1 and Game.LevelsStats[Levels[i-1][table.getn(Levels[i-1])][1]] and Game.LevelsStats[Levels[i-1][table.getn(Levels[i-1])][1]].Finished == true then
						status = 1
					end
				end

				--				if Game.AddOn then
				--					status = 2
				--				end

				if current_set then
					status = 0
				elseif status == 1 then
					current_set = true
				end

				-- DEMO !!!
				--				status = 1

				if status == 1 or status == 2 then
					PMENU.AddLevelToMap( i, Levels[i][j][1], Levels[i][j][2], "HUD/Map/"..Levels[i][j][3], Levels[i][j][4], Levels[i][j][5], status )
				else
					if Cfg.Language ~= "polish" then
						PMENU.AddLevelToMap( i, Levels[i][j][1], TXT.SPStats.Locked, "HUD/Map/sketch_question", Levels[i][j][4], 0, status )
					else
						PMENU.AddLevelToMap( i, Levels[i][j][1], "Zablokowany", "HUD/Map/sketch_question", Levels[i][j][4], 0, status )
					end
				end
			end
		end
	end
end

function Levels_GetNextLevel(name)
	if name == nil then return nil end

	if not Game then return end

	if Game.AddOn then
		Levels = LevelsAddOn
	else
		Levels = LevelsMain
	end

	local ret = false
	for i=1,table.getn(Levels) do
		for j=1,table.getn(Levels[i]) do
			if ret == true and Game.Difficulty >= Levels[i][j][6] then
				return Levels[i][j][1]
			end
			if Levels[i][j][1] == name then
				ret = true
			end
		end
	end

	if ret then return Levels[1][1][1] end

	--	if ret then return Levels[5][1][1] end
end

function Levels_GetLevelName(dir)
	if dir == nil then return nil end

	if not Game then return end

	if Game.AddOn then
		Levels = LevelsAddOn
	else
		Levels = LevelsMain
	end

	for i=1,table.getn(Levels) do
		for j=1,table.getn(Levels[i]) do
			if Levels[i][j][1] == dir then
				if Levels == LevelsMain then
					return "C"..string.format("%02d",i).."E"..string.format("%02d",j).." - "..Levels[i][j][2]
				else
					return "BooH E"..string.format("%02d",j).." - "..Levels[i][j][2]
				end
			end
		end
	end
end

function Levels_GetLevelByDir(dir)
	if dir == nil then return nil, nil end

	for i=1,table.getn(LevelsAddOn) do
		for j=1,table.getn(LevelsAddOn[i]) do
			if LevelsAddOn[i][j][1] == dir then
				return j,i
			end
		end
	end

	for i=1,table.getn(LevelsMain) do
		for j=1,table.getn(LevelsMain[i]) do
			if LevelsMain[i][j][1] == dir then
				return j,i
			end
		end
	end
end

function Levels_GetSketchByDir(dir)
	if dir == nil then return nil end

	for i=1,table.getn(LevelsAddOn) do
		for j=1,table.getn(LevelsAddOn[i]) do
			if LevelsAddOn[i][j][1] == dir then
				return "HUD/Map/"..LevelsAddOn[i][j][3]
			end
		end
	end

	for i=1,table.getn(LevelsMain) do
		for j=1,table.getn(LevelsMain[i]) do
			if LevelsMain[i][j][1] == dir then
				return "HUD/Map/"..LevelsMain[i][j][3]
			end
		end
	end

	if dir == "C2L5_Demo" then
		return "HUD/Map/sketch_town"
	elseif dir == "C5L1_Demo" then
		return "HUD/Map/sketch_wenecja"
	elseif dir == "C5L4_Demo" then
		return "HUD/Map/sketch_pieklo"
	elseif dir == "C6L0_PCFHQ" then
		return "HUD/Map/sketch_mp"
	end

	local ldir = string.lower(dir)
	if(string.find(ldir,string.lower("ctf_chaos-a")))then return "../PKPlusData/Maps/ctf_chaos-a" end
	if(string.find(ldir,string.lower("ctf_chaos-b")))then return "../PKPlusData/Maps/ctf_chaos-b" end
	if(string.find(ldir,string.lower("ctf_chaos-c")))then return "../PKPlusData/Maps/ctf_chaos-c" end
	if(string.find(ldir,string.lower("ctf_chaos")))then return "../PKPlusData/Maps/ctf_chaos" end
	if(string.find(ldir,string.lower("ctf_forbidden-a")))then return "../PKPlusData/Maps/ctf_forbidden-a" end
	if(string.find(ldir,string.lower("ctf_forbidden-b")))then return "../PKPlusData/Maps/ctf_forbidden-b" end
	if(string.find(ldir,string.lower("ctf_forbidden-c")))then return "../PKPlusData/Maps/ctf_forbidden-c" end
	if(string.find(ldir,string.lower("ctf_forbidden")))then return "../PKPlusData/Maps/ctf_forbidden" end
	if(string.find(ldir,string.lower("ctf_trainstation-a")))then return "../PKPlusData/Maps/ctf_trainstation-a" end
	if(string.find(ldir,string.lower("ctf_trainstation-b")))then return "../PKPlusData/Maps/ctf_trainstation-b" end
	if(string.find(ldir,string.lower("ctf_trainstation-c")))then return "../PKPlusData/Maps/ctf_trainstation-c" end
	if(string.find(ldir,string.lower("ctf_trainstation")))then return "../PKPlusData/Maps/ctf_trainstation" end
	if(string.find(ldir,string.lower("dmpcf_tower-a")))then return "../PKPlusData/Maps/dmpcf_tower-a" end
	if(string.find(ldir,string.lower("dmpcf_tower-b")))then return "../PKPlusData/Maps/dmpcf_tower-b" end
	if(string.find(ldir,string.lower("dmpcf_tower-c")))then return "../PKPlusData/Maps/dmpcf_tower-c" end
	if(string.find(ldir,string.lower("dmpcf_tower")))then return "../PKPlusData/Maps/dmpcf_tower" end
	if(string.find(ldir,string.lower("dmpcf_warehouse-a")))then return "../PKPlusData/Maps/dmpcf_warehouse-a" end
	if(string.find(ldir,string.lower("dmpcf_warehouse-b")))then return "../PKPlusData/Maps/dmpcf_warehouse-b" end
	if(string.find(ldir,string.lower("dmpcf_warehouse-c")))then return "../PKPlusData/Maps/dmpcf_warehouse-c" end
	if(string.find(ldir,string.lower("dmpcf_warehouse")))then return "../PKPlusData/Maps/dmpcf_warehouse" end
	if(string.find(ldir,string.lower("dm_1v1_meatless-a")))then return "../PKPlusData/Maps/dm_1v1_meatless-a" end
	if(string.find(ldir,string.lower("dm_1v1_meatless-b")))then return "../PKPlusData/Maps/dm_1v1_meatless-b" end
	if(string.find(ldir,string.lower("dm_1v1_meatless-c")))then return "../PKPlusData/Maps/dm_1v1_meatless-c" end
	if(string.find(ldir,string.lower("dm_1v1_meatless")))then return "../PKPlusData/Maps/dm_1v1_meatless" end
	if(string.find(ldir,string.lower("dm_5quid01-a")))then return "../PKPlusData/Maps/dm_5quid01-a" end
	if(string.find(ldir,string.lower("dm_5quid01-b")))then return "../PKPlusData/Maps/dm_5quid01-b" end
	if(string.find(ldir,string.lower("dm_5quid01-c")))then return "../PKPlusData/Maps/dm_5quid01-c" end
	if(string.find(ldir,string.lower("dm_5quid01")))then return "../PKPlusData/Maps/dm_5quid01" end
	if(string.find(ldir,string.lower("dm_absinthe-a")))then return "../PKPlusData/Maps/dm_absinthe-a" end
	if(string.find(ldir,string.lower("dm_absinthe-b")))then return "../PKPlusData/Maps/dm_absinthe-b" end
	if(string.find(ldir,string.lower("dm_absinthe-c")))then return "../PKPlusData/Maps/dm_absinthe-c" end
	if(string.find(ldir,string.lower("dm_absinthe")))then return "../PKPlusData/Maps/dm_absinthe" end
	if(string.find(ldir,string.lower("dm_ballistic-a")))then return "../PKPlusData/Maps/dm_ballistic-a" end
	if(string.find(ldir,string.lower("dm_ballistic-b")))then return "../PKPlusData/Maps/dm_ballistic-b" end
	if(string.find(ldir,string.lower("dm_ballistic-c")))then return "../PKPlusData/Maps/dm_ballistic-c" end
	if(string.find(ldir,string.lower("dm_ballistic")))then return "../PKPlusData/Maps/dm_ballistic" end
	if(string.find(ldir,string.lower("dm_cursed-a")))then return "../PKPlusData/Maps/dm_cursed-a" end
	if(string.find(ldir,string.lower("dm_cursed-b")))then return "../PKPlusData/Maps/dm_cursed-b" end
	if(string.find(ldir,string.lower("dm_cursed-c")))then return "../PKPlusData/Maps/dm_cursed-c" end
	if(string.find(ldir,string.lower("dm_cursed")))then return "../PKPlusData/Maps/dm_cursed" end
	if(string.find(ldir,string.lower("dm_exmortis-a")))then return "../PKPlusData/Maps/dm_exmortis-a" end
	if(string.find(ldir,string.lower("dm_exmortis-b")))then return "../PKPlusData/Maps/dm_exmortis-b" end
	if(string.find(ldir,string.lower("dm_exmortis-c")))then return "../PKPlusData/Maps/dm_exmortis-c" end
	if(string.find(ldir,string.lower("dm_exmortis")))then return "../PKPlusData/Maps/dm_exmortis" end
	if(string.find(ldir,string.lower("dm_factory-a")))then return "../PKPlusData/Maps/dm_factory-a" end
	if(string.find(ldir,string.lower("dm_factory-b")))then return "../PKPlusData/Maps/dm_factory-b" end
	if(string.find(ldir,string.lower("dm_factory-c")))then return "../PKPlusData/Maps/dm_factory-c" end
	if(string.find(ldir,string.lower("dm_factory")))then return "../PKPlusData/Maps/dm_factory" end
	if(string.find(ldir,string.lower("dm_fallen1-a")))then return "../PKPlusData/Maps/dm_fallen1-a" end
	if(string.find(ldir,string.lower("dm_fallen1-b")))then return "../PKPlusData/Maps/dm_fallen1-b" end
	if(string.find(ldir,string.lower("dm_fallen1-c")))then return "../PKPlusData/Maps/dm_fallen1-c" end
	if(string.find(ldir,string.lower("dm_fallen1")))then return "../PKPlusData/Maps/dm_fallen1" end
	if(string.find(ldir,string.lower("dm_fallen2-a")))then return "../PKPlusData/Maps/dm_fallen2-a" end
	if(string.find(ldir,string.lower("dm_fallen2-b")))then return "../PKPlusData/Maps/dm_fallen2-b" end
	if(string.find(ldir,string.lower("dm_fallen2-c")))then return "../PKPlusData/Maps/dm_fallen2-c" end
	if(string.find(ldir,string.lower("dm_fallen2")))then return "../PKPlusData/Maps/dm_fallen2" end
	if(string.find(ldir,string.lower("dm_fallen2te-a")))then return "../PKPlusData/Maps/dm_fallen2te-a" end
	if(string.find(ldir,string.lower("dm_fallen2te-b")))then return "../PKPlusData/Maps/dm_fallen2te-b" end
	if(string.find(ldir,string.lower("dm_fallen2te-c")))then return "../PKPlusData/Maps/dm_fallen2te-c" end
	if(string.find(ldir,string.lower("dm_fallen2te")))then return "../PKPlusData/Maps/dm_fallen2te" end
	if(string.find(ldir,string.lower("dm_fragenstein-a")))then return "../PKPlusData/Maps/dm_fragenstein-a" end
	if(string.find(ldir,string.lower("dm_fragenstein-b")))then return "../PKPlusData/Maps/dm_fragenstein-b" end
	if(string.find(ldir,string.lower("dm_fragenstein-c")))then return "../PKPlusData/Maps/dm_fragenstein-c" end
	if(string.find(ldir,string.lower("dm_fragenstein")))then return "../PKPlusData/Maps/dm_fragenstein" end
	if(string.find(ldir,string.lower("dm_illuminati-a")))then return "../PKPlusData/Maps/dm_illuminati-a" end
	if(string.find(ldir,string.lower("dm_illuminati-b")))then return "../PKPlusData/Maps/dm_illuminati-b" end
	if(string.find(ldir,string.lower("dm_illuminati-c")))then return "../PKPlusData/Maps/dm_illuminati-c" end
	if(string.find(ldir,string.lower("dm_illuminati")))then return "../PKPlusData/Maps/dm_illuminati" end
	if(string.find(ldir,string.lower("dm_mine-a")))then return "../PKPlusData/Maps/dm_mine-a" end
	if(string.find(ldir,string.lower("dm_mine-b")))then return "../PKPlusData/Maps/dm_mine-b" end
	if(string.find(ldir,string.lower("dm_mine-c")))then return "../PKPlusData/Maps/dm_mine-c" end
	if(string.find(ldir,string.lower("dm_mine")))then return "../PKPlusData/Maps/dm_mine" end
	if(string.find(ldir,string.lower("dm_psycho-a")))then return "../PKPlusData/Maps/dm_psycho-a" end
	if(string.find(ldir,string.lower("dm_psycho-b")))then return "../PKPlusData/Maps/dm_psycho-b" end
	if(string.find(ldir,string.lower("dm_psycho-c")))then return "../PKPlusData/Maps/dm_psycho-c" end
	if(string.find(ldir,string.lower("dm_psycho")))then return "../PKPlusData/Maps/dm_psycho" end
	if(string.find(ldir,string.lower("dm_sacred-a")))then return "../PKPlusData/Maps/dm_sacred-a" end
	if(string.find(ldir,string.lower("dm_sacred-b")))then return "../PKPlusData/Maps/dm_sacred-b" end
	if(string.find(ldir,string.lower("dm_sacred-c")))then return "../PKPlusData/Maps/dm_sacred-c" end
	if(string.find(ldir,string.lower("dm_sacred")))then return "../PKPlusData/Maps/dm_sacred" end
	if(string.find(ldir,string.lower("dm_trainstation-a")))then return "../PKPlusData/Maps/dm_trainstation-a" end
	if(string.find(ldir,string.lower("dm_trainstation-b")))then return "../PKPlusData/Maps/dm_trainstation-b" end
	if(string.find(ldir,string.lower("dm_trainstation-c")))then return "../PKPlusData/Maps/dm_trainstation-c" end
	if(string.find(ldir,string.lower("dm_trainstation")))then return "../PKPlusData/Maps/dm_trainstation" end
	if(string.find(ldir,string.lower("dm_unseen-a")))then return "../PKPlusData/Maps/dm_unseen-a" end
	if(string.find(ldir,string.lower("dm_unseen-b")))then return "../PKPlusData/Maps/dm_unseen-b" end
	if(string.find(ldir,string.lower("dm_unseen-c")))then return "../PKPlusData/Maps/dm_unseen-c" end
	if(string.find(ldir,string.lower("dm_unseen")))then return "../PKPlusData/Maps/dm_unseen" end
	if(string.find(ldir,string.lower("C1L1_Cathedral-a")))then return "../PKPlusData/Maps/C1L1_Cathedral-a" end
	if(string.find(ldir,string.lower("C1L1_Cathedral-b")))then return "../PKPlusData/Maps/C1L1_Cathedral-b" end
	if(string.find(ldir,string.lower("C1L1_Cathedral-c")))then return "../PKPlusData/Maps/C1L1_Cathedral-c" end
	if(string.find(ldir,string.lower("C1L1_Cathedral")))then return "../PKPlusData/Maps/C1L1_Cathedral" end
	if(string.find(ldir,string.lower("C1L2_Atrium_Complex-a")))then return "../PKPlusData/Maps/C1L2_Atrium_Complex-a" end
	if(string.find(ldir,string.lower("C1L2_Atrium_Complex-b")))then return "../PKPlusData/Maps/C1L2_Atrium_Complex-b" end
	if(string.find(ldir,string.lower("C1L2_Atrium_Complex-c")))then return "../PKPlusData/Maps/C1L2_Atrium_Complex-c" end
	if(string.find(ldir,string.lower("C1L2_Atrium_Complex")))then return "../PKPlusData/Maps/C1L2_Atrium_Complex" end
	if(string.find(ldir,string.lower("C1L3_Catacombs-a")))then return "../PKPlusData/Maps/C1L3_Catacombs-a" end
	if(string.find(ldir,string.lower("C1L3_Catacombs-b")))then return "../PKPlusData/Maps/C1L3_Catacombs-b" end
	if(string.find(ldir,string.lower("C1L3_Catacombs-c")))then return "../PKPlusData/Maps/C1L3_Catacombs-c" end
	if(string.find(ldir,string.lower("C1L3_Catacombs")))then return "../PKPlusData/Maps/C1L3_Catacombs" end
	if(string.find(ldir,string.lower("C1L4_Cemetery-a")))then return "../PKPlusData/Maps/C1L4_Cemetery-a" end
	if(string.find(ldir,string.lower("C1L4_Cemetery-b")))then return "../PKPlusData/Maps/C1L4_Cemetery-b" end
	if(string.find(ldir,string.lower("C1L4_Cemetery-c")))then return "../PKPlusData/Maps/C1L4_Cemetery-c" end
	if(string.find(ldir,string.lower("C1L4_Cemetery")))then return "../PKPlusData/Maps/C1L4_Cemetery" end
	if(string.find(ldir,string.lower("C1L5_Enclave-a")))then return "../PKPlusData/Maps/C1L5_Enclave-a" end
	if(string.find(ldir,string.lower("C1L5_Enclave-b")))then return "../PKPlusData/Maps/C1L5_Enclave-b" end
	if(string.find(ldir,string.lower("C1L5_Enclave-c")))then return "../PKPlusData/Maps/C1L5_Enclave-c" end
	if(string.find(ldir,string.lower("C1L5_Enclave")))then return "../PKPlusData/Maps/C1L5_Enclave" end
	if(string.find(ldir,string.lower("C2L1_Bridge-a")))then return "../PKPlusData/Maps/C2L1_Bridge-a" end
	if(string.find(ldir,string.lower("C2L1_Bridge-b")))then return "../PKPlusData/Maps/C2L1_Bridge-b" end
	if(string.find(ldir,string.lower("C2L1_Bridge-c")))then return "../PKPlusData/Maps/C2L1_Bridge-c" end
	if(string.find(ldir,string.lower("C2L1_Bridge")))then return "../PKPlusData/Maps/C2L1_Bridge" end
	if(string.find(ldir,string.lower("C2L2_Prison-a")))then return "../PKPlusData/Maps/C2L2_Prison-a" end
	if(string.find(ldir,string.lower("C2L2_Prison-b")))then return "../PKPlusData/Maps/C2L2_Prison-b" end
	if(string.find(ldir,string.lower("C2L2_Prison-c")))then return "../PKPlusData/Maps/C2L2_Prison-c" end
	if(string.find(ldir,string.lower("C2L2_Prison")))then return "../PKPlusData/Maps/C2L2_Prison" end
	if(string.find(ldir,string.lower("C2L3_Opera-a")))then return "../PKPlusData/Maps/C2L3_Opera-a" end
	if(string.find(ldir,string.lower("C2L3_Opera-b")))then return "../PKPlusData/Maps/C2L3_Opera-b" end
	if(string.find(ldir,string.lower("C2L3_Opera-c")))then return "../PKPlusData/Maps/C2L3_Opera-c" end
	if(string.find(ldir,string.lower("C2L3_Opera")))then return "../PKPlusData/Maps/C2L3_Opera" end
	if(string.find(ldir,string.lower("C2L4_Asylum-a")))then return "../PKPlusData/Maps/C2L4_Asylum-a" end
	if(string.find(ldir,string.lower("C2L4_Asylum-b")))then return "../PKPlusData/Maps/C2L4_Asylum-b" end
	if(string.find(ldir,string.lower("C2L4_Asylum-c")))then return "../PKPlusData/Maps/C2L4_Asylum-c" end
	if(string.find(ldir,string.lower("C2L4_Asylum")))then return "../PKPlusData/Maps/C2L4_Asylum" end
	if(string.find(ldir,string.lower("C2L5_Town-a")))then return "../PKPlusData/Maps/C2L5_Town-a" end
	if(string.find(ldir,string.lower("C2L5_Town-b")))then return "../PKPlusData/Maps/C2L5_Town-b" end
	if(string.find(ldir,string.lower("C2L5_Town-c")))then return "../PKPlusData/Maps/C2L5_Town-c" end
	if(string.find(ldir,string.lower("C2L5_Town")))then return "../PKPlusData/Maps/C2L5_Town" end
	if(string.find(ldir,string.lower("C2L6_Swamp-a")))then return "../PKPlusData/Maps/C2L6_Swamp-a" end
	if(string.find(ldir,string.lower("C2L6_Swamp-b")))then return "../PKPlusData/Maps/C2L6_Swamp-b" end
	if(string.find(ldir,string.lower("C2L6_Swamp-c")))then return "../PKPlusData/Maps/C2L6_Swamp-c" end
	if(string.find(ldir,string.lower("C2L6_Swamp")))then return "../PKPlusData/Maps/C2L6_Swamp" end
	if(string.find(ldir,string.lower("C3L1_Train_Station-a")))then return "../PKPlusData/Maps/C3L1_Train_Station-a" end
	if(string.find(ldir,string.lower("C3L1_Train_Station-b")))then return "../PKPlusData/Maps/C3L1_Train_Station-b" end
	if(string.find(ldir,string.lower("C3L1_Train_Station-c")))then return "../PKPlusData/Maps/C3L1_Train_Station-c" end
	if(string.find(ldir,string.lower("C3L1_Train_Station")))then return "../PKPlusData/Maps/C3L1_Train_Station" end
	if(string.find(ldir,string.lower("C3L2_Factory-a")))then return "HUD/Map/sketch_fabryka-a" end
	if(string.find(ldir,string.lower("C3L2_Factory-b")))then return "/HUD/Map/sketch_fabryka-b" end
	if(string.find(ldir,string.lower("C3L2_Factory-c")))then return "HUD/Map/sketch_fabryka-c" end
	if(string.find(ldir,string.lower("C3L2_Factory")))then return "HUD/Map/sketch_fabryka" end
	if(string.find(ldir,string.lower("C3L3_Military_Base-a")))then return "HUD/Map/sketch_baza-a" end
	if(string.find(ldir,string.lower("C3L3_Military_Base-b")))then return "/HUD/Map/sketch_baza-b" end
	if(string.find(ldir,string.lower("C3L3_Military_Base-c")))then return "HUD/Map/sketch_baza-c" end
	if(string.find(ldir,string.lower("C3L3_Military_Base")))then return "HUD/Map/sketch_baza" end
	if(string.find(ldir,string.lower("C3L4_Castle-a")))then return "HUD/Map/sketch_zamek-a" end
	if(string.find(ldir,string.lower("C3L4_Castle-b")))then return "/HUD/Map/sketch_zamek-b" end
	if(string.find(ldir,string.lower("C3L4_Castle-c")))then return "HUD/Map/sketch_zamek-c" end
	if(string.find(ldir,string.lower("C3L4_Castle")))then return "HUD/Map/sketch_zamek" end
	if(string.find(ldir,string.lower("C3L5_Ruins-a")))then return "HUD/Map/sketch_ruins-a" end
	if(string.find(ldir,string.lower("C3L5_Ruins-b")))then return "/HUD/Map/sketch_ruins-b" end
	if(string.find(ldir,string.lower("C3L5_Ruins-c")))then return "HUD/Map/sketch_ruins-c" end
	if(string.find(ldir,string.lower("C3L5_Ruins")))then return "HUD/Map/sketch_ruins" end
	if(string.find(ldir,string.lower("C3L6_Forest-a")))then return "HUD/Map/sketch_forest-a" end
	if(string.find(ldir,string.lower("C3L6_Forest-b")))then return "/HUD/Map/sketch_forest-b" end
	if(string.find(ldir,string.lower("C3L6_Forest-c")))then return "HUD/Map/sketch_forest-c" end
	if(string.find(ldir,string.lower("C3L6_Forest")))then return "HUD/Map/sketch_forest" end
	if(string.find(ldir,string.lower("C4L1_Oriental_Castle-a")))then return "HUD/Map/sketch_arabski-a" end
	if(string.find(ldir,string.lower("C4L1_Oriental_Castle-b")))then return "/HUD/Map/sketch_arabski-b" end
	if(string.find(ldir,string.lower("C4L1_Oriental_Castle-c")))then return "HUD/Map/sketch_arabski-c" end
	if(string.find(ldir,string.lower("C4L1_Oriental_Castle")))then return "HUD/Map/sketch_arabski" end
	if(string.find(ldir,string.lower("C4L2_Babel-a")))then return "HUD/Map/sketch_babel-a" end
	if(string.find(ldir,string.lower("C4L2_Babel-b")))then return "/HUD/Map/sketch_babel-b" end
	if(string.find(ldir,string.lower("C4L2_Babel-c")))then return "HUD/Map/sketch_babel-c" end
	if(string.find(ldir,string.lower("C4L2_Babel")))then return "HUD/Map/sketch_babel" end
	if(string.find(ldir,string.lower("C4L4_Alastor-a")))then return "HUD/Map/sketch_alastor-a" end
	if(string.find(ldir,string.lower("C4L4_Alastor-b")))then return "/HUD/Map/sketch_alastor-b" end
	if(string.find(ldir,string.lower("C4L4_Alastor-c")))then return "HUD/Map/sketch_alastor-c" end
	if(string.find(ldir,string.lower("C4L4_Alastor")))then return "HUD/Map/sketch_alastor" end
	if(string.find(ldir,string.lower("C5L1_Benchmark-a")))then return "HUD/Map/sketch_wenecja-a" end
	if(string.find(ldir,string.lower("C5L1_Benchmark-b")))then return "/HUD/Map/sketch_wenecja-b" end
	if(string.find(ldir,string.lower("C5L1_Benchmark-c")))then return "HUD/Map/sketch_wenecja-c" end
	if(string.find(ldir,string.lower("C5L1_Benchmark")))then return "HUD/Map/sketch_wenecja" end
	if(string.find(ldir,string.lower("C5L1_City_On_Water-a")))then return "HUD/Map/sketch_wenecja-a" end
	if(string.find(ldir,string.lower("C5L1_City_On_Water-b")))then return "/HUD/Map/sketch_wenecja-b" end
	if(string.find(ldir,string.lower("C5L1_City_On_Water-c")))then return "HUD/Map/sketch_wenecja-c" end
	if(string.find(ldir,string.lower("C5L1_City_On_Water")))then return "HUD/Map/sketch_wenecja" end
	if(string.find(ldir,string.lower("C5L2_Benchmark-a")))then return "HUD/Map/sketch_doki-a" end
	if(string.find(ldir,string.lower("C5L2_Benchmark-b")))then return "/HUD/Map/sketch_doki-b" end
	if(string.find(ldir,string.lower("C5L2_Benchmark-c")))then return "HUD/Map/sketch_doki-c" end
	if(string.find(ldir,string.lower("C5L2_Benchmark")))then return "HUD/Map/sketch_doki" end
	if(string.find(ldir,string.lower("C5L2_Docks-a")))then return "HUD/Map/sketch_doki-a" end
	if(string.find(ldir,string.lower("C5L2_Docks-b")))then return "/HUD/Map/sketch_doki-b" end
	if(string.find(ldir,string.lower("C5L2_Docks-c")))then return "HUD/Map/sketch_doki-c" end
	if(string.find(ldir,string.lower("C5L2_Docks")))then return "HUD/Map/sketch_doki" end
	if(string.find(ldir,string.lower("C5L3_Monastery-a")))then return "HUD/Map/sketch_opactwo-a" end
	if(string.find(ldir,string.lower("C5L3_Monastery-b")))then return "/HUD/Map/sketch_opactwo-b" end
	if(string.find(ldir,string.lower("C5L3_Monastery-c")))then return "HUD/Map/sketch_opactwo-c" end
	if(string.find(ldir,string.lower("C5L3_Monastery")))then return "HUD/Map/sketch_opactwo" end
	if(string.find(ldir,string.lower("C5L4_Hell-a")))then return "HUD/Map/sketch_pieklo-a" end
	if(string.find(ldir,string.lower("C5L4_Hell-b")))then return "/HUD/Map/sketch_pieklo-b" end
	if(string.find(ldir,string.lower("C5L4_Hell-c")))then return "HUD/Map/sketch_pieklo-c" end
	if(string.find(ldir,string.lower("C5L4_Hell")))then return "HUD/Map/sketch_pieklo" end
	if(string.find(ldir,string.lower("C6L0_PCFHQ-a")))then return "HUD/Map/sketch_question-a" end
	if(string.find(ldir,string.lower("C6L0_PCFHQ-b")))then return "/HUD/Map/sketch_question-b" end
	if(string.find(ldir,string.lower("C6L0_PCFHQ-c")))then return "HUD/Map/sketch_question-c" end
	if(string.find(ldir,string.lower("C6L0_PCFHQ")))then return "HUD/Map/sketch_question" end
	if(string.find(ldir,string.lower("C6L1_Orphanage-a")))then return "HUD/Map/sketch_orphanage-a" end
	if(string.find(ldir,string.lower("C6L1_Orphanage-b")))then return "/HUD/Map/sketch_orphanage-b" end
	if(string.find(ldir,string.lower("C6L1_Orphanage-c")))then return "HUD/Map/sketch_orphanage-c" end
	if(string.find(ldir,string.lower("C6L1_Orphanage")))then return "HUD/Map/sketch_orphanage" end
	if(string.find(ldir,string.lower("C6L2_LoonyPark-a")))then return "HUD/Map/sketch_loony-a" end
	if(string.find(ldir,string.lower("C6L2_LoonyPark-b")))then return "/HUD/Map/sketch_loony-b" end
	if(string.find(ldir,string.lower("C6L2_LoonyPark-c")))then return "HUD/Map/sketch_loony-c" end
	if(string.find(ldir,string.lower("C6L2_LoonyPark")))then return "HUD/Map/sketch_loony" end
	if(string.find(ldir,string.lower("C6L3_Lab-a")))then return "HUD/Map/sketch_lab-a" end
	if(string.find(ldir,string.lower("C6L3_Lab-b")))then return "/HUD/Map/sketch_lab-b" end
	if(string.find(ldir,string.lower("C6L3_Lab-c")))then return "HUD/Map/sketch_lab-c" end
	if(string.find(ldir,string.lower("C6L3_Lab")))then return "HUD/Map/sketch_lab" end
	if(string.find(ldir,string.lower("C6L4_City-a")))then return "HUD/Map/sketch_city-a" end
	if(string.find(ldir,string.lower("C6L4_City-b")))then return "/HUD/Map/sketch_city-b" end
	if(string.find(ldir,string.lower("C6L4_City-c")))then return "HUD/Map/sketch_city-c" end
	if(string.find(ldir,string.lower("C6L4_City")))then return "HUD/Map/sketch_city" end
	if(string.find(ldir,string.lower("C6L4_Pentagon-a")))then return "HUD/Map/sketch_pentagon-a" end
	if(string.find(ldir,string.lower("C6L4_Pentagon-b")))then return "/HUD/Map/sketch_pentagon-b" end
	if(string.find(ldir,string.lower("C6L4_Pentagon-c")))then return "HUD/Map/sketch_pentagon-c" end
	if(string.find(ldir,string.lower("C6L4_Pentagon")))then return "HUD/Map/sketch_pentagon" end
	if(string.find(ldir,string.lower("C6L5_Leningrad-a")))then return "HUD/Map/sketch_leningrad-a" end
	if(string.find(ldir,string.lower("C6L5_Leningrad-b")))then return "/HUD/Map/sketch_leningrad-b" end
	if(string.find(ldir,string.lower("C6L5_Leningrad-c")))then return "HUD/Map/sketch_leningrad-c" end
	if(string.find(ldir,string.lower("C6L5_Leningrad")))then return "HUD/Map/sketch_leningrad" end
	if(string.find(ldir,string.lower("C6L6_Colloseum-a")))then return "HUD/Map/sketch_colloseum-a" end
	if(string.find(ldir,string.lower("C6L6_Colloseum-b")))then return "/HUD/Map/sketch_colloseum-b" end
	if(string.find(ldir,string.lower("C6L6_Colloseum-c")))then return "HUD/Map/sketch_colloseum-c" end
	if(string.find(ldir,string.lower("C6L6_Colloseum")))then return "HUD/Map/sketch_colloseum" end
	if(string.find(ldir,string.lower("C6L7_IceWallow-a")))then return "HUD/Map/sketch_question-a" end
	if(string.find(ldir,string.lower("C6L7_IceWallow-b")))then return "/HUD/Map/sketch_question-b" end
	if(string.find(ldir,string.lower("C6L7_IceWallow-c")))then return "HUD/Map/sketch_question-c" end
	if(string.find(ldir,string.lower("C6L7_IceWallow")))then return "HUD/Map/sketch_question" end
	if(string.find(ldir,string.lower("C6L8_Galleon-a")))then return "HUD/Map/sketch_question-a" end
	if(string.find(ldir,string.lower("C6L8_Galleon-b")))then return "/HUD/Map/sketch_question-b" end
	if(string.find(ldir,string.lower("C6L8_Galleon-c")))then return "HUD/Map/sketch_question-c" end
	if(string.find(ldir,string.lower("C6L8_Galleon")))then return "HUD/Map/sketch_question" end
	if(string.find(ldir,string.lower("C6L8_Mines-a")))then return "HUD/Map/sketch_underworld-a" end
	if(string.find(ldir,string.lower("C6L8_Mines-b")))then return "/HUD/Map/sketch_underworld-b" end
	if(string.find(ldir,string.lower("C6L8_Mines-c")))then return "HUD/Map/sketch_underworld-c" end
	if(string.find(ldir,string.lower("C6L8_Mines")))then return "HUD/Map/sketch_underworld" end
	if(string.find(ldir,string.lower("C6L9_Mine-a")))then return "HUD/Map/sketch_stonepit-a" end
	if(string.find(ldir,string.lower("C6L9_Mine-b")))then return "/HUD/Map/sketch_stonepit-b" end
	if(string.find(ldir,string.lower("C6L9_Mine-c")))then return "HUD/Map/sketch_stonepit-c" end
	if(string.find(ldir,string.lower("C6L9_Mine")))then return "HUD/Map/sketch_stonepit" end
	if(string.find(ldir,string.lower("C6L10_Shadowland-a")))then return "HUD/Map/sketch_shadowland-a" end
	if(string.find(ldir,string.lower("C6L10_Shadowland-b")))then return "/HUD/Map/sketch_shadowland-b" end
	if(string.find(ldir,string.lower("C6L10_Shadowland-c")))then return "HUD/Map/sketch_shadowland-c" end
	if(string.find(ldir,string.lower("C6L10_Shadowland")))then return "HUD/Map/sketch_shadowland" end
	return "HUD/Map/sketch_mp"
end


-- Loading screen

ProgressIcons =
{
	{ 275, 92, "HUD/loading/s_1" },
	{ 300, 98, "HUD/loading/s_2" },
	{ 323, 109, "HUD/loading/s_3" },
	--	{ 307, 92, "HUD/loading/s_3" },
	{ 347, 124, "HUD/loading/s_4" },
	{ 367, 142, "HUD/loading/s_5" },

	{ 404, 202, "HUD/loading/s_6" },
	{ 411, 223, "HUD/loading/s_7" },
	{ 415, 248, "HUD/loading/s_2" },
	{ 410, 275, "HUD/loading/s_8" },
	{ 406, 300, "HUD/loading/s_9" },

	{ 373, 363, "HUD/loading/s_5" },
	{ 354, 381, "HUD/loading/s_1" },
	{ 333, 394, "HUD/loading/s_4" },
	{ 305, 408, "HUD/loading/s_6" },
	{ 279, 416, "HUD/loading/s_3" },

	{ 218, 415, "HUD/loading/s_8" },
	{ 193, 409, "HUD/loading/s_7" },
	{ 168, 396, "HUD/loading/s_9" },
	{ 142, 381, "HUD/loading/s_2" },
	{ 123, 360, "HUD/loading/s_5" },

	{ 92, 304, "HUD/loading/s_1" },
	{ 87, 280, "HUD/loading/s_4" },
	{ 85, 254, "HUD/loading/s_8" },
	{ 87, 227, "HUD/loading/s_3" },
	{ 93, 204, "HUD/loading/s_6" },

	{ 123, 148, "HUD/loading/s_9" },
	{ 142, 129, "HUD/loading/s_2" },
	{ 168, 109, "HUD/loading/s_7" },
	{ 195, 98, "HUD/loading/s_8" },
	{ 220, 92, "HUD/loading/s_5" },
}

function LoadScreen_FillIcons()
	for i=1,table.getn(ProgressIcons) do
		PMENU.SetProgressIcon( i - 1, ProgressIcons[i][1], ProgressIcons[i][2], ProgressIcons[i][3] )
	end
end
