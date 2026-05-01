function reply(msg)
text = nil
if msg and msg.content and msg.content.text then xname =  (Redis:get(Fast.."Name:Bot") or "سيلفا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then text = neww or text
end
end

--------

if text == "تفعيل ردود السورس" or text == "تفعيل ردود البوت" or text == "تفعيل الردود المصريه" or text == "تفعيل الردود العراقيه" or text == "تعطيل ردود بوت" or text == "تفعيل ردود بوت" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تفعيل الردود المصريه • ', data = senderr..'/open_masr'},
},
{
{text = '• تفعيل الردود العراقيه •', data = senderr..'/open_Iraq'},
},
}
}
return send(msg_chat_id,msg_id,"*• بواسطه ⦉ "..Text.." ⦊\n• تم تفعيل ردود السورس 🌿❤️.\n• اختار نوع الردود اللتي تريد تفعيلها 🌿❤️.*","md",false, false, false, false, reply_markup)
end 

if text == "تعطيل ردود السورس" or text == "تعطيل ردود البوت" or text == "تعطيل الردود المصريه" or text == "تعطيل الردود العراقيه" or text == "تعطيل ردود بوت" or text == "تعطيل ردود بوت" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تعطيل الردود المصريه • ', data = senderr..'/clocs_masr'},
},
{
{text = '• تعطيل الردود العراقيه •', data = senderr..'/clocs_Iraq'},
},
}
}
return send(msg_chat_id,msg_id,"*• بواسطه ⦉ "..Text.." ⦊\n• تم تعطيل ردود السورس 🌿❤️.\n• اختار نوع الردود اللتي تريد تعطيلها 🌿❤️.*","md",false, false, false, false, reply_markup)
end

if text == 'هاي' or text == 'هيي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*خالتك جرت ورايا 😹💔*',"md",true)  
end
if text == 'سلام عليكم' or text == 'السلام عليكم' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*وعليكم السلام 🌝💜*',"md",true)  
end
if text == 'سلام' or text == 'مع سلامه' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*مع الف سلامه يقلبي متجيش تاني 😹💔🎶*',"md",true)  
end
if text == 'برايفت' or text == 'بف' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*خدوني معاكم برايفت والنبي 🥺💔*',"md",true)  
end
if text == 'النبي' or text == 'صلي علي النبي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*عليه الصلاه والسلام 🌝💛*',"md",true)  
end
if text == 'نعم' or text == 'يا نعم' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*نعم الله عليك 🌚❤️*',"md",true)  
end
if text == '🙄' or text == '🙄🙄' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'* نزل عينك تحت كدا علشان هتخاد علي قفاك 😒❤️*',"md",true)  
end
if text == '🙄' or text == '🙄🙄' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*نزل عينك تحت كدا علشان هتخاد علي قفاك 😒❤️*',"md",true)  
end
if text == '😂' or text == '😂😂' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🌝❤️*',"md",true)  
end
if text == '😹' or text == '😹' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🌝❤️*',"md",true)  
end
if text == '🤔' or text == '🤔🤔' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'* بتفكر في اي 🤔*',"md",true)  
end
if text == '🌚' or text == '🌝' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*القمر ده شبهك 🙂❤️*',"md",true)  
end
if text == '💋' or text == '💋💋' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*انا عايز مح انا كمان 🥺💔*',"md",true)  
end
if text == '😭' or text == '😭😭' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*بتعيط تيب لي طيب 😥*',"md",true)  
end
if text == '🥺' or text == '🥺🥺' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*متزعلش بحبك 😻🤍*',"md",true)  
end
if text == '😒' or text == '😒😒' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*عدل وشك ونت بتكلمني 😒🙄*',"md",true)  
end
if text == 'بحبك' or text == 'حبق' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*وانا كمان بعشقك يا روحي 🤗🥰*',"md",true)  
end
if text == 'محح' or text == 'هات مح' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*محات حياتي يروحي 🌝❤️*',"md",true)  
end
if text == 'هلا' or text == 'هلا وغلا' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*هلا بيك ياروحي 👋*',"md",true)  
end
if text == 'هشش' or text == 'هششخرص' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*بنهش كتاكيت احنا هنا ولا اي 🐣😹*',"md",true)  
end
if text == 'الحمد الله' or text == 'بخير الحمد الله' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*دايما ياحبيبي 🌝❤️*',"md",true)  
end
if text == 'بف' or text == 'بص بف' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*وحيات امك ياكبتن خدوني معاكو بيف ??💔*',"md",true)  
end
if text == 'خاص' or text == 'بص خاص' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ونجيب اشخاص 😂👻*',"md",true)  
end
if text == 'صباح الخير' or text == 'مساء الخير' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*انت الخير يعمري 🌝❤️*',"md",true)  
end
if text == 'صباح النور' or text == 'باح الخير' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*صباح العسل 😻🤍*',"md",true)  
end
if text == 'حصل' or text == 'حثل' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*خخخ امال 😹*',"md",true)  
end
if text == 'اه' or text == 'اها' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*اه اي يا قدع عيب 😹💔*',"md",true)  
end
if text == 'كسم' or text == 'كسمك' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*عيب ياوسخ 🙄💔*',"md",true)  
end
if text == "يا بوتي" then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*روح وعقل بوتك 🥺💔*',"md",true)  
end
if text == 'متيجي' or text == 'تع' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*لا عيب بتكسف 😹💔*',"md",true)  
end
if text == 'هيح' or text == 'لسه صاحي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*صح النوم 😹💔*',"md",true)  
end
if text == 'منور' or text == 'نورت' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ده نورك ي قلبي 🌝💙*',"md",true)  
end
if text == 'باي' or text == 'انا ماشي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ع فين لوين رايح وسايبنى 🥺💔*',"md",true)  
end
if text == 'ويت' or text == 'ويت يحب' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*اي الثقافه دي 😒😹*',"md",true)  
end
if text == 'خخخ' or text == 'خخخخخ' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*اهدا يوحش ميصحش كدا 😒😹*',"md",true)  
end
if text == 'شكرا' or text == 'مرسي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*العفو ياروحي 🙈🌝*',"md",true)  
end
if text == 'حلوه' or text == 'حلو' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*انت الي حلو ياقمر 🤤🌝*',"md",true)  
end
if text == 'بموت' or text == 'هموت' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*موت بعيد م ناقصين مصايب 😑😂*',"md",true)  
end
if text == 'اي' or text == 'ايه' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*جتك اوهه م سامع ولا ايي 😹👻*',"md",true)  
end
if text == 'طيب' or text == 'تيب' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*فرح خالتك قريب 😹💋💃🏻*',"md",true)  
end
if text == 'حاضر' or text == 'حتر' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*حضرلك الخير يارب 🙂❤️*',"md",true)  
end
if text == 'جيت' or text == 'انا جيت' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'* لف ورجع تانى مشحوار 😂🚶‍♂👻*',"md",true)  
end
if text == 'بخ' or text == 'عو' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*يوه خضتني ياسمك اي 🥺💔*',"md",true)  
end
if text == 'حبيبي' or text == 'حبيبتي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*اوه ياه 🌝😂*',"md",true)  
end
if text == 'تمام' or text == 'تمم' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'* امك اسمها احلام 😹😹*',"md",true)  
end
if text == 'خلاص' or text == 'خلص' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*خلصتت روحكك يبعيد 😹💔*',"md",true)  
end
if text == 'سي في' or text == 'سيفي' then
if not Redis:get(Fast.."Timoo:Selvaa"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*كفيه شقط سيب حاجه لغيرك 😎😂*',"md",true)  
end
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '😭😭😭' or text == '😭😭😭😭' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*مآآعٍآشُ آلُِي يزعٍلُِڪڪ 𖠙 😏♥️*',"md",true)  
end
if text == 'سلام' or text == 'سلام عليكم' or text == 'السلام عليكم' or text == 'سلامم عليكم' or text == 'السلامم عليكم' or text == 'سلامم' or text == 'السلام على من رد السلام' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*و الـسٕـلام ؏ـليڪم ؏ـمࢪي 🤍*',"md",true)  
end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*شبّيي اﻟ̣̣פﻟ̣̣و 𖠙 😿💔*',"md",true)  
end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*أُرٌجُعُ عٍيدِهآآ مٍوو تنِْسةه 𖠙 🤤♥️*',"md",true)  
end
if text == 'هلو' or text == 'هلا' or text == 'هلاو' or text == 'ههلا' or text == 'ههلاو' or text == 'هلاو' or text == 'هاي' or text == 'ههاي' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ۿـلاٱ بَلحـبَ ﻣﻣـَاُلتي 😔??*',"md",true)  
end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' or text == 'شلون الاخبار' or text == 'شخبارك' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*تمۘامۘ عمۘري ٰوانۨہتت ?? ??♥️*',"md",true)  
end
if text == 'وينك' or text == 'وينج' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*مْوٌجہوٌدِ يہمْگُ يحلوُ 𖠙 😉♥️*',"md",true)  
end
if text == 'نايمين' or text == 'ميتين' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*طُآمسين ووعٍيوونڪ 𖠙 😪🖤ۦ*',"md",true)  
end
if text == 'بوت عواي' or text == 'بوت زربه' or text == 'البوت عاوي' or text == 'البوت زربه' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*اطردكك تجرب ؟ ، 😕🔪*',"md",true)  
end
if text == 'هلوباي' or text == 'هلو باي' then  
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*شحۡسۜيت مۘنۨہ هيجۚ ּكتبت ؟ 🌝♥️*',"md",true)  
end
if text == 'اكلك' or text == 'اكلج' or text == 'اكلكم' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ڪوولُِ مآڪوولُِ لُِآحٍدِ 𖠙 😉♥️*',"md",true)  
end
if text == 'فرخ' or text == 'فرخه' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*وينۨہهۂَ خۡل احۡصرهۂَ 𖠙 😹♥️*',"md",true)  
end
if text == 'بوسني' or text == 'بوسيني' then 
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*-محِااﭑةه ، ݪسِقق  🥺♥️♥️؟.*',"md",true)  
end
if text == "صباحوا" or text == "صباح الخير" or text == "صباحو" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*صَباحيّ ، ﭑنتةه🥺💞💞.*',"md",true)  
end
if text == "اكو بوت" or text == "اكو بوت؟" or text == "عدكم بوت" or text == "عندكم بوت" or text == "عدكم بوت؟" or text == "عندكم بوت؟" or text == "تردون بوت" or text == "تردون بوت؟" or text == "وين البوت" or text == "وين البوت؟" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*-موَ بعَينڪۃ ، شنيَ ، 🌝🌝.*',"md",true)  
end
if text == "جاو" or text == "ججاو" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*- ۅَتعۅفنيَ ؟.*',"md",true)  
end
if text == "تف" or text == "تفف" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*چا غير مَي ، ۅࢪدَ ،*',"md",true)  
end
if text == "تحبني" or text == "تحبني؟" or text == "تحبني؟؟" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*شعندِيّ ، غيࢪكَ✌️♥️*',"md",true)  
end
if text == "ههه" or text == "هههه" or text == "ههههه" or text == "هههههه" or text == "ههههههه" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*جَعل ، محدَ غيݛكَ ، يضحكَ  ، ♥️♥️*',"md",true)  
end
if text == "جوعان" or text == "جوعانه" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ټعاَل ﭑڪلنيَ ، 🌝.*',"md",true)  
end
if text == 'وينك' or text == 'وينج' then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*مْوٌجہوٌدِ يہمْگُ يحلوُ  😉♥️*',"md",true)  
end
if text == "بوت ملطلط" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ربي صبرني 😞🌾*',"md",true)  
end
if text == "وينكم" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*حَيݪيٰ ، 🥺💞*',"md",true)  
end
if text == "احبك" or text == "حبك" then
if not Redis:get(Fast.."Timo:Iraq"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id," ","md",true)  
end
return bot.sendText(msg_chat_id,msg_id,'*ﭑنيۿمَ ، قسمَہ، 🥺💞*',"md",true)  
end


end
return {Fast = reply}