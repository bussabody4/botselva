--[[
لــ تــيــــمو ســيـلــفــا
]] 
function timo(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
---------
if text == 'اوامر التفعيل والتعطيل' or text == "اوامر التفعيل" or text == "اوامر التعطيل" or text == "التفعيل والتعطيل" or text == "التعطيل والتفعيل" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Timo = bot.getUser(Sudo_Id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• التفعيل - التعطيل •', data = senderr..'/listallAddorrem'}, 
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
}
return send(msg_chat_id,msg_id, [[*
〈 اليك قائمه التعطيل والتفعيل 🥺❤️ 〉
*]],"md",false, false, false, false, reply_markup)
elseif text == 'اوامر القفل والفتح' or text == "اوامر القفل" or text == "اوامر الفتح" or text == "القفل والفتح" or text == "الفتح والقفل" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Timo = bot.getUser(Sudo_Id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القفل - الفتح •', data = senderr..'/NoNextSeting'}, 
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
}
return send(msg_chat_id,msg_id, [[*
〈 اليك قائمه القفل والفتح 🥺❤️ 〉
*]],"md",false, false, false, false, reply_markup)
elseif text == 'العاب اونلاين' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Timo = bot.getUser(Sudo_Id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تويت •', data = senderr..'/Haiw7'}, {text = '• صراحه •', data = senderr..'/saraha'}, 
},
{
{text = '• اسئله •', data = senderr..'/soaaal'}, {text = '• اذكار •', data = senderr..'/Haiw5'}, 
},
}
}
return send(msg_chat_id,msg_id, [[*
اليك العاب اونلاين
*]],"md",false, false, false, false, reply_markup)
end
-----------------------------------------
if text == "الالعاب" or text == "العاب" or text == "لعبه" then
local t = "*〈 قـائمه الالعاب يروحي 🥺♥ 〉  *"
local m = "https://t.me/UOUSOU/34"
local Timo = bot.getUser(Sudo_Id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• العاب السورس •', callback_data = msg.sender_id.user_id.."/SelvaTi"},{text = '• العاب متطورة •', callback_data = msg.sender_id.user_id.."/TiSelva"},
},
{
{text = '• بنك الحظ •', callback_data = msg.sender_id.user_id.."/SelTimoo"},
},
{
{text = '• النوادي •', callback_data = msg.sender_id.user_id.."/Nadyy"},{text = '• المزرعه •', callback_data = msg.sender_id.user_id.."/Mazraa"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard)) 
end
-----------------------------------------
if text == "الاوامر" or text == "اوامر الجروب" or text == "اوامر" then
local photo = bot.getUserProfilePhotos(Fast)
local ban = bot.getUser(Fast)
local bain = bot.getUser(senderr)
if bain.username then
banusername = '[@'..bain.username..']'
else
banusername = 'لا يوجد'
end
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local selva = "*╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ "..Text.." ⦊\n╚• ʜᴇʀᴇ ɪꜱ ᴛʜᴇ ʟɪꜱᴛ ᴏꜰ ᴄᴏᴍᴍᴀɴᴅꜱ*"
local Timo = bot.getUser(Sudo_Id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر المطورين •', callback_data = msg.sender_id.user_id.."/helpsudo"},{text = '• اوامر الجروب •', callback_data = msg.sender_id.user_id.."/Group12"},
},
{
{text = '• اوامر التسليه •', callback_data = msg.sender_id.user_id.."/helpts"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
{
{text = ' اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(selva).."&reply_to_message_id="..rep.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
-----------------------------------------
if text == "ترتيب الاوامر" or text == "اظبط الاوامر" or text == "رفع الاوامر" then
local photo = bot.getUserProfilePhotos(Fast)
local selva = "\n*╖ اهلا عزيزي "..msg.Name_Controller.." 🥺❤️*\n*╢ لترتيب الاوامر*\n*╜ اضغط الزر في الاسفل*\n"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اضغط لترتيب الاوامر •', callback_data = msg.sender_id.user_id.."/trtep@"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(selva).."&reply_to_message_id="..rep.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
-----------------------------------------
if text == "استعاده الاوامر" or text == "استعاده" or text == "ارجاع الاوامر" then
local photo = bot.getUserProfilePhotos(Fast)
local selva = "\n*╖ اهلا عزيزي "..msg.Name_Controller.." 🥺❤️*\n*╢ لاستعاده الاوامر*\n*╜ اضغط الزر في الاسفل*\n"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اضغط لاستعاده الاوامر •', callback_data = msg.sender_id.user_id.."/esta@"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(selva).."&reply_to_message_id="..rep.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
-----------------------------------------
if text == "تغير رد السورس" or text == "تغير رد سورس" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص المطور الاساسي فقط* ',"md",true)  
end
Redis:set(Fast.."Waiting:Source:Reply"..msg.sender_id.user_id, true)
return send(msg_chat_id, msg_id, "*• أرسل الآن الرد الجديد الذي تريد وضعه لأمر (سورس)\n • لجلب اسم المستخدم* `{name}`", "md")
end
if text == "الغاء" and Redis:get(Fast.."Waiting:Source:Reply"..msg.sender_id.user_id) then
Redis:del(Fast.."Waiting:Source:Reply"..msg.sender_id.user_id)
return send(msg_chat_id, msg_id, "*• تم إلغاء تعديل رد السورس*","md")
end
if Redis:get(Fast.."Waiting:Source:Reply"..msg.sender_id.user_id) then
Redis:del(Fast.."Waiting:Source:Reply"..msg.sender_id.user_id)
Redis:set(Fast.."Reply:Source:Text", text)
return send(msg_chat_id, msg_id, "*• تم حفظ رد السورس الجديد بنجاح ✅*", "md")
end
if text == "حذف رد السورس" or text == "مسح رد سورس" or text == "حذف رد سورس" or text == "مسح رد السورس" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص المطور الاساسي فقط* ',"md",true)  
end
Redis:del(Fast.."Reply:Source:Text")
return send(msg_chat_id, msg_id, "*• تم حذف رد السورس، والرجوع للرد الافتراضي*", "md")
end
if text == 'سورس' or text == 'يا سورس' or text == 'source' or text == 'السورس' then
local bain = bot.getUser(senderr)
local name = bain.first_name or "تـيـمـو"
local timo_selva = Redis:get(Fast.."Reply:Source:Text")
if not timo_selva then
timo_selva = "╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ {name} ⦊ \n╚• ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ ꜱᴏᴜʀᴄᴇ"
end
timo_selva = timo_selva:gsub("{name}", "*["..name.."](tg://user?id="..bain.id..")*")
local selva = "*"..timo_selva.."*"
local photo_url = "https://files.catbox.moe/rz15yy.jpg"
local Timo = bot.getUser(Sudo_Id)
local keyboard = {
inline_keyboard = {
{
{text = '• ᴅᴇᴠ ꜱᴏᴜʀᴄᴇ •', callback_data = msg.sender_id.user_id.."/DevSelva"},
{text = '• ᴄʜ ꜱᴏᴜʀᴄᴇ •', callback_data = msg.sender_id.user_id.."/ChannelSelva"},
},
{
{text = " "..(Timo.first_name or "Developer").." ", url = "https://t.me/"..Timo.username}
},
{
{text = ' اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
}
local rep = msg.id / 2097152 / 0.5
https.request("https://api.telegram.org/bot"..Token.."/sendPhoto?chat_id="..msg_chat_id.."&caption="..URL.escape(selva).."&photo="..photo_url.."&reply_to_message_id="..rep.."&parse_mode=Markdown&has_spoiler=true&reply_markup="..JSON.encode(keyboard))
end
-----------------------------------------
if text == "• قسم الاذاعه •" or text == "اذاعه" or text == "اذاعه اونلاين" or text == "اذاعه خاص" or text == "اذاعه بالتثبيت" or text == "اذاعه بالتوجيه" then
if Redis:get(Fast.."broadcast") then
send(msg.chat_id,msg.id,'*• الاذاعه معطله من قبل المطور الاساسي\n√*',"md",true)  
return false 
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n• عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n•  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n•  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local ban = bot.getUser(Fast)
local bain = bot.getUser(senderr)
if bain.username then
banusername = '[@'..bain.username..']'
else
banusername = 'لا يوجد'
end
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "\n*╖ اهلا عزيزي ⦉ "..Text.." ⦊️*\n*╢ اهلا بك في قوائم الاذاعه*\n*╜ يمكنك اختيار نوع الاذاعه من خلال الازرار*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• للم ــجـموعـات •', data = senderr..'/Broadcasting_Groups'},{text = '• للـخ ـــاص •', data = senderr..'/Broadcasting_Users'},
},
{
{text = '• بـالـتـثبــيـت •', data = senderr..'/Groups_Pin'},
},
{
{text = '• تـوجيـه للـم ــجـموعـات •', data = senderr..'/Groups_Fwd'},
},
{
{text = '• تـوجيـه بـالـخ ـاص •', data = senderr..'/Users_Fwd'},
},
}
}
return bot.sendText(msg_chat_id,msg_id,Timo,'md',false, false, false, false, reply_markup)
end
-----------------------------------------
if text == "تغيير" or text == "تغيير انلاين" or text == "تغير" or text == "• تغير اونلاين •" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local TIMO = "*• اليك قائمه التغير عزيزي "..msg.Name_Controller.." 🥺❤️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• المطور الاساسي •', data = senderr..'/yaaaaa'},
},
{
{text = '• اسم البوت الاول •', data = senderr..'/Namebot'},
},
{
{text = '• اسم البوت الثاني •', data = senderr..'/botName'},
},
}
}
return send(msg_chat_id, msg_id,TIMO,"md",false, false, false, false, reply_markup)
end
-----------------------------------------
if text == "الساعه" or text == "الوقت" then
    local Timoo = " "..os.date("%I:%M:%S %p")
    local TIMO = "*⌚️ إليك الساعة الآن، عزيزي " .. msg.Name_Controller .. " 🥺❤️*"
    local reply_markup = bot.replyMarkup{type = 'inline', data = {
        {
            {text = Timoo, url = 't.me/'..UserBot..'?start'},
        },
    }}
    return bot.sendText(msg_chat_id, msg_id, TIMO, 'md', false, false, false, false, reply_markup)
end
-----------------------------------------
if text == "التاريخ" or text == "انهارده اي" or text == "اليوم" then
local selva = http.request("http://api.aladhan.com/v1/gToH")
local timo_o = json:decode(selva) 
local timo1 = timo_o.data.hijri.day
local timo2 = timo_o.data.hijri.month.ar
local timo3 = timo_o.data.hijri.year
local timo4 = "• الميلادي > "..os.date("%Y/%m/%d")
local timo5 = "• الهجري > "..timo1.."/"..timo2.."/"..timo3.." "
local current_day = os.date("%A")
    local days_in_arabic = {
        Sunday = "الأحد",
        Monday = "الاثنين",
        Tuesday = "الثلاثاء",
        Wednesday = "الأربعاء",
        Thursday = "الخميس",
        Friday = "الجمعة",
        Saturday = "السبت"
    }
current_day = days_in_arabic[current_day] or current_day 
local timo6 = "• اليوم > "..current_day.." "
local Timo = "\n*╖ اهلا عزيزي "..msg.Name_Controller.." 🥺❤️*\n*╢ اليك تاريخ اليوم*\n*╜ الهجري والميلادي*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = timo6, url = 't.me/'..UserBot..'?start'},
},
{
{text = timo4, url = 't.me/'..UserBot..'?start'},
},
{
{text = timo5, url = 't.me/'..UserBot..'?start'},
},
}
}
return bot.sendText(msg_chat_id,msg_id,Timo,'md',false, false, false, false, reply_markup)
end 
-------------------
if text then
if text:match("(.*)(عبدالله)(.*)") or text:match("(.*)(مطور السورس)(.*)") or text:match("(.*)(مبرمج السورس)(.*)") then
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local selva = 6702141393
local sender = msg.sender_id.user_id
local from_user = bot.getUser(sender)
local sender_name = from_user.first_name or "مستخدم"
local sender_username = from_user.username and "@"..from_user.username or "لا يوجد يوزر"
local sender_username_link = from_user.username and "https://t.me/"..from_user.username or "tg://user?id="..sender
local sender_id = sender
local linked_name = "[" .. sender_name .. "](" .. sender_username_link .. ")"
local group_link = Info_Chats.invite_link.invite_link or "https://t.me/unknown"
local group_name = Get_Chat.title or "جروب"
local linked_group = "[" .. group_name .. "](" .. group_link .. ")"
local days_in_arabic = {Sunday = "الأحد",Monday = "الإثنين",Tuesday = "الثلاثاء",Wednesday = "الأربعاء",Thursday = "الخميس",Friday = "الجمعة",Saturday = "السبت"}
local day_of_week = os.date("%A")  
local current_date = os.date("%d/%m/%Y")  
local current_time = os.date("%I:%M %p")
day_of_week = days_in_arabic[day_of_week] or day_of_week
local notify_text = "*〈 نـداء اليك عزيدي المطور عبدالله ♥ 〉\n\n" .. "• الاسم *⇇⦉ " .. linked_name .. " ⦊\n" .. "*• اليوزر ⇇ ⦉ " .. sender_username .. " ⦊*\n" .. "*• الايدي ⇇* ⦉ `" .. sender_id .. "` ⦊\n*• في جروب ⇇ *⦉ " ..linked_group.." ⦊ \n".."*• اليوم ⇇ ⦉ " .. day_of_week .. " ⦊\n".."• التاريخ ⇇ ⦉ " .. current_date .. " ⦊\n".."• الوقت ⇇ ⦉ " .. current_time .. " ⦊*"
local Timo_Selva = bot.replyMarkup{type = 'inline',data = {{{text = sender_name, url = sender_username_link},},
{{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, },}}
bot.sendText(selva,0,notify_text,"md",false, false, false, false, Timo_Selva)
local UserId_Info = bot.searchPublicChat("Di_il")
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
local Bio = InfoUser.bio or ''
local username = UserInfo.first_name or ''
local user_tag = UserInfo.username and "@" .. UserInfo.username or "لا يوجد"
local photo = bot.getUserProfilePhotos(UserId_Info.id)
local user_id = UserId_Info.id
local Text = '*𝅄 𓏺 𝖬𝗋. 𝖳𝗂𝗆𝗈 𝖨𝗇𝖿𝗈𝗋𝗆𝖺𝗍𝗂𝗈𝗇\n'
..'𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮ ⦉* ['..username..'](tg://user?id='..user_id..') *⦊\n'
..'𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ ⦉ '..user_tag..' ⦊\n'
..'𝅄 𓏺 𝖨𝖣 ⋮ ⦉ '..user_id..' ⦊\n'
..'𝅄 𓏺 𝖡𝗂𝗈 ⋮ ⦉ '..Bio..' ⦊*'
keyboardd = {} 
keyboardd.inline_keyboard = { { {text = username, url = "https://t.me/Di_il"} } }
local msg_id = msg.id / 2097152 / 0.5 
if photo.total_count > 0 then
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(Text)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&has_spoiler=true &reply_markup='..JSON.encode(keyboardd))
else
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id='..msg.chat_id..'&text='..URL.escape(Text)..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
end


if text == 'المطور' or text == 'مطور البوت' or text == 'مطور' then   
local  ban = bot.getUser(Sudo_Id) 
local  bain = bot.getUserFullInfo(Sudo_Id)
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if  bain.bio then
Bio =  bain.bio
else
Bio = 'لا يوجد'
end
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
if ban.username then
Creator = "* "..ban.first_name.."*\n"
else
Creator = "* ["..ban.first_name.."](tg://user?id="..ban.id..")*\n"
end 
if ban.first_name then
Creat = " "..ban.first_name.." "
else
Creat = " Developers Bot \n"
end
local photo = bot.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = '*𝅄 𓏺 𝖧𝖾𝗋𝖾.𝗌 𝖳𝗁𝖾 𝖡𝗈𝗍 𝖣𝖾𝗏𝖾𝗅𝗈𝗉𝖾𝗋*\n'
..'𝅄 𓏺 *𝖭𝖺𝗆𝖾 ⋮* ['..ban.first_name..'](tg://user?id='..Sudo_Id..')\n'
..'𝅄 𓏺 *𝖴𝗌𝖾𝗋 ⋮* [@'..ban.username..']\n'
..'𝅄 𓏺 *𝖨𝖣 ⋮* `'..Sudo_Id..'`\n'
..'𝅄 𓏺 *𝖡𝗂𝗈 ⋮ ['..Bio..']*'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..ban.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&has_spoiler=true &reply_markup='..JSON.encode(keyboardd))
else
local TestText = '*𝅄 𓏺 𝖧𝖾𝗋𝖾.𝗌 𝖳𝗁𝖾 𝖡𝗈𝗍 𝖣𝖾𝗏𝖾𝗅𝗈𝗉𝖾𝗋*\n'
..'𝅄 𓏺 *𝖭𝖺𝗆𝖾 ⋮* ['..ban.first_name..'](tg://user?id='..Sudo_Id..')\n'
..'𝅄 𓏺 *𝖴𝗌𝖾𝗋 ⋮* [@'..ban.username..']\n'
..'𝅄 𓏺 *𝖨𝖣 ⋮* `'..Sudo_Id..'`\n'
..'𝅄 𓏺 *𝖡𝗂𝗈 ⋮ ['..Bio..']*'
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id='..msg.chat_id..'&text='..URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown".."&reply_markup="..URL.escape(JSON.encode(keyboardd)))
end
end
if text == 'نادي المطور' or text == 'نادي مطور' or text == 'المطور' or text == 'مطور' then  
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local bains = bot.getUser(senderr)
if bains.first_name then
klajq = ' ['..bains.first_name..'](tg://user?id='..bains.id..') '
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ''..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = ''..bains.first_name..''
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(Sudo_Id,0,'*\n• مرحبا سيدي المطور \nشخص ما يحتاج مساعدتك\nꔹ━━━━━━━━━━ꔹ\n• اسمه ⇿* '..klajq..' \n*• ايديه ⇿ '..senderr..'\n• يوزره ⇿ @'..basgk..'\n• الوقت ⇿ '..os.date("%I:%M %p *")..'\n• التاريخ ⇿ '..os.date("%Y/%m/%d *")..'*',"md",false, false, false, false, reply_markup)
end
if text == "اخفاء الڪيبورد" or text == '• تغير الڪيبورد •' then
local k = {remove_keyboard = true}
return https.request("http://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..msg.chat_id.."&text="..URL.escape("*• تـم اخـفـاء الـڪيـبورد بـنجـاح*").."&parse_mode=Markdown&reply_markup="..JSON.encode(k))
end

if not start_time then  
start_time = os.time()
end
if text == "حاله البوت" then
local uptime = os.time() - start_time 
local days = math.floor(uptime / 86400) 
local hours = math.floor((uptime % 86400) / 3600) 
local minutes = math.floor((uptime % 3600) / 60) 
local seconds = uptime % 60 
local uptime_text = string.format("*• البوت شغال منذ ⋮\n%d يوم ⋮ %d ساعة ⋮ %d دقيقة ⋮ %d ثانية*", days, hours, minutes, seconds)
bot.sendText(chat_id, msg_id, uptime_text, "md", true)
end

if text == 'افلام' or text == 'الافلام' or text == 'سينما' or text == 'سيما' then
local selva = "\n*╖ اهلا عزيزي "..msg.Name_Controller.." 🥺❤️*\n*╢ اليك قائمه الافلام*\n*╜ يمكنك التحكم من الازرار بالاسفل*\n"
local m = "https://t.me/UOUSOU/84"
local Timo = bot.getUser(Sudo_Id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• افلام ( 2025 ) •', callback_data=msg.sender_id.user_id.."/aflam2025"}
},
{
{text = '• افلام ( 2024 ) •', callback_data=msg.sender_id.user_id.."/aflam2024"}
},
{
{text = '• ʙᴏᴛ ᴅᴇᴠᴇʟᴏᴘᴇʀ •', url = "https://t.me/"..Timo.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(selva).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard)) 
end

if text == "تصفير ليكاتي" then
local user_id = msg.sender_id.user_id
Redis:del(Fast.."like:users:"..user_id)
Redis:srem(Fast.."like:user:", user_id)
return send(msg.chat_id, msg.id, "*• تم تصفير لايكاتك بنجاح يا نجم*", "md")
end

if text == "تصفير لايك" and msg.reply_to_message_id ~= 0 then
if msg.sender_id.user_id == 6702141393 then
local reply_msg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local target_id = reply_msg.sender_id.user_id
local target_info = bot.getUser(target_id)
local Timo_selva = FlterBio(target_info.first_name or "عبدالله")
Redis:del(Fast.."like:users:"..target_id)
Redis:srem(Fast.."like:user:", target_id)
return send(msg.chat_id, msg.id, "*• تم تصفير لايكات العضو ⇇*⦉ ["..Timo_selva.."](tg://user?id="..target_id..") ⦊", "md")
else
return send(msg.chat_id, msg.id, "*• هذا الامر يخص المطور عبدالله فقط*", "md")
end
end

if text and text:match("^اضف لايك (%d+)$") and msg.reply_to_message_id ~= 0 then
if msg.sender_id.user_id == 6702141393 then
local Timo_like = tonumber(text:match("^اضف لايك (%d+)$"))
if Timo_like > 10000 then
return send(msg.chat_id, msg.id, "*• الحد الأقصى لإضافة اللايكات هو 10000 لايك فقط.*", "md")
end
local reply_msg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local target_id = reply_msg.sender_id.user_id
local target_info = bot.getUser(target_id)
local Timo_selva = FlterBio(target_info.first_name or "عبدالله")
if not Redis:sismember(Fast.."like:user:", target_id) then
Redis:sadd(Fast.."like:user:", target_id)
end
for i = 1, Timo_like do
Redis:sadd(Fast.."like:users:"..target_id, "fake_"..math.random(1,99999999))
end
local total_likes = Redis:scard(Fast.."like:users:"..target_id)
local sender_name = FlterBio(msg.sender_id.first_name or "ㅤ 𓏺.𝘁𝗶𝗺𝗼 𝘀𝗲𝗹𝘃𝗮𝗮 .⤸")
local message = "*• تم تحويل "..Timo_like.." لايكات إليك من الشخص ⋮ * ⦉ ["..sender_name.."](tg://user?id="..msg.sender_id.user_id..") ⦊\n*• إجمالي لايكاتك الآن ⋮ "..total_likes.."*"
bot.sendText(target_id, 0, message, "md")
local message_to_dev = "*• يا عبدالله كدا انت حولت ⦉ "..Timo_like.." ⦊ لايك\n• لــــ * ⋮ ⦉ ["..Timo_selva.."](tg://user?id="..target_id..") ⦊"
bot.sendText(6702141393, 0, message_to_dev, "md")
return send(msg.chat_id, msg.id, "*• تم إضافة ⦉ "..Timo_like.." ⦊ لايكات\n• لــــ ⋮* ⦉ ["..Timo_selva.."](tg://user?id="..target_id..") ⦊\n*• إجمالي لايكاته الآن ⋮ ⦉ "..total_likes.." ⦊*", "md")
else
return send(msg.chat_id, msg.id, "*• هذا الامر يخص المطور عبدالله فقط*", "md")
end
end

if text == "تفعيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*•  اللايك ايدي مفعل مسبقا*',"md",true) 
end
Redis:del(Fast.."like:id:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n*•  تم تفعيل اللايك ايدي*\n•  و رمز اللايك ( '..emo..' )\n•  لتغيره ( ` تعيين لايك ايدي + الايموجي` )',"md",true) 
end

if text == "تعطيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*•  اللايك ايدي معطل مسبقا*',"md",true) 
end
Redis:set(Fast.."like:id:"..msg.chat_id, true)
return send(msg_chat_id,msg_id,'\n*•  تم تعطيل اللايك ايدي*',"md",true) 
end

if text and text:match('^تعيين لايك ايدي (.*)') then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo = text:match('^تعيين لايك ايدي (.*)')
Redis:set(Fast.."like:id:emo:"..msg.chat_id, emo)
return send(msg_chat_id,msg_id,'\n*•  تم وضع اللايك ايدي* ( '..emo..' )',"md",true) 
end

if text == "تصفير لايك ايدي" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n• هذا الامر يخص ⦃*'..Controller_Num(1)..'*⦄ بس',"md",true)  
end
local id_users = Redis:smembers(Fast.."like:user:")
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n•  لا يوجد مستخدمين',"md",true) 
end
for k,v in pairs(id_users) do
Redis:del(Fast.."like:users:"..v)
end
Redis:del(Fast.."like:user:")
return send(msg_chat_id,msg_id,'\n•  تم حذف ⦃ `'..#id_users..'` ⦄ مستخدم',"md",true) 
end

if text == "توب الليكات" then
local id_users = Redis:smembers(Fast.."like:user:")
local list = {}
local msg_text = "•  اعلى 20 مستخدم حصلو على لايك :\n\n"
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n•  لا يوجد مستخدمين',"md",true)
end
for k,v in pairs(id_users) do
local likes = #Redis:smembers(Fast.."like:users:"..v)
if tonumber(likes) ~= 0 then
table.insert(list, {tonumber(likes), v})
end
end
table.sort(list, function(a, b) return a[1] > b[1] end)
local emoji = { "🥇" ,"🥈","🥉","4)","5)","6)","7)","8)","9)","10)","11)","12)","13)","14)","15)","16)","17)","18)","19)","20)" }
for k,v in pairs(list) do
if tonumber(k) <= 20 then
local user_info = bot.getUser(v[2])
local user_name = user_info.first_name or "لا يوجد اسم"
user_name = user_name:gsub("<", ""):gsub(">", "") 
local user_link = "<a href=\"tg://user?id="..v[2].."\">" .. user_name .. "</a>"
msg_text = msg_text .. emoji[k] .. " " .. user_link .. " - " .. v[1] .. " لايك\n"
end
end
return send(msg_chat_id, msg_id, msg_text, "html", true)
end

if text == "مسح" then
local senderr = msg.sender_id.user_id
if not msg.Admin then
return send(msg_chat_id, msg_id, '\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ', "md", true)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id, msg_id, "\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *", "md", true)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id, msg_id, '\n*• البوت ليس لديه صلاحيه مسح الرسائل* ', "md", true)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "مسح 50 رساله", data = senderr.."/del5ll"},
},
{
{text = "مسح 100 رساله", data = senderr.."/del10ll"},{text = "مسح 200 رساله", data = senderr.."/del20io"},
},
{
{text = "مسح 300 رساله", data = senderr.."/del30ui"},{text = "مسح 400 رساله", data = senderr.."/del58sue"},
},
{
{text = "مسح 500 رساله", data = senderr.."/del50ew"},{text = "مسح 600 رساله", data = senderr.."/del60ri"},
},
{
{text = "مسح 700 رساله", data = senderr.."/del80rv"},{text = "مسح 800 رساله", data = senderr.."/del90wz"},
},
{
{text = "مسح 900 رساله", data = senderr.."/del90rm"},{text = "مسح 1000 رساله", data = senderr.."/del100vc"},
},
}
}
return send(msg_chat_id, msg_id, "*• اختر عدد الرسائل التي تريد مسحها*", "md", false, false, false, false, reply_markup)
end


if text == "شراء مميز" or text == "شراء رتبه مميز" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 500 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه مميز.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 500)
if Redis:sismember(Fast.."Special:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبة مميز.*", "md", true)
else
Redis:sadd(Fast.."Special:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك رتبه مميز في البوت وتم خصم 500 من نقاطك.*", "md", true)
end
end

if text == "شراء ادمن" or text == "شراء رتبه ادمن" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 2000 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه ادمن.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 2000)
if Redis:sismember(Fast.."Admin:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبته ادمن.*", "md", true)
else
Redis:sadd(Fast.."Admin:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته ادمن في البوت وتم خصم 2000 من نقاطك*", "md", true)
end
end


if text == "شراء منشئ" or text == "شراء رتبه منشئ" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 3200 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه منشئ.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 3200)
if Redis:sismember(Fast.."Creator:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبه منشئ.*", "md", true)
else
Redis:sadd(Fast.."Creator:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته منشئ في البوت وتم خصم 3200 من نقاطك*", "md", true)
end
end

if text == "شراء مدير" or text == "شراء رتبه مدير" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 3800 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه مدير.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 3800)
if Redis:sismember(Fast.."Manger:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبه مدير.*", "md", true)
else
Redis:sadd(Fast.."Manger:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته مدير في البوت وتم خصم 3800 من نقاطك*", "md", true)
end
end

if text == "شراء منشئ اساسي" or text == "شراء رتبه منشئ اساسي" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 4100 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه منشئ اساسي.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 4100)
if Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبه منشئ اساسي.*", "md", true)
else
Redis:sadd(Fast.."SuperCreator:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته منشئ اساسي في البوت وتم خصم 4100 من نقاطك*", "md", true)
end
end

if text == "شراء مالك" or text == "شراء رتبه مالك" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 18000 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه مالك.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 18000)
if Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبه مالك.*", "md", true)
else
Redis:sadd(Fast.."Ownerss:Group"..msg.chat_id, msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته مالك في البوت وتم خصم 18000 من نقاطك*", "md", true)
end
end

if text == "شراء مطور" or text == "شراء رتبه مطور" then 
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(Num) < 35000 then
return send(msg.chat_id, msg.id, "*• نقاطك لا تكفي لشراء رتبه مطور.*", "md", true)
end
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 35000)
if Redis:sismember(Fast.."Special:Group"..msg.chat_id, msg.sender_id.user_id) then
return send(msg.chat_id, msg.id, "*• لديك بالفعل رتبه مطور.*", "md", true)
else
Redis:sadd(Fast.."Dev:Groups", msg.sender_id.user_id)
return send(msg.chat_id, msg.id, "*• تم ترقيتك الي رتبته مطور في البوت وتم خصم 35000 من نقاطك*", "md", true)
end
end

if text == "شراء رتبه" or text == "ارفعني" or text == "رتبه" or text == "متجر" then    
local Timo = "*• يمكنك شراء رتبه في البوت باستخدام نقاطك \n• شراء مميز ⋮ 500 نقطه\n• شراء ادمن ⋮ 2000 نقطه\n• شراء منشئ ⋮ 3200 نقطه\n• شراء منشئ اساسي ⋮ 4100 نقطه\n• شراء مدير ⋮ 3800 نقطه\n• شراء مالك ⋮ 18000 نقطه\n• شراء مطور ⋮ 35000 نقطه *"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "• مميز •", data = msg.sender_id.user_id.."/BuySpecial"},{text = "• ادمن •", data = msg.sender_id.user_id.."/BuyAdmin"},
},
{
{text = "• منشئ •", data = msg.sender_id.user_id.."/BuyCreatorr"},{text = "• منشئ اساسي •", data = msg.sender_id.user_id.."/BuySuperCreator"},
},
{
{text = "• مالك •", data = msg.sender_id.user_id.."/BuyOwnerss"},{text = "• مدير •", data = msg.sender_id.user_id.."/BuyManger"},
},
{
{text = "• مطور •", data = msg.sender_id.user_id.."/BuyDev"},
},
}
}
return send(msg.chat_id, msg.id,Timo,"md", false, false, false, false, reply_markup)
end

if text and text:match("^استفتاء (.+)$") then
local input = text:match("^استفتاء (.+)$")
local question, opts = input:match("^(.-)%s*%-%s*(.+)$")
if not question or not opts then
return send(msg.chat_id, msg.id, "*الصيغه غلط\nاكتب: استفتاء سؤالك - اختيار 1 - اختيار 2 ...*", "md", true)
end
local options = {}
for opt in opts:gmatch("[^%-]+") do
table.insert(options, opt:match("^%s*(.-)%s*$"))
end
if #options < 2 or #options > 10 then
return send(msg.chat_id, msg.id, "*عدد الخيارات يجب أن يكون من 2 إلى 10.*", "md", true)
end
local success = timo_selva(msg.chat_id, question, options)
if not success then
return send(msg.chat_id, msg.id, "* حدث خطأ في إرسال الاستفتاء.*", "md", true)
end
return false
end

if text == "الجاسوس" then
Redis:del("SpyGame:Players"..msg_chat_id)
Redis:del("SpyGame:Started"..msg_chat_id)
Redis:del("SpyGame:Spy"..msg_chat_id)
Redis:del("SpyGame:ExplainIndex"..msg_chat_id)
Redis:set(Fast.."SpyGame:Owner:"..msg.chat_id, msg.sender_id.user_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "• انضمام •", data = "join_spy_game"}
},
}
}
return send(msg_chat_id, msg_id, "*• اهلا بك في لعبه الجاسوس \n• يمكنك الانضمام الي اللعبه من خلال الزرار في الاسفل\n• تاكد من وجود محادثه بينك وبين البوت*", "md", false, false, false, false, reply_markup)
end
------------------
function shuffle_table(t)
math.randomseed(os.time())
local n = #t
for i = n, 2, -1 do
local j = math.random(i)
t[i], t[j] = t[j], t[i]
end
return t
end
function explain_next_player(chat_id)
local shuffled_list = Redis:get("SpyGame:ShuffledPlayers"..chat_id)
if not shuffled_list then
local list = Redis:get("SpyGame:PlayerList"..chat_id)
if not list then return end
local players = {}
for id in string.gmatch(list, '([^,]+)') do
table.insert(players, id)
end
players = shuffle_table(players)
local new_list = table.concat(players, ",")
Redis:set("SpyGame:ShuffledPlayers"..chat_id, new_list)
Redis:set("SpyGame:ExplainIndex"..chat_id, 1)
shuffled_list = new_list
end
local players = {}
for id in string.gmatch(shuffled_list, '([^,]+)') do
table.insert(players, id)
end
local index = tonumber(Redis:get("SpyGame:ExplainIndex"..chat_id)) or 1
if index > #players then
Redis:del("SpyGame:ShuffledPlayers"..chat_id) 
send_vote_buttons(chat_id)
return
end
local uid = players[index]
local user = bot.getUser(uid)
send(chat_id, 0, "*• الدور علي* ⦉ ["..user.first_name.."](tg://user?id="..uid..") ⦊\n*• اشرح الكلمه الان !\n• معاك 25 ثانيه تشرح فيهم*", "md")
Redis:incr("SpyGame:ExplainIndex"..chat_id)
os.execute("sleep 25")
explain_next_player(chat_id)
end
---------------------
 function send_vote_buttons(chat_id)
local players = {}
for id in string.gmatch(Redis:get("SpyGame:PlayerList"..chat_id), '([^,]+)') do
table.insert(players, id)
end
local options = {}
for _, id in ipairs(players) do
local user = bot.getUser(id)
table.insert(options, user.first_name or "Unknown")
end
local question = "• من تعتقد انه الجاسوس 😂❤️."
local success = timo_selva(chat_id, question, options)
if success then
os.execute("sleep 20")
announce_spy(chat_id)
end
end
---------------------------
function announce_spy(chat_id)
local spy = Redis:get("SpyGame:Spy"..chat_id)
local word = Redis:get("SpyGame:Word"..chat_id)
if not spy then return end
local user = bot.getUser(spy)
local name = user.first_name or "الجاسوس"
send(chat_id, 0, "*• الجاسوس هو ⋮* ⦉ ["..name.."](tg://user?id="..spy..") ⦊\n*• خمن الكلمه التي تم شرحها !*", "md", true)
send(spy, 0, "*• خمن الكلمة !\nلو عرفتها، هتفوز !\nاكتب الكلمه هنا او في الجروب *", "md")
Redis:set("SpyGame:WaitGuess:"..spy, chat_id)
Redis:set("SpyGame:ReadyToGuess:"..spy, true)
end
------------------------------------
if text and Redis:get("SpyGame:WaitGuess:"..senderr) then
local chat_id = Redis:get("SpyGame:WaitGuess:"..senderr)
local spy_id = Redis:get("SpyGame:Spy"..chat_id)
if tostring(senderr) ~= tostring(spy_id) then
return
end
if not Redis:get("SpyGame:ReadyToGuess:"..senderr) then
return
end
local correct_word = Redis:get("SpyGame:Word"..chat_id)
if text:lower() == correct_word:lower() then
send(chat_id, 0, "*• الجاسوس خمن الكلمة صح !\nطلع جاسوس ذكي !*", "md")
else
send(chat_id, 0, "*• الجاسوس خمن غلط !\nطلع جاسوس فاشل !\n\n• الكلمة كانت ⋮ "..correct_word.."*", "md")
end
Redis:del("SpyGame:WaitGuess:"..senderr)
Redis:del("SpyGame:ReadyToGuess:"..senderr)
end
----------------------
if text == "نرد" or text == "النرد" then
send_timo_selva(msg.chat_id, "dice")
end
if text == "سله" or text == "كره سله" or text == "السله" or text == "كره السله" then
send_timo_selva(msg.chat_id, "basketball")
end
if text == "قدم" or text == "كوره" or text == "كوره قدم" then
send_timo_selva(msg.chat_id, "football")
end
if text == "بولينج" then
send_timo_selva(msg.chat_id, "bowling")
end
if text == "دارتس" then
send_timo_selva(msg.chat_id, "darts")
end
----------------------
function get_usd_price()
local response_body = {}
local api_key = "efef288d0e754e73995db24eb7be58a3"
local url = "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=" .. api_key
local res, code = https.request{
url = url,
sink = ltn12.sink.table(response_body)
}
if code ~= 200 then
return "❌ فشل في الاتصال بجلب السعر."
end
local body = table.concat(response_body)
local data, _, err = JSON.decode(body)
if err or not data or not data.rates then
return "❌ تعذر الحصول على السعر."
end
local rates = data.rates
local function fmt(val)
return string.format("%.2f", tonumber(val))
end
local msg = "✅ أسعار الدولار الآن ⋮\n"
msg = msg .. "🇪🇬 الجنيه المصري ⋮ ⦉ " .. fmt(rates.EGP) .. " ⦊\n"
msg = msg .. "🇸🇦 الريال السعودي ⋮ ⦉ " .. fmt(rates.SAR) .. " ⦊\n"
msg = msg .. "🇦🇪 الدرهم الإماراتي ⋮ ⦉ " .. fmt(rates.AED) .. " ⦊\n"
msg = msg .. "🇱🇧 الليرة اللبنانية ⋮ ⦉ " .. fmt(rates.LBP) .. " ⦊\n"
msg = msg .. "🇸🇾 الليرة السورية ⋮ ⦉ " .. fmt(rates.SYP) .. " ⦊\n"
msg = msg .. "🇮🇶 الدينار العراقي ⋮ ⦉ " .. fmt(rates.IQD) .. " ⦊\n"
msg = msg .. "🇦🇺 الدولار الأسترالي ⋮ ⦉ " .. fmt(rates.AUD) .. " ⦊\n"
msg = msg .. "🇨🇦 الدولار الكندي ⋮ ⦉ " .. fmt(rates.CAD) .. " ⦊\n"
msg = msg .. "🇴🇲 الريال العُماني ⋮ ⦉ " .. fmt(rates.OMR) .. " ⦊\n"
msg = msg .. "🇶🇦 الريال القطري ⋮ ⦉ " .. fmt(rates.QAR) .. " ⦊\n"
msg = msg .. "🇰🇼 الدينار الكويتي ⋮ ⦉ " .. fmt(rates.KWD) .. " ⦊\n"
msg = msg .. "🇨🇭 الفرنك السويسري ⋮ ⦉ " .. fmt(rates.CHF) .. " ⦊\n"
return msg
end
if text == "دولار" or text == "سعر الدولار" then
local timo = get_usd_price()
send(msg.chat_id, msg.id,"*"..timo.."*", "md")
end


function get_asiacell_price_custom()
local response_body = {}
local api_key = "efef288d0e754e73995db24eb7be58a3"
local url = "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=" .. api_key
local res, code = https.request{
url = url,
sink = ltn12.sink.table(response_body)
}
if code ~= 200 then
return "❌ فشل في الاتصال بجلب السعر."
end
local body = table.concat(response_body)
local data, _, err = JSON.decode(body)
if err or not data or not data.rates then
return "❌ تعذر الحصول على السعر."
end
local rates = data.rates
local usd_to_egp = tonumber(rates.EGP)
local asia_egp = 30
local asia_usd = asia_egp / usd_to_egp
local msg = "💳 سعر 1 ASIA الآن ⋮\n"
msg = msg .. "🇮🇶 الدينار العراقي ⋮ ⦉ 1000 ⦊\n"
msg = msg .. "🇺🇸 الدولار ⋮ ⦉ " .. string.format("%.4f", asia_usd) .. " ⦊\n"
msg = msg .. "🇪🇬 الجنيه المصري ⋮ ⦉ " .. string.format("%.2f", asia_egp) .. " ⦊\n"
return msg
end

if text == "اسيا" or text == "اساسيل" then
local timo = get_asiacell_price_custom()
send(msg.chat_id, msg.id,"*"..timo.."*", "md")
end

if text == "مصحف" or text == "المصحف" then
local last_selva = Redis:get(Fast.."quran_selva:"..msg.sender_id.user_id) or 1
last_selva = tonumber(last_selva)
local Tselva = "*• اهلا بك في مصحف القران الڪـريم 🌿❤️.*"
local keyboard = {inline_keyboard = {{{text = "• اضغط لفتح المصحف •", callback_data = msg.sender_id.user_id.."/quran_"..last_selva},},}}
https.request("https://api.telegram.org/bot"..Token.."/sendPhoto?chat_id="..msg_chat_id.."&photo=https://t.me/UOUSOU/95".."&caption="..URL.escape(Tselva).."&parse_mode=markdown&reply_markup="..URL.escape(JSON.encode(keyboard)))
end 


if text == 'تلاوات' or text == 'قران' or text == 'القران' or text == "القران الكريم" then
local selva = "*• اختر السورة التي تريد عرضها من المصحف الكريم :*"
local keyboard = {inline_keyboard = {{{text = "• اضغط للاستماع الي القران الكريم •", callback_data = msg.sender_id.user_id.."/next_1"}}}}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendPhoto?chat_id="..msg_chat_id.."&caption="..URL.escape(selva).."&photo=https://t.me/UOUSOU/95&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end

----------------------
end
return {Fast = timo}