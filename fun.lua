--[[
]] 
function Fast_Fun(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text== 'مسح موسيقى' and msg.reply_to_message_id then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)  
Redis:del(Fast..'Text:Games:audio'..Message_Reply.content.audio.audio.remote.id)  
Redis:srem(Fast.."audio:Games:Bot",Message_Reply.content.audio.audio.remote.id)  
return send(msg.chat_id, msg.id,'• تم مسح الموسيقى ومسح الجواب .')
end

if text== 'اضف موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg.chat_id, msg.id,'• ارسل الموسيقى الان ...')
end

if text== ("قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
for k,v in pairs(list) do
bot.sendAudio(msg_chat_id, msg.id,v , '', "md") 
end
end

if text== ("مسح قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
for k,v in pairs(list) do
Redis:del(Fast..'Text:Games:audio'..v)  
Redis:srem(Fast.."audio:Games:Bot",v)  
end
return send(msg.chat_id, msg.id, "• تم مسح جميع الاسئله")
end

if text== 'موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
local quschen = list[math.random(#list)]
local GetAnswer = Redis:get(Fast..'Text:Games:audio'..quschen)
Redis:set(Fast..'Games:Set:Answer'..msg.chat_id,GetAnswer)
bot.sendAudio(msg_chat_id, msg.id,quschen , '', "md") 
return false
end


if text == "تفعيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات العامه بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل الصوتيات العامه \n✓" )
end 
end
if text == "تعطيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات العامه بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل الصوتيات العامه\n✓" )
end   
end

if text == "تفعيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل الصوتيات \n✓" )
end 
end
if text == "تعطيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio1'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل الصوتيات\n✓" )
end   
end

if text == "تفعيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n•هذا الامر يخص { '..Controller_Num(6)..' }*',"md",true)  
end
local JABWA = ' \n•تم تفعيل شعر'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'sh3ir:Abs'..msg.chat_id) 
end
if text == "تعطيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n• هذا الامر يخص { '..Controller_Num(6)..' }*',"md",true)  
end
local JABWA = ' \n• تم تعطيل شعر'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'sh3ir:Abs'..msg.chat_id,true)  
end
if text and (text == "شعر" or text == "↫ شعر ✯") and not Redis:get(Fast..'sh3ir:Abs'..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*• تم اختيار الشعر لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ قناة السورس ⚡',url="t.me/"..chsource..""}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "تخ" or text == "اقتلو" or text == "تخ تخ" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return bot.sendText(msg_chat_id,msg_id,"*لول عوز يقتل نفسه العبيط 😹*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(6702141393) then
return bot.sendText(msg_chat_id,msg_id,"*يسطا دا مبرمج السورس ممكن يفشخني انا وانتا 😂😞*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر علي نفسي يستا 😂*","md",true)  
end
if ban.first_name then
Text = '*قتل ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n*المجرم دا 😢 ⇿* ['..ban.first_name..'](tg://user?id='..ban.id..')\n*انـا لله وانـا اليـه راجعـون 😢\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'المقتول 🔪', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/176&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تف" or text == "اتفو" or text == "تف تف" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return bot.sendText(msg_chat_id,msg_id,"*اععع عوز يتف علي نفسه 😳*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(6702141393) then
return bot.sendText(msg_chat_id,msg_id,"*يسطا دا مبرمج السورس ممكن يفشخني انا وانتا 😂😞*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر علي نفسي يستا 😂*","md",true)  
end
if ban.first_name then
Text = '*تف ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n*علي المجرم دا 😢 ⇿ * ['..ban.first_name..'](tg://user?id='..ban.id..')\n*اععع اي القرف دا\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'المجني عليه 😹', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/175&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "مح" or text == "بوسه" or text == "مح فبؤقك" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*اععع عوز يبوس نفسه 😳*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*لا استخدم الأمر علي نفسي يستا 😂*","md",true)  
end
if ban.first_name then
Text = '*💞 القميل ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n*😉 بعتلك بوسه ⇿* ['..ban.first_name..'](tg://user?id='..ban.id..')\n*• تم القبله بنجاح 🥺♥\n*'
else
Text = 'لا يوجد'
end
 keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'المقبول 👻😹', url = "https://t.me/"..ban.username..""},
},
}
local msgg = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/199&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "نااادي" or text == "صيييييح" then
local Info_Chats = bot.getSupergroupFullInfo(msg.chat_id)
local chat_Members = bot.searchChatMembers(msg_chat_id, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local Mostafa = "["..member_name.."](tg://user?id="..member_id..")"
local JABWA = {"وينك يا برو صديقك يحتاجك 💕.","• يـا قمـري ❤️‍🔥","اخي شلون م تحكي معنا 🤔.","وينك كلبي صديقك يحتاجك 💗.","منورنا يقمر 🌚🤍","• يـا قمـري ❤️‍🔥","لينا ساعه نطرينك اخي 😾."}
local Text = JABWA[math.random(#JABWA)]
return bot.sendText(msg_chat_id,msg_id,"* "..Text.." *\n "..Mostafa.." ","md",true)
end

if text == "تعطيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل التسليه مسبقا\n√',"md")
else
Redis:set(Fast.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل التسليه\n√',"md")
end
end
if text == "تفعيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if not Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل التسليه مسبقا\n√',"md")
else
Redis:del(Fast.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل التسليه\n√',"md")
end
end
if text == 'مسح صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
return send(msg_chat_id,msg_id,'• ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg_chat_id,msg_id, '• ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات")
return false
end
message = '• قائمه الصوتيات :\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات عامه")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,v)
Redis:del(Fast.."audio:Games"..msg.chat_id..v)
end
send(msg_chat_id,msg_id, "• تم مسح جميع الصوتيات")
end


if text == 'مسح صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
send(msg_chat_id,msg_id, '• ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'start')
send(msg_chat_id,msg_id, '• ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات العامه") or text== ("الاغاني") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات عامه")
return false
end
message = '• قائمه الصوتيات العامه:\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات العامه") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."All:text:Games:Bot",v)
Redis:del(Fast.."All:audio:Games"..v)
end
send(msg_chat_id,msg_id, "• تم مسح جميع الصوتيات")
end
if text == "تعطيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل اوامر الصيغ مسبقا\n√',"md")
else
Redis:set(Fast.."kadmeat"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل اوامر الصيغ\n√',"md")
end
end
if text == "تفعيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل اوامر التحويلات مسبقا\n√',"md")
else
Redis:del(Fast.."kadmeat"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل اوامر الصيغ\n√',"md")
end
end
if text == "تفعيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل المتحركه'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:gif:Abs'..msg.chat_id) 
end
if text == "تعطيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل المتحركه'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:gif:Abs'..msg.chat_id,true)  
end
if text and (text == "متحركه" or text == "↫ متحركه ✯") and not Redis:get(Fast..'Abs:gif:Abs'..msg.chat_id) then
Abs = math.random(2,1075); 
local Text ='*• تم اختيار المتحركه لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل الميمز'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:memz:Abs'..msg.chat_id) 
end
if text == "تعطيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل الميمز'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:memz:Abs'..msg.chat_id,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ✯") and not Redis:get(Fast..'Abs:memz:Abs'..msg.chat_id) then
Abs = math.random(2,220); 
local Text ='*• تم اختيار مقطع الميمز لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل الريمكس'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:Remix:Abs'..msg.chat_id) 
end
if text == "تعطيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل الريمكس'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:Remix:Abs'..msg.chat_id,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ✯") and not Redis:get(Fast..'Abs:Remix:Abs'..msg.chat_id) then
Abs = math.random(2,400); 
local Text ='*• تم اختيار الريمكس لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل الصوره'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:Photo:Abs'..msg.chat_id) 
end
if text == "تعطيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل الصوره'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:Photo:Abs'..msg.chat_id,true)  
end
if text and (text == "صوره" or text == "↫ صوره ✯") and not Redis:get(Fast..'Abs:Photo:Abs'..msg.chat_id) then
Abs = math.random(4,1120); 
local Text ='*• تم اختيار الصوره لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل الانمي'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:Anime:Abs'..msg.chat_id) 
end
if text == "تعطيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل الانمي'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:Anime:Abs'..msg.chat_id,true)  
end
if text and (text == "انمي" or text == "↫ انمي ✯") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*• تم اختيار صورة الانمي لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل الافلام'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:Movies:Abs'..msg.chat_id) 
end
if text == "تعطيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل الافلام'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:Movies:Abs'..msg.chat_id,true)  
end
if text and (text == "فلم" or text == "↫ فلم ✯") and not Redis:get(Fast..'Abs:Movies:Abs'..msg.chat_id) then
Abs = math.random(4,80); 
local Text ='*• تم اختيار الفلم لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تفعيل المسلسلات'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:del(Fast..'Abs:Series:Abs'..msg.chat_id) 
end
if text == "تعطيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local JABWA = ' \n• تم تعطيل المسلسلات'
send(msg_chat_id,msg_id,JABWA,"md")
Redis:set(Fast..'Abs:Series:Abs'..msg.chat_id,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ✯") and not Redis:get(Fast..'Abs:Series:Abs'..msg.chat_id) then
Abs = math.random(2,54); 
local Text ='*• تم اختيار المسلسل لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text and text:match("^معنى (.*)$") then 
local TextMean = text:match("^معنى (.*)$") or text:match("^معنى اسم (.*)$") 
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
UrlMean = io.popen('curl -s "https://life-its-good.tk/m3aniasmaaip/m3aneip.php?Name='..URL.escape(TextMean)..'"'):read('*a')
Mean = JSON.decode(UrlMean) 
send(msg_chat_id,msg_id, Mean.ok.abs)
end
end
if text and text:match("^ذكاء (.*)$") then
local TextName = text:match("^ذكاء (.*)$")
local gptchatt = request("https://www.hmss.store/api/chat.php/index.php?text="..URL.escape(TextName))
send(msg_chat_id,msg_id,gptchatt,"md",true)
end
if text == "تعطيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل اغنيه مسبقا\n√',"md")
else
Redis:set(Fast.."myniknea"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل اغنيه\n√',"md")
end
end
if text == "تفعيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل اغنيه مسبقا\n√',"md")
else
Redis:del(Fast.."myniknea"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل اغنيه\n√',"md")
end
end
if text == "اغنية" or text == "اغنيه" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'myniknea'..msg.chat_id) then
Abs = math.random(3,205); 
local Text ='*• تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ قناة السورس ⚡',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = 0
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/meromp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end 
if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.Fastbots.ml/apies/playstore.php?q="..URL.escape(q))
local json = JSON.decode(url)
if url == "null" or #json <= 1 then
return send(msg.chat_id,msg.id,'• لم استطيع العثور علي نتيجه في google play ')
end
local datar = {data = {{text = "قناه السورس" , url = 'http://t.me/'..chsource..''}}}
if #json < 5 then
for i = 1,#json do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
else
for i = 1,5 do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
send(msg.chat_id,msg.id,'• نتائج بحثك عن *'..q..'* في play store',"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id,"• البحث باللغه الانجليزيه فقط")
end
end
if text then
if text:match("^النلظ (.*)$") or text:match("^توبتل (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^تظىمم (.*)$") or text:match("^تلمانظ (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@'..chsource..'")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end
if text == "تقطيع" then
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.text then 
local line = result.content.text.text
for t in string.gmatch(line, "[^%s]+") do
send(msg_chat_id,msg_id,t,"md",true)  
end 
end
end
end

if text and text:match("^طقس (.*)$") then
local TextName = text:match("^طقس (.*)$")
local weather = https.request("https://api.openweathermap.org/data/2.5/weather?q=" .. TextName .. "&units=metric&appid=e409825a497a0c894d2dd975542234b0&lang=ar")    
if not weather then
return send(msg.chat_id, msg.id, "❌ لم أتمكن من جلب بيانات الطقس، تأكد من اسم المدينة أو الاتصال بالإنترنت.", "md", true)
end 
local weather_decode = JSON.decode(weather)
if not weather_decode or weather_decode.cod ~= 200 then
return send(msg.chat_id, msg.id, "❌ لم أتمكن من جلب بيانات الطقس للمدينة: " .. TextName, "md", true)
end
local days_ar = {
["Sunday"] = "الأحد",
["Monday"] = "الإثنين",
["Tuesday"] = "الثلاثاء",
["Wednesday"] = "الأربعاء",
["Thursday"] = "الخميس",
["Friday"] = "الجمعة",
["Saturday"] = "السبت"
}
local eng_day = os.date("%A")
local arabic_day = days_ar[eng_day] or eng_day
local api_weather1_date = arabic_day .. " - " .. os.date("%Y/%m/%d")
local api_weather1_condition = weather_decode.weather[1].description 
local api_weather1_temp = weather_decode.main.temp 
local api_weather1_rain = weather_decode.rain and weather_decode.rain["1h"] or 0 
local api_weather1_humidity = weather_decode.main.humidity 
local api_weather1_wind = weather_decode.wind.speed
local month = tonumber(os.date("%m"))
local season = "❄️ فصل ⋮ الشتاء"
if month >= 3 and month <= 5 then
season = "🌸 فصل ⋮ الربيع"
elseif month >= 6 and month <= 8 then
season = "☀️ فصل ⋮ الصيف"
elseif month >= 9 and month <= 11 then
season = "🍂 فصل ⋮ الخريف"
end
local weather_icon = "☀️"
if api_weather1_condition:match("مطر") then
weather_icon = "🌧️"
elseif api_weather1_condition:match("رياح") then
weather_icon = "🌬️"
elseif api_weather1_condition:match("غائم") then
weather_icon = "☁️"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = weather_icon .. " حالة الجو ⋮ " .. api_weather1_condition, data = 'weather_info ⋮' .. TextName}},
{{text = "🌡 درجة الحرارة ⋮ " .. api_weather1_temp .. " °C", data = 'weather_info ⋮' .. TextName}},
{{text = "💧 نسبة الرطوبة ⋮ " .. api_weather1_humidity .. "%", data = 'weather_info ⋮' .. TextName}},
{{text = "💨 سرعة الرياح ⋮ " .. api_weather1_wind .. " m/s", data = 'weather_info ⋮' .. TextName}},
{{text = season, data = 'weather_info ⋮' .. TextName}},}}
send(msg.chat_id, msg.id, "*🌍 اليوم ⋮ " .. api_weather1_date .. " .\n" ..weather_icon .. " حالة الجو ⋮ " .. api_weather1_condition .. " .\n" ..        "🌡 درجة الحرارة ⋮ " .. api_weather1_temp .. " ℃ .\n" ..        "🌧️ نسبة الأمطار ⋮ " .. api_weather1_rain .. " .\n" ..        "💧 نسبة الرطوبة ⋮ " .. api_weather1_humidity .. " .\n" ..        "🌬️ معلومات الرياح ⋮ " .. api_weather1_wind .. " m/s .\n" ..season .. " . *", "md", true, false, false, false, reply_markup)
end



end
return {Fast = Fast_Fun}