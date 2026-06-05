module("extensions.dp",package.seeall)
extension = sgs.Package("dp")

function string:split(sep)
  local sep, fields = sep or ":", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

--luaxhm = sgs.General(extension, "luaxhm", "wei", 3, true)
--luacj = sgs.General(extension, "luacj", "wei", 3, false)
luahm=sgs.General(extension,"luahm","shu","4",false)
--luatshzhr=sgs.General(extension,"luatshzhr","wu",4,false)
luazhgk = sgs.General(extension, "luazhgk", "wu", 3, true)
--luasmzh = sgs.General(extension, "luasmzh", "wei", 3, true)
luawyj = sgs.General(extension, "luawyj", "wei", 3, false)
luawenyuan = sgs.General(extension, "luawenyuan", "shu", 3, false)
luawenyang = sgs.General(extension, "luawenyang", "wei", 4, true)
luazhg = sgs.General(extension, "luazhg", "shu", 4, true)
luamyl = sgs.General(extension, "luamyl", "qun", 4, false,false)
--luaspmyl = sgs.General(extension, "luaspmyl", "shu", 4, false,true)
--luaxxy = sgs.General(extension, "luaxxy", "wei", 3, false)
luayh = sgs.General(extension, "luayh", "wei", 4, true)
LuaGuoNvWang=sgs.General(extension,"LuaGuoNvWang","wei",3,false)
--luaxly = sgs.General(extension, "luaxly", "wei", 3, false)
luazhxc = sgs.General(extension, "luazhxc", "shu", 3, false)
--luaslb = sgs.General(extension, "luaslb", "wu", 3, false)
luallq = sgs.General(extension, "luallq", "qun", 4, false)
--luawangshuang = sgs.General(extension, "luawangshuang", "wei", 4, true)
--dailaidongzhu = sgs.General(extension, "dailaidongzhu", "shu", 4, true)
--人物列传
--司马昭列传
simazhaols=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "simazhaols$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--杜预列传
duyuls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "duyuls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--带来洞主列传
--杜预列传
dailaidongzhuls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "dailaidongzhuls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--孙茹列传
sunruls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "sunruls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--王双列传
wangshuangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "wangshuangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--文鸳列传
wenyuanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "wenyuanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--文鸯列传
wenyangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "wenyangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--夏侯懋列传
xiahoumaols=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "xiahoumaols$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--曹姬列传
caojils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "caojils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--关凤列传
guanfengls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "guanfengls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--马云禄列传
mayunluls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "mayunluls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--SP马云禄列传
spmayunluls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "spmayunluls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--吕玲绮列传
lvlingqils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "lvlingqils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--赵广列传
zhaoguangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhaoguangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--诸葛恪列传
zhugekels=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhugekels$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--张星彩列传
zhangxingcails=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhangxingcails$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--王元姬列传
wangyuanjils=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "wangyuanjils$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--羊祜列传
yanghuls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "yanghuls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--辛宪英列传
xinxianyingls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "xinxianyingls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--薛灵芸列传
xuelingyunls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "xuelingyunls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--刘封列传
liufengls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "liufengls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--花鬘列传
huamanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "huamanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--鲍三娘列传
baosanniangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "baosanniangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--孙鲁班孙鲁育列传
sunlubanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "sunlubanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--诸葛果列传
zhugeguols=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhugeguols$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--关索列传
guansuols=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "guansuols$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--郭女王列传
guonvwangls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "guonvwangls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--诸葛瞻列传
zhugezhanls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "zhugezhanls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--孔雀列传
kongquels=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "kongquels$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--太史昭容列传
taishizhaorongls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "taishizhaorongls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}
--卑弥呼列传
beimihuls=sgs.CreateTriggerSkill{
	    frequency = sgs.Skill_Compulsory, 
	    name = "beimihuls$",
	    events=sgs.GameStart, 
	    on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		room:detachSkillFromPlayer(player,self:objectName())--把临时技能删了
        end
}



--技能卡

--浸润
luajr_trs=sgs.CreateTriggerSkill{
name="luajr_trs",
--view_as_skill=!!_vs,
events={sgs.Damaged},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damaged then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		for var=1,damage.damage,1 do
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect(self:objectName())
			local pfc1=room:getOtherPlayers(selfplayer)
			local pfc2=room:getAlivePlayers()
			local pfc_t=room:getAlivePlayers()
			for _,p in sgs.qlist(pfc_t) do
				if p:getHandcardNum()>p:getHp() then 
					if not p:hasSkill(self:objectName()) then pfc1:removeOne(p) end
				else 
					pfc2:removeOne(p)
				end			
			end
			--if pfc1:length()>0 then player:speak(">") end
			if pfc1:length()==0 and pfc2:length()==0 then
				return false 
			elseif pfc1:length()==0 then
				selfplayer:setMark("luajr_tmp",2)
				local pc=room:askForPlayerChosen(selfplayer,pfc2,self:objectName())
				if pc~=nil then
					pc:turnOver()
				end
			elseif pfc2:length()==0 then
				selfplayer:setMark("luajr_tmp",1)
				local pc=room:askForPlayerChosen(selfplayer,pfc1,self:objectName())
				if pc~=nil then
					pc:drawCards(1)
					if pc:hasSkill(self:objectName()) then return false end
					selfplayer:drawCards(1)
				end
			else
				if room:askForChoice(player, self:objectName(), "jr_choice1+jr_choice2") == "jr_choice2" then 
					selfplayer:setMark("luajr_tmp",2)
					local pc=room:askForPlayerChosen(selfplayer,pfc2,self:objectName())
					if pc~=nil then
						pc:turnOver()
					end
				else
					selfplayer:setMark("luajr_tmp",1)
					local pc=room:askForPlayerChosen(selfplayer,pfc1,self:objectName())
					if pc~=nil then
						pc:drawCards(1)
						if pc:hasSkill(self:objectName()) then return false end
						selfplayer:drawCards(1)
					end
				end
			end
		end			
	end	
end,
--can_trigger=function()
	--return true
--end
}
--建构
luazg_trs=sgs.CreateTriggerSkill{
name="luazg_trs",
--view_as_skill=!!_vs,
events={sgs.Predamaged},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Predamaged then
		if selfplayer:isNude() then return false end
		local damage=data:toDamage()
		if not damage.card or not damage.card:inherits("Slash") then return false end
		selfplayer:setTag("luazg_tmp",data)
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		if room:askForDiscard(selfplayer,self:objectName(),1,true,true) then
			local pfc=room:getAlivePlayers()
			local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
			if pc~=nil then
				damage.from=pc
				data:setValue(damage)
			end
		end
	end
	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--巾帼
luajg_vs=sgs.CreateViewAsSkill{
name="luajg_vs",
n=1,
view_filter=function(self, selected, to_select)
	return to_select:inherits("Slash") and to_select:isRed()
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	--local a!!_card=!!_card:clone()
	local a_card=sgs.Sanguosha:cloneCard("duel",cards[1]:getSuit(),cards[1]:getNumber())
	for var=1,#cards,1 do
		a_card:addSubcard(cards[var])
	end	
	a_card:setSkillName(self:objectName())
	return a_card
end,
enabled_at_play=function()
	return true
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}
--银屏
luayp_trs=sgs.CreateTriggerSkill{
name="luayp_trs",
--view_as_skill=!!_vs,
events={sgs.SlashMissed,sgs.CardEffect},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.SlashMissed then
		local effect=data:toSlashEffect()
		if not effect.to:hasSkill(self:objectName()) then return false end
		if effect.from:hasFlag("luayp_tmp"..effect.to:objectName()) then
			room:setPlayerFlag(effect.from,"-luayp_tmp"..effect.to:objectName())
			if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
			room:playSkillEffect(self:objectName())
			selfplayer:drawCards(2)
		end
	elseif event==sgs.CardEffect then
		local effect=data:toCardEffect()
		if not effect.to:hasSkill(self:objectName()) then return false end
		if not effect.card:inherits("Slash") then return false end
		if effect.from:hasFlag("luayp_tmp"..effect.to:objectName()) then
			room:setPlayerFlag(effect.from,"-luayp_tmp"..effect.to:objectName())
		end
		if not effect.card:isBlack() then return false end
		room:setPlayerFlag(effect.from,"luayp_tmp"..effect.to:objectName())
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--疾驰
luajch_trs=sgs.CreateTriggerSkill{
name="luajch_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		local phase=selfplayer:getPhase()
		if phase==sgs.Player_Draw then 
			if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
			room:playSkillEffect(self:objectName())
			room:setPlayerFlag(selfplayer,"luajch_tmp")
			selfplayer:drawCards(1)
			return true
		elseif phase==sgs.Player_Finish then
			if selfplayer:hasFlag("luajch_tmp") then
				selfplayer:drawCards(1)--已修改为摸一张，之语，削弱
			end
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--虎女
luahn_trs=sgs.CreateTriggerSkill{
name="luahn_trs",
--view_as_skill=!!_vs,
events={sgs.CardUsed},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	--if selfplayer:getMark("luajm_tmp")==0 then return false end
	if event==sgs.CardUsed then
		local use=data:toCardUse()
		if not use.from:hasSkill(self:objectName()) then return false end
		if not use.card:inherits("Slash") then return false end
    if selfplayer:getHandcardNum() ~= 0 then return false end
		if selfplayer:hasFlag("luahn_tmp") then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		room:playSkillEffect(self:objectName())
		--room:setPlayerFlag(selfplayer,"tianyi_success")		
		local pfc=room:getAlivePlayers()
		--for _,p in sgs.qlist(use.to) do
			--pfc:removeOne(p)				
		--end
		--pfc:removeOne(selfplayer)
		if pfc:isEmpty() then return false end
		local pc = room:askForPlayerChosen(selfplayer, pfc, self:objectName())
		--local slash_t=sgs.Sanguosha:cloneCard("slash",use.card:getSuit(),use.card:getNumber())
		--local use_t = sgs.CardUseStruct()
		--use_t.card=slash_t
		--use_t.from=selfplayer
		--use_t.to:append(pc)
		use.to:append(pc)
		room:setPlayerFlag(selfplayer,"luahn_tmp")
		room:useCard(use)
		room:setPlayerFlag(selfplayer,"-luahn_tmp")
		return true
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--将门
luajm_trs=sgs.CreateTriggerSkill{
name="luajm_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_Wake,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if selfplayer:getMark("luajm_waked")>0 then return false end
		if selfplayer:getPhase()~=sgs.Player_Start then return false end
		if selfplayer:getHp()>2 then return false end
		room:playSkillEffect(self:objectName())
		room:loseMaxHp(selfplayer)
		room:acquireSkill(selfplayer,"wushuang")
		--room:acquireSkill(selfplayer,"luahn_trs")
		--selfplayer:addMark("luajm_tmp")
		selfplayer:addMark("luajm_waked")
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--戎装
luarzh_trs=sgs.CreateTriggerSkill{
name="luarzh_trs",
--view_as_skill=!!_vs,
events={sgs.CardEffect},
frequency = sgs.Skill_NotFrequent,
priority=1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	if event==sgs.CardEffect then
		local effect=data:toCardEffect()
		if not(effect.card:inherits("Slash") or effect.card:inherits("Duel")) then return false end
		if not effect.from:hasSkill(self:objectName()) then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
                if effect.to:isAllNude() then return end
				local id_t=room:askForCardChosen(effect.from,effect.to,"hej",self:objectName())
				room:throwCard(id_t)
		end
	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--良姻
lualy_trs=sgs.CreateTriggerSkill{
name="lualy_trs",
--view_as_skill=!!_vs,
events={sgs.GameStart},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.GameStart then
		if (room:askForSkillInvoke(selfplayer,self:objectName())==true) then 
			room:playSkillEffect(self:objectName())
			--room->transfigure(player, "sp_sunshangxiang", true, false);
			room:transfigure(selfplayer,"luaspmyl",true,false)
			room:setPlayerProperty(selfplayer,"kingdom",sgs.QVariant("shu"))
			
		else
			room:setPlayerProperty(selfplayer,"kingdom",sgs.QVariant("qun"))
		end
				
	end
	
end,
--[[can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end]]--
}
----甚贤 code by sunny
luashx_trs=sgs.CreateTriggerSkill{
	name="luashx_trs",
	events=sgs.PhaseChange,--阶段改变时发动
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if player:getPhase()==sgs.Player_Start then--出牌阶段
			if room:askForSkillInvoke(player,self:objectName()) then--受伤，确认发动
				local p=room:askForPlayerChosen(player,room:getOtherPlayers(player),self:objectName())--选择玩家
				room:playSkillEffect(self:objectName())
				player:drawCards(1)
				p:drawCards(1)
			end
			return false--不跳过阶段
		end
	end,
}--code by sunny
----敬哀 code by sunny
luaja_card=sgs.CreateSkillCard{
	name="luaja_effect",
	target_fixed=false,
	will_throw=true,
	filter=function(self,targets,to_select,player)
		return #targets==0 and to_select:isWounded()
	end,
	on_use=function(self,room,source,targets)
		room:throwCard(self)
		if self:getSubcards():isEmpty() then room:loseHp(source) end
		local target=targets[1]
		effect=sgs.CardEffectStruct()
		effect.card=self
		effect.from=source
		effect.to=target
		room:cardEffect(effect)
		room:setPlayerFlag(source,"luaja_used")
		room:playSkillEffect("luaja_vs")
	end,
	on_effect=function(self,effect)
		local recov=sgs.RecoverStruct()
		recov.card=self
		recov.who=effect.from
		effect.to:getRoom():recover(effect.to,recov)
	end
}
luaja_vs=sgs.CreateViewAsSkill{
	name="luaja_vs",
	n=1,
	view_filter=function(self, selected, to_select)
		return to_select:getSuit()==sgs.Card_Heart and to_select:getTypeId()==sgs.Card_Trick
	end,
	view_as=function(self,cards)
		local qcard=luaja_card:clone()
		if #cards==1 then qcard:addSubcard(cards[1]) end
		qcard:setSkillName(self:objectName())
		return qcard
	end,
	enabled_at_play=function()
		return not sgs.Self:hasFlag("luaja_used")
	end,
}--code by sunny
--椒图
luajt_trs=sgs.CreateTriggerSkill{
name="luajt_trs",
--view_as_skill=!!_vs,
events={sgs.CardResponsed},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardResponsed then
		if selfplayer:getPhase()~=sgs.Player_NotActive then return false end
		if not player:hasSkill(self:objectName()) then return false end
		local cd=data:toCard()
		if cd:inherits("Slash") then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect(self:objectName())
			local pfc=room:getOtherPlayers(selfplayer)
			local pfc_t=room:getOtherPlayers(selfplayer)
			for _,p in sgs.qlist(pfc_t) do
				--if not selfplayer:canSlash(p) then pfc:removeOne(p) end
				if not selfplayer:inMyAttackRange(p) then pfc:removeOne(p) end			
			end
			local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
			if pc~=nil then
				local cd_t=room:askForCard(pc,"slash","#luajt1")
				if cd_t==nil then
					local damage = sgs.DamageStruct()
					damage.from=selfplayer
					damage.to=pc
					damage.damage=1
					room:damage(damage)
				end				
			end
			return false
		elseif cd:inherits("Jink") then
			if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
			room:playSkillEffect(self:objectName())
			local pfc=room:getOtherPlayers(selfplayer)
			local pfc_t=room:getOtherPlayers(selfplayer)
			for _,p in sgs.qlist(pfc_t) do
				--if not selfplayer:canSlash(p) then pfc:removeOne(p) end
                if not selfplayer:inMyAttackRange(p) then pfc:removeOne(p) end				
			end
			local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
			if pc~=nil then
				local cd_t=room:askForCard(pc,"jink","#luajt2")
				if cd_t==nil then
					local damage = sgs.DamageStruct()
					damage.from=selfplayer
					damage.to=pc
					damage.damage=1
					room:damage(damage)
				end
			end
			return false
		end		
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--英才
luayc_trs=sgs.CreateTriggerSkill{
name="luayc_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if selfplayer:getPhase()==sgs.Player_Draw then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect(self:objectName())
			selfplayer:drawCards(2)
			room:setPlayerFlag(selfplayer,"tianyi_failed")
		elseif selfplayer:getPhase()==sgs.Player_Discard then
			room:setPlayerFlag(selfplayer,"-tianyi_failed")
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}

luaycslash = sgs.CreateSlashSkill
{
	name = "#luaycslash",
-- 额外出杀（返回还能再使用的杀的数量）
	s_residue_func = function(self, from)
	    if from:hasSkill("#luaycslash") and from:hasFlag("tianyi_failed") then
                --local init =  1 - from:getSlashCount() -- 还能再使用的杀的数量，若已经使用了1张杀，则init=1-1=0，不能使用杀了
                --return init + from:getMark("Fist") -- 如果获得了1个Fist标记，则在可用杀的基础上+1，本例中未0+1=1，有多少Fist标记可再使用多少张杀
			-- 返回值为998，表示使用杀无次数限制（如连弩、咆哮）
			-- 返回值为-998，表示不能再使用杀（如天义拼点失败）
            --else
            return -998    --return 0
	    end
	end,
}

--奇兵
luaqb_card=sgs.CreateSkillCard{
name="luaqb_effect",
target_fixed=false,
will_throw=false,
filter=function(self,targets,to_select)
	return (to_select:objectName() ~= sgs.Self:objectName()) and (#targets==0) 
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
    room:playSkillEffect("luaqb_vs")
	local slash=sgs.Sanguosha:getCard(self:getSubcards():at(0))
	--local slash_t=sgs.Sanguosha:cloneCard("slash",slash:getSuit(),slash:getNumber())
	self:getSubcards():removeOne(slash:getEffectiveId())
	room:throwCard(self)
	targets[1]:addMark("qinggang")
	local use_t = sgs.CardUseStruct()
	use_t.card=slash
	use_t.from=source
	use_t.to:append(targets[1])
	room:useCard(use_t)
	targets[1]:removeMark("qinggang")
end,
--on_effect=function(self,effect)
--end
}

luaqb_vs=sgs.CreateViewAsSkill{
name="luaqb_vs",
n=1,
view_filter=function(self, selected, to_select)
	return (to_select:inherits("Slash")) and (to_select:isRed())
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_luaqb_card=luaqb_card:clone()
	a_luaqb_card:addSubcard(cards[1])
	a_luaqb_card:setSkillName(self:objectName())
	return a_luaqb_card
end,
enabled_at_play=function()
	return sgs.Self:canSlashWithoutCrossbow() and not sgs.Self:hasFlag("tianyi_failed")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}
--治生
luaskillzhsh_card = sgs.CreateSkillCard{
        name = "luaskillzhsh",
        target_fixed = false,
        will_throw = false,       
        filter=function(self,targets,to_select)
                return #targets == 0
        end,     
        on_effect=function(self,effect)
                local room = effect.from:getRoom()
                local player = effect.from
                local target = effect.to
                local numb = self:getSubcards():length()
                room:moveCardTo(self,target,sgs.Player_Hand,false)        
                local card_ids = room:getNCards(numb*2)
                room:fillAG(card_ids,nil)
                room:getThread():delay()
                for _,id in sgs.qlist(card_ids) do
                        card = sgs.Sanguosha:getCard(id)
                        if card:isRed() then
                                room:takeAG(player, id)
                        else
                                room:takeAG(nil, id)
                        end
                end
                room:getThread():delay()
                for _,p in sgs.qlist(room:getAllPlayers()) do
                        p:invoke("clearAG")
               end
                room:setPlayerFlag(player,"luaskillzhshused")
        end,
 
}

luaskillzhsh_vs = sgs.CreateViewAsSkill{
        name = "luaskillzhsh",        
        n = 254,       
        view_filter=function(self, selected, to_select)
                if #selected > sgs.Self:getLostHp() then return false end
        if to_select:isEquipped() then return false end
        return true 
        end,    
        view_as = function(self, cards)
                if #cards==0 then return false end
                local card=luaskillzhsh_card:clone()
                for var=1,#cards,1 do
            card:addSubcard(cards[var])                
        end
                card:setSkillName(self:objectName())
        return card
        end,   
        enabled_at_play = function(self,player)
                return not (player:hasFlag("luaskillzhshused") or player:isKongcheng())
        end,
 

}

--蓄伎
luaxj_card=sgs.CreateSkillCard{
name="luaxj_effect",
target_fixed=true,
will_throw=true,
--[[filter=function(self,targets,to_select)
end,
feasible=function(self,targets)
end,
on_use=function(self,room,source,target)
end,
on_effect=function(self,effect)
end]]--
}

luaxj_vs=sgs.CreateViewAsSkill{
name="luaxj_vs",
n=1,
view_filter=function(self, selected, to_select)        
       return (to_select:getSuit()~=sgs.Card_Heart) and (not to_select:isEquipped())
end,
view_as=function(self, cards)
        if #cards==1 then 
        local acard=luaxj_card:clone()        
        acard:addSubcard(cards[1])        
        acard:setSkillName(self:objectName())
        return acard end
end,
enabled_at_play=function()
        return false        
end,
enabled_at_response=function(self,pattern)
        return pattern=="@luaxj_trs" --仅响应 要求一张jicai_card        
end
}

luaxj_trs=sgs.CreateTriggerSkill{
name="luaxj_trs",
view_as_skill=luaxj_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if selfplayer:getPhase()==sgs.Player_Discard then
			if selfplayer:getHandcardNum()<=selfplayer:getMaxCards() then return false end
			room:playSkillEffect(self:objectName())
			local hcs=selfplayer:getHandcards()
			local cnt=0
			for _,hc in sgs.qlist(hcs) do
				if hc:getSuit()~=sgs.Card_Heart then cnt=cnt+1 end				
			end
			if (selfplayer:getHandcardNum()-cnt)==0 then return false end
			if cnt>selfplayer:getMaxCards() then
				--player:speak("1")
				for var=1,cnt-selfplayer:getMaxCards(),1 do
					local cd
					while true do
						--cd=room:askForCard(selfplayer,"@luaxj_trs","@luaxj_trs")
						cd=room:askForCard(selfplayer,".|spade,club,diamond|.|hand|.","@luaxj_trs")
						if cd~=nil then break end
					end
					--if cd~=nil then
					room:throwCard(cd)
					--end
				end
			end
			for _,c in sgs.qlist(selfplayer:getHandcards()) do
				if c:getSuit()==sgs.Card_Heart then
					room:showCard(selfplayer,c:getEffectiveId())
				end					
			end
			return true
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--诬言
luawy_card=sgs.CreateSkillCard{
name="luawy_effect",
target_fixed=false,
will_throw=false,
filter=function(self,targets,to_select)
	return #targets==0
end,
--feasible=function(self,targets)
--end,
--on_use=function(self,room,source,target)
--end,
on_effect=function(self,effect)
	local room=effect.from:getRoom()
	room:setPlayerFlag(effect.from,"luawy_used")	
	--effect.from:pindian(effect.to,"luawy",self)	
	--room:setPlayerFlag(effect.from,"luawy_tmp")
	room:playSkillEffect("luawy_vs")
	if effect.from:pindian(effect.to,"luawy",self) then
		local pfc=room:getOtherPlayers(effect.to)
		local pfc_t=room:getOtherPlayers(effect.to)
		--effect.from:speak("1")
		for _,p in sgs.qlist(pfc_t) do
			if not effect.to:canSlash(p) then
				pfc:removeOne(p)
			end			
		end
		--effect.from:speak("2")
		local pc=room:askForPlayerChosen(effect.from,pfc,"luawy")
		if pc~=nil then
			if not room:askForDiscard(pc,"luawy",2,2,true,true) then
				local damage = sgs.DamageStruct()
				damage.from = effect.from
				damage.to = pc				
				room:damage(damage)
			end
		end
	else
		--effect.from:speak("punishment")
		--room:throwCard(self)
		effect.to:obtainCard(self)
	end
	--room:setPlayerFlag(effect.from,"-luawy_tmp")
end
}

luawy_vs=sgs.CreateViewAsSkill{
name="luawy_vs",
n=1,
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped()
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_luawy_card=luawy_card:clone()
	a_luawy_card:addSubcard(cards[1])
	a_luawy_card:setSkillName(self:objectName())
	return a_luawy_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luawy_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}
--私通
luast_card=sgs.CreateSkillCard{
name="luast_effect",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select)
	if #targets>0 then return false end
	local x=sgs.Self:getLostHp()
	local diff=math.abs(to_select:getHandcardNum()-sgs.Self:getHandcardNum())
	if sgs.Self:getGeneral():isMale() then
		return to_select:getGeneral():isFemale() and (diff<=x)
	end
	if sgs.Self:getGeneral():isFemale() then
		return to_select:getGeneral():isMale() and (diff<=x)
	end
	return false
	--effect.from->getGeneral()->isMale() != effect.to->getGeneral()->isMale()
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	room:setPlayerFlag(source,"luast_used")
	local a = source
	local b = targets[1]
		-- a:setHandCardNum(0)------setHandCardNum这个函数没有写lua，在clientplayer.cpp里
		-- b:setHandCardNum(9)
	local n1 = a:getHandcardNum()
	local n2 = b:getHandcardNum()
	--room:setPlayerFlag(a, "luadm_a")
	--room:setPlayerFlag(b, "luadm_b")
	if n1 == 0 and n2 ~= 0 then
		a,b = b, a
		n1, n2 = n2, n1
	end
	--room:setPlayerFlag(a, "luadm_a")
	--room:setPlayerFlag(b, "luadm_b")
	--room:output(a:getGeneralName().."\t"..n1.."\n"..b:getGeneralName().."\t"..n2)
	--if n1 ~= n2 then
	--	room:askForDiscard(player, "@luadimeng", math.abs(n1 - n2), math.abs(n1 - n2), false, true)
	--end
	local dcard1 = a:wholeHandCards()
	local dcard2 = b:wholeHandCards()
	if dcard1 then
		room:moveCardTo(dcard1, b, sgs.Player_Special, false)--a手牌全部移动到b特殊牌区
	end		
	if dcard1 then
		room:moveCardTo(dcard1, b, sgs.Player_Hand, false)--a手牌全部从b特殊牌区移动到b手牌
		--dcar1 = nil
	end
	if dcard2 then
		room:moveCardTo(dcard2, a, sgs.Player_Hand, false)--b手牌全部从a特殊牌区移动到a手牌
		--dcar2 = nil
		room:playSkillEffect("luast_vs")
	end		
	local log = sgs.LogMessage()
	log.type = "#luadimeng"
	log.from = a
	log.to:append(b)
	log.arg  = n1
	log.arg2 = n2
	--room:sendLog(log)
end,
--on_effect=function(self,effect)
--end
}

luast_vs=sgs.CreateViewAsSkill{
name="luast_vs",
n=0,
--view_filter=function(self, selected, to_select)
	--return true
--end,
view_as=function(self, cards)
	if #cards~=0 then return nil end
	local a_luast_card=luast_card:clone()
	--a_luast_card:addSubcard(cards[1])
	a_luast_card:setSkillName(self:objectName())
	return a_luast_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luast_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}
--花卜
luahb_trs=sgs.CreateTriggerSkill{
name="luahb_trs",
--view_as_skill=!!_vs,
events={sgs.StartJudge,sgs.PhaseChange},
frequency=sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.StartJudge then
		local judge=data:toJudge()		
		local x=selfplayer:getLostHp()+1
		if selfplayer:hasFlag("huabu") then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		room:setPlayerFlag(selfplayer,"huabu")
		room:playSkillEffect(self:objectName())
		selfplayer:setTag("huabu",data)--add by sunny
		room:doGuanxing(selfplayer, room:getNCards(x, false), false)
		--selfplayer:setTag("huabu",nil)--add by sunny
	elseif event==sgs.PhaseChange then
		if selfplayer:hasFlag("huabu") then room:setPlayerFlag(selfplayer,"-huabu") end
	end
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--中闱
luazhw_trs=sgs.CreateTriggerSkill{
name="luazhw_trs",
--view_as_skill=!!_vs,
events={sgs.CardUsed},
frequency=sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardUsed then
		if selfplayer:getPhase()~=sgs.Player_NotActive then return false end
		local use=data:toCardUse()
		local b=false
		for _,p in sgs.qlist(use.to) do
			if p:hasSkill(self:objectName()) then b=true end				
		end
		if not b then return false end
		if use.card:getTypeId()~=sgs.Card_Trick then return false end
		--player:speak("~~")
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		selfplayer:drawCards(1)
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--义理
luayl_trs=sgs.CreateTriggerSkill{
name="luayl_trs",
--view_as_skill=!!_vs,
events={sgs.Pindian},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Pindian then
		local pd=data:toPindian()
		if pd.from:hasSkill(self:objectName()) then
			room:playSkillEffect(self:objectName())
			local cd=pd.from_card
			local num=cd:getNumber()+3
			if num>13 then num=13 end
			local cd_t=sgs.Sanguosha:cloneCard(pd.from_card:objectName(),cd:getSuit(),num)
			cd_t:addSubcard(cd)
			cd_t:setSkillName(self:objectName())
			pd.from_card=cd_t			
		elseif pd.to:hasSkill(self:objectName()) then
			local cd=pd.to_card
			local num=cd:getNumber()+3
			if num>13 then num=13 end
			local cd_t=sgs.Sanguosha:cloneCard(pd.to_card:objectName(),cd:getSuit(),num)
			cd_t:addSubcard(cd)
			cd_t:setSkillName(self:objectName())
			pd.to_card=cd_t
		end
		selfplayer:speak(string.format("%d vs %d",pd.from_card:getNumber(),pd.to_card:getNumber()))		
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--父志
luafzh_trs=sgs.CreateTriggerSkill{--add by sunny
	name="luafzh_trs",
	events=sgs.Dying,
	frequency=sgs.Skill_Wake,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()	
		if player:getMark("luafzh_trs")>0 then return false end
		room:playSkillEffect(self:objectName())
		room:loseMaxHp(player,1)
		local recover=sgs.RecoverStruct()
		recover.recover=1
		recover.who=player
		room:recover(player,recover)--回复
		room:acquireSkill(player,"luayl_trs")
		player:addMark("luafzh_trs")
	end,
}
--天骄
luatj_trs=sgs.CreateTriggerSkill{--触发技
	name="luatj_trs",
	events={sgs.PhaseChange},--阶段改变时发动
	on_trigger=function(self,event,player,data)--要执行的动作
		local room=player:getRoom()--获取房间
		if event==sgs.PhaseChange then
			if not player:hasSkill(self:objectName()) then return false end
			if player:getPhase()==sgs.Player_Play then--出牌阶段
				if not room:askForSkillInvoke(player,self:objectName(),data) then return end--询问是否发动
				room:playSkillEffect(self:objectName())
				local pfc=room:getOtherPlayers(player)
				local pfc_t=room:getOtherPlayers(player)
				for _,p in sgs.qlist(pfc_t) do
					if p:isKongcheng() then
						pfc:removeOne(p)
					end				
				end
				local pc=room:askForPlayerChosen(player,pfc,self:objectName())
				if (not pc) or player:isKongcheng() then return end
				local success=player:pindian(pc,self:objectName(),NULL)--拼点，记录结果
				if success then 
					if pc:isNude() then return false end
					local card=sgs.Sanguosha:getCard(room:askForCardChosen(player,pc,"eh",self:objectName()))--记录选择的牌
					room:moveCardTo(card,player,sgs.Player_Hand,false)--移动
				else
					room:acquireSkill(pc,"#mianyijineng")
					--room:setPlayerFlag(pc,"luatj_tmp")					
				end
				return
			--elseif player:getPhase()==sgs.Player_Discard then
				--for _,p in sgs.qlist(room:getAlivePlayers()) do
					--if p:hasFlag("luatj_tmp") then room:setPlayerFlag(p,"-luatj_tmp") end					
				--end
			end
			local pc=room:findPlayerBySkillName("#mianyijineng")
			if pc then room:detachSkillFromPlayer(pc,"#mianyijineng") end
		end		
	end,
}
--太史昭容？？
mianyijineng=sgs.CreateTriggerSkill{
	name="#mianyijineng",
	events=sgs.CardEffected,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local card=data:toCardEffect().card--记录使用的卡
		if not (card:inherits("Slash") or card:isNDTrick()) then return false end--卡片种类不符则不发动
		return true--卡片无效
	end,
}
--绝尘
luashg_trs=sgs.CreateTriggerSkill{
name="luashg_trs",
--view_as_skill=!!_vs,
events={sgs.DamageCaused},
frequency=sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	--local effect=data:toCardEffect()
	if event==sgs.DamageCaused then
		local damage=data:toDamage()
		--if damage.card==nil then return false end
		--if not damage.card:inherits("Slash") then return false end
		--if player:getLostHp()==0 then return false end
		if damage.to:isNude() then return false end
		local log = sgs.LogMessage()
			log.from = player
			log.to:append(damage.to)
			log.type ="#juechentip"
			room:sendLog(log)
		if (room:askForSkillInvoke(player,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		local x=(player:getLostHp()+1)
		--if selfplayer:hasSkill("luagd_trs") then
			--x=x+selfplayer:getLostHp()	
		--end
		for var=1,x,1 do
			if damage.to:isNude() then return false end
			room:throwCard(room:askForCardChosen(player,damage.to,"he",self:objectName()))
		end
	end	
end,
}
--比翼
luaby_slash_card=sgs.CreateSkillCard{
name="luaby_slash_effect",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select)
	return (#targets==0) and (sgs.Self:canSlash(to_select))	
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	local selfplayer=source
	local p_t=nil
	for _,p in sgs.qlist(room:getOtherPlayers(selfplayer)) do
		if p:getMark("@luaby_biyi")>0 then p_t=p end
	end
	if p_t==nil then return false end
	--targets[1]:speak("target")
	local cd_t=room:askForCard(p_t,"slash","biyisha")
	if cd_t==nil then return false end
	p_t:drawCards(1)--在这里增加若响应则摸牌，之语
	selfplayer:drawCards(1)--自己也摸一张
	local use=sgs.CardUseStruct()
	use.card=cd_t
	use.from=selfplayer
	use.to:append(targets[1])
	room:useCard(use)	
end,
--on_effect=function(self,effect)
	
--end
}

luaby_slash_vs=sgs.CreateViewAsSkill{
name="luaby_slash_vs",
n=0,
--view_filter=function(self, selected, to_select)
	--return true
--end,
view_as=function(self, cards)
	if #cards~=0 then return nil end
	local a_luaby_slash_card=luaby_slash_card:clone()
	--a!!_card:addSubcard(cards[1])
	a_luaby_slash_card:setSkillName(self:objectName())
	return a_luaby_slash_card
end,
enabled_at_play=function()
	return (sgs.Self:canSlashWithoutCrossbow() or (sgs.Self:getWeapon() and sgs.Self:getWeapon():className() == "Crossbow"))and not sgs.Self:hasFlag("tianyi_failed") and (sgs.Self:getMark("@luaby_biyi")>0)--修复连弩只能用一次BUG，之语
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luaby_trs=sgs.CreateTriggerSkill{
name="luaby_trs",
--view_as_skill=luaby_vs,
events={sgs.PhaseChange,sgs.TurnStart,sgs.CardAsked,sgs.GameStart},
frequency = sgs.Skill_NotFrequent,--改成选择触发
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if not player:hasSkill(self:objectName()) then return false end
		if selfplayer:getPhase()~=sgs.Player_Start then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		local pfc=room:getAlivePlayers()
		local pfc_t=room:getAlivePlayers()
		for _,p in sgs.qlist(pfc_t) do
			if not p:getGeneral():isMale() then pfc:removeOne(p) end 				
		end
		local pc=room:askForPlayerChosen(selfplayer,pfc,self:objectName())
		if pc==nil then return false end
		selfplayer:gainMark("@luaby_biyi")
		pc:gainMark("@luaby_biyi")
	elseif event==sgs.TurnStart then
		if not player:hasSkill(self:objectName()) then return false end
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:getMark("@luaby_biyi")>0 then 	p:loseAllMarks("@luaby_biyi") end			
		end
	elseif event==sgs.CardAsked then
		if player:getMark("@luaby_biyi")==0 then return false end
		local p_t=nil
		for _,p in sgs.qlist(otherplayers) do
			if p:getMark("@luaby_biyi")>0 then p_t=p end	--找到比翼对象		
		end
		if p_t==nil then return false end
		local str=data:toString()
		if player:hasSkill(self:objectName()) then--找到自己
			if str~="slash" then return false end
			if(not room:askForSkillInvoke(player, self:objectName())) then return false end--加入询问--之语
			local cd_t=room:askForCard(p_t,"slash","biyisha")
			if cd_t==nil then return false end
			room:provide(cd_t)
			p_t:drawCards(1)--先对象摸
			player:drawCards(1)--再自己摸
		else
			if str~="jink" then return false end
			if(not room:askForSkillInvoke(player, self:objectName())) then return false end--加入询问--之语
			local cd_t=room:askForCard(selfplayer,"jink","biyishan")
			if cd_t==nil then return false end
			room:provide(cd_t)
			selfplayer:drawCards(1)--先自己摸
			player:drawCards(1)--再对象摸【总之就是先提供者摸，然后接受者摸】
		end
	elseif event==sgs.GameStart then
		if not player:hasSkill(self:objectName()) then return false end
		room:attachSkillToPlayer(player,"luaby_slash_vs")		
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--隽美
juanmeis = sgs.CreateViewAsSkill{
	name = "juanmeis",
	n = 2,
	enabled_at_play = function() 
		return  false
	end,
	enabled_at_response = function(self, player,pattern)
	return pattern == "jink"
	end,

	view_filter = function(self, selected, to_select)
		return  not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards==0 then return nil end	
		if #cards == 2 then
			local new_card =sgs.Sanguosha:cloneCard("jink", sgs.Card_NoSuit, 0)
			new_card:addSubcard(cards[1])	
		    new_card:addSubcard(cards[2])
			new_card:setSkillName(self:objectName())			
			return new_card
		end
	end
}
--博学
luabx_trs=sgs.CreateTriggerSkill{
name="luabx_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if not player:hasSkill(self:objectName()) then return false end
		if selfplayer:getPhase()~=sgs.Player_Play then return false end
		if selfplayer:getPile("field"):length()==0 then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
		room:playSkillEffect(self:objectName())
		for var=1,selfplayer:getLostHp()+1,1 do
			if selfplayer:getPile("field"):length()~=0 then
				local pile=selfplayer:getPile("field")
				room:fillAG(pile,selfplayer)
				--for var = 1, 1 do
				local cd_id = room:askForAG(selfplayer,pile,true,self:objectName())
				if cd_id ~= -1 then
					pile:removeOne(cd_id)
					room:obtainCard(selfplayer,cd_id)
					--	i = i+1
				end
				selfplayer:invoke("clearAG")
			end
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--天时
luatsh_trs=sgs.CreateTriggerSkill{
name="luatsh_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange,sgs.Predamage},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if not player:hasSkill(self:objectName()) then return false end
		if selfplayer:getPhase()==sgs.Player_Start then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect(self:objectName())
			local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(.*):(.*)")
			judge.who=selfplayer
			judge.reason=self:objectName()
			room:judge(judge)
			if judge.card:getSuit()==sgs.Card_Club then
				room:setPlayerFlag(selfplayer,"luatsh_thunder")
			elseif judge.card:getSuit()==sgs.Card_Diamond then
				--room:setPlayerFlag(selfplayer,"luatsh_earth")
				selfplayer:turnOver()
			elseif judge.card:getSuit()==sgs.Card_Spade then
				room:setPlayerFlag(selfplayer,"luatsh_lost")
			elseif judge.card:getSuit()==sgs.Card_Heart then
				room:setPlayerFlag(selfplayer,"luatsh_fire")
			end
			--selfplayer:obtainCard(judge.card)，修改为不获得判定牌
		end
	elseif event==sgs.Predamage then
		if selfplayer:getPhase()==sgs.Player_NotActive then return false end
		local damage=data:toDamage()
		if selfplayer:hasFlag("luatsh_lost") then
			room:loseHp(damage.to,damage.damage)
			return true
		end
		if selfplayer:hasFlag("luatsh_earth") and (damage.damage>1) then damage.damage=1 end
		if selfplayer:hasFlag("luatsh_fire") and (damage.nature==sgs.DamageStruct_Fire) then damage.damage=damage.damage+1 end
		if selfplayer:hasFlag("luatsh_thunder") and (damage.nature==sgs.DamageStruct_Thunder) then damage.damage=damage.damage+1 end
		data:setValue(damage)
		return false
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--专权
luazhq_fts=sgs.CreateFilterSkill{
name="luazhq_fts",
view_filter=function(self,to_select)
	local str=""
	local int2suit={sgs.Card_Spade,sgs.Card_Club,sgs.Card_Heart,sgs.Card_Diamond}
	return to_select:getSuit()==int2suit[sgs.Self:getMark("luazhq_suit")]
end,
view_as=function(self,card)
	local str=""
	local int2basic={"slash","thunder_slash","fire_slash","jink","peach","analeptic"}
	str=int2basic[sgs.Self:getMark("luazhq_basic")]
	--if sgs.Self:getMark("luazhq_basic")==3 then str="peach" end	
	local filtered=sgs.Sanguosha:cloneCard(str, card:getSuit(), card:getNumber())
	filtered:addSubcard(card)
	filtered:setSkillName(self:objectName())
	return filtered
end
}

luazhq_card=sgs.CreateSkillCard{
name="luazhq_effect",
target_fixed=true,
will_throw=true,
--filter=function(self,targets,to_select)
	
--end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	local selfplayer=source
	selfplayer:turnOver()
	local basic_t=room:askForChoice(selfplayer, self:objectName(), "slash+thunder_slash+fire_slash+jink+peach+analeptic")
	local suit_t=room:askForSuit(selfplayer,"luazhq_trs")
	local basic2int={["slash"]=1,["thunder_slash"]=2,["fire_slash"]=3,["jink"]=4,["peach"]=5,["analeptic"]=6}
	local suit2int={[sgs.Card_Spade]=1,[sgs.Card_Club]=2,[sgs.Card_Heart]=3,[sgs.Card_Diamond]=4}
	selfplayer:speak(string.format("%d %d",basic2int[basic_t],suit2int[suit_t]))
	room:setPlayerMark(selfplayer,"luazhq_basic",basic2int[basic_t])
	room:setPlayerMark(selfplayer,"luazhq_suit",suit2int[suit_t])		
	room:setPlayerFlag(selfplayer,"luazhq_used")
	for _,p in sgs.qlist(room:getAlivePlayers()) do
		room:setPlayerMark(p,"luazhq_basic",basic2int[basic_t])
		room:setPlayerMark(p,"luazhq_suit",suit2int[suit_t])
		room:acquireSkill(p,"luazhq_fts")				
	end
	--room:acquireSkill(selfplayer,"luazhq_fts")
	room:playSkillEffect("luazhq_trs")
	
end,
--on_effect=function(self,effect)
	
--end
}

luazhq_vs=sgs.CreateViewAsSkill{
name="luazhq_vs",
n=0,
--view_filter=function(self, selected, to_select)
	--return true
--end,
view_as=function(self, cards)
	if #cards~=0 then return nil end
	local a_luazhq_card=luazhq_card:clone()
	--a!!_card:addSubcard(cards[1])
	a_luazhq_card:setSkillName(self:objectName())
	return a_luazhq_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luazhq_used")
end,
--[[enabled_at_response=function(self, player, pattern)
	if sgs.Self:getPhase()==sgs.Player_NotActive then return false end
	if sgs.Self:hasFlag("luazhq_used") then return false end
	return pattern:find("slash") or pattern:find("jink") or pattern:find("peach") or pattern:find("analeptic")
end]]
}

luazhq_trs=sgs.CreateTriggerSkill{
name="luazhq_trs",
view_as_skill=luazhq_vs,
events={sgs.TurnStart,sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	--[[if event==sgs.CardAsked then
		if not player:hasSkill(self:objectName()) then return false end
		if selfplayer:hasFlag("luazhq_used") then return false end
		local str=data:toString()
		local int2basic={"slash","thunder_slash","fire_slash","jink","peach","analeptic"}
		local b=false
		for var=1,#int2basic,1 do
			if str:find(int2basic[var]) then b=true end
		end
		if not b then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end		
		room:showAllCards(selfplayer)
		local basic_t=room:askForChoice(selfplayer, self:objectName(), "slash+thunder_slash+fire_slash+jink+peach+analeptic")
		local suit_t=room:askForSuit(selfplayer)
		local basic2int={["slash"]=1,["thunder_slash"]=2,["fire_slash"]=3,["jink"]=4,["peach"]=5,["analeptic"]=6}
		local suit2int={[sgs.Card_Spade]=1,[sgs.Card_Club]=2,[sgs.Card_Heart]=3,[sgs.Card_Diamond]=4}
		selfplayer:speak(string.format("%d %d",basic2int[basic_t],suit2int[suit_t]))
		room:setPlayerMark(selfplayer,"luazhq_basic",basic2int[basic_t])
		room:setPlayerMark(selfplayer,"luazhq_suit",suit2int[suit_t])		
		room:setPlayerFlag(selfplayer,"luazhq_used")
		room:acquireSkill(selfplayer,"luazhq_fts")
	end]]--
	if event==sgs.TurnStart then
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			--if p:hasSkill("luazhq_fts") and (not p:hasSkill("luatsh_trs"))and (not p:hasSkill("luajx_prs")) then room:detachSkillFromPlayer(p,"luazhq_fts") end				
		end		
	elseif event==sgs.PhaseChange then
		if player:getPhase()==sgs.Player_Finish then
			for _,p in sgs.qlist(room:getAlivePlayers()) do
				if p:hasSkill("luazhq_fts") then room:detachSkillFromPlayer(p,"luazhq_fts") end				
			end
		end		
	end	
end,
--can_trigger=function(self, player)
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
--end
}
--九锡
luajx_prs=sgs.CreateProhibitSkill{ 
name = "luajx_prs",
is_prohibited=function(self,from,to,card)
    if to:hasSkill(self:objectName()) and (to:getHp()==1) then
        return card:inherits("Slash")
    end
end,
}

luajxs_trs=sgs.CreateTriggerSkill{--by之语
	name="#luajxs_trs",
	events={ sgs.SlashEffected},
	--priority=2,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		if player:getHp()~=1 then return false end
		return true
	end,
}
--妩媚
luawm_trs=sgs.CreateTriggerSkill{
name="luawm_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if selfplayer:getPhase()==sgs.Player_Discard then
			local x=selfplayer:getHandcardNum()-selfplayer:getMaxHp()
			room:playSkillEffect("luawm_trs")
			if x<=0 then return true end
			room:askForDiscard(selfplayer,"gamerule",x,x,false,false)
			return true
		end
	end
end,
--can_trigger=function(self, player)
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
--end
}
--妖惑
luayaohuo_card=sgs.CreateSkillCard{
name="luayaohuo_trs",
target_fixed=false,
will_throw=true,
filter=function(self,targets,to_select)
	return (#targets==0) and to_select:getGeneral():isMale() and (sgs.Self:distanceTo(to_select) <= 1) and to_select:getMark("@luayaohuo_yaohuo")==0
end,
--feasible=function(self,targets)
--end,
on_use=function(self,room,source,targets)
	local selfplayer=source
	room:throwCard(self)
	--room:setPlayerFlag(selfplayer,"luayaohuo_used")
	targets[1]:gainMark("@luayaohuo_yaohuo")	
end,
--on_effect=function(self,effect)
	
--end
}

luayaohuo_vs=sgs.CreateViewAsSkill{
name="luayaohuo_vs",
n=1,
view_filter=function(self, selected, to_select)
	return (#selected==0) and (to_select:getSuit()==sgs.Card_Club) and not to_select:isEquipped()
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_luayaohuo_card=luayaohuo_card:clone()
	for var=1,#cards,1 do
		a_luayaohuo_card:addSubcard(cards[var])
	end	
	a_luayaohuo_card:setSkillName(self:objectName())
	return a_luayaohuo_card
end,
enabled_at_play=function()
	--return not sgs.Self:hasFlag("luayaohuo_used")
	return true
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luayaohuo_trs=sgs.CreateTriggerSkill{
name="luayaohuo_trs",
view_as_skill=luayaohuo_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if player:getMark("@luayaohuo_yaohuo")~=1 then return false end
		if player:getPhase()==sgs.Player_Draw then
			local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(club):(.*)")
			judge.who=player
			judge.reason=self:objectName()
			room:judge(judge)
			if not judge:isGood() then
				selfplayer:drawCards(2)--已修改为摸两张，之语，增强
				return true
			end
		elseif player:getPhase()==sgs.Player_Finish then
			player:loseMark("@luayaohuo_yaohuo")
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--深闱
luashw_dts=sgs.CreateDistanceSkill{
name= "luashw_dts$",
correct_func=function(self,from,to)
	if from:hasSkill(self:objectName()) then
		if(not from:hasLordSkill("luashw_dts")) then return 0 end
		local otherplayers=from:getSiblings()
		local x=0
		for _,p in sgs.qlist(otherplayers) do
			if p:getKingdom()=="qun" then x=x+1 end				
		end		
		if from:getKingdom()=="qun" then x=x+1 end
		return 0-x
	end
end
}
--远见
LUAYuanJian_card = sgs.CreateSkillCard{
	name="LUAYuanJian",
	target_fixed=true,
	on_use=function(self,room,source,targets)
		if source:isAlive() then
			room:throwCard(self)
			room:drawCards(source,self:subcardsLength())
		end
	end,
}
LUAYuanJianVS=sgs.CreateViewAsSkill{
	name="LUAYuanJianVS",
	n=998,
	view_filter=function(self,selected,to_select)
		return sgs.Self:hasFlag("LUAYuanJianCard:"..to_select:getId())
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local new_card=LUAYuanJian_card:clone()
		local i=0
		local card=nil
		while i<#cards do
			i=i+1
			card=cards[i]
			new_card:addSubcard(card:getId())
		end
		new_card:setSkillName("LUAYuanJian")
		return new_card
	end,
	enabled_at_play=function()
		return false
	end,
	enabled_at_response=function(self,player,pattern)
		return pattern=="@LUAYuanJian"
	end,
}
LUAYuanJian=sgs.CreateTriggerSkill{
	name="LUAYuanJian",
	events={sgs.CardGot,sgs.PhaseChange,sgs.CardDrawnDone},
	priority=-1,
	view_as_skill=LUAYuanJianVS,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if event==sgs.PhaseChange then
			if player:getPhase()==sgs.Player_Draw then
				--player:speak("phase")
				room:setPlayerFlag(player,"LUAYuanJianusing")
				room:askForUseCard(player,"@LUAYuanJian","LUAYuanJian")
			end
			return false
		end
		if player:getPhase()~=sgs.Player_Draw then return false end
		if player:hasFlag("LUAYuanJianusing") then return false end
		local id=0
		local str=""
		if event==sgs.CardDrawnDone then
			--player:speak("drawndone")
			local x=data:toInt()
			local hnum=player:getHandcardNum()--手牌数
			for var=1,x,1 do
				id=player:handCards():at(hnum-var)
				str="LUAYuanJianCard:"..id
				--player:speak(str)
				room:setPlayerFlag(player,str)
			end
		end
		if event==sgs.CardGot then
			--player:speak("got")
			local move=data:toCardMove()
			local id=move.card_id
			if not sgs.Sanguosha:getCard(id):isVirtualCard() then
				for _,id_t in sgs.qlist(sgs.Sanguosha:getCard(id):getSubcards()) do
					str="LUAYuanJianCard:"..id
					--player:speak(str)
					room:setPlayerFlag(player,str)
				end
			end
		end
	end,
}
--安居
luaaj_trs=sgs.CreateTriggerSkill{
name="luaaj_trs",
--view_as_skill=!!_vs,
events={sgs.DamageForseen},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
    local room=player:getRoom() 
    local selfplayer=room:findPlayerBySkillName(self:objectName())
    local otherplayers=room:getOtherPlayers(selfplayer)
    --local effect=data:toCardEffect()
    if event==sgs.DamageForseen then
        local damage=data:toDamage()
            if damage.card and damage.card:isBlack() then
                if player:getHandcardNum()<=damage.from:getAttackRange() then
                         room:playSkillEffect("luaaj_trs")
                         return true
                 end
             end
    end 
end,
--can_trigger=function(self, player)
--local room=player:getRoom()
--local selfplayer=room:findPlayerBySkillName(self:objectName())
--if selfplayer==nil then return false end
--return selfplayer:isAlive()
--end
}
--逐鹿
luazhl_card=sgs.CreateSkillCard{
name="luazhl_effect",
target_fixed=false,
will_throw=true,
on_use=function(self,room,source,targets)
    room:throwCard(self)
	local target=targets[1]
	effect=sgs.CardEffectStruct()
	effect.card=self
	effect.from=source
	effect.to=target
	room:cardEffect(effect)
	room:setPlayerFlag(source,"luazhl_used")
    room:playSkillEffect("luazhl_vs")--修复音效 之语
end,
on_effect=function(self,effect)
	local room=effect.from:getRoom()
	room:swapSeat(effect.from,effect.to)
	room:setPlayerFlag(effect.to,"luazhl_target")
end
}

luazhl_vs=sgs.CreateViewAsSkill{
name="luazhl_vs",
n=1,
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped()
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	local a_luazhl_card=luazhl_card:clone()
	for var=1,#cards,1 do
		a_luazhl_card:addSubcard(cards[var])
	end	
	a_luazhl_card:setSkillName(self:objectName())
	return a_luazhl_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luazhl_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}

luazhl_trs=sgs.CreateTriggerSkill{
name="#luazhl_trs",
view_as_skill=luazhl_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if not player:hasFlag("luazhl_used") then return false end
		if player:getPhase()==sgs.Player_Finish then
			for _,p in sgs.qlist(otherplayers) do
				if p:hasFlag("luazhl_target") then
					room:swapSeat(player,p)
					return false
				end				
			end
		end
	end	
end,
}
--巫术
luawsh_trs=sgs.CreateTriggerSkill{
name="luawsh_trs",
--view_as_skill=!!_vs,
events={sgs.Damaged,sgs.PhaseChange},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damaged then
		local damage=data:toDamage()
		if not damage.to:hasSkill(self:objectName()) then return false end
		if damage.from then
			damage.from:gainMark("@luawsh_wushu",damage.damage)
			room:playSkillEffect("luawsh_trs")	
		end
	elseif event==sgs.PhaseChange then
		if player:getPhase()==sgs.Player_Start then
			--player:speak(("%d"):format(player:getMark("@luawsh_wushu")))
			for _,p in sgs.qlist(room:getOtherPlayers(player)) do
				--p:speak(("%d"):format(p:getMark("@luawsh_wushu")))
				if p:getMark("@luawsh_wushu")>=player:getMark("@luawsh_wushu") then return false end			
			end
			player:loseAllMarks("@luawsh_wushu")
			player:skip(sgs.Player_Draw)
			player:skip(sgs.Player_Play)
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--劫掠
luajielue_trs=sgs.CreateTriggerSkill{
name="luajielue_trs$",
--view_as_skill=!!_vs,
events={sgs.Damage},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damage then
		if not selfplayer:hasLordSkill(self:objectName()) then return false end
		local damage=data:toDamage()
		if damage.to:isAllNude() then return false end
		if damage.from and damage.from:getKingdom()=="qun" and not damage.from:hasSkill(self:objectName()) then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:playSkillEffect("luajielue_trs")	
			local id=room:askForCardChosen(selfplayer,damage.to,"hej",self:objectName())
			if room:getCardPlace(id)==sgs.Player_Hand then
				room:moveCardTo(sgs.Sanguosha:getCard(id),selfplayer,sgs.Player_Hand,false)
			else
				room:obtainCard(selfplayer,id)
			end
		end		
		
	end
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}
--针神
luazhenshen_trs=sgs.CreateTriggerSkill{
name="luazhenshen_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if player:getPhase()==sgs.Player_Start then
			while true do
				if (room:askForSkillInvoke(player,self:objectName(),data)~=true) then return false end
				room:playSkillEffect("luazhenshen_trs")
				local judge=sgs.JudgeStruct()
				judge.pattern=sgs.QRegExp("(.*):(heart|diamond):(.*)")
				judge.who=player
				judge.reason=self:objectName()
				room:judge(judge)
				if judge:isGood() then					
				else
					return false
				end
				local pc=room:askForPlayerChosen(player,room:getAlivePlayers(),self:objectName())
				if pc~=nil then
					room:setPlayerProperty(pc,"chained",sgs.QVariant(not pc:isChained()))
					if not pc:isChained() and pc:isWounded() then
						local recover = sgs.RecoverStruct()  
						recover.recover = 1  
						recover.who = player   --source
						recover.card = nil
						room:recover(pc,recover)
					end
				end
			end
		end
	end
end,
--can_trigger=function(self, player)
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
--end
}
--红泪
luahonglei_trs=sgs.CreateTriggerSkill{
name="luahonglei_trs",
--view_as_skill=!!_vs,
events=sgs.Death,--{sgs.CardUsed,sgs.CardResponsed,sgs.Death},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
--	if event==sgs.Death then
		--player:speak("death")
		if not player:hasSkill(self:objectName()) then return false end
		--player:speak("self death")
		local damage=data:toDamageStar()
		if damage.from and damage.from:isAlive() then
			--room:setPlayerMark(damage.from,"luahonglei_mark",1)
			--damage.from:gainMark("@luahonglei_honglei")
			local from=damage.from
			str=".|heart,diamond|.|."
			from:jilei(str)
			from:invoke("jilei",str)
			room:acquireSkill(from,"LuaHongLeiTR")
			--damage.from:speak("hl target")
		end
--[[	elseif event==sgs.CardUsed then
		local use=data:toCardUse()
		if use.from:getMark("@luahonglei_honglei")>0 then
			if use.card:isRed() then room:throwCard(use.card) use.from:speak("used") return true end
		end
	elseif event==sgs.CardResponsed then
		local cd=data:toCard()
		if player:getMark("@luahonglei_honglei")>0 then
			if cd:isRed() then player:speak("responsed") return true end
		end
	end]]
end,
can_trigger=function(self, player)
	return true
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
end
}
--红泪
LuaHongLeiTR=sgs.CreateTriggerSkill{--红泪buff by sunny
	name="LuaHongLeiTR",
	events=sgs.PhaseChange,--阶段改变时发动
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if player:getPhase()==sgs.Player_Discard then
			str="."
		else
			str=".|heart,diamond|.|."
		end
		player:jilei(str)
		player:invoke("jilei",str)
		room:setPlayerFlag(player,"jilei")
	end,
}
local skill=sgs.Sanguosha:getSkill("LuaHongLeiTR")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(LuaHongLeiTR)
	sgs.Sanguosha:addSkills(skillList)
end
sgs.LoadTranslationTable{
	["LuaHongLeiTR"]="红泪效果",
	[":LuaHongLeiTR"]="你不可以使用，装备或者打出红色牌。",
}

--拒援
luajuyuan=sgs.CreateTriggerSkill{
 name = "luajuyuan",
 frequency = sgs.Skill_Compulsory,
 events = {sgs.AskForPeaches},
 priority=3,
can_trigger = function()
  return true
 end,
 on_trigger=function(self,event,player,data)
  local room = player:getRoom()
  local dying = data:toDying() 
  local selfplayer=room:findPlayerBySkillName(self:objectName())
  if not dying.who:hasSkill(self:objectName()) then return false end
  if event==sgs.AskForPeaches and not (player:hasSkill(self:objectName()))then
		return true
		end
 end,
}

luajuyuan2=sgs.CreateTriggerSkill{--还是拒援
 name = "#luajuyuan",
 frequency = sgs.Skill_Compulsory,
 events = {sgs.AskForPeaches},
 on_trigger=function(self,event,player,data)
  local room = player:getRoom()
  local dying = data:toDying()
  if dying.who:hasSkill(self:objectName()) then return false end
  if event==sgs.AskForPeaches and player:hasSkill(self:objectName())then
		return true
		end
 end,
}
--刚猛
luagangmeng=sgs.CreateTriggerSkill{
 name = "luagangmeng",--刚猛
 frequency = sgs.Skill_Compulsory,
 events = {sgs.DamageDone,sgs.Damage},
 --can_trigger = function()
  --return true
 --end,
 on_trigger = function(self,event,player,data)
  local room=player:getRoom()
  local damage = data:toDamage()
  if event==sgs.Damage and (damage.from:hasSkill(self:objectName()))then
   damage.from:drawCards(1)
   room:playSkillEffect("luagangmeng")
  end
 end,
}
--飞刀
feidaoscard=sgs.CreateSkillCard{--技能卡
	name="feidaoscard",
	target_fixed=false,
    will_throw=false,
	filter = function(self, targets, to_select)--目标过滤
		if #targets > 0  then return false end--只能选一个目标                
		if to_select:objectName() == sgs.Self:objectName() then return false end--排除自己                
		--if to_select:hasSkill("kongcheng") and to_select:isKongcheng() then return false end--排除空城诸葛
		if not sgs.Self:canSlash(to_select,false) then return false end--检测杀的合法性
		if to_select:hasSkill("luajx_prs") and to_select:getHp()==1 then return false end--排除龙凤后传【九锡】司马昭--飞刀技能修复：之语
		return true
	end,
	--on_effect=function(self,effect)
	on_use=function(self,room,source,targets)
	room:setPlayerFlag(source,"feidaosUsing")
		--local target = effect.to                
		--local room = target:getRoom()                
		--room:throwCard(self)--弃掉这张卡
		room:moveCardTo(self,targets[1],sgs.Player_Hand,true)--卡片转移
		local newslash=sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)--克隆一张杀
		newslash:setSkillName("feidaos")--设置这张杀是由feidaos生成的
		local use=sgs.CardUseStruct()--准备使用这张杀
		use.card=newslash--更改原来的卡牌
		use.from=source
		use.to:append(targets[1])
		room:useCard(use,false)--false指不计入杀的次数限制
		room:setPlayerFlag(source,"-feidaosUsing")
	end,
}
feidaos=sgs.CreateViewAsSkill{
	name="feidaos",
	n=1,--一次一张牌
	view_filter=function(self,selected,to_select)
		return to_select:inherits("Weapon")
	end,
	view_as=function(self,cards)
		if #cards==1 then
			acard=feidaoscard:clone()--复制一张卡的效果
			acard:addSubcard(cards[1])--？？
			acard:setSkillName(self:objectName())--？？
			return acard--返回一张新卡
		end
	end,
	enabled_at_play=function(self,player)
		--return sgs.Self:getSlashCount()<1
		--return not sgs.Self:hasFlag("feidaosUsing")
		return not sgs.Self:hasUsed("#feidaoscard")
	end,
}
feidaostr=sgs.CreateTriggerSkill{
	name="#feidaostr",
	view_as_skill=feidaos,
	events=sgs.SlashProceed,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if event==sgs.SlashProceed then
			local effect=data:toSlashEffect()
			if effect.from:hasFlag("feidaosUsing") then
				room:slashResult(effect,nil)--结算杀中了，然后无效原来的
				return true
				--return false
			end
		end
	end,
}
--蛮血
LUAManXie=sgs.CreateTriggerSkill{--触发技
	name="LUAManXie",
	events=sgs.PhaseChange,--阶段改变时发动
	frequency=sgs.Skill_Wake,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if player:getMark("@LUAManXieWaked")>0 then return false end--没有标记，不可使用技能
		if player:getPhase()==sgs.Player_Start then--出牌阶段
			local range=player:getAttackRange()
			local hp=player:getHp()
			if hp<=range then
				local log1=sgs.LogMessage()
				log1.type="$LUAManXie"
				log1.from=player
				room:sendLog(log1)
				room:loseMaxHp(player)--最大体力值-1
				room:acquireSkill(player,"lieren") --添加技能
				player:gainMark("@LUAManXieWaked",1)
			end
		end
		return false
	end,
}
--蛮族
LUAManZu=sgs.CreateTriggerSkill{
	name="LUAManZu",
	events=sgs.CardEffected,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local card=data:toCardEffect().card--记录使用的卡
		local room=player:getRoom()--获取房间
		if not card:inherits("SavageAssault") then return false end--卡片种类不符则不发动
		local log1=sgs.LogMessage()
		log1.type="$LUAManZu"
		log1.from=player
		room:sendLog(log1)
		room:playSkillEffect("LUAManZu")
		return true--卡片无效	
	end,
}

luamanzu_prs=sgs.CreateProhibitSkill{ 
name = "luamanzu_prs",
is_prohibited=function(self,from,to,card)
    if to:hasSkill(self:objectName()) then
        return card:inherits("SavageAssault")
    end
end,
}
--从军
LUACongJun=sgs.CreateTriggerSkill{
	name="LUACongJun",
	events=sgs.SlashMissed,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		local effect=data:toSlashEffect()
		local to=effect.to
		local from=effect.from
		for _,theplayer in sgs.qlist(room:getOtherPlayers(player)) do--循环，逐一检视所有角色
			if theplayer:hasSkill("LUACongJun") and theplayer:canSlash(to) then
				local card=room:askForCard(theplayer,"slash","askforLUACongJun",data)
				if card then
					local use=sgs.CardUseStruct()
					use.card=card
					use.from=theplayer
					use.to:append(to)
					room:playSkillEffect("LUACongJun")
					room:useCard(use,false)
				end
			end
		end	
	end,
	can_trigger=function(self,player)
		return player and player:isAlive()--重载cantrigger，不是自己也能用（相当于略去hasskill）
	end,
}
--认父
LUARenFu=sgs.CreateTriggerSkill{
	name="LUARenFu",
	events={sgs.Death,sgs.GameStart},
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()--获取房间
		if event==sgs.GameStart then
			if not player:hasSkill(self:objectName()) then return false end
			for _,theplayer in sgs.qlist(room:getOtherPlayers(player)) do--循环，逐一检视所有角色
				if theplayer:hasSkill("wusheng") then room:acquireSkill(player,"wusheng") end
				if theplayer:hasSkill("wushen") then room:acquireSkill(player,"wushen") end
			end
			return false
		end
		--player:speak("dddd")
		local a=false
		local b=false
		for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
			if theplayer:isAlive() then
				--theplayer:speak("check")
				if theplayer:hasSkill("wusheng") and not theplayer:hasSkill(self:objectName()) then a=true end
				if theplayer:hasSkill("wushen") and not theplayer:hasSkill(self:objectName()) then b=true end
			end
		end
		if not a then
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
				if theplayer:hasSkill(self:objectName()) then room:detachSkillFromPlayer(theplayer,"wusheng") end
			end
		end
		if not b then
			for _,theplayer in sgs.qlist(room:getAllPlayers()) do--循环，逐一检视所有角色
				if theplayer:hasSkill(self:objectName()) then room:detachSkillFromPlayer(theplayer,"wushen") end
			end
		end
		return false
	end,
	can_trigger=function(self,player)
		return true
	end,
}
--祈禳
luaqirang = sgs.CreateViewAsSkill{
	name = "luaqirang",
	n = 2,
	
	enabled_at_play = function()
		return not sgs.Self:hasFlag("luaqirangused") 
	end,

	view_filter = function(self, selected, to_select)
		return to_select:getSuit() == sgs.Card_Heart and not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards==0 then return nil end	
		if #cards == 2 then
			local new_card =sgs.Sanguosha:cloneCard("amazing_grace", sgs.Card_NoSuit, 0)
			new_card:addSubcard(cards[1])	
		    new_card:addSubcard(cards[2])
			new_card:setSkillName(self:objectName())			
			sgs.Self:setFlags("luaqirangused")
			return new_card
		end
	end
}
--遁世
luadunshi=sgs.CreateTriggerSkill{
	name="luadunshi",
	events={sgs.HpChanged, sgs.PhaseChange, sgs.GameStart},
	priority=2,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local x = player:getHp()
		local CanInvoke = false
		if x >2 then
			room:acquireSkill(player,"jizhi")
			room:detachSkillFromPlayer(player,"guanxing")
			room:detachSkillFromPlayer(player,"bazhen")
			room:playSkillEffect("luadunshi")
			elseif x ==2 then
			room:acquireSkill(player,"guanxing")
			room:detachSkillFromPlayer(player,"jizhi")
			room:detachSkillFromPlayer(player,"bazhen")
			elseif x <2 then
			room:acquireSkill(player,"bazhen")
			room:detachSkillFromPlayer(player,"guanxing")
			room:detachSkillFromPlayer(player,"jizhi")
			end
			return
	end
}
--姻缘
LuaYinYuanCard=sgs.CreateSkillCard{--技能卡
	name="LuaYinYuanCard",
	will_throw=true,
	filter=function(self,targets,to_select,player)
		return to_select:getGeneral():isMale() and #targets==0
	end,
	on_use=function(self,room,source,targets)
		room:setPlayerFlag(source,"LuaYinYuanUsed")
		local card=nil
		local suitnum={0,0,0,0}--记录选择的各花色数，suitnum[x]表示花色不小于x的牌数目，suitnum[1]就是总数，花色是可以用数字表达的，0代表黑桃
		local cdid=0
		local cards=self:getSubcards()
		local target=targets[1]--从目标角色数组中把目标提取出来
		local t=true
		local count=0
		local newcard=LuaYinYuanCard:clone()
		local suitstr=""
		while t and cards:length()>0 do
			t=nil
			room:fillAG(cards,target)--填充ag界面
			room:playSkillEffect("LuaYinYuan")
			cdid=room:askForAG(target,cards,true,"LuaYinYuan")
			target:invoke("clearAG")
			if cdid==-1 then break end--不再选牌返回的是-1
			cards:removeOne(cdid)--从ag列表中去除
			local card=sgs.Sanguosha:getCard(cdid)
			newcard:addSubcard(card)--加到这张牌中，以便被获得
			x=card:getSuit()--花色
			local suitstr=card:getSuitString()--获取花色字符串
			local pattern=".|"..suitstr.."|."--基本牌，锦囊牌，对应花色
			t=room:askForCard(target,pattern,"请用一张相同花色的牌与之交换（由于【姻缘】）")--询问给牌
			if t then
			    newcard:addSubcard(card)
				room:moveCardTo(t,source,sgs.Player_Hand,true)--卡片转移
				count=count+1
			end
		end
		if count==0 then
			local damagex=sgs.DamageStruct()--创建新的伤害结构体
			damagex.damage=1--点数
			damagex.from=source--来源是自己
			damagex.to=target--伤害对象
			room:damage(damagex)--执行伤害
		else
			room:moveCardTo(newcard,target,sgs.Player_Hand,true)--卡片转移
		end
	end,
}

LuaYinYuan=sgs.CreateViewAsSkill{
	name="LuaYinYuan",
	n=998,
	view_filter=function(self,selected,to_select)
		if to_select:isEquipped() then return false end
		return true 
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local acard=LuaYinYuanCard:clone()--复制一张卡的效果
		for var=1,#cards,1 do--将所有选中的牌加入仁德技能牌的Subcards     
			acard:addSubcard(cards[var])
		end
		return acard
	end,
	enabled_at_play=function(self,player)
		return not sgs.Self:hasFlag("LuaYinYuanUsed")
	end,
}
--招亲
LuaZhaoQinCard=sgs.CreateSkillCard{
	name="LuaZhaoQinCard",
	target_fixed=true,--应该是不用选对象
	on_use=function(self,room,source,targets)
		local player=source
		player:loseAllMarks("@LuaZhaoQin")--丢失标记
		room:playSkillEffect("LuaZhaoQin")
		local bignumber=0
		local smallnumber=14
		local bigplayer=nil
		local smallplayer=nil
		for _,p in sgs.qlist(room:getOtherPlayers(source)) do--循环，逐一检视其它角色
			if p:isAlive() and p:getGeneral():isMale() and not p:isKongcheng() then--未死，有牌
				local carda=room:askForCardShow(p,p,"LuaZhaoQin")
				local number=carda:getNumber()
				if number>=bignumber then
					bignumber=number
					bigplayer=p
				end
				if number<smallnumber then
					smallnumber=number
					smallplayer=p
				end
				self:addSubcard(carda)
			end
		end
		room:throwCard(self)
		local recover=sgs.RecoverStruct()
		recover.recover=1
		recover.who=player
		room:recover(player,recover)--回复
		if bigplayer then room:recover(bigplayer,recover) end--回复
		if smallplayer then
			local damagex=sgs.DamageStruct()--创建新的伤害结构体
			damagex.damage=1--点数
			damagex.to=smallplayer--伤害对象
			room:damage(damagex)--执行伤害
		end
	end,
}
LuaZhaoQin=sgs.CreateViewAsSkill{
	name="LuaZhaoQin",
	view_as=function()
		acard=LuaZhaoQinCard:clone()--复制一张卡的效果
		return acard--返回一张新卡
	end,
	enabled_at_play=function()
		return sgs.Self:getMark("@LuaZhaoQin")==1
	end,
}
LuaZhaoQinTR=sgs.CreateTriggerSkill{
	name="#LuaZhaoQinTR",
	events=sgs.GameStart,--阶段改变时发动，开始时加标记
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		player:gainMark("@LuaZhaoQin",1)--获得一枚标记（技能未使用）
		return false
	end,
}
--倾国 by ibicdlcod, 
qingguos = sgs.CreateViewAsSkill{
	name = "qingguos",
	n = 1,
	
	view_filter = function(self, selected, to_select)
		return to_select:isBlack() and not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local new_card = sgs.Sanguosha:cloneCard("jink", card:getSuit(), card:getNumber())
			new_card:addSubcard(card:getId())
			new_card:setSkillName(self:objectName())
			return new_card
		end
	end,
	
	enabled_at_play = function()
		return false
	end,
	
	enabled_at_response = function(self, player, pattern)
		return pattern == "jink"
	end
}
--辅君 by sunny
LuaFuJun=sgs.CreateTriggerSkill{
	name="LuaFuJun",
	events=sgs.Damaged,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if room:askForSkillInvoke(player,"LuaFuJun",data) then
			local judge=sgs.JudgeStruct()
			judge.pattern=sgs.QRegExp("(.*):(heart):(.*)")
			judge.good=false
			judge.reason=self:objectName()
			judge.who=player
			room:judge(judge)
			if judge:isGood() then
				local current=room:getCurrent()
				local thread=room:getThread()
				current:play(current:getPhases())
					room:playSkillEffect("LuaFuJun")
				while true do
					current=current:getNextAlive()
					current:gainAnExtraTurn(current)
				end
			end
		end
	end,
}
--内助 by sunny
LuaNeiZhuCard=sgs.CreateSkillCard{
	name="LuaNeiZhuCard",
	on_use=function(self,room,source,targets)
		local t=targets[1]--从目标角色数组中把目标提取出来
		room:moveCardTo(self,t,sgs.Player_Hand,true)--卡片转移
		room:playSkillEffect("LuaNeiZhu")
	end,
}
LuaNeiZhuVS=sgs.CreateViewAsSkill{
	name="LuaNeiZhuVS",
	n=1,
	view_filter=function(self,selected,to_select)
		return not to_select:isEquipped()
	end,
	view_as=function(self,cards)
		if #cards==0 then return nil end
		local acard=LuaNeiZhuCard:clone()
		acard:addSubcard(cards[1])
		return acard
	end,
	enabled_at_play=function()
		return false
	end,
	enabled_at_response=function(self,player,pattern) 
		return pattern=="#LuaNeiZhuCard"
	end
}
LuaNeiZhu=sgs.CreateTriggerSkill{
	name="LuaNeiZhu",
	view_as_skill=LuaNeiZhuVS,
	events=sgs.Predamaged,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		if not player:isKongcheng() then room:askForUseCard(player,"#LuaNeiZhuCard","askgvw") end
	end,
}
--节俭
jiejians = sgs.CreateTriggerSkill
 {
         name = "jiejians",
         events = {sgs.CardDiscarded},
         frequency = sgs.Skill_Compulsory,
         can_trigger = function(self, player)
                 return not player:hasSkill(self:objectName())
         end,
         on_trigger = function(self, event, player, data)
                 local room = player:getRoom()
                 local owner = room:findPlayerBySkillName(self:objectName())
                 if not owner then return false end
                 if player:getPhase() == sgs.Player_Discard then
                         local card_star = data:toCard()
                         local card_ids = {}
                         for _, id in sgs.qlist(card_star:getSubcards()) do
                                 table.insert(card_ids, id)
                         end
                         if #card_ids == 0 or #card_ids <= owner:getHandcardNum() then return false end
                         local card_id = table.concat(card_ids, "+")
                         room:setTag("JiejianList", sgs.QVariant(card_id))
						 room:playSkillEffect("jiejians")
                 end
         end                
}
 
jiejians_invoke = sgs.CreateTriggerSkill
 {
         name = "#jiejians_invoke",
         events = {sgs.PhaseChange},
         priority = -2,
         can_trigger = function(self, player)
                 return not player:hasSkill("jiejians")
         end,
         on_trigger = function(self, event, player, data)
                 local room = player:getRoom()
                 local owner = room:findPlayerBySkillName("jiejians")
                 if not owner or player:isDead() then return false end
                 local jiejian_list = room:getTag("JiejianList"):toString()
                 room:removeTag("JiejianList")
                 if jiejian_list == "" then return false end
                 jiejian_list = jiejian_list:split("+")
                 local to_gain = sgs.IntList()
                 local guzheng = false
                 for _, id in ipairs (jiejian_list) do
                         if room:getCardPlace(id) == sgs.Player_DiscardedPile then
                                 to_gain:append(id)
                         else
                                 guzheng = true
                         end
                 end
                 --if to_gain:length() == 0 and guzheng then room:getCurrent():turnOver() end
                 if to_gain:length() == 0 then return false end
                 if room:askForChoice(owner, "jiejians", "to_gain+to_turnover") == "to_gain" then
                         room:fillAG(to_gain, owner)
                         local card_id = room:askForAG(owner, to_gain, false, "jiejians")
                         room:moveCardTo(sgs.Sanguosha:getCard(card_id), owner, sgs.Player_Hand, true)
                         owner:invoke("clearAG")
                 else
                         room:getCurrent():turnOver()
                 end                
        end                
}
--退守 by 之语
tstmp={}
tuishouvs = sgs.CreateViewAsSkill
{
	name = "tuishouvs",
	n = 1,
	
	view_filter = function(self, selected, to_select)
		return not to_select:isEquipped()
	end,
	
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local ts_card = sgs.Sanguosha:cloneCard(tstmp[1], cards[1]:getSuit(), cards[1]:getNumber())
			ts_card:addSubcard(cards[1])
			ts_card:setSkillName(self:objectName())
			return ts_card
		end
	end,
	
	enabled_at_play = function() 
		tstmp[1] = "slash"
		return sgs.Self:getHandcardNum()==1 and ((sgs.Self:canSlashWithoutCrossbow()) or (sgs.Self:getWeapon() and sgs.Self:getWeapon():className() == "Crossbow"))
	end,
	
	enabled_at_response = function(self, player, pattern)
		if(pattern == "jink") or (pattern == "slash") then 
			tstmp[1] = pattern
			return sgs.Self:getHandcardNum()==1
		end
	end,
}
LuaTuiShouTR=sgs.CreateTriggerSkill{--记录需求的技能，为了AI。 by sunny
	name="#LuaTuiShouTR",
	events=sgs.CardAsked,
	frequency=sgs.Skill_Compulsory,
	on_trigger=function(self,event,player,data)
		local room=player:getRoom()
		local str=data:toString()
		room:setPlayerFlag(player,"-LuaTuiShouJink")
		room:setPlayerFlag(player,"-LuaTuiShouSlash")
		if str=="jink" then room:setPlayerFlag(player,"LuaTuiShouJink") end
		if str=="slash" then room:setPlayerFlag(player,"LuaTuiShouSlash") end
	end,
}

--尽瘁 by 之语
jincuits = sgs.CreateTriggerSkill{
	name = "jincuits",
	events = {sgs.CardLost},
	priority=5,--防止暂时移动到判定区的牌出现变动
	frequency = sgs.Skill_NotFrequent,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local move = data:toCardMove()
		local e = player:getEquips():length()
		local em=0
		if player:isKongcheng() and e>0 and move.from_place == sgs.Player_Hand then   --若空了城、有装备、且从手里被拿走的
			if room:askForSkillInvoke(player, self:objectName()) == true then
				local choice
				local target
				if e==4 then
				    room:playSkillEffect("jincuits")
					choice = room:askForChoice(player, "jincuits", "a+b+c+d")
				elseif e==3 then
				    room:playSkillEffect("jincuits")
					choice = room:askForChoice(player, "jincuits", "a+b+c")
				elseif e==2 then
				    room:playSkillEffect("jincuits")
					choice = room:askForChoice(player, "jincuits", "a+b")
				else
					--choice = room:askForChoice(player, "jincuits", "a")
					room:playSkillEffect("jincuits")
					choice = "a"
				end
				if(choice == "a")then
					local card_id = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Special, true)--暂时移动到判定区

					em=em+1
					targets=room:getOtherPlayers(player)
					if sgs.Sanguosha:getCard(card_id):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					if targets:length()>0 then
						target=room:askForPlayerChosen(player,targets,"jincuits")--选择玩家
						room:moveCardTo(sgs.Sanguosha:getCard(card_id), target, sgs.Player_Equip, true)--装上
					else
						room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Equip, true)--否则移动回来
					end
					
				elseif(choice == "b")then
					local card_id = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
					targets=room:getOtherPlayers(player)
					if sgs.Sanguosha:getCard(card_id):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id2 = room:askForCardChosen(player, player, "e", "jincuits")
										room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Special, true)--暂时移动到判定区

					em=em+1
					if sgs.Sanguosha:getCard(card_id2):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					if targets:length()>0 then
					target=room:askForPlayerChosen(player,targets,"jincuits")--选择玩家
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id2), target, sgs.Player_Equip, true)--装上
					else
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Equip, true)--
					end
					
				elseif(choice == "c")then
					local card_id = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
					targets=room:getOtherPlayers(player)
					if sgs.Sanguosha:getCard(card_id):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id2 = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
					if sgs.Sanguosha:getCard(card_id2):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id3 = room:askForCardChosen(player, player, "e", "jincuits")
										room:moveCardTo(sgs.Sanguosha:getCard(card_id3), player, sgs.Player_Special, true)--暂时移动到判定区

					em=em+1
					if sgs.Sanguosha:getCard(card_id3):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					if targets:length()>0 then
					target=room:askForPlayerChosen(player,targets,"jincuits")--选择玩家
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id2), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id3), target, sgs.Player_Equip, true)--装上
					else
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id3), player, sgs.Player_Equip, true)--
					end
					
				elseif(choice == "d")then
					local card_id = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
										targets=room:getOtherPlayers(player)

					if sgs.Sanguosha:getCard(card_id):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id2 = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
					if sgs.Sanguosha:getCard(card_id2):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id2):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id3 = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id3), player, sgs.Player_Special, true)--暂时移动到判定区
					em=em+1
					if sgs.Sanguosha:getCard(card_id3):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id3):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					local card_id4 = room:askForCardChosen(player, player, "e", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(card_id4), player, sgs.Player_Special, true)--暂时移动到判定区

					em=em+1
					if sgs.Sanguosha:getCard(card_id4):inherits("Weapon") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getWeapon()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id4):inherits("Armor") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getArmor()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id4):inherits("OffensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getOffensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					elseif sgs.Sanguosha:getCard(card_id4):inherits("DefensiveHorse") then
						for _,p in sgs.qlist(room:getOtherPlayers(player)) do
							if p:getDefensiveHorse()~=nil then 
								targets:removeOne(p) 
							end 
						end
					end
					if targets:length()>0 then
					target=room:askForPlayerChosen(player,targets,"jincuits")--选择玩家
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id2), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id3), target, sgs.Player_Equip, true)--装上
					room:moveCardTo(sgs.Sanguosha:getCard(card_id4), target, sgs.Player_Equip, true)--装上
					else
					room:moveCardTo(sgs.Sanguosha:getCard(card_id), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id2), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id3), player, sgs.Player_Equip, true)--
						room:moveCardTo(sgs.Sanguosha:getCard(card_id4), player, sgs.Player_Equip, true)--
					end
				end
					
					
				if targets:length()>0 and target:getHandcardNum()>(em+em) then
					local n=0
					while n<(em+em) do
					local huode = room:askForCardChosen(player, target, "h", "jincuits")
					room:moveCardTo(sgs.Sanguosha:getCard(huode),player, sgs.Player_Hand, false)
					n=n+1
					end
				elseif targets:length()>0 then
					local handcards = target:getHandcards()
					local x = target:getHandcardNum()
					for _,cd in sgs.qlist(handcards) do
						room:moveCardTo(cd, player, sgs.Player_Hand, false)--false是不展示
					end
					local value = sgs.QVariant()
					value:setValue(target)
				else 
					return false
					
				end
			else
				return false
			end	
		end	
	end,
}
--远虑
yuanlu = sgs.CreateTriggerSkill{
	name = "yuanlu",
	events = sgs.Pindian,
	
	can_trigger = function(self, player)
		return true
	end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local skillowner = room:findPlayerBySkillName(self:objectName())
		if not skillowner then return false end

		local pindian = data:toPindian()
		if pindian.from:getSeat() == skillowner:getSeat() or 
        pindian.to:getSeat() == skillowner:getSeat() then 
      return 
    end
		if not skillowner:askForSkillInvoke(self:objectName()) then return false end

    room:playSkillEffect("yuanlu")

		local choices = {pindian.from:getGeneralName(), pindian.to:getGeneralName()}
		
		local log = sgs.LogMessage()
		log.type = "$SiJL_bLog_from"
		log.from = pindian.from
		log.to:append(pindian.to)
		log.card_str = pindian.from_card:getEffectIdString()
		room:sendLog(log)
		log.type = "$SiJL_bLog_to"
		log.from = skillowner
		log.card_str = pindian.to_card:getEffectIdString()
		room:sendLog(log)
		room:playSkillEffect("SiJL_b")
		
		local choice = room:askForChoice(skillowner, self:objectName(), table.concat(choices, "+"))
		local new_card = room:askForCard(skillowner, ".", "@yuanlu_card")
		if not new_card then return false end
		
		local target = skillowner
		
		if choice == pindian.from:getGeneralName() then
			target = pindian.from
			local old_card = pindian.from_card
			pindian.from_card = new_card
			room:moveCardTo(new_card, nil, sgs.Player_Special, true)
			room:moveCardTo(old_card, skillowner, sgs.Player_Hand, true)
		else
			target = pindian.to
			local old_card = pindian.to_card
			pindian.to_card = new_card
			room:moveCardTo(new_card, nil, sgs.Player_Special, true)
			room:moveCardTo(old_card, skillowner, sgs.Player_Hand, true)
		end
		
		local log2 = sgs.LogMessage()
		log2.tpye = "$SiJL_bLog"
		log2.from = skillowner
		log2.to:append(target)
		log2.card_str = new_card:getEffectIdString()
		room:sendLog(log)
		
		data:setValue(pindian)
		return false
end,
}

-- 姻利
yinli2= sgs.CreateTriggerSkill{
	name = "yinli2",
	events = {sgs.CardLost},
  priority = 3, -- 必须大于连营的优先级.

	can_trigger = function(self, target)
    return not target:hasSkill("yinli2") and
      target:isAlive() and target:getGender() == sgs.General_Male
	end,

	on_trigger=function(self, event, player, data)
    local room = player:getRoom()
    local move = data:toCardMove()
		local me = room:findPlayerBySkillName("yinli2")

    if not me:isAlive() then return end

    if player:isKongcheng() and
      move.from_place == sgs.Player_Hand and
      room:askForSkillInvoke(me, "yinli2") then

      room:playSkillEffect("yinli2")

      local choice 
      if player:isWounded() then
        choice = room:askForChoice(me, "yinli2", "yinli2_recover+yinli2_draw")
      else
        choice = "yinli2_draw"
      end

      if choice == "yinli2_recover" then
        local recover = sgs.RecoverStruct()			
        recover.recover = 1
        recover.who = player
        room:recover(player, recover)
      else
        me:drawCards(1)
      end
    end
  end
}

-- 红殇
hongshang2 = sgs.CreateTriggerSkill{
  name = "hongshang2",
  events = {sgs.CardEffected},
  priority = 2,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local effect = data:toCardEffect()
    local card = effect.card
    local from = effect.from
    local to = effect.to

    -- 自己回合
    if player:getPhase() ~= sgs.Player_NotActive then return end

    -- 桃
    if card:inherits("Peach") then return end

    if (card:isRed() and 
        not player:isNude()) then

      local targets = sgs.SPlayerList()
      local all_targets = room:getOtherPlayers(player)
      all_targets:removeOne(from)
      for _, p in sgs.qlist(all_targets) do
        if from:isProhibited(p, card) then
          -- pass
        elseif (card:inherits("Snatch") or card:inherits("Dismantlement")) and
          p:isAllNude() then
          -- pass
        elseif card:inherits("FireAttack") and p:isKongcheng() then
          -- pass
        elseif card:inherits("GodSalvation") and not p:isWounded() then
          -- pass
        else
          targets:append(p)
        end
      end

      if targets:isEmpty() then
        return false
      end

      if room:askForSkillInvoke(player, "hongshang2") then
        room:playSkillEffect("hongshang2")

        room:askForDiscard(player, "hongshang2", 1, 1, false, true)
        local target = room:askForPlayerChosen(player, targets, "hongshang2")
      
        local log = sgs.LogMessage()
        log.type = "#hongshang2"
        log.from = player
        log.to:append(target)
        room:sendLog(log)

        if card:inherits("GlobalEffect") or card:inherits("AOE") then
          local effect = sgs.CardEffectStruct()
          effect.card = card
          effect.from = from
          effect.to = target

          room:cardEffect(effect)
        else
          local use = sgs.CardUseStruct()
          use.card = card
          use.from = from
          use.to:append(target)

          room:useCard(use)
        end

        return true
      end
    end
  end,
}

--追袭
zhuixi = sgs.CreateViewAsSkill{
  name = "zhuixi",
  n = 2,

  view_filter = function(self, selectd, to_select)
    return to_select:inherits("Slash")
  end,

  view_as = function(self, cards)
    if #cards == 2 then
      local acard = sgs.Sanguosha:cloneCard("slash", sgs.Card_NoSuit, 0)
      acard:setSkillName("zhuixi")
      acard:addSubcard(cards[1])
      acard:addSubcard(cards[2])

      return acard
    end
  end,

  enabled_at_play = function(self, player)
    return (player:canSlashWithoutCrossbow() or 
      player:hasWeapon("crossbow"))
  end,

	enabled_at_response = function(self, player, pattern)
		return pattern == "@@zhuixi"
	end  
}

zhuixi_trigger = sgs.CreateTriggerSkill{
  name = "#zhuixi_trigger",
	events = {sgs.SlashProceed},
  frequency = sgs.Skill_NotFrequent,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local effect = data:toSlashEffect()

    if (effect.slash:getSkillName() == "zhuixi") then
      room:playSkillEffect("zhuixi")

      local jink, jink1, jink2
      jink1 = room:askForCard(effect.to, "jink", "@zhuixi-slash-1:"..player:objectName(), data)
      if (jink1) then
        jink2 = room:askForCard(effect.to, "jink", "@zhuixi-slash-2:"..player:objectName(), data)
      end
      if (jink1 and jink2) then
        jink = sgs.Sanguosha:cloneCard("jink", sgs.Card_NoSuit, 0)
				jink:addSubcard(jink1)
				jink:addSubcard(jink2)
				a = room:slashResult(effect, jink)
      end

      room:slashResult(effect, jink) 
      return true -- 取消默认结算
    end
  end
}

-- 借刀杀人使用追袭
zhuixi_trigger2 = sgs.CreateTriggerSkill{
  name = "#zhuixi_trigger2",
  events = {sgs.CardEffected},
  frequency = sgs.Skill_NotFrequent,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local effect = data:toCardEffect()
    local card = effect.card
    local from = effect.from
    local to = effect.to

    if card:inherits("Collateral") then
      local prompt = string.format("@zhuixi-collateral:%s:%s", 
        from:objectName(), to:objectName())

      if room:isCanceled(effect) then
        return true
      end

      if (room:askForUseCard(player, "@@zhuixi", prompt)) then
        room:playSkillEffect("zhuixi")
      else
        card:onEffect(effect)
      end

      return true
    end
  end
}

--宛马
wanma = sgs.CreateTriggerSkill{
  name = "wanma",
  events = {sgs.Predamage},
  frequency = sgs.Skill_Compulsory,
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()
    local damage = data:toDamage()

    if (player:getOffensiveHorse() and
        damage.card:inherits("Slash")) then 
      room:playSkillEffect("wanma")

      damage.damage = damage.damage + 1 
      data:setValue(damage)
    end
  end
}
--斗智
douzhi_choices = "snatch+dismantlement+duel+fire_attack+iron_chain"
douzhi = sgs.CreateViewAsSkill{
  name = "douzhi",
  n = 1,

  view_filter = function(self, selected, to_select)
    return true
    --[[
    return #selected < 1 and
      not to_select:isEquipped() and
      (to_select:inherits("Snatch") or 
      to_select:inherits("Dismantlement") or
      to_select:inherits("Duel") or
      to_select:inherits("FireAttack") or
      to_select:inherits("IronChain"))
      --]]
  end,

  view_as = function(self, cards)
    if #cards == 1 then
      local card = cards[1]
      local acard = douzhi_card:clone()
      acard:setSkillName("douzhi")
      acard:setUserString(tostring(card:getId()))

      return acard
    end
  end,
}

douzhi_card = sgs.CreateSkillCard{
  name = "douzhi",
  target_fixed = false,
  will_throw = true,

  filter = function(self, targets, to_select, player) 
    return true
    --[[
    local card_id = tonumber(string.match(self:toString(), ":(%d+)$"))
    local card = sgs.Sanguosha:getCard(card_id)

    return #targets < 1 and
      to_select:objectName() ~= player:objectName() and
      not player:isProhibited(to_select, card) and 
      not ((card:inherits("Snatch") or card:inherits("Dismantlement")) and to_select:isAllNude()) and
      not (card:inherits("FireAttack") and p:isKongcheng())
      --]]
  end,

  on_effect = function(self, effect)
    local from = effect.from
    local to = effect.to
    local room = to:getRoom()
    local card_id = tonumber(string.match(self:toString(), ":(%d+)$"))
    local card = sgs.Sanguosha:getCard(card_id)

    room:throwCard(card)
    room:playSkillEffect("douzhi")

    local log = sgs.LogMessage()
    log.type = "#douzhi"
    log.from = player
    log.to:append(to)
    room:sendLog(log)

    local choice = room:askForChoice(to, "douzhi", douzhi_choices)

    local log = sgs.LogMessage()
    log.type = "#douzhi_result"
    log.from = player
    log.to:append(to)
    log.arg = card:objectName()
    log.arg2 = choice
    room:sendLog(log)

    if choice == card:objectName() then
      local log = sgs.LogMessage()
      log.type = "#douzhi_yes"
      log.from = player
      log.to:append(to)
      room:sendLog(log)

    else
      local log = sgs.LogMessage()
      log.type = "#douzhi_no"
      log.from = player
      log.to:append(to)
      room:sendLog(log)

      local new_general 
      if to:getGender() == sgs.General_Female then new_general="sujiangf" else new_general="sujiang" end

      local skills = {}
      if not to:hasFlag("douzhi") then
        for _, skill in sgs.qlist(to:getVisibleSkillList()) do
          --if skill:getLocation() == sgs.Skill_Right then
            table.insert(skills, skill:objectName())
            room:detachSkillFromPlayer(to, skill:objectName())
          --end
        end

        to:gainMark("@duanchang");
        room:setPlayerFlag(to, "douzhi")
        tag_name = "douzhi_" .. to:getGeneralName()
        room:setTag(tag_name, sgs.QVariant(table.concat(skills, "+")))
      end

      local use = sgs.CardUseStruct() use.card = card
      use.from = from
      use.to:append(to)

      room:useCard(use)
    end
  end,
}

douzhi_trigger = sgs.CreateTriggerSkill{
  name = "#douzhi_trigger",
  events = {sgs.PhaseChange},
  
  on_trigger = function(self, event, player, data)
    local room = player:getRoom()

    if player:getPhase() == sgs.Player_Finish then
      for _,p in sgs.qlist(room:getOtherPlayers(player)) do
        if p:hasFlag("douzhi") then
          local tag_name = "douzhi_" .. p:getGeneralName()
          skill_str = room:getTag(tag_name):toString()
          for _, skill_name in ipairs(skill_str:split("+")) do
            local skill = sgs.Sanguosha:getSkill(skill_name)
            if skill:isLordSkill() and not p:isLord() then
              -- pass
            else
              room:acquireSkill(p, skill_name, true)
            end
          end
          room:removeTag(tag_name)
          p:loseAllMarks("@duanchang")
        end
      end
    end
  end,
}
--破锁
posuo = sgs.CreateViewAsSkill{
  name = "posuo",
  n = 1,

  view_filter = function(self, selected, to_select)
    return not to_select:isEquipped()
  end,

  view_as = function(self, cards)
    if #cards == 1 then
      local card = cards[1]
      local acard = posuo_card:clone()
      acard:addSubcard(card)
      acard:setSkillName("posuo")

      return acard
    end
  end,
}

posuo_card = sgs.CreateSkillCard{
  name = "posuo",
  target_fixed = false,
  will_throw = true,

  filter = function(self, targets, to_select, player) 
    return #targets < 2
  end,

  on_effect = function(self, effect)
    local from = effect.from
    local to = effect.to
    local room = to:getRoom()

    local iron_chain = sgs.Sanguosha:cloneCard("iron_chain", sgs.Card_NoSuit, 0)
    --[[
    duel:setCancelable(false)  -- 没用. TrickCard#setCancelable
    local use = sgs.CardUseStruct()
    use.from = from
    use.to:append(to)
    use.card = duel
    room:useCard(use)
    --]]
    local effect = sgs.CardEffectStruct()
    effect.from = from
    effect.to = to
    effect.card = iron_chain
    room:cardEffect(effect) -- 权宜之计

    local chained_count = 0
    local kingdoms = {}
    for _, p in sgs.qlist(room:getAlivePlayers()) do
      kingdoms[p:getKingdom()] = true
      if p:isChained() then
        chained_count = chained_count + 1
      end
    end
    local kingdom_count = 0
    for k in pairs(kingdoms) do
      kingdom_count = kingdom_count + 1
    end
    if chained_count >= kingdom_count then
      local damage = sgs.DamageStruct()
      damage.damage = 1
      damage.nature = sgs.DamageStruct_Fire
      damage.to = from
      room:damage(damage)
    end
  end
}  
--自缚
zhifuslashcard = sgs.CreateSkillCard
{   name = "zhifuslashcard",	
	filter = function(self,targets,to_select,player)
		if #targets>=player:getMark("zhifu") then return false	
		else return to_select:getSeat()~=player:getSeat() end
	end,
	on_use=function(self,room,player,targets)
	if #targets==0 then return end
			local slash =sgs.Sanguosha:cloneCard("slash",sgs.Card_NoSuit,0)
			slash:setSkillName("zhifu")
			for var=1,#targets,1 do
			local use=sgs.CardUseStruct()
			use.card=slash
			use.from=player
			use.to:append(targets[var])
			room:useCard(use,true)	
			end
	room:setPlayerMark(player,"zhifu",0)
end,
}

zhifu_card = sgs.CreateSkillCard
{   name = "zhifu_card",	
	target_fixed = true,
	on_use=function(self,room,player,targets)
			room:showAllCards(player,nil)
			for _,card in sgs.qlist(player:getHandcards()) do
				if card:inherits("Jink") then
				room:setPlayerMark(player,"zhifu",player:getMark("zhifu")+1)
				room:throwCard(card,player)
				end
			end
end,
}

zhifuvs=sgs.CreateViewAsSkill{
	name="zhifuvs",
	view_as = function(self, cards)	
		if sgs.Self:getMark("zhifu")>0 then return zhifuslashcard:clone()
		else return zhifu_card:clone()	end	
	end,	
	enabled_at_play=function(self,player,pattern)
		return  sgs.Sanguosha:cloneCard("slash",sgs.Card_NoSuit,0):isAvailable(player) and player:canSlashWithoutCrossbow()
	end,
		enabled_at_response=function(self,player,pattern)
		return pattern=="@@zhifu"
	end,
}
zhifu=sgs.CreateTriggerSkill
{
	name="zhifu",
	events={sgs.CardLost},
	view_as_skill=zhifuvs,
	on_trigger=function(self,event,player,data)	 
		local room = player:getRoom()
        local move = data:toCardMove()		
		local card = sgs.Sanguosha:getCard(move.card_id)	
		if card:inherits("Jink") and player:getMark("zhifu")>0 and #getCards("Jink",player)==0 then 
		room:askForUseCard(player,"@@zhifu","@askforzhifu")
		room:playSkillEffect("zhifu")
		end
	end
}

--夏侯懋
--luaxhm:addSkill(xiahoumaols)
--luaxhm:addSkill(luaskillzhsh_vs)
--luaxhm:addSkill(luaxj_trs)
--曹姬
--luacj:addSkill(caojils)
--luacj:addSkill(luajr_trs)
--luacj:addSkill(luazg_trs)
--花鬘
--HuaMan:addSkill(LUAFeiDao)
luahm:addSkill(huamanls)
luahm:addSkill(feidaos)
luahm:addSkill(feidaostr)
luahm:addSkill(LUAManXie)
luahm:addSkill(luamanzu_prs)
--太史昭容
--luatshzhr:addSkill(taishizhaorongls)
--luatshzhr:addSkill(luatj_trs)
local skill=sgs.Sanguosha:getSkill("#mianyijineng")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(mianyijineng)
	sgs.Sanguosha:addSkills(skillList)
end
local skill=sgs.Sanguosha:getSkill("luayl_trs")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(luayl_trs)
	sgs.Sanguosha:addSkills(skillList)
end
--luatshzhr:addSkill(luafzh_trs)
--诸葛恪
luazhgk:addSkill(zhugekels)
luazhgk:addSkill(luayc_trs)
luazhgk:addSkill(luaycslash)
--luazhgk:addSkill(luaqb_fts)
luazhgk:addSkill(luaqb_vs)
--司马昭
--luasmzh:addSkill(simazhaols)
--luasmzh:addSkill(luatsh_trs)
local skill=sgs.Sanguosha:getSkill("luazhq_fts")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(luazhq_fts)
	sgs.Sanguosha:addSkills(skillList)
end
--luasmzh:addSkill(luazhq_trs)
--luasmzh:addSkill(luajx_prs)
--luasmzh:addSkill(luajxs_trs)
--王元姬
luawyj:addSkill(wangyuanjils)
luawyj:addSkill(luahb_trs)
luawyj:addSkill(luazhw_trs)
--文鸳
local skill=sgs.Sanguosha:getSkill("luaby_slash_vs")
if not skill then
	local skillList=sgs.SkillList()
	skillList:append(luaby_slash_vs)
	sgs.Sanguosha:addSkills(skillList)
end
luawenyuan:addSkill(wenyuanls)
luawenyuan:addSkill(luaby_trs)
--luawenyuan:addSkill(luajunmei_trs)
luawenyuan:addSkill(juanmeis)
--文鸯
luawenyang:addSkill(wenyangls)
luawenyang:addSkill(luashg_trs)
--赵广
luazhg:addSkill(zhaoguangls)
luazhg:addSkill(luajt_trs)
--马云禄
--SP马云禄
luamyl:addSkill(mayunluls)
luamyl:addSkill(luarzh_trs)
--luamyl:addSkill(lualy_trs)

--luaspmyl:addSkill(spmayunluls)
--luaspmyl:addSkill("luarzh_trs")
--luaspmyl:addSkill("lualy_trs")
--辛宪英
--luaxxy:addSkill(xinxianyingls)
--luaxxy:addSkill(LUAYuanJian)
--luaxxy:addSkill(luaaj_trs)
--羊祜
luayh:addSkill(yanghuls)
luayh:addSkill("tuntian")
luayh:addSkill("#tuntian-get")
luayh:addSkill(luabx_trs)
--郭女王
LuaGuoNvWang:addSkill(guonvwangls)
LuaGuoNvWang:addSkill(LuaNeiZhu)
LuaGuoNvWang:addSkill(LuaFuJun)
LuaGuoNvWang:addSkill(jiejians_invoke)
LuaGuoNvWang:addSkill(jiejians)
--薛灵芸
--luaxly:addSkill(xuelingyunls)
--luaxly:addSkill(luazhenshen_trs)
--luaxly:addSkill(luahonglei_trs)
--张星彩
luazhxc:addSkill(zhangxingcails)
luazhxc:addSkill(luashx_trs)
luazhxc:addSkill(luaja_vs)
--孙鲁班孙鲁育
--luaslb:addSkill(sunlubanls)
--luaslb:addSkill(luawy_vs)
--luaslb:addSkill(luast_vs)
--吕玲绮
luallq:addSkill(lvlingqils)
luallq:addSkill(luajch_trs)
luallq:addSkill(luajm_trs)
luallq:addSkill(luahn_trs)
--王双
--luawangshuang:addSkill(wangshuangls)
--luawangshuang:addSkill(zhuixi)
--luawangshuang:addSkill(zhuixi_trigger)
--luawangshuang:addSkill(wanma)
--luawangshuang:addSkill(zhuixi_trigger2)
--带来洞主
--dailaidongzhu:addSkill(dailaidongzhuls)
--dailaidongzhu:addSkill(zhifu)
--dailaidongzhu:addSkill("luamanzu_prs")



sgs.LoadTranslationTable{
["dp"]="龙凤后传",
["luacj"]="曹姬",
["#luacj"] = "清河公主",
["designer:luacj"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luacj"]="英雄杀",
	["luajr_trs"]="浸润",
	[":luajr_trs"]="每当你受到一点伤害，可以进行二选一：选择一名手牌数不大于其体力的其他角色，你与其各摸一张牌；选择一名手牌数大于其体力的角色，将其武将牌翻面。",
	["jr_choice1"]="选择一名手牌不大于其体力的其他角色，你与其各摸一张牌。",
	["jr_choice2"]="选择一名手牌大于其体力的角色，将其武将牌翻面。",
	["luazg_trs"]="谮构",
	[":luazg_trs"]="每当有人受到【杀】的伤害时，你可以弃一张牌，选择一名角色作为其伤害来源。",
    ["illustrator:luacj"] = "插图：KOEI，PS：廉贞星君",
["luagf"]="关凤",
["#luagf"] = "关三小姐",
["designer:luagf"]="廉贞星君丨lwx19911226，晴儿雨儿",
["cv:luagf"]="三国志",
	["luajg_vs"]="巾帼",
	[":luajg_vs"]="你可以将红色的【杀】当作【决斗】使用。",
	["luayp_trs"]="银屏",
	[":luayp_trs"]="当你用【闪】抵消黑色的【杀】时，你可以摸两张牌。",
	["illustrator:luagf"] = "插图:三国群英OL丨PS:廉贞星君",
["luallq"]="吕玲绮",
["#luallq"] = "名将之后",
["designer:luallq"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luallq"]="三国志",
	["luajch_trs"]="疾驰",
	[":luajch_trs"]="摸牌阶段，你可以选择只摸一张牌，若如此做，你在回合结束阶段摸一张牌。",
	["luajm_trs"]="将门",
	[":luajm_trs"]="<b>觉醒技</b>，回合开始阶段，若你的体力值不大于2点，你须减1点体力上限，永久获得技能【无双】。",
	["luahn_trs"]="虎女",
	[":luahn_trs"]="当你使用的【杀】是最后的手牌时，可为其指定一个目标（无视距离）\n★丈八蛇矛效果亦有效。",
	["illustrator:luallq"] = "插图:KOEI丨PS:廉贞星君",
["luamyl"]="马云禄",
["#luamyl"] = "扬威将军",
["#luaspmyl"] = "扬威将军",
["designer:luamyl"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luamyl"]="英雄杀",
["luaspmyl"]="SP马云禄",
["designer:luaspmyl"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luaspmyl"]="英雄杀",
	["luarzh_trs"]="戎装",
	[":luarzh_trs"]="你使用【杀或决斗】时可弃置目标区域内一张牌。",
	["@luarzh_red"]="对方使用了【戎装】，请打出一张锦囊牌来抵消她的【杀】。",
	["rzh_choice1"]="弃置目标两张牌",
	["rzh_choice2"]="造成伤害",
	["lualy_trs"]="良姻",
	[":lualy_trs"]="游戏开始时，你可以选择发动【良姻】，势力变为【蜀】；或不发动【良姻】，势力变为【群】。",
	["illustrator:luamyl"] = "插图：宇峻画廊，PS：廉贞星君",
	["illustrator:luaspmyl"] = "插图:不详丨PS:廉贞星君",
["luazhxc"]="张星彩",
["#luazhxc"] = "如意儿媳",
["designer:luazhxc"]="廉贞星君丨lwx19911226，晴儿雨儿",
["cv:luazhxc"]="英雄杀",
	["luashx_trs"]="甚贤",
	[":luashx_trs"]="回合开始阶段，你可令一名其他角色与你各摸一张牌。",
	["luaja_vs"]="敬哀",
	[":luaja_vs"]="出牌阶段，你可以弃掉一张红桃锦囊牌或是自减一点体力，选择场上一名已受伤的角色回复一点体力，每回合限一次。",
	["illustrator:luazhxc"] = "插图:KOEI丨PS:廉贞星君",
["luazhg"]="赵广",
["#luazhg"] = "牙门将军",
["designer:luazhg"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luazhg"]="英雄杀",
	["luajt_trs"]="椒图",
	[":luajt_trs"]="回合外，你每出一张【杀】，在结算前，可以令你攻击范围内的一名角色打出一张【杀】，若不能，你对其造成一点伤害。你每出一张【闪】，在结算前，可以令你攻击范围内的一名角色打出一张【闪】，若不能，你对其造成一点伤害。\n★响应【仁德】的杀亦有效。",
	["#luajt1"]="因为【椒图】的效果，请打出一张【杀】",
	["#luajt2"]="因为【椒图】的效果，请打出一张【闪】",
	["illustrator:luazhg"] = "插图:KOEI丨PS:廉贞星君",
["luazhgk"]="诸葛恪",
["#luazhgk"] = "弱冠都尉",
["designer:luazhgk"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luazhgk"]="官方，三国志",
	["luayc_trs"]="英才",
	[":luayc_trs"]="摸牌阶段，你可以多摸两张牌，若如此做，你在本回合出牌阶段不能使用【杀】。\n★可以使用杀响应你发起的决斗。",
	["luaqb_vs"]="奇兵",
	[":luaqb_vs"]="出牌阶段，你可以将一张红色的【杀】对任意其他目标使用，无距离限制，无视目标防具。",
	["luaqb_effect"]="奇兵",
	["illustrator:luazhgk"] = "插图:KOEI丨PS:廉贞星君",
["luaxhm"]="夏侯懋",
["#luaxhm"] = "魏王驸马",
["designer:luaxhm"]="廉贞星君丨lwx19911226，高达一号",
["cv:luaxhm"]="英雄杀",
["@luaxj_trs"] = "由于【蓄伎】，你已展示所有红桃手牌，且红桃手牌将不参与弃牌阶段，不能被弃置也不会计数。",
	["luaskillzhsh"]="治生",
	[":luaskillzhsh"]="出牌阶段，你可以将至多X+1（至少1）张手牌，交给其他一名角色，然后展示牌堆顶你所交出的牌数的2倍张牌，并获得其中所有红色牌，每回合限用一次，X为你已损失的体力值。",
	["luaxj_trs"]="蓄伎",
	[":luaxj_trs"]="<b>锁定技</b>，弃牌阶段，你需展示所有红桃手牌，它们不参与手牌数计算，也不参与弃牌。",
	["illustrator:luaxhm"] = "插图:热血三国丨PS:廉贞星君",
["luaslb"]="孙鲁班&孙鲁育",
["#luaslb"] = "吴氏姐妹",
["designer:luaslb"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luaslb"]="官方，西游杀",
	["luawy_vs"]="诬言",
	[":luawy_vs"]="出牌阶段，你可以选择一名其他角色拼点，若你赢，在目标角色攻击范围内，由你指定的另一名角色必须弃两张牌或受到你对其造成的一点伤害；若你没赢，对方获得你的拼点牌，每回合限用一次。",
	["luast_vs"]="私通",
	[":luast_vs"]="出牌阶段，你可以选择一名异性角色，你们的手牌差不能超过X（X为你已损失的体力值），你们交换所有手牌。每阶段限一次。",
	["illustrator:luaslb"] = "插图:俊西JUNC丨PS:廉贞星君",
["luawyj"]="王元姬",
["#luawyj"] = "文明皇后",
["designer:luawyj"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luawyj"]="英雄杀",
	["luahb_trs"]="花卜",
	[":luahb_trs"]="任意一名角色判定前，你可以观看牌堆顶X+1张牌，并以任意顺序置于牌堆顶或牌堆底，X为你已损失的体力值，每阶段限一次。★即使某个判定阶段有多个判定需要，也仅能发动一次。\n★参与【洛神】的判定时，也仅能发动一次。",
	["luazhw_trs"]="中闱",
	[":luazhw_trs"]="在回合外，每当你成为锦囊的目标时，你可以摸一张牌。",
	["illustrator:luawyj"] = "插图:KOEI丨PS:廉贞星君",
["luatshzhr"]="太史昭容",
["#luatshzhr"] = "笃烈之女",
["designer:luatshzhr"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luatshzhr"]="官方，英雄杀",
	["luatj_trs"]="天骄",
	[":luatj_trs"]="出牌阶段开始前，你可以与一名角色拼点，若你赢，你可以获得对方一张牌；若你没赢，此出牌阶段【杀】和非延时锦囊对对方无效。",
	["luafzh_trs"]="父志",
	[":luafzh_trs"]="<b>觉醒技</b>，当你处于濒死状态时，你须恢复1体力，然后自减1点体力上限，并永久获得技能【义理】：你的拼点牌结算时点数+3（超过K时视为K）。",
	["luayl_trs"]="义理",
	[":luayl_trs"]="<b>锁定技</b>，你的拼点牌结算时点数+3（超过K时视为K）",
	["illustrator:luatshzhr"] = "插图:霸者无双丨PS:廉贞星君",
["luawenyang"]="文鸯",
["#luawenyang"] = "东夷校尉",
["#luawenyuan"] = "将军夫人",
["designer:luawenyang"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luawenyang"]="英雄杀",
	["luashg_trs"]="绝尘",
	[":luashg_trs"]="你造成伤害时，可以先弃置对方X+1张牌（X为你已损失体力值），然后再结算伤害。\n★一旦发动，必须弃满此数，不可中途取消。",
	["#juechentip"] = "%from 对 %to 造成了伤害！！！",
	["illustrator:luawenyang"] = "插图：三国志大战，PS：廉贞星君",
["luawenyuan"]="文鸳",
["designer:luawenyuan"]="廉贞星君丨之语，潇潇蒙蒙",
["cv:luawenyuan"]="官方（妙妙），英雄杀",
	["luaby_trs"]="比翼",
	["biyisha"]="你可以为你的同伴出一张杀",
	["biyishan"]="你可以为你的同伴出一张闪",
	[":luaby_trs"]="回合开始阶段，你可以选择一名男性角色，你和其进入比翼状态：他可以替你使用或打出【杀】，你可以替他使用或打出【闪】，并且每次响应【比翼】后，你二人各摸一张牌。比翼状态在你回合开始前解除。\n★技能栏【比翼杀】的作用:在你回合内需要使用或打出【杀】时，可以点此发动【比翼】。",
	["luaby_slash_vs"]="比翼杀",
	["luaby_slash_effect"]="比翼杀",
	["illustrator:luawenyuan"] = "插图:心在焚烧丨PS:廉贞星君",
	["juanmeis"]="隽美",
	[":juanmeis"]="任何时候，你可以将两张手牌当作【闪】使用或打出。",
    ["@luaby_biyi"] = "比翼（你可以替同伴打出一张杀(闪)）",
["luayh"]="羊祜",
["#luayh"] = "美髯儒将",
["designer:luayh"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luayh"]="官方，英雄杀",
	["luabx_trs"]="博学",
	[":luabx_trs"]="出牌阶段开始前，你可以从【田】中获得至多X+1张牌（X为你已损失体力值）。",	
	["illustrator:luayh"] = "插图:六筒丨PS:廉贞星君",
["luasmzh"]="司马昭",
["#luasmzh"] = "灭蜀晋王",
["designer:luasmzh"]="廉贞星君丨lwx19911226，之语",
["cv:luasmzh"]="英雄杀",
	["luatsh_trs"]="天时",
	[":luatsh_trs"]="回合开始阶段，你可以进行一次判定。根据结果执行以下效果：<font color=\"red\"><b>♥</b></font>本回合火属性伤害+1；<font color=\"blue\"><b>♣</b></font>本回合雷属性伤害+1；<font color=\"blue\"><b>♠</b></font>本回合所有伤害视为体力流失；<font color=\"red\"><b>♦</b></font>你将武将牌翻面。",
	["luazhq_trs"]="专权",
	[":luazhq_trs"]="出牌阶段限一次，你可以将武将牌翻面，然后声明一种基本牌（【杀】、【雷杀】、【火杀】、【闪】、【桃】、【酒】）和一种花色，本回合所有合理位置与该花色相同的牌，都锁定视为该基本牌。\n★合理位置：所有角色的手牌区，牌堆里的牌。",
	["luazhq_effect"]="专权",
	["luazhq_fts"]="专权",
	[":luazhq_fts"]="<b>锁定技</b>，本回合你所有对应花色手牌视为对应基本牌",
	["luajx_prs"]="九锡",
	[":luajx_prs"]="<b>锁定技</b>，你体力值为1时不能成为【杀】的目标。",
	["illustrator:luasmzh"] = "插图:KOEI丨PS:廉贞星君",
["luabmh"]="卑弥呼",
["#luabmh"] = "亲魏倭王",
["designer:luabmh"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luabmh"]="英雄杀",
	["luawm_trs"]="妩媚",
	[":luawm_trs"]="<b>锁定技</b>，你的手牌上限始终同你的体力上限。",	
	["luayaohuo_trs"]="妖惑",
	[":luayaohuo_trs"]="出牌阶段，你可以弃置一张草花手牌，并令一名与你距离为1以内的男性角色获得一枚指示物【妖惑】：其在摸牌阶段开始前需要进行判定，若不为草花，则你摸两张牌，其跳过摸牌阶段。其回合结束后，弃置该指示物。\n★没有每阶段一次的限制。",
	["luashw_dts"]="深闱",
	[":luashw_dts"]="<b>主公技</b>，<b>锁定技</b>，场上每有一名群雄势力存活，你计算与其他角色距离时-1。",
	["illustrator:luabmh"] = "插图:不详丨PS:廉贞星君",
["luaxxy"]="辛宪英",
["#luaxxy"] = "咏絮之才",
["designer:luaxxy"]="廉贞星君丨lwx19911226，晴儿雨儿",
["cv:luaxxy"]="英雄杀",
	["LUAYuanJian"]="远见",
	[":LUAYuanJian"]="摸牌阶段结束时，你可以将摸牌阶段得到的牌任意数量弃置，并摸等量的牌，每回合仅限一次。",
	["luaaj_trs"]="安居",
	[":luaaj_trs"]="<b>锁定技</b>，当你受到黑色的牌造成的伤害时，若你的手牌数不大于伤害来源的攻击范围，则其对你造成的伤害无效。\n★技能操作要求较高，请自己注意是否会受到伤害，以免浪费手牌。",
	["illustrator:luaxxy"] = "插图:三国群英OL丨PS:廉贞星君",
["luakq"]="孔雀",
["#luakq"] = "楼兰女王",
["designer:luakq"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luakq"]="西游杀，英雄杀",	
	["luazhl_vs"]="逐鹿",
		["luazhl_vs"]="逐鹿",
	["luazhl_effect"]="逐鹿",
	[":luazhl_vs"]="出牌阶段，你可以弃一张手牌，与一名角色交换位置，回合结束阶段换回。每阶段限用一次。",
	["luawsh_trs"]="巫术",
	[":luawsh_trs"]="<b>锁定技</b>，任意角色每对你造成一点伤害，获得一个【巫术】标记。当前【巫术】标记最多的一名角色（须仅有一名角色满足）的回合开始阶段，其弃置所有【巫术】标记，并跳过摸牌阶段和出牌阶段。",	
	["luajielue_trs"]="劫掠",
	[":luajielue_trs"]="<b>主公技</b>，每当其他群雄角色造成伤害时，你可以从伤害目标处（含判定区）获得一张牌。",
	["illustrator:luakq"] = "插图:PONPONPON丨PS:廉贞星君",
["luaxly"]="薜灵芸",
["#luaxly"] = "神针夜来",
["designer:luaxly"]="技能:廉贞星君丨LUA:lwx19911226",
["cv:luaxly"]="英雄杀",
	["luazhenshen_trs"]="针神",
	[":luazhenshen_trs"]="回合开始阶段，你可以进行判定，若结果为红色，你须将任意一名角色的武将牌横置或取消横置恢复一点体力。然后可以继续判定，直到出现黑色并生效或你不愿意判定了为止。",
	["luahonglei_trs"]="红泪",
	[":luahonglei_trs"]="杀死你的角色无法使用、打出、弃置（弃牌阶段除外）任意红色的牌。",
	["illustrator:luaxly"] = "插图：赤脚赛跑，PS：廉贞星君",
["lualf"]="刘封",
["#lualf"] = "尴尬义子",
["designer:lualf"]="技能:廉贞星君丨LUA:zhh9211",
["cv:lualf"]="英雄杀",
	["luajuyuan"]="拒援",
	[":luajuyuan"]="<b>锁定技</b>，当你濒死时，其他角色不能对你使用【桃】；当其他角色濒死时，你不能对其使用【桃】。",
	["luagangmeng"]="刚猛",
	[":luagangmeng"]="<b>锁定技</b>，你每造成一次伤害后，立即摸一张牌。",
	["illustrator:lualf"] = "插图:云画流年丨PS:廉贞星君",
["luahm"]="花鬘",
["#luahm"] = "南蛮奇葩",
["designer:luahm"]="廉贞星君丨晴儿雨儿，之语",
["cv:luahm"]="官方，西游杀",
	["feidaos"]="飞刀",
	[":feidaos"]="出牌阶段限一次，你可以将一张武器牌交给一名其他角色，视为你对其使用一张不能被闪避的【杀】（不计入每回合使用限制）。",
	["feidaoscard"]="飞刀",
	["LUAManXie"]="蛮血",
	["$LUAManXie"]="花鬘的体力值不大于攻击距离，满足觉醒条件",
	[":LUAManXie"]="<b>觉醒技</b>，回合开始阶段，若你的体力值不大于你的攻击距离，你须减一点体力上限，永久获得技能【烈刃】。",
	["luamanzu_prs"]="蛮族",
	[":luamanzu_prs"]="<b>锁定技</b>，你不能成为【南蛮入侵】的目标。",
	["illustrator:luahm"] = "插图:赤脚赛跑丨PS:廉贞星君",
["luabsnnew"]="鲍三娘",
["#luabsnnew"] = "女中豪杰",
["designer:luabsnnew"]="廉贞星君丨lwx19911226，晴儿雨儿",
["cv:luabsnnew"]="英雄杀",
	["LuaYinYuan"]="姻缘",
	[":LuaYinYuan"]="出牌阶段，你可以展示至少一张手牌，并选择一名男性角色，其须用相同花色的手牌与你展示的牌进行一对一的交换，若其没有依此法交换任何牌，则你对其造成一点伤害。\n★你展示的牌不止一张时，目标角色可以交换任意张，但如果小于1，则其受到伤害。",	
	["LuaZhaoQin"]="招亲",
	[":LuaZhaoQin"]="<b>限定技</b>，出牌阶段，你可以令所有手牌数不为0的男性角色进行集体拼点，点数最大的角色与你各恢复一点体力，点数最小的角色受到一点无来源的伤害（相同点数比较时，按拼点规则，后者为大）。",
	["illustrator:luabsnnew"] = "插图:翼丨PS:廉贞星君",
["luags"]="关索",
["#luags"] = "关四公子",
["designer:luags"] = "技能:廉贞星君丨LUA:晴儿雨儿",
["cv:luags"] = "英雄杀",
	["LUACongJun"]="从军",
	[":LUACongJun"]="其他角色使用的[杀]被抵消后，若抵消角色在你的攻击范围之内，你可以向其使用一张不计入回合使用限制的【杀】。",
	["LUARenFu"]="认父",
	[":LUARenFu"]="<b>关联技</b>，，场上存在关羽角色且存活时，你获得如下对应技能：关羽或SP关羽-【武圣】，神关羽-【武魂】，对应角色阵亡后技能随之消失。",
	["askforLUACongJun"] = "是否发动【从军】，对出【闪】角色追加使用一张不计入回合使用限制的【杀】。",
	["illustrator:luags"] = "插图:三国群英OL丨PS:廉贞星君",
["luazhgg"]="诸葛果",
["#luazhgg"] = "乘烟葛女",
["designer:luazhgg"]="技能:廉贞星君丨LUA:zhh9211",
["cv:luazhgg"]="西游杀",	
	["luaqirang"]="祈禳",
	[":luaqirang"]="出牌阶段，你可以将任意两张红桃手牌作为五谷丰登使用，每阶段限一次。",
	["luadunshi"]="遁世",
	[":luadunshi"]="<b>锁定技</b>，根据你当前的体力值获得以下技能（随体力变化而变化）：三点及以上-【集智】，两点-【观星】，一点-【八阵】。",
	["illustrator:luazhgg"] = "插图：倩女幽魂，PS：廉贞星君",
["zhugezhans"]="诸葛瞻",
["designer:zhugezhans"] = "技能:潇潇蒙蒙丨LUA:之语",
["cv:zhugezhans"] = "英雄杀",
["#zhugezhans"] = "武侯余荫",
["illustrator:zhugezhans"] = "插图:天地英雄丨PS:廉贞星君",
    ["tuishouvs"]="退守",
	[":tuishouvs"]="你的最后一张手牌可以当【杀】或【闪】使用或打出。",	
	["jincuits"]="尽瘁",
	[":jincuits"]="每当你失去最后的手牌时，可立即将装备区的任意X张牌置于其他一名角色的装备区里（不得替换原装备），然后你获得该角色2X张手牌（不足则全部获得）。",	
	["a"] = "1. 选择1个装备。",
	["b"] = "2. 选择2个装备。",
	["c"] = "3. 选择3个装备。",
	["d"] = "4. 选择4个装备。",	
["LuaGuoNvWang"]="郭女王",
["cv:LuaGuoNvWang"]="英雄杀，西游杀",
["designer:LuaGuoNvWang"] = "廉贞星君丨晴儿雨儿，【群】皇叔",	
["#LuaGuoNvWang"] = "文德皇后",
    ["illustrator:LuaGuoNvWang"] = "插图:三国征战丨PS:廉贞星君",
	["LuaNeiZhu"]="内助",
	["LuaNeiZhuCard"]="内助",
	[":LuaNeiZhu"]="每当你受到伤害时，你可以先将一张手牌交给除你之外的一名角色。★操作提示：发动时，需要点击【内助】技能按钮后，才能选择要给出的牌。",	
	["to_gain"]="获得一张其所弃的牌。",
	["to_turnover"]="将其武将牌翻面。",
	["askgvw"]="请点击【内助】技能，选择给出的手牌，否则点取消。",
	["jiejians"]="节俭",
	[":jiejians"]="<b>锁定技</b>，其他角色弃牌阶段结束时，若其所弃的牌大于你当前的手牌数，则你须进行二选一：获得一张其所弃的牌，或令其武将牌翻面。",
	["jiejians_invoke"]="节俭",
	["LuaNeiZhu"]="内助",
	[":LuaNeiZhu"]="每当你受到伤害时，你可以先将一张手牌交给除你之外的一名角色。",	
	["LuaFuJun"]="辅君",
	[":LuaFuJun"]="每当你受到伤害后，你可以进行一次判定，若结果不为红桃，当前阶段立即结束。",	
["sunru"] = "孙茹",
["cv:sunru"]="无",
["designer:sunru"] = "廉贞星君丨LUA：Guten 流风回雪",	
["#sunru"] = "霸王遗女",
["illustrator:sunru"] = "插图:不详丨PS:廉贞星君",
	["yuanlu"] = "远虑",
	[":yuanlu"] = "当其它两名角色进行拼点时，在其展示前，你可以以一张牌替换其中一张。",
	["@SiJL_b"]="请打出一张用于交换的牌",
	["$SiJL_bLog"] = "%from 发动了技能干预拼点,干预目标是 %to ,其拼点结果为 %card",
	["$SiJL_bLog_from"] = "%from 的拼点牌是 %card",
	["$SiJL_bLog_to"] = "%to 的拼点牌是 %card. 等待 %from 选择拼点干预目标",
	["@yuanlu_card"] = "请选择一张手牌干预拼点（替换目标拼点牌）",
	["$SiJL_b"]="洞察先机,无有不破！",
	["yinli2"] = "姻利",
	[":yinli2"] = "每当男性角色使出或失去最后一张手牌时，你可立即进行二先一：令其回复一点体力或你摸一张牌。",
	["yinli2_recover"] = "令其回复一点体力",
	["yinli2_draw"] = "你摸一张牌",
	["hongshang2"] = "红殇",
	[":hongshang2"] = "回合外每当你成为除【桃】以外红色牌的目标后，可以弃一张牌将目标改为其他角色。（不得是此红牌的使用者）。",
["luawangshuang"] = "王双",
["cv:luawangshuang"]="无",
["designer:luawangshuang"] = "廉贞星君丨LUA：Guten",	
["#luawangshuang"] = "万夫不当",
["illustrator:luawangshuang"] = "插图:天宇丨PS:廉贞星君",
    ["zhuixi"] = "追袭",
    [":zhuixi"] = "当你可以使用【杀】时，你可以一起使用两张【杀】（指定一个目标），指定目标需连续打出两张【闪】才能抵消。",
	["~zhuixi"] = "当你可以使用【杀】时，你可以一起使用两张【杀】（指定一个目标），指定目标需连续打出两张【闪】才能抵消。",
    ["@zhuixi1"] = "拥有追袭的 王双 砍你， 你必须连续使用两张【闪】。",
    ["@zhuixi2"] = "拥有追袭的 王双 砍你， 请你再使用一张【闪】。",
    ["wanma"] = "宛马",
    [":wanma"] = "<b>锁定计</b>，当你装备区里有-1马时，且你使用的【杀】造成伤害时，伤害+1。",
	["~luawangshuang"]="该死，快来救我。",
	["$zhuixi"]="挡我者死，逆我者亡！",
	["$wanma"]="去死吧！",
	["@zhuixi-slash-1"]="你需要连续打出两张【闪】。",
	["@zhuixi-slash-2"]="你还需要打出一张【闪】。",
	["@zhuixi-collateral"]="你可以使用【追袭】，操作提示：点击追袭技能然后选择两张杀牌",
	["~sunru"]="救救我...",
["duyu"] = "杜预", 
["#duyu"] = "以一当万",
["cv:duyu"]="无",
["designer:duyu"] = "廉贞星君丨LUA:Guten",	
["illustrator:duyu"] = "三国志大战",
    ["douzhi"] = "斗智",
	["$douzhi"] = "哼哼，你猜一猜。",
    [":douzhi"] = "出牌阶段，当你即将对一名其他角色（该角色是唯一的目标）使用非延时锦囊时，你可以先将锦囊牌正面朝下打出，目标角色须猜测一种锦囊牌，然后展示，若猜错，该角色失去其所有技能直到你回合结束后，若猜对，该锦囊无效并进入弃牌堆。",
    ["#douzhi"] = "%from 要求 %to 猜测一种锦囊牌",
    ["#douzhi_result"] = "%to 猜的是 %arg2，%from 用的是 %arg",
    ["#douzhi_yes"] = "%to 猜对了, 该锦囊无效了。",
    ["#douzhi_no"] = "%to 猜错了",
    ["posuo"] = "破锁",
    [":posuo"] = "出牌阶段，你可以弃一张牌，然后选择1至2名角色（可以是自己）目标角色分别将武将牌横置或取消横置，若此时场上横置角>色数达到或超过存活角色势力数，你受到一点火属性伤害无来源。 ",  
["dailaidongzhu"] = "带来洞主",
  ["#dailaidongzhu"] = "南蛮豪杰",
  ["designer:dailaidongzhu"] = "廉贞星君丨LUA:流风回雪",
  ["cv:dailaidongzhu"] = "无",
  ["illustrator:dailaidongzhu"] = "群英赋",
  ["~zhifu"]="选择至多X名目标，视为对他们使用了杀。",
	["zhifu"] = "自缚",
	["zhifu_card"] = "自缚",
	["zhifuslashcard"] = "自缚",
	["$zhifu"]="没人可以阻挡我！",
	["@askforzhifu"] = "你可以选择至多X名玩家视为对其每一位使用一张杀（X至多为你所弃置闪的数量）",
	[":zhifu"] = "出牌阶段，若你没有使用杀，可以展示所有手牌，并弃置所有闪，然后选择X名角色视为对他们名使用一张杀（X为你所弃置闪的数量）。",
	
	
--后补
	["@luawsh_wushu"] = "巫术",
	["@luayaohuo_yaohuo"] = "妖惑",
	["@LuaZhaoQin"] = "招亲绣球",
	["@LUAManXieWaked"] = "蛮血",
	["LuaZhaoQinCard"]="招亲",
	["LuaYinYuanCard"]="姻缘",
	["$yuanlu"]="要是大家能看见我有多厉害就好了。",
	["$yinli2"]="我的荣幸",
	["$hongshang2"]="你的残暴与疯狂早已击溃了你。",
	["$jiejians"]="消失在时间的洪流之中吧！",
	
["$luajr_trs"] = "哼！不怕你",
["$luazg_trs"] = "怎么这样啊！",
["$luaja_vs"] = "啊?受伤了吗？",
["$luashx_trs"] = "唯妾懂你~",
["$luajg_vs"] = "一决胜负吧~",
["$luayp_trs"] = "螳臂当车~",
["$luajch_trs"] = "冲进去~",
["$luahn_trs"] = "敢挡我？~",
["$luarzh_trs"] = "你看我是男是女？",
["$luajt_trs"] = "进可攻，退可守！",
["$luayc_trs"] = "巧变制敌，谋定而动~",
["$luaqb_vs"] = "进攻时机已到！",
["$luaskillzhsh"] = "我也不亏~",
["$luaxj_trs"] = "多多益善~",
["$luawy_vs"] = "哈~~~~~",
["$luast_vs"] = "~妹妹们不可怠慢~",
["$luahb_trs"] = "需要帮忙吗？",
["$luazhw_trs"] = "你真是大方~",
["$luatj_trs"] = "何人出战？",
["$luafzh_trs"] = "今所志未遂，奈何死乎？",
["$luashg_trs"] = "你的牌太多了~",
["$luaby_trs"] = "连理并蒂，比翼不移~",
["$juanmeis"] = "小女子有礼了~",
["$luabx_trs"] = "兵者，诡道也~",
["$luatsh_trs"] = "天命所归啊~",
["$luazhq_trs"] = "遇事当如此处置！",
["$luawm_trs"] = "那好吧~",
["$luayaohuo_trs"] = "想要牌吗~",
["$LUAYuanJian"] = "还不赖嘛~",
["$luaaj_trs"] = "谁也伤不了我~",
["$luazhl_vs"] = "换个位置换种运气~",
["$luawsh_trs"] = "快来护驾~",
["$luajielue_trs"] = "且让我戏耍一番~",
["$luazhenshen_trs"] = "六宫粉黛无颜色~",
["$luagangmeng"] = "再来~",
["$feidaos"] = "尝尝我飞刀的厉害~",
["$luamanzu_prs"] = "妖王~",
["$LuaYinYuan"] = "你们俩个谁更厉害~",
["$LuaZhaoQin"] = "比武招亲吧~",
["$LUACongJun"] = "容我来补一刀！",
["$luaqirang"] = "解八难，渡群生~",
["$luadunshi"] = "解八难，渡群生~",
["$LuaNeiZhu"] = "你好我也好~",
["$LuaFuJun"] = "想杀本夫人？哼！",
["$tuishouvs"] = "知进退，明得失~",
["$jincuits"] = "我和你拼了~",
["~luacj"]="自古红颜多薄命啊~",
["~luagf"]="再会了。",
["~luallq"]="再会了。",
["~luamyl"]="难道我被看穿了吗？",
["~luaspmyl"]="难道我被看穿了吗？",
["~luazhxc"]="何人懂我？",
["~luazhg"]="一世英明尽毁啊~",
["~luazhgk"]="一失足成千古恨啊~",
["~luaxhm"]="红颜祸水啊~",
["~luaslb"]="快逃命啊。",
["~luawyj"]="别把我一个人留在这里...",
["~luatshzhr"]="汝今势孤，命必绝矣！",
["~luawenyang"]="乱臣贼子，不可窥测神器！",
["~luawenyuan"]="天长地久有时尽，此恨绵绵无绝期~",
["~luayh"]="生遇明主，死亦无憾~",
["~luasmzh"]="知天命，尽人事~",
["~luabmh"]="结局不该如此。",
["~luaxxy"]="靠山吃山，靠水吃水~",
["~luakq"]="撤退！",
["~luaxly"]="小女子伤痛欲绝啊~",
["~lualf"]="天不佑我大汉~",
["~luahm"]="亲，我去了...",
["~luabsnnew"]="我不玩了。",
["~luags"]="报国无门啊~",
["~luazhgg"]="暂无",
["~zhugezhans"] = "今当远离，临表涕零。",
["~LuaGuoNvWang"] = "哀家不甘啊~",
["luaja_effect"] = "敬哀",
["duyuls"]="人物列传",
[":duyuls"]="<b>杜预，字元凯，京兆人，其父、祖父皆为魏功臣，羊祜死后，接替其掌荆州军务，灭吴统一战争时为西线统帅，用计离间西陵太守，引益州水师、又设计破掉沉江铁锁，直接导致了吴国灭亡。杜预其人不能拉弓、亦不会骑马，指挥战斗唯凭智慧。</b>",
["simazhaols"]="人物列传",
[":simazhaols"]="<b>司马昭，子子上，司马懿与张春华次子，妻王元姬，河内人。曹魏权臣，多有军识。263年夏，派钟会、邓艾、诸葛绪分兵三路伐蜀，同年蜀亡。后有著名成语：”司马昭之心，路人皆知。“篡逆之心昭然若揭。</b>",
["wenyuanls"]="人物列传",
[":wenyuanls"]="<b>文鸳，魏扬州刺史文钦之女，与文鸯为孪生兄妹。自小与姜维定亲。其容貌端庄秀丽，文辞藻丽，书法隽美。后随夫降蜀。</b>",
["wenyangls"]="人物列传",
[":wenyangls"]="<b>文鸯，字次骞，魏扬州刺史文钦之子，与文鸳为孪生兄妹，文钦协同毌丘俭举兵在寿春反叛，讨伐司马师。时文鸯年十八，单骑在司马师大营七进七出，邓艾为首众将皆不能挡。后文钦被诸葛诞所杀，文鸯复投司马昭，封关内侯。后因晋八王之乱牵连，被灭族。</b>",
["xiahoumaols"]="人物列传",
[":xiahoumaols"]="<b>夏侯懋，字子林，生父夏侯渊，嗣与夏侯惇为子。妻清河公主曹姬。裴松之言其：性无武略，而好治生。戍守洛阳期间，多畜伎妾，因此与清河公主不和。诸葛亮一出祁山，夏侯懋为魏国大都督，被王平生擒。</b>",
["caojils"]="人物列传",
[":caojils"]="<b>曹姬，曹操爱女，号清河公主。曹操欲嫁此女于丁仪，因曹丕劝荐，下嫁夏侯懋。后与夏侯懋不和，并以谮构之词上于魏明帝，帝未信。</b>",
["guanfengls"]="人物列传",
[":guanfengls"]="<b>关凤，《三国群英传》架空人物。历史上却有原型。孙权遣使向关羽求亲，关羽呵斥曰：虎女安能嫁犬子？《花关索传》中对其详加描写，并被改为戏剧，剧中称其为关银屏。</b>",
["mayunluls"]="人物列传",
[":mayunluls"]="<b>马云禄，周大荒《反三国志》中记载人物，马腾之女，马超之妹。自幼习武，女中无双。上门求亲者皆被其以武相羞，后遇赵云，与之结发。</b>",
["matengls"]="人物列传",
["spmayunluls"]="人物列传",
[":spmayunluls"]="<b>马云禄，周大荒《反三国志》中记载人物，马腾之女，马超之妹。自幼习武，女中无双。上门求亲者皆被其以武相羞，后遇赵云，与之结发。</b>",
["lvlingqils"]="人物列传",
[":lvlingqils"]="<b>吕玲绮，游戏《三国志》中架空人物。吕布之女。历史上却有原型。吕布与袁术曾有政治婚姻之说，未成。吕布被曹操围于下邳之时，婚事再次被提及，却被曹操、刘备所阻。吕布死后，家族迁往许昌。</b>",
["zhaoguangls"]="人物列传",
[":zhaoguangls"]="<b>赵广，赵云次子。为牙门将，后随姜维至沓中，临阵战死。</b>",
["zhugekels"]="人物列传",
[":zhugekels"]="<b>诸葛恪，字元逊，琅邪阳都人。诸葛瑾之子，诸葛亮之侄。少聪颖，以神童著称。孙权临终前为托孤大臣之首，并设下奇兵破魏三路大军，后轻敌伐魏，围攻新城不下。为掩其错，在东吴专权独断。被孙峻联合吴主孙亮设计杀害，夷三族。</b>",
["zhangxingcails"]="人物列传",
[":zhangxingcails"]="<b>张星彩，游戏《三国无双》中架空人物。张飞之女，刘禅之妻。历史上却有原型。经诸葛亮推荐曰：故车骑将军张飞之女甚贤，年十七岁，可纳为正宫皇后。史称大张后。</b>",
["wangyuanjils"]="人物列传",
[":wangyuanjils"]="<b>王元姬，王朗之孙，司马昭之妻，晋武帝司马炎生母。知书达理，贤孝俱佳，王朗曰：兴吾家者，必此女也，惜不为男矣！谥号文明皇后。</b>",
["sunlubanls"]="人物列传",
[":sunlubanls"]="<b>孙权与步练师的两个女儿，孙鲁班，字大虎，吴全公主。前配周瑜子循，后配全琮。与太子不睦，鲁班尝谮太子和子母。終令太子被废，后因通奸之罪被赐死。孙鲁育，字小虎，初嫁朱据，因就废太子一事与孙鲁班不和遭孙鲁班所害。</b>",
["yanghuls"]="人物列传",
[":yanghuls"]="<b>羊祜，字叔子，辛宪英之侄。泰山人。西晋开国元勋。博学能文，清廉正直，坐镇襄阳，都督荆州诸军事，在此广兴屯田，一改荆州缺粮的局面。荆州屯田为日后灭吴起到了至关重要的作用。</b>",
["xinxianyingls"]="人物列传",
[":xinxianyingls"]="<b>辛宪英，名不详，字宪英，生于董卓焚洛阳之时，卒于魏国亡后第二年，一生见证三国始末。素有远见卓识，预见到钟会的叛乱，使得家族未受牵连。</b>",
["xuelingyunls"]="人物列传",
[":xuelingyunls"]="<b>薛灵芸，常山人。曹丕妃子，魏文帝改其名曰夜来。妙于针工，虽处于深帷之内，不用灯烛之光，裁制立成。非夜来缝制，帝则不服，宫中号为针神。</b>",
["liufengls"]="人物列传",
[":liufengls"]="<b>刘封，刘备义子，西川平定后，刘备立刘禅为储君，排挤刘封，令其远赴边城上庸，关羽失荆州向其求援，刘封拒援，同守将孟达降魏，劝刘封随之，刘封拒从，回川。诸葛亮曰：封性刚猛，易世之后终难制御。先主遂除之。</b>",
["huamanls"]="人物列传",
[":huamanls"]="<b>花鬘，《花关索传》中记载，关索妻子之一。平定南蛮时，关索被孟获生擒，因此遇到花鬘，二人产生情愫，花鬘故意被蜀汉所擒，交换关索。孟获投降后，经诸葛亮主媒，嫁于关索。</b>",
["baosanniangls"]="人物列传",
[":baosanniangls"]="<b>鲍三娘，《花关索传》中记载，关索妻子之一。鲍家庄三小姐，聪明伶俐，精通武艺，曾扬言击败她者，愿嫁之。后有貌丑者胜之，鲍三娘不愿，关索又胜之，遂嫁于关索。后随夫镇守南中，南中一带至今有其传说留世。</b>",
["zhugeguols"]="人物列传",
[":zhugeguols"]="<b>诸葛果，诸葛亮与黄月英之女，诸葛瞻之妹。据《历代神仙通鉴》记载，诸葛均曰：三兄分仕三国，吾宗当兴。孔明蹙额曰：闻诸葛恪侄刚躁，非保家子弟；诸葛诞固执寡谋。便常教以禳斗之法，后诸葛果遁世修行，羽化升仙。</b>",
["guansuols"]="人物列传",
[":guansuols"]="<b>关索，关羽第三子。因战乱与父失散多年，据《花关索传》记载，关索闻父守备荆州，前来认父。后荆州失陷，关索负伤偶至鲍家庄，在诸葛亮平南蛮之时，再次参军成为先锋将军。</b>",
["guonvwangls"]="人物列传",
[":guonvwangls"]="<b>郭女王，名不详，字女王。魏文帝曹丕第一任皇后（也是唯一一位），史载，郭后年少时，才略智数就令父亲感到奇异，被其父叹曰：此乃我女中王也。助曹丕登基，深受宠幸。其人又崇尚节俭，谥号文德皇后。传闻因与甄姬争宠，谗害甄姬，史料等均无确切证据。</b>",
["zhugezhanls"]="人物列传",
[":zhugezhanls"]="<b>诸葛瞻，诸葛亮与黄月英之子，诸葛果之兄。邓艾伐蜀时，刘禅派其统兵增援，不料前锋战败，诸葛瞻引大军退守剑阁，不久便被邓艾击溃，诸葛瞻宁死不降。其一生受其父名望影响颇大，其功名多是余荫所致。</b>",
["kongquels"]="人物列传",
[":kongquels"]="<b>孔雀，龙凤后传架空人物。楼兰系西域三十六国之一，曹魏时曾在此设立长史，但无实际管辖权。现代考古发现，孔雀河南岸出土古楼兰遗址，其人种属于欧罗巴人。</b>",
["taishizhaorongls"]="人物列传",
[":taishizhaorongls"]="<b>太史昭容，《三国群英传》架空人物，太史慈之女，继承父亲笃烈之志。</b>",
["beimihuls"]="人物列传",
[":beimihuls"]="<b>卑弥呼，三国时日本邪马台国女王，能使鬼道，以妖惑众，年长不嫁。桓灵年间，倭国大乱，男主不能服众，卑弥呼以鬼道登基，年十七，其弟佐政，其居深宫，不问世事。与曹魏交厚，被封为亲魏倭王。</b>",
["sunruls"]="人物列传",
[":sunruls"]="<b>孙茹，小霸王孙策之女，后来孙权为了平衡东吴四大姓的矛盾，将此女嫁与陆逊，其姻缘颇有政治意味。</b>",
["wangshuangls"]="人物列传",
[":wangshuangls"]="<b>王双，陇西郡人，曹真麾下的猛将。惯使六十斤重的大刀和流星锤，开两石铁胎弓。在陈仓与蜀汉军马交锋，杀死了谢雄、龚起，重创张嶷。追击蜀军时被魏延斩杀。</b>",
["dailaidongzhuls"]="人物列传",
[":dailaidongzhuls"]="<b>带来洞主，孟获妻祝融夫人之弟也，诸葛亮平南战役中，先后向孟获举荐木鹿大王和兀突骨。六擒孟获时，献上诈降之计，捆绑孟获和祝融，衣袖中暗藏凶器，至诸葛亮军中诈降。被诸葛亮识破反被擒获。</b>",



}


--废弃的代码

--[[luajt_trs=sgs.CreateTriggerSkill{
name="luajt_trs",
--view_as_skill=!!_vs,
events={sgs.CardFinished},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardFinished then
		local use=data:toCardUse()
		if not use.card:inherits("Slash") then return false end
		local b=false
		for _,p in sgs.qlist(use.to) do
			if p:hasSkill(self:objectName()) then b=true end 				
		end
		if not b then return false end
		if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
		local slash=room:askForCard(selfplayer,"slash",self:objectName())
		if slash~=nil then
			--local pc=room:askForPlayerChosen(selfplayer,otherplayers,self:objectName())
			--if pc~=nil then
			local slash_t=sgs.Sanguosha:cloneCard("slash",slash:getSuit(),slash:getNumber())
			local use_t = sgs.CardUseStruct()
			use_t.card=slash_t
			use_t.from=selfplayer
			use_t.to:append(use.from)
			room:useCard(use_t)
			--end
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]--

--[[luaqb_fts=sgs.CreateFilterSkill{
name="luaqb_fts",
view_filter=function(self,to_select)
	return to_select:inherits("Slash") and (to_select:getSuit()==sgs.Card_Heart)
end,
view_as=function(self,card)
	local filtered=sgs.Sanguosha:cloneCard("wushen_slash", card:getSuit(), card:getNumber())
	filtered:addSubcard(card)
	filtered:setSkillName(self:objectName())
	return filtered
end
}]]--

--[[luazhsh_card=sgs.CreateSkillCard{
name="luazhsh_effect",
target_fixed=false,
will_throw=false,
--filter=function(self,targets,to_select)
	--return #targets==0
--end,
--feasible=function(self,targets)
--end,
--on_use=function(self,room,source,target)
--end,
on_effect=function(self,effect)
	local room=effect.from:getRoom()
	room:setPlayerFlag(effect.from,"luazhsh_used")
	room:moveCardTo(self,effect.to,sgs.Player_Hand,false)
	while true do
		if (room:askForSkillInvoke(effect.from,"luazhsh_vs")~=true) then break end
		local judge=sgs.JudgeStruct()
		judge.pattern=sgs.QRegExp("(.*):(heart|diamond):(.*)")
		judge.who=effect.from
		judge.reason="luazhsh"
		room:judge(judge)
		if judge.card:isBlack() then break end
		--if judge.card:getSuit()==sgs.Card_Diamond then 
		room:obtainCard(effect.from,judge.card) 
		--end
		if (judge.card:getSuit()==sgs.Card_Heart) and (effect.from:isWounded()) then
			local recover=sgs.RecoverStruct()
			recover.recover=1
			recover.who=effect.from
			recover.card=self
			room:recover(effect.from,recover)
		end		
	end
end
}]]

--[[luazhsh_vs=sgs.CreateViewAsSkill{
name="luazhsh_vs",
n=998,
view_filter=function(self, selected, to_select)
	return not to_select:isEquipped()
end,
view_as=function(self, cards)
	if #cards<2 then return nil end
	local a_luazhsh_card=luazhsh_card:clone()
	for var=1,#cards,1 do
		a_luazhsh_card:addSubcard(cards[var])
	end
	a_luazhsh_card:setSkillName(self:objectName())
	return a_luazhsh_card
end,
enabled_at_play=function()
	return not sgs.Self:hasFlag("luazhsh_used")
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}]]
--[[luawy_trs=sgs.CreateTriggerSkill{
name="luawy_trs",
view_as_skill=luawy_vs,
events={sgs.Pindian,sgs.CardEffect},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Pindian then
		--if not selfplayer:hasFlag("luawy_tmp") then return false end
		--room:setPlayerFlag(selfplayer,"-luawy_tmp")
		local pd=data:toPindian()
		if pd.reason~="luawy" then return false end
		local to=pd.to
		local from=pd.from		
		if pd.from_card:getNumber()>pd.to_card:getNumber() then
			local pfc=room:getOtherPlayers(to)
			local pfc_t=room:getOtherPlayers(to)
			--effect.from:speak("1")
			for _,p in sgs.qlist(pfc_t) do
				if not to:canSlash(p) then
					pfc:removeOne(p)
				end			
			end
		--effect.from:speak("2")
			local pc=room:askForPlayerChosen(from,pfc,self:objectName())
			if pc~=nil then
				if not room:askForDiscard(pc,"luawy",2,2,true,true) then
					local damage = sgs.DamageStruct()
					damage.from = from
					damage.to = pc				
					room:damage(damage)
				end
			end
		else
			from:speak("punishment")
			to:obtainCard(pd.from_card)
		end
	elseif event==sgs.CardEffect then
		local effect=data:toCardEffect()
		if not effect.from:hasSkill(self:objectName()) then return false end
		
		if effect.card:getSkillName()=="luawy_effect" then
			
			effect.from:pindian(effect.to,"luawy",effect.card)
		end		
	end	
end,
--can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end--
}]]--
--[[luahb_card = sgs.CreateSkillCard
{
	name = "luahb_effect",
	target_fixed = true,
	will_throw = false,
}

luahb_vs = sgs.CreateViewAsSkill
{
	name = "luahb_vs",
	n = 1,	
	view_filter = function(self, selected, to_select)        
		if not to_select:isEquipped() then return true
		else return false end
	end,	
	view_as = function(self, cards)
		if #cards == 1 then 
		local acard = luahb_card:clone()        
		acard:addSubcard(cards[1])        
		acard:setSkillName(self:objectName())
		return acard end
	end,	
	enabled_at_play = function()
		return false        
	end,	
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@luahb_trs" --仅响应 要求一张luaguicai_card        
	end
}

luahb_trs = sgs.CreateTriggerSkill
{
	name = "luahb_trs",
	events = sgs.AskForRetrial,	--听说这个事件不需要cantrigger
	view_as_skill = luahb_vs,
	priority=-1,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local simashi = room:findPlayerBySkillName(self:objectName())
		local judge = data:toJudge()	--获取判定结构体
		if not judge.who:hasSkill(self:objectName()) then return false end        
		simashi:setTag("Judge",data)	--SET技能拥有者TAG
		if (room:askForSkillInvoke(simashi, self:objectName()) ~= true) then return false end	--询问发动 可以去掉
			local card = room:askForCard(simashi, "@@luahb_trs", "@luahb_trs", data)				--要求一张luaguicai_card   别忘了@luaguicai是询问字符串     
			if card ~= nil then  -- 如果打出了        
				--room:throwCard(judge.card) --原判定牌丢弃如果是想要鬼道那样的替换回来就应该改为
				simashi:obtainCard(judge.card)
				judge.card = sgs.Sanguosha:getCard(card:getEffectiveId()) --判定牌更改
				room:moveCardTo(judge.card, nil, sgs.Player_Special) --移动到判定区
				
				local log = sgs.LogMessage()  --LOG 以下是改判定专用的TYPE
				log.type = "$ChangedJudge"
				log.from = player
				log.to:append(judge.who)
				log.card_str = card:getEffectIdString()
				room:sendLog(log)
				
				room:sendJudgeResult(judge) 
			end
		return false --要FALSE~~
	end,        
}]]--
--[[luazhw_trs=sgs.CreateTriggerSkill{
name="luazhw_trs",
--view_as_skill=!!_vs,
events={sgs.CardLost},
frequency = sgs.Skill_Frequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardLost then
		if selfplayer:getPhase()~=sgs.Player_NotActive then return false end
		local move=data:toCardMove()
		if move.from==nil then return false end
		if not move.from:hasSkill(self:objectName()) then return false end
		if move.from_place==sgs.Player_Hand then
			if (room:askForSkillInvoke(selfplayer,self:objectName())~=true) then return false end
			selfplayer:drawCards(1)
			if move.to_place~=sgs.Player_DiscardedPile then selfplayer:drawCards(1) end
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]--
--[[
luajunmei_trs=sgs.CreateTriggerSkill{--去掉这个技能
name="luajunmei_trs",
--view_as_skill=!!_vs,
events={sgs.CardResponsed,sgs.CardUsed},
frequency = sgs.Skill_Compulsory,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardResponsed then
		if player:getMark("@luaby_biyi")==0 then return false end
		local cd=data:toCard()
		if cd:inherits("Slash") or cd:inherits("Jink") then
			room:playSkillEffect(self:objectName())
			player:drawCards(1)
		end
	elseif event==sgs.CardUsed then
		if player:getMark("@luaby_biyi")==0 then return false end
		local use=data:toCardUse()
		if not use.card:inherits("Slash") then return false end
		room:playSkillEffect(self:objectName())
		player:drawCards(1)
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}--]]
--[[luazhq_vs=sgs.CreateViewAsSkill{
name="luazhq_vs",
n=1,
view_filter=function(self, selected, to_select)
	if #selected>0 then return false end
	if to_select:isEquipped() then return false end
	if to_select:getSuit()==sgs.Card_Heart then return sgs.Self:isWounded() end
	if to_select:getSuit()==sgs.Card_Club then return not sgs.Self:hasUsed("Analeptic") end
	--return sgs.Slash_isAvailable()	
end,
view_as=function(self, cards)
	if #cards~=1 then return nil end
	--local a_luazhq_card=luazhq_card:clone()
	--a_luazhq_card:addSubcard(cards[1])
	--a_luazhq_card:setSkillName(self:objectName())
	--return a_luazhq_card
	local str=""
	if cards[1]:getSuit()==sgs.Card_Spade then str="thunder_slash" end
	if cards[1]:getSuit()==sgs.Card_Diamond then str="fire_slash" end
	if cards[1]:getSuit()==sgs.Card_Heart then str="peach" end
	if cards[1]:getSuit()==sgs.Card_Club then str="analeptic" end
	local a_card=sgs.Sanguosha:cloneCard(str,cards[1]:getSuit(),cards[1]:getNumber())
	a_card:addSubcard(cards[1])
	a_card:setSkillName(self:objectName())
	return a_card
end,
enabled_at_play=function()
	return not sgs.Self:isKongcheng()
end,
enabled_at_response=function(self, player, pattern)
	return false
end
}]]--
--[[luazhq_fts=sgs.CreateFilterSkill{
name="luazhq_fts",
view_filter=function(self,to_select)
	local str=sgs.Self:getTag("luazhq_suit"):toString()
	str="heart"
	return to_select:getSuitString()==str
end,
view_as=function(self,card)
	local str=sgs.Self:getTag("luazhq_basic"):toString()
	str="analeptic"
	local int2basic={"slash","jink","peach","analeptic"}
	str=int2basic[sgs.Self:getMark("luazhq_basic")]
	--if sgs.Self:getMark("luazhq_basic")==3 then str="peach" end	
	local filtered=sgs.Sanguosha:cloneCard(str, card:getSuit(), card:getNumber())
	filtered:addSubcard(card)
	filtered:setSkillName(self:objectName())
	return filtered
end
}]]--

--[[luazhq_trs=sgs.CreateTriggerSkill{
name="luazhq_trs",
--view_as_skill=!!_vs,
events={sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.PhaseChange then
		if not player:hasSkill(self:objectName()) then return false end
		if selfplayer:getPhase()==sgs.Player_Play then
			if (room:askForSkillInvoke(selfplayer,self:objectName(),data)~=true) then return false end
			room:showAllCards(selfplayer)
			local basic_t=room:askForChoice(selfplayer, self:objectName(), "slash+jink+peach+analeptic")
			local suit_t=room:askForSuit(selfplayer)
			selfplayer:setTag("luazhq_basic",sgs.QVariant(basic_t))
			selfplayer:setTag("luazhq_suit",sgs.QVariant(sgs.Card_Suit2String(suit_t)))
			local basic2int={["slash"]=1,["jink"]=2,["peach"]=3,["analeptic"]=4}
			selfplayer:speak(string.format("%d",basic2int[basic_t]))
			room:setPlayerMark(selfplayer,"luazhq_basic",basic2int[basic_t])
			
			selfplayer:speak(selfplayer:getTag("luazhq_suit"):toString())
			selfplayer:speak(selfplayer:getTag("luazhq_basic"):toString())			
			
			room:setPlayerFlag(selfplayer,"luazhq_tmp")
			room:acquireSkill(selfplayer,"luazhq_fts")
		elseif selfplayer:getPhase()==sgs.Player_Finish then
			if not selfplayer:hasFlag("luazhq_tmp") then return false end
			room:setPlayerFlag(selfplayer,"-luazhq_tmp")
			room:detachSkillFromPlayer(selfplayer,"luazhq_fts")			
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]--

--[[luashw_dts=sgs.CreateDistanceSkill{
name= "luashw_dts$",
correct_func=function(self,from,to)
	if from:hasSkill(self:objectName()) then
		if(not from:hasLordSkill("luashw_dts")) then return 0 end
		local x=from:getMark("luashw_cnt")
		return 0-x
	end
end
}

luashw_trs=sgs.CreateTriggerSkill{
name="#luashw_trs",
--view_as_skill=!!_vs,
events={sgs.TurnStart,sgs.Death},
frequency = sgs.Skill_NotFrequent,
--priority=-1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.TurnStart then
		local x=0
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:getKingdom()=="qun" then x=x+1 end				
		end
		room:setPlayerMark(selfplayer,"luashw_cnt",x)
		player:speak(string.format("%d",selfplayer:getMark("luashw_cnt")))
	elseif event==sgs.Death then
		local x=0
		for _,p in sgs.qlist(room:getAlivePlayers()) do
			if p:getKingdom()=="qun" then x=x+1 end				
		end
		room:setPlayerMark(selfplayer,"luashw_cnt",x)
		player:speak(string.format("%d",selfplayer:getMark("luashw_cnt")))
	end
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]----idtable={}
--远见
--[[luayj_trs=sgs.CreateTriggerSkill{
name="luayj_trs",
--view_as_skill=!!_vs,
events={sgs.CardDrawnDone,sgs.CardGot,sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
priority=-1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardDrawnDone then
		if player:getPhase()~=sgs.Player_Draw then return false end
		if player:hasFlag("luayj_used") then return false end
		local x=data:toInt()
		local hnum = player:getHandcardNum() --手牌数
		local idstr=player:getTag("luayj_idstr"):toString()
		for var=1,x,1 do
			local str_t="|"
			if idstr=="" then str_t="" end 
			idstr=idstr..str_t..("%d"):format(player:handCards():at(hnum-var))
			--table.insert(idtable,player:handCards():at(hnum-var))
		end
		player:setTag("luayj_idstr",sgs.QVariant(idstr))
		player:speak("drawndone")		
	elseif event==sgs.CardGot then
		local move=data:toCardMove()
		if player:getPhase()~=sgs.Player_Draw then return false end
		if player:hasFlag("luayj_used") then return false end
		local idstr=player:getTag("luayj_idstr"):toString()
		if not sgs.Sanguosha:getCard(move.card_id):isVirtualCard() then 
			local str_t="|"
			if idstr=="" then str_t="" end			
			idstr=idstr..str_t..("%d"):format(move.card_id) 
			--table.insert(idtable,move.card_id) 
		end
		for _,id_t in sgs.qlist(sgs.Sanguosha:getCard(move.card_id):getSubcards()) do
			if not sgs.Sanguosha:getCard(id_t):isVirtualCard() then 
				local str_t="|"
				if idstr=="" then str_t="" end				
				idstr=idstr..str_t..("%d"):format(id_t) 
				--table.insert(idtable,id_t) 
			end				
		end
		player:setTag("luayj_idstr",sgs.QVariant(idstr))
		player:speak("got")
	elseif event==sgs.PhaseChange then
		if player:getPhase()==sgs.Player_Draw then
			player:speak("phase")
			local idstr=player:getTag("luayj_idstr"):toString()
			if idstr=="" then return false end
			local idstrtable=idstr:split("|")
			local idlist=sgs.IntList()
			for var=1,#idstrtable,1 do
				player:speak(idstrtable[var])
				local id_t=tonumber(idstrtable[var])
				if room:getCardOwner(id_t):hasSkill(self:objectName()) then
					idlist:append(id_t)
				end
			end
			local cnt=0
			while true do
				if idlist:isEmpty() then break end
				room:fillAG(idlist,player)
				--for var = 1, 1 do
				local cd_id = room:askForAG(player,idlist,true,self:objectName())
				if cd_id ~= -1 then
					idlist:removeOne(cd_id)
					--room:moveCardTo(sgs.Sanguosha:getCard(cd_id), selfplayer, sgs.Player_Hand, true)
					room:throwCard(cd_id)
					cnt=cnt+1
				--	i = i+1
				else
					player:invoke("clearAG")
					break
				end
				player:invoke("clearAG")
			end
			if cnt~=0 then 
				room:setPlayerFlag(player,"luayj_used")			
				player:drawCards(cnt) 
			end
			--while true do
				--if #idtable==0 then break end
				--table.remove(idtable)
			--end
			
		else		
			player:setTag("luayj_idstr",sgs.QVariant(""))			
		end		
	end
end,
--can_trigger=function(self, player)
	--local room=player:getRoom()
	--local selfplayer=room:findPlayerBySkillName(self:objectName())
	--if selfplayer==nil then return false end
	--return selfplayer:isAlive()
--end
}]]
 --辅君
--[[ luafujun_trs=sgs.CreateTriggerSkill{
name="luafujun_trs",
--view_as_skill=!!_vs,
events={sgs.Damaged,sgs.PhaseChange},
frequency = sgs.Skill_NotFrequent,
--priority
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.Damaged then
		local damage=data:toDamage()
		if not player:hasSkill(self:objectName()) then return false end
		if (room:askForSkillInvoke(player,self:objectName(),data)~=true) then return false end
		local judge=sgs.JudgeStruct()
		judge.pattern=sgs.QRegExp("(.*):(spade|club|diamond):(.*)")
		judge.who=player
		judge.reason=self:objectName()
		room:judge(judge)
		
		if judge:isGood() then
			local phaselist={[sgs.Player_Start]="start",
							[sgs.Player_Judge]="judge",
							[sgs.Player_Draw]="draw",
							[sgs.Player_Play]="play",
							[sgs.Player_Discard]="discard",
							[sgs.Player_Finish]="finish",
							[sgs.Player_NotActive]="not_active",
							}
			--damage.from:setPhase(damage.from:getPhase()+1)
			--room:setPlayerProperty(room:getCurrent(),"phase",sgs.QVariant(phaselist[room:getCurrent():getPhase()+1]))
			--room:getThread():trigger(sgs.TurnStart,room:getCurrent())
			--room:setPlayerMark(room:getCurrent(),"luafujun_skip",room:getCurrent():getPhase()+1)
			--room:getCurrent():play()
			
			--damage.from:skip(damage.from:getPhase())
		end
	elseif event==sgs.PhaseChange then
		if player:getPhase()==sgs.Player_Start and player:getMark("luafujun_skip")>0 then
			for var=1,player:getMark("luafujun_skip"),1 do
				player:skip(sgs.Player_Start+var-1)
			end
			room:setPlayerMark(player,"luafujun_skip",0)
			return true
		end
	end
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]
--节俭
--[[luajiejian_trs=sgs.CreateTriggerSkill{
name="luajiejian_trs",
--view_as_skill=!!_vs,
events={sgs.CardDiscarded,sgs.PhaseChange},
frequency = sgs.Skill_Compulsory,
priority=-1,
on_trigger=function(self,event,player,data)
	local room=player:getRoom()	
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	local otherplayers=room:getOtherPlayers(selfplayer)
	--local effect=data:toCardEffect()
	if event==sgs.CardDiscarded then
		local cd=data:toCard()
		if player:hasSkill(self:objectName()) then return false end
		if player:getPhase()==sgs.Player_Discard then
			local idstr=selfplayer:getTag("luajiejian_idstr"):toString()
			if cd:isVirtualCard() then
				for _,id_t in sgs.qlist(cd:getSubcards()) do
					idstr=idstr..("|%d"):format(id_t)
					--selfplayer:addMark("luajiejian_cnt")					
				end
			else
				idstr=idstr..("|%d"):format(cd:getEffectiveId())
				--selfplayer:addMark("luajiejian_cnt")
			end
			selfplayer:setTag("luajiejian_idstr",sgs.QVariant(idstr))
		end
	elseif event==sgs.PhaseChange then
		if player:hasSkill(self:objectName()) then return false end
		if player:getPhase()==sgs.Player_Discard then
			local idstr=selfplayer:getTag("luajiejian_idstr"):toString()
			local idtable=idstr:split("|")
			table.remove(idtable,1)
			local idlist=sgs.IntList()
			for var=1,#idtable,1 do
				if room:getCardPlace(idtable[var])==sgs.Player_DiscardedPile then idlist:append(idtable[var]) end
			end			
			if idlist:length()>selfplayer:getHandcardNum() then
				if room:askForChoice(selfplayer, self:objectName(), "turnover+cardgot" )== "turnover" then 
					player:turnOver()
				else 
					
					room:fillAG(idlist,selfplayer)
					--for var = 1, 1 do
					local cd_id = room:askForAG(selfplayer,idlist,false,self:objectName())
					if cd_id ~= -1 then
						idlist:removeOne(cd_id)
						--room:moveCardTo(sgs.Sanguosha:getCard(cd_id), selfplayer, sgs.Player_Hand, true)
						room:obtainCard(selfplayer,cd_id)
					--	i = i+1
					end
					selfplayer:invoke("clearAG")
				end
			end
		else
			selfplayer:setTag("luajiejian_idstr",sgs.QVariant("-1"))
		end
	end	
end,
can_trigger=function(self, player)
	local room=player:getRoom()
	local selfplayer=room:findPlayerBySkillName(self:objectName())
	if selfplayer==nil then return false end
	return selfplayer:isAlive()
end
}]]
--羽化
--[[luayuhua = sgs.CreateTriggerSkill{
	name = "luayuhua",
	frequency=sgs.Skill_Compulsory,
	events = {sgs.Death},
	can_trigger = function(self, player)
		return true 
	end,
	
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		local targets = room:getOtherPlayers(player)
		if not (player:hasSkill(self:objectName()))then return false end
		if (not room:askForSkillInvoke(player,self:objectName())) then return false end
		local target=room:askForPlayerChosen(player,targets,self:objectName())
		room:setPlayerProperty(target,"maxhp",sgs.QVariant(target:getMaxHP()+1))	
			local recover = sgs.RecoverStruct()
			recover.recover = 1
			recover.who = target
			room:recover(target,recover)
			return false
end,
}}]]
--红殇
--[[hongshang=sgs.CreateTriggerSkill
{
	name="hongshang",
	frequency = sgs.Skill_Compulsory,
	events={sgs.DamageForseen},
	on_trigger=function(self,event,player,data)
    local room = player:getRoom()

		if (not player:getArmor())  then 
      local damage=data:toDamage()
      if damage.card:isRed() then 
        room:playSkillEffect("hongshang")
        return true 
      end
    end
	end
}}]]
