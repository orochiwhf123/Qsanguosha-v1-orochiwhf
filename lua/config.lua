
-- this script to store the basic configuration for game program itself
-- and it is a little different from config.ini

config = {
	version = "20230928",
	version_name = "鬼隐版 Stage 7",
	mod_name = "official",
	kingdoms = { 
		"wei", 
		"shu",
		"wu",
		"qun",
		"god"
	},
	
	package_names = {
		"StandardCard",
		"StandardExCard",
		"Maneuvering",
		"SPCard",
		"Nostalgia",
		--"New3v3Card",
		--"HegemonyCard",
		"YitianCard",
		"Joy",
		"Disaster",
		"JoyEquip",

		"Standard",
		"Wind",
		"Fire",
		"Thicket",
		"Mountain",
		"God",
		"SP",
		"YJCM",
		"YJCM2012",
		"YJCM2013",
		--"NewStandard",
		--"Special3v3",
		"BGM",
		"Yitian",
		"Wisdom",
		"Ling",
		--"Assassins",
		--"Olympics",
		--"Hegemony",
		--"Paster",
		"SanDZhimeng",
		"NostalGeneral",
		--"ChangbanSlope",
		--"Danchuang",
		"Test",
	},

	scene_names = {
		"Guandu",
		"Fancheng",
		"Couple",
		"Zombie",
		"Impasse",
		"Custom",
	},

	ai_names = {
		"劳尔陈",
		"大骚",
		"伊森",
		"喵",
		"峰爷",
		"城哥",
		"肥强",
		"李碧玉",
		"黄铭新",
		"徐晨达",
		"杜天军",
		"张鹏忠",
		"陈志先",
		"黄弈超",
		"林长懋",
		"林俊伟",
		"陈雅莉",
		"陈志军",
		"何嘉欣",
		"胡雪钦",
		"黄本源",
		"黄聪海",
		"陷阱",
		"江涛",
		"兰帕德",
		"李俊雄",
		"阿福",
		"林立滨",
		"卢桂芳",
		"阮茂芳",
		"苏晨涵",
		"王超然",
		"游涛",
		"郑珠鸿",
		"上哥",
		"菲姐",
		"黄导",
		"钢牙妹",
		"陈建斌",
		"蒋勤勤",
		"好骚",
		"无上宗师",
		"海峰",
		"星梦孤月",
		"无名神僧",
		"郑煌城",
		"林宜森",
		"卢威",
		"冯强",
		"黄献景",
		"中山叶笛",
	-- 感谢一路走来，为太阳神三国杀付出和支持过的朋友们！
	},

	kingdom_colors ={
		wei = "#547998",
		shu = "#D0796C",
		wu = "#4DB873",
		qun = "#8A807A",
		god = "#96943D",
	},	

	mini_max = 50 -- 此处以Config.S_MINI_MAX_COUNT为准
}

scenario = { -- 非身份局模式下的一些设置
	savsa_packages = { -- 3v3模式：设置加载的扩展包
		"standard",
		"wind",
	},
	couple_lord = "caocao", -- 夫妻协战：设置主公
	couple_spouse = { -- 设置新的夫妻
		"simayi+guojia",
		"ganfuren+liubei",
		"hanxiandi+fushi",
	},
}
ban_list = { -- 初始禁表设置
	roles_ban = { -- 身份局单禁
	    "zhouyu",
		"guanping",
		"zhuran",
		"axiuluo",
		"shenzhonghui",
		"wanghaifeng",
		"wanghaining",
		"xiahouen",
		"shenhuanggai",
		"hanba",
	    "neo_zhouyu",
		"bgm_pangtong",
		--"daqiao",
		"tianqizhe",
		"fuchouzhe",
		--"wisshuijing",
		--"bgm_liubei",
		--"zhangbao",
		"bgm_lvmeng",
		"shencaocao",
		"xiahoujie",
		--"xiahoujuan",
		--"caizhaoji",
		"lingdonglai",
		--"caochong",
		--"yuejin",
		"baozoubashen",
		"shenshezhang",
		--"hanxiandi",
		"wenpin",
		--"dengshizai",
		--"liuxie",
		--"huatuo",
		--"zhangchunhua",
		--"chengpu"
	},
	kof_ban = { -- 1v1模式
		"huatuo",
		"lvmeng",
		"zuoci"
	},
	savsa_ban = { -- 3v3模式
		"yuji",
		"caizhaoji",
	},
	basara_ban = { -- 暗将模式
		"dongzhuo",
		"zuoci",
		"shenzhugeliang",
		"shenlvbu",
		"zhanggongqi",
		"huaxiong",
		"bgm_lvmeng"
	},
	hegemony_ban = { -- 国战模式（注意所有的神势力也会被禁用）
		"dongzhuo",
		"zuoci",
		"zhanggongqi",
		"huaxiong",
		"bgm_lvmeng",
		"xiahoujuan",
		"zhugejin"
	},
	pairs_ban = { -- 双将
	--	双将全禁
	    "zhouyu",
	    "neo_zhouyu",
		"shencaocao",
		"wisshuijing",
		"daqiao",
		"tianqizhe",
		"fuchouzhe",
		--"caocao",
		"zuoci",
		--"luboyan",
		"liushan",
		"bgm_liubei",
		"bgm_lvmeng",
		--"xiahoujuan",
		"xiahoujie",
		--"caizhaoji",
		"dongzhuo",
		"lingdonglai",
		--"caochong",
		"baozoubashen",
		--"yuejin",
		--"guanping",
		"shenshezhang",
		--"liuxie",
		--"hanxiandi",
		"wenpin",
		--"dengshizai",
		--"chengong",
		--"zhangchunhua",
		--"chengpu",
		"huatuo",
		"liaohua", -- 廖化：易产生BUG
		"bgm_pangtong", -- SB庞统：不解释，已经身份单禁了
	--	副将禁用
		--"+luboyan", -- 陆伯言：变身BUG
	--	特定禁用
		"zhenji+zhangjiao", -- 无限刷牌
		"zhenji+simayi", -- 无限刷牌
		"huanggai+wuguotai", -- 无限回复
		"luxun+liubei", -- 无限刷牌
		"luxun+yuji", -- 无限刷牌
		"zhugejin+zhenji", -- 无限刷牌
	  --"huanggai+yuanshao", -- 超强爆发
		"luxun+wolong", -- 强力刷牌
		"luxun+daqiao", -- 超强防杀
		"huangyueying+wolong", -- 强力刷牌
		--"huangyueying+yuanshao", -- 强力刷牌
		--"huangyueying+ganning", -- 强力刷牌
		--"huangyueying+yanliangwenchou", -- 强力刷牌
		--"yanliangwenchou+huanggai", -- 超强爆发
		--"yanliangwenchou+sunce", -- 决斗激昂
		"dengai+guojia", -- 屯田天妒
		"dengai+simayi", -- BUG禁配
		"dengai+zhangjiao", -- BUG禁配
		"dengai+shenzhugeliang",
		"dengai+shensimayi", -- BUG禁配
		"zhugejin+dengai", -- BUG禁配
		--"weiyan+huanggai", -- 吸血回复
		--"sunquan+nos_lingtong", -- 制衡旋风
		--"sunquan+sunshangxiang", -- 脱衣服睡觉
		"wuguotai+guojia", -- 卖血自补，高收益卖血将+高回复将
		"wuguotai+xunyu", -- 卖血自补，高收益卖血将+高回复将
		"huatuo+guojia", -- 几乎打不死，无限拖延时间
		"huatuo+xunyu", -- 几乎打不死，无限拖延时间
		"huatuo+xiahoujuan", -- 几乎打不死，无限拖延时间
		"yuanshu+zhanghe", -- 可避免庸肆负面效果
		"yuanshu+lvmeng", -- 可避免庸肆负面效果
		--"caoren+shenlvbu", -- 缩短神愤延时
		--"caozhi+shenlvbu", -- 缩短神愤延时
		--"caoren+caozhi", -- 缩短据守延时
		"guanxingzhangbao+luxun", -- 辅助爆发
		--"guanxingzhangbao+sunce", -- 辅助爆发
		--"guanxingzhangbao+huanggai", -- 超强爆发
		"xushu+zhugeliang", -- 刀枪不入
		"nos_xushu+zhugeliang", -- 刀枪不入
		"zhugejin+huatuo", -- 急救明哲
		--"fazheng+xiahoudun", -- 双重肛裂
		--"nos_fazheng+xiahoudun", -- 双重肛裂
		"caozhi+kongrong",

		"caochong+caocao",
		"caochong+yuanshu",
		"jiangboyue+huangyueying",
		"jiangboyue+wolong",
		"jiangboyue+yuanshao",
		"jiangboyue+yanliangwenchou",
		"jiangboyue+ganning",
		"jiangboyue+luxun",
		"jiangboyue+zhanggongqi",
		"jiangboyue+lukang",
		"lukang+liubei",
		"lukang+wolong",
		"lukang+yuji",
		"lukang+zhanggongqi",
		"zhanggongqi+luxun",
		"zhanggongqi+huatuo",
		"zhanggongqi+wisjiangwei",
		"caizhaoji+simayi",
		"caizhaoji+caoren",
		"caizhaoji+caozhi",
		"caizhaoji+zhugejin",
		"caizhaoji+shenlvbu",
		"caizhaoji+dengshizai",
		"dengshizai+caoren",
		"dengshizai+shenlvbu",
		"dengshizai+bgm_diaochan",
		"bgm_diaochan+caoren",
		"bgm_diaochan+shenlvbu",
		"bgm_diaochan+caizhaoji",
		"bgm_diaochan+bgm_caoren",
		"bgm_caoren+caoren",
		"bgm_caoren+caozhi",
		"bgm_caoren+shenlvbu",
		"bgm_caoren+dengshizai",
		"bgm_caoren+caizhaoji",
		"bgm_pangtong+huanggai",
		"bgm_zhangfei+guanyu",
		"bgm_liubei+zhugeliang"
	},
	forbid_packages = {
		"New3v3Card",
		"changban_slope",
		"test"
	},
}

mini_max = sgs.GetConfig("S_MINI_MAX_COUNT", config.mini_max)
for i=1, mini_max do
	local scene_name = ("MiniScene_%02d"):format(i)
	table.insert(config.scene_names, scene_name)
end

