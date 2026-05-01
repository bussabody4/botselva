--[[
لــ تــيــــمو ســيـلــفــا
]] 
function TimoSelva(msg)
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


if text == 'صلاحياتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
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
local Selva = "*• انت مالڪ الجروب يا ⦉ "..Text.." ⦊\n√*"
local TemoSelva = "*• انت عضو في الجروب يا ⦉ "..Text.." ⦊\n√*"
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,Selva,"md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,TemoSelva,"md",true) 
end
local Get_Chat = bot.getChat(msg_chat_id)
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status 
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local Timo = "*• هذه هي صلاحياتك في الجروب\n• عزيزي ⦉ "..Text.." ⦊\n• اسم الجروب ⦉* "..Get_Chat.title.." *⦊\n• رتبتڪ = ⦉ "..msg.Name_Controller.." ⦊*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'تغير المعلومات ⋮ ⦉ '..change_info..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'مسح الرسائل ⋮ ⦉ '..delete_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'حظر المستخدمين ⋮ ⦉ '..restrict_members..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'تثبيت الرسائل ⋮ ⦉ '..pin_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مستخدمين ⋮ ⦉ '..invite_users..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مشرفين ⋮ ⦉ '..promote..' ⦊',url='http://t.me/'..bain.username..''},
}
}
}
return send(msg.chat_id,msg.id,Timo,"md",false, false, false, false, reply_markup)
end
end 
if text == 'صلاحياته' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local StatusMember = bot.getChatMember(msg_chat_id,rep_idd).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"• الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"• الصلاحيات : عضو في الجروب" ,"md",true) 
end
local ban = bot.getUser(Fast)
local bain = bot.getUser(rep_idd)
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
local RinkBot = Controller(msg_chat_id,rep_idd)
local Get_Chat = bot.getChat(msg_chat_id)
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local Timo = "*• هذه هي صلاحياته في الجروب\n• اسمه ⦉ "..Text.." ⦊\n• اسم الجروب ⦉* "..Get_Chat.title.." *⦊\n• رتبته ⦉ "..RinkBot.." ⦊*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'تغير المعلومات ⋮ ⦉ '..change_info..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'مسح الرسائل ⋮ ⦉ '..delete_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'حظر المستخدمين ⋮ ⦉ '..restrict_members..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'تثبيت الرسائل ⋮ ⦉ '..pin_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مستخدمين ⋮ ⦉ '..invite_users..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مشرفين ⋮ ⦉ '..promote..' ⦊',url='http://t.me/'..bain.username..''},
}
}
}
return send(msg.chat_id,msg.id,Timo,"md",false, false, false, false, reply_markup)
end
end 
if text and text:match('^صلاحياته @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^صلاحياته @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,UserId_Info.id).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"• الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"• الصلاحيات : عضو في الجروب" ,"md",true) 
end
local ban = bot.getUser(Fast)
local bain = bot.getUser(UserId_Info.id)
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
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local Get_Chat = bot.getChat(msg_chat_id)
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local Timo = "*• هذه هي صلاحياته في الجروب\n• اسمه ⦉ "..Text.." ⦊\n• اسم الجروب ⦉* "..Get_Chat.title.." *⦊\n• رتبته ⦉ "..RinkBot.." ⦊*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'تغير المعلومات ⋮ ⦉ '..change_info..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'مسح الرسائل ⋮ ⦉ '..delete_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'حظر المستخدمين ⋮ ⦉ '..restrict_members..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'تثبيت الرسائل ⋮ ⦉ '..pin_messages..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مستخدمين ⋮ ⦉ '..invite_users..' ⦊',url='http://t.me/'..bain.username..''},
},
{
{text = 'اضافه مشرفين ⋮ ⦉ '..promote..' ⦊',url='http://t.me/'..bain.username..''},
}
}
}
return send(msg.chat_id,msg.id,Timo,"md",false, false, false, false, reply_markup)
end
end

end
return {Fast = TimoSelva}