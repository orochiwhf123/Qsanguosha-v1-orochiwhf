module("extensions.transformV1orochiwhf", package.seeall)
extension = sgs.Package("transformV1orochiwhf")

------刘备
BeiLtf=sgs.General(extension, "BeiLtf", "qun", 5, true,true,true)
liubei=sgs.Sanguosha:getGeneral("liubei")
 
DeX=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="DeX",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="liubei" do	
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName()) 
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName()) 
			room:transfigure(player,"bgm_liubei",false,false)
			player:gainMark("@hate")
			return false
		end
		while player:getGeneral2Name()=="liubei" do	
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName()) 
				return false 
			end
			room:acquireSkill(player,"zhaolie")
			room:acquireSkill(player,"shichou")
			player:gainMark("@hate")
			room:detachSkillFromPlayer(player,"rende")
			room:detachSkillFromPlayer(player,"jijiang")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_liubei"))--无技能 
			return false 
		end
	end,
}
BeiLtf:addSkill(DeX)
if liubei~=nil then liubei:addSkill("DeX") end


------关羽
YuGtf=sgs.General(extension, "YuGtf", "qun", 5, true,true,true)
guanyu=sgs.Sanguosha:getGeneral("guanyu")


ChangY=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ChangY",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local glist="sp_guanyu+neo_guanyu"  ----定义选将列表
		
		while player:getGeneralName()=="guanyu" do ---主将变身
			if not player:askForSkillInvoke(self:objectName()) then   -----若不变身，清除技能
				room:detachSkillFromPlayer(player,self:objectName()) 
				return false 
			end
			local gname= room:askForChoice(player,self:objectName(),glist)  ---选择武将
			while gname=="sp_guanyu" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"sp_guanyu",false,false)
				room:setPlayerProperty(player,"kingdom",sgs.QVariant("wei"))
				return false
			end
			while gname=="neo_guanyu" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"neo_guanyu",false,false)
				return false
			end
		end
		while player:getGeneral2Name()=="guanyu" do ---副将变身
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="sp_guanyu" do
				room:acquireSkill(player,"danji")
				room:detachSkillFromPlayer(player,self:objectName())
				room:setPlayerProperty(player,"general2",sgs.QVariant("sp_guanyu"))--无技能
				
				return false
			end
			while g2name=="neo_guanyu" do
			room:acquireSkill(player,"yishi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_guanyu"))--无技能 
				return false
			end
		end
    end,
}
YuGtf:addSkill(ChangY)
if guanyu~=nil then guanyu:addSkill("ChangY") end


-----张飞
FeiZtf=sgs.General(extension, "FeiZtf", "qun", 5, true,true,true)
zhangfei=sgs.Sanguosha:getGeneral("zhangfei")
 
DeY=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="DeY",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local glist="bgm_zhangfei+neo_zhangfei"
		
		while player:getGeneralName()=="zhangfei" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local gname= room:askForChoice(player,self:objectName(),glist)
			while gname=="bgm_zhangfei" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"bgm_zhangfei",false,false)
				return false
			end
			while gname=="neo_zhangfei" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"neo_zhangfei",false,false)
				return false
			end
		end
		
		while player:getGeneral2Name()=="zhangfei" do
			if not player:askForSkillInvoke(self:objectName()) then
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="bgm_zhangfei" do
			room:acquireSkill(player,"jie")
			room:acquireSkill(player,"dahe")
			room:detachSkillFromPlayer(player,"paoxiao")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_zhangfei"))--无技能 
				return false
			end
			while g2name=="neo_zhangfei" do
			room:acquireSkill(player,"tannang")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_zhangfei"))--无技能 
				return false
			end
		end
    end,
}
FeiZtf:addSkill(DeY)
if zhangfei~=nil then zhangfei:addSkill("DeY") end


-------赵云
YunZtf=sgs.General(extension, "YunZtf", "qun", 5, true,true,true)
zhaoyun=sgs.Sanguosha:getGeneral("zhaoyun")
 
LongZ=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="LongZ",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local glist="bgm_zhaoyun+shenzhaoyun+neo_zhaoyun"
		while player:getGeneralName()=="zhaoyun" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local gname= room:askForChoice(player,self:objectName(),glist)
			while gname=="bgm_zhaoyun" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"bgm_zhaoyun",false,false)
				room:setPlayerProperty(player,"kingdom",sgs.QVariant("qun"))
				return false
			end
			while gname=="shenzhaoyun" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"shenzhaoyun",false,false)
				room:setPlayerProperty(player,"kingdom",sgs.QVariant("god"))
				return false
			end
			while gname=="neo_zhaoyun" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"neo_zhaoyun",false,false)
				room:setPlayerProperty(player,"kingdom",sgs.QVariant("shu"))
				return false
			end
		end
		
		while player:getGeneral2Name()=="zhaoyun" do
			if not player:askForSkillInvoke(self:objectName()) then
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="bgm_zhaoyun" do
			room:acquireSkill(player,"chongzhen")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_zhaoyun"))--无技能 
				return false
			end
			while g2name=="shenzhaoyun" do
			room:acquireSkill(player,"juejing")
			room:acquireSkill(player,"longhun")
			room:detachSkillFromPlayer(player,"longdan")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("shenzhaoyun"))--无技能 
				return false
			end
			while g2name=="neo_zhaoyun" do
			room:acquireSkill(player,"yicong")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_zhaoyun"))--无技能 
				return false
			end
		end
    end,
}

YunZtf:addSkill(LongZ)
if zhaoyun~=nil then zhaoyun:addSkill("LongZ") end


-----曹仁
RenCtf=sgs.General(extension, "RenCtf", "qun", 5, true,true,true)
caoren=sgs.Sanguosha:getGeneral("caoren")

XiaoZ=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="XiaoZ",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local glist="bgm_caoren+neo_caoren"
		
		while player:getGeneralName()=="caoren" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local gname= room:askForChoice(player,self:objectName(),glist)
			while gname=="bgm_caoren" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"bgm_caoren",false,false)
				return false
			end
			while gname=="neo_caoren" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"neo_caoren",false,false)
				return false
			end
		end
		
		while player:getGeneral2Name()=="caoren" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="bgm_caoren" do
			room:acquireSkill(player,"kuiwei")
			room:acquireSkill(player,"yanzheng")
			room:detachSkillFromPlayer(player,"jushou")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_caoren"))--无技能
				return false
			end
			while g2name=="neo_caoren" do
			room:acquireSkill(player,"neojushou")
			room:detachSkillFromPlayer(player,"jushou")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_caoren"))--无技能
				return false
			end
		end
    end,
}
RenCtf:addSkill(XiaoZ)
if caoren~=nil then caoren:addSkill("XiaoZ") end



-----许褚
ChuXtf=sgs.General(extension, "ChuXtf", "qun", 5, true,true,true)
xuchu=sgs.Sanguosha:getGeneral("xuchu")
 
YiY=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="YiY",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="xuchu" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"neo_xuchu",false,false)
			return false
		end
		while player:getGeneral2Name()=="xuchu" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"neoluoyi")
			room:detachSkillFromPlayer(player,"luoyi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_xuchu"))--无技能
			return false
		end
    end,
}
ChuXtf:addSkill(YiY)
if xuchu~=nil then xuchu:addSkill("YiY") end



------周瑜
YuZtf=sgs.General(extension, "YuZtf", "qun", 5, true,true,true)
zhouyu=sgs.Sanguosha:getGeneral("zhouyu")
 
SoulY=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="SoulY",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="zhouyu" do 
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"neo_zhouyu",false,false)
			return false
		end
		while player:getGeneral2Name()=="zhouyu" do 
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"neofanjian")
			room:detachSkillFromPlayer(player,"fanjian")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_zhouyu"))--无技能
			return false
		end
    end,
}
YuZtf:addSkill(SoulY)
if zhouyu~=nil then zhouyu:addSkill("SoulY") end



------吕蒙
MengLtf=sgs.General(extension, "MengLtf", "qun", 5, true,true,true)
lvmeng=sgs.Sanguosha:getGeneral("lvmeng")
 
MingZ=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="MingZ",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		--local glist="bgm_lvmeng+shenlvmeng"
		local glist="Y_lvmeng+shenlvmeng"
		
		while player:getGeneralName()=="lvmeng" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local gname= room:askForChoice(player,self:objectName(),glist)
			while gname=="Y_lvmeng" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"Y_lvmeng",false,false)
				return false
			end
			while gname=="shenlvmeng" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"shenlvmeng",false,false)
				return false
			end
		end
		while player:getGeneral2Name()=="lvmeng" do 
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="bgm_lvmeng" do
			room:acquireSkill(player,"tanhu")
			room:acquireSkill(player,"mouduan")
			player:gainMark("@wu")
			room:detachSkillFromPlayer(player,"keji")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_lvmeng"))--无技能
			return false
	    end
        while g2name=="shenlvmeng" do
			room:acquireSkill(player,"shelie")
			room:acquireSkill(player,"gongxin")
			room:detachSkillFromPlayer(player,"keji")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("shenlvmeng"))--无技能
				return false
			end
		end
    end,
}
MengLtf:addSkill(MingZ)
if lvmeng~=nil then lvmeng:addSkill("MingZ") end



-----夏侯惇
DunXHtf=sgs.General(extension, "DunXHtf", "qun", 5, true,true,true)
xiahoudun=sgs.Sanguosha:getGeneral("xiahoudun")

YuanR=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="YuanR",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local glist="bgm_xiahoudun+neo_xiahoudun"
		
		while player:getGeneralName()=="xiahoudun" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local gname= room:askForChoice(player,self:objectName(),glist)
			while gname=="bgm_xiahoudun" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"bgm_xiahoudun",false,false)
				return false
			end
			while gname=="neo_xiahoudun" do
			    room:detachSkillFromPlayer(player,self:objectName())
				room:transfigure(player,"neo_xiahoudun",false,false)
				return false
			end
		end
		while player:getGeneral2Name()=="xiahoudun" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			local g2name= room:askForChoice(player,self:objectName(),glist)
			while g2name=="bgm_xiahoudun" do
			room:acquireSkill(player,"fenyong")
			room:acquireSkill(player,"xuehen")
			room:detachSkillFromPlayer(player,"ganglie")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_xiahoudun"))--无技能
				return false
			end
			while g2name=="neo_xiahoudun" do
			room:acquireSkill(player,"neoganglie")
			room:detachSkillFromPlayer(player,"ganglie")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("neo_xiahoudun"))--无技能
				return false
			end
		end
    end,
}
DunXHtf:addSkill(YuanR)
if xiahoudun~=nil then xiahoudun:addSkill("YuanR") end



------貂蝉          ban: 曹植，贾诩
ChanDtf=sgs.General(extension, "ChanDtf", "qun", 5, true,true,true)
diaochan=sgs.Sanguosha:getGeneral("diaochan")
 
MoonS=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="MoonS",
	events={sgs.GameStart},
	on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		local log=sgs.LogMessage()
		
		while player:getGeneralName()=="diaochan" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"bgm_diaochan",false,false)
			return false
		end
		
		while player:getGeneral2Name()=="diaochan" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"lihun")
			room:detachSkillFromPlayer(player,"lijian")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_diaochan"))--无技能
			return false
		end
    end,
}
ChanDtf:addSkill(MoonS)
if diaochan~=nil then diaochan:addSkill("MoonS") end



------公孙瓒 GongSun Zan
ZanGStf=sgs.General(extension, "ZanGStf", "qun", 5, true,true,true)
gongsunzan=sgs.Sanguosha:getGeneral("gongsunzan")
 
QiY=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="QiY",
	events={sgs.GameStart},
	on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="gongsunzan" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"neo_gongsunzan",false,false)
			return false
		end
		while player:getGeneral2Name()=="gongsunzan" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
			return false
		end
			room:acquireSkill(player,"zhulou")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_gongsunzan"))--无技能
			return false
		end
    end,
}
ZanGStf:addSkill(QiY)
if gongsunzan~=nil then gongsunzan:addSkill("QiY") end


QiaoZtf=sgs.General(extension, "QiaoZtf", "qun", 5, true,true,true)
daqiao=sgs.Sanguosha:getGeneral("daqiao")
 
da=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="da",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="daqiao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"bgm_daqiao",false,false) 
			room:setPlayerProperty(player,"kingdom",sgs.QVariant("wu"))
			return false
        end
		while player:getGeneral2Name()=="daqiao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"yanxiao")
			room:acquireSkill(player,"anxian")
			room:detachSkillFromPlayer(player,"guose")
			room:detachSkillFromPlayer(player,"liuli")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_daqiao"))--无技能
			return false
		end
    end,
}
QiaoZtf:addSkill(da)
if daqiao~=nil then daqiao:addSkill("da") end


NingZtf=sgs.General(extension, "NingZtf", "qun", 5, true,true,true)
ganning=sgs.Sanguosha:getGeneral("ganning")
 
sa=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="sa",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="ganning" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"bgm_ganning",false,false) 
			room:setPlayerProperty(player,"kingdom",sgs.QVariant("qun"))
			return false
        end
		while player:getGeneral2Name()=="ganning" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"yinling")
			room:acquireSkill(player,"junwei")
			room:detachSkillFromPlayer(player,"qixi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("bgm_ganning"))--无技能 
			return false
		end
    end,
}
NingZtf:addSkill(sa)
if ganning~=nil then ganning:addSkill("sa") end

DengSz=sgs.General(extension, "DengSz", "qun", 5, true,true,true)
dengshizai=sgs.Sanguosha:getGeneral("dengshizai")
 
ba=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ba",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="dengshizai" do
			--if not player:askForSkillInvoke(self:objectName()) then 
				--room:detachSkillFromPlayer(player,self:objectName())
				--return false 
			--end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"olddengshizai",false,false) 
			return false
        end
		while player:getGeneral2Name()=="dengshizai" do
			--if not player:askForSkillInvoke(self:objectName()) then 
				--room:detachSkillFromPlayer(player,self:objectName())
				--return false
			--end
			room:acquireSkill(player,"zhenggon")
			room:detachSkillFromPlayer(player,"zhenggong")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("olddengshizai"))--无技能 
			return false
		end
    end,
}
DengSz:addSkill(ba)
if dengshizai~=nil then dengshizai:addSkill("ba") end

LiuB=sgs.General(extension, "LiuB", "qun", 5, true,true,true)
liubiao=sgs.Sanguosha:getGeneral("liubiao")
 
ca=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ca",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="liubiao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"Y_liubiao",false,false) 
			return false
        end
		while player:getGeneral2Name()=="liubiao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"Y_zishou")
			room:acquireSkill(player,"Y_yangzheng")
			room:detachSkillFromPlayer(player,"zishou")
			room:detachSkillFromPlayer(player,"zongshi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("Y_liubiao"))--无技能 
			return false
		end
    end,
}
LiuB:addSkill(ca)
if liubiao~=nil then liubiao:addSkill("ca") end

Faz=sgs.General(extension, "Faz", "qun", 5, true,true,true)
fazheng=sgs.Sanguosha:getGeneral("fazheng")
 
ka=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ka",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="fazheng" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_fazheng",false,false) 
			return false
        end
		while player:getGeneral2Name()=="fazheng" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosenyuan")
			room:acquireSkill(player,"nosxuanhuo")
			room:detachSkillFromPlayer(player,"enyuan")
			room:detachSkillFromPlayer(player,"xuanhuo")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_fazheng"))--无技能 
			return false
		end
    end,
}
Faz:addSkill(ka)
if fazheng~=nil then fazheng:addSkill("ka") end

WaY=sgs.General(extension, "WaY", "qun", 5, true,true,true)
wangyi=sgs.Sanguosha:getGeneral("wangyi")
 
ea=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ea",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="wangyi" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_wangyi",false,false) 
			return false
        end
		while player:getGeneral2Name()=="wangyi" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"noszhenlie")
			room:acquireSkill(player,"nosmiji")
			room:detachSkillFromPlayer(player,"zhenlie")
			room:detachSkillFromPlayer(player,"miji")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_wangyi"))--无技能 
			return false
		end
    end,
}
WaY:addSkill(ea)
if wangyi~=nil then wangyi:addSkill("ea") end

LingT=sgs.General(extension, "LingT", "qun", 5, true,true,true)
lingtong=sgs.Sanguosha:getGeneral("lingtong")
 
fa=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="fa",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="lingtong" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_lingtong",false,false) 
			return false
        end
		while player:getGeneral2Name()=="lingtong" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosxuanfeng")
			room:detachSkillFromPlayer(player,"xuanfeng")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_lingtong"))--无技能 
			return false
		end
    end,
}
LingT:addSkill(fa)
if lingtong~=nil then lingtong:addSkill("fa") end

Xus=sgs.General(extension, "Xus", "qun", 5, true,true,true)
xushu=sgs.Sanguosha:getGeneral("xushu")
 
ga=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ga",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="xushu" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_xushu",false,false) 
			return false
        end
		while player:getGeneral2Name()=="xushu" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"noswuyan")
			room:acquireSkill(player,"nosjujian")
			room:detachSkillFromPlayer(player,"wuyan")
			room:detachSkillFromPlayer(player,"jujian")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_xushu"))--无技能 
			return false
		end
    end,
}
Xus:addSkill(ga)
if xushu~=nil then xushu:addSkill("ga") end

GXZBao=sgs.General(extension, "GXZBao", "qun", 5, true,true,true)
guanxingzhangbao=sgs.Sanguosha:getGeneral("guanxingzhangbao")
 
ha=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ha",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="guanxingzhangbao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_guanxingzhangbao",false,false) 
			return false
        end
		while player:getGeneral2Name()=="guanxingzhangbao" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosfuhun")
			room:detachSkillFromPlayer(player,"fuhun")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_guanxingzhangbao"))--无技能 
			return false
		end
    end,
}
GXZBao:addSkill(ha)
if guanxingzhangbao~=nil then guanxingzhangbao:addSkill("ha") end

HanDa=sgs.General(extension, "HanDa", "qun", 5, true,true,true)
handang=sgs.Sanguosha:getGeneral("handang")
 
ia=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ia",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="handang" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_handang",false,false) 
			return false
        end
		while player:getGeneral2Name()=="handang" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosgongqi")
			room:acquireSkill(player,"nosjiefan")
			room:detachSkillFromPlayer(player,"gongqi")
			room:detachSkillFromPlayer(player,"jiefan")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_handang"))--无技能 
			return false
		end
    end,
}
HanDa:addSkill(ia)
if handang~=nil then handang:addSkill("ia") end

Madaii=sgs.General(extension, "Madaii", "qun", 5, true,true,true)
madai=sgs.Sanguosha:getGeneral("madai")
 
ja=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="ja",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="madai" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_madai",false,false) 
			return false
        end
		while player:getGeneral2Name()=="madai" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosqianxi")
			room:detachSkillFromPlayer(player,"qianxi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_madai"))--无技能 
			return false
		end
    end,
}
Madaii:addSkill(ja)
if madai~=nil then madai:addSkill("ja") end

Zhangca=sgs.General(extension, "Zhangca", "qun", 5, true,true,true)
zhangchunhua=sgs.Sanguosha:getGeneral("zhangchunhua")
 
la=sgs.CreateTriggerSkill{
    frequency=sgs.Skill_Limited,
	name="la",
	events={sgs.GameStart},
    on_trigger=function(self,event,player,data)
        local room=player:getRoom()
		while player:getGeneralName()=="zhangchunhua" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false 
			end
			room:detachSkillFromPlayer(player,self:objectName())
			room:transfigure(player,"nos_zhangchunhua",false,false) 
			return false
        end
		while player:getGeneral2Name()=="zhangchunhua" do
			if not player:askForSkillInvoke(self:objectName()) then 
				room:detachSkillFromPlayer(player,self:objectName())
				return false
			end
			room:acquireSkill(player,"nosshangshi")
			room:detachSkillFromPlayer(player,"shangshi")
			room:detachSkillFromPlayer(player,self:objectName())
			room:setPlayerProperty(player,"general2",sgs.QVariant("nos_zhangchunhua"))--无技能 
			return false
		end
    end,
}
Zhangca:addSkill(la)
if zhangchunhua~=nil then zhangchunhua:addSkill("la") end

sgs.LoadTranslationTable{
	["transformV1orochiwhf"] = "变身包",
	
	["la"]="老张春华",
	[":la"]="游戏开始时，选择变身成为【老张春华】",
	
	["ja"]="老马岱",
	[":ja"]="游戏开始时，选择变身成为【老马岱】",
	
	["ia"]="老韩当",
	[":ia"]="游戏开始时，选择变身成为【老韩当】",
	
	["ha"]="老小关张",
	[":ha"]="游戏开始时，选择变身成为【老小关张】",
	
	["ga"]="老徐庶",
	[":ga"]="游戏开始时，选择变身成为【老徐庶】",
	
	["fa"]="老凌统",
	[":fa"]="游戏开始时，选择变身成为【老凌统】",
	
	["ea"]="老王异",
	[":ea"]="游戏开始时，选择变身成为【老王异】",
	
	["ka"]="老法正",
	[":ka"]="游戏开始时，选择变身成为【老法正】",

	["DeX"]="☆SP刘备",
	[":DeX"]="游戏开始时，选择变身成为【☆SP刘备】",


	["ChangY"]="SP关羽/翼关羽",
	[":ChangY"]="游戏开始时，选择变身成为【SP关羽】或【翼关羽】",

	["DeY"]="☆SP张飞/翼张飞",
	[":DeY"]="游戏开始时，选择变身成为【☆SP张飞】或【翼张飞】",

	["LongZ"]="流氓云/神赵云/翼赵云",
	[":LongZ"]="游戏开始时，选择变身成为【流氓云】或【神赵云】或【翼赵云】",
	
	["da"]="☆SP大乔",
	[":da"]="游戏开始时，选择变身成为【☆SP大乔】",
	
	["sa"]="☆SP甘宁",
	[":sa"]="游戏开始时，选择变身成为【☆SP甘宁】",



	["XiaoZ"]="☆SP曹仁/翼曹仁",
	[":XiaoZ"]="游戏开始时，选择变身成为【☆SP曹仁】或【翼曹仁】",

	["YiY"]="翼许褚",
	[":YiY"]="游戏开始时，选择变身成为【翼许褚】",

	["SoulY"]="翼周瑜",
	[":SoulY"]="游戏开始时，选择变身成为【翼周瑜】",

	["MingZ"]="五影吕蒙/神吕蒙",
	[":MingZ"]="游戏开始时，选择变身成为【五影吕蒙】或【神吕蒙】",


	["YuanR"]="☆SP夏侯惇/翼夏侯惇",
	[":YuanR"]="游戏开始时，选择变身成为【☆SP夏侯惇】或【翼夏侯惇】",
	
	["MoonS"]="☆SP貂蝉",
	[":MoonS"]="游戏开始时，选择变身成为【☆SP貂蝉】",


	["QiY"]="翼公孙瓒",
	[":QiY"]="游戏开始时，选择变身成为【翼公孙瓒】",
	
	["ba"]="老邓士载",
	[":ba"]="游戏开始时，变身成为【老邓士载】",
	
	["ca"]="流氓表",
	[":ca"]="游戏开始时，选择变身成为【流氓表】",
}