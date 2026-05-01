function Callback(data)
ChatId = data.chat_id
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
if data.Fastbots == "updateChatMember" then
if tonumber(data.new_chat_member.member_id.user_id) == tonumber(Fast) then
if data.new_chat_member.status and data.new_chat_member.status and data.new_chat_member.status.can_delete_messages == true then
local chat_id = data.chat_id
local who_promot = data.actor_user_id

--code start
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
if not Redis:sismember(Fast.."ChekBotAdd",chat_id) then ---done active
Redis:set("Fast:ActivatedAt:"..chat_id, os.time())
local Get_Chat = bot.getChat(chat_id)
local UserInfo = bot.getUser(who_promot)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n╗•  تم تفعيل جروب جديد \n╣• بواسطه ⋮ *⦉ ['..UserInfo.first_name..'](tg://user?id='..who_promot..') ⦊*\n╣• عدد الاعضاء ⋮ ⦉ '..Info_Chats.member_count..' ⦊\n╣• عدد الادمنيه ⋮ ⦉ '..Info_Chats.administrator_count..' ⦊\n╣• عدد المطرودين ⋮ ⦉ '..Info_Chats.banned_count..' ⦊\n╣• عدد المقيدين ⋮ ⦉ '..Info_Chats.restricted_count..' ⦊\n╝• الرابط ⋮ ⦉ '..Info_Chats.invite_link.invite_link..' ⦊*',"md", true, false, false, false, reply_markup)
local Info_Members = bot.getSupergroupMembers(chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
Redis:sadd(Fast.."ChekBotAdd",chat_id)
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..chat_id,v.member_id.user_id) 
Redis:set(Fast..'lock_chengname'..chat_id,true)  
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:sadd(Fast.."Admin:Group"..chat_id,v.member_id.user_id) 
Redis:set(Fast.."smsme"..chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:set(Fast..'tagallgroup'..chat_id,'open') 
Redis:set(Fast..'tagall@all'..chat_id,'open') 
Redis:del(Fast.."knele"..chat_id)
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:BanId"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:SetId"..chat_id,true) 
Redis:set(Fast.."Status:KickMe"..chat_id,true) 
Redis:set(Fast.."replayallbot"..chat_id,true)
Redis:del(Fast.."amrthshesh"..chat_id)
Redis:del(Fast.."spammkick"..chat_id)
Redis:del(Fast.."intg"..chat_id)
Redis:del(Fast.."kadmeat"..chat_id)
Redis:del(Fast.."zhrfa"..chat_id)
Redis:del(Fast.."brjj"..chat_id)
Redis:del(Fast.."idnotmembio"..chat_id)
Redis:del(Fast.."idnotmem"..chat_id)
Redis:del(Fast..'lock_geamsAudio1'..chat_id) 
Redis:del(Fast..'lock_geamsAudio'..chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..chat_id)    
end
end
end
end
local txt = '*• بواسطه* ⦉ ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ ⦊\n\n*• جروب* ⦉ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') ⦊\n*• تم تفعيل تلقائياً بنجاح ✅.\n• وتم رفع الادمنيه في البوت تلقائي ❤️.*'
local photo = bot.getUserProfilePhotos(Fast)
local Timo = bot.getUser(Sudo_Id) 
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = " "..(Timo.first_name or "Developer").." ", url = "https://t.me/"..Timo.username..""},
},
}
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..chat_id.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape(txt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end
end 
if data and data.Fastbots and data.Fastbots == "updateNewInlineCallbackQuery" then
local Text = bot.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(Fast..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذه الهمسه ليست لك')..'&show_alert=true')
end
end
end
if data and data.Fastbots and data.Fastbots == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = bot.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = 'هذي الهمسه للحلو ( [@'..username[2]..'] ) هو اللي يقدر يشوفها 💖🔐', parse_mode = 'Markdown'}	
local reply_markup = {inline_keyboard={{{text = 'عرض الهمسه ♡ ', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}}	
local resuult = {{type = 'article', id = idnum, title = 'هذه همسه سريه الى [@'..username[2]..']', input_message_content = input_message_content, reply_markup = reply_markup}}	
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(Fast..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(Fast..'hmsabots'..idnum..data.sender_user_id,username[1])
end
end
end

if data and data.Fastbots and data.Fastbots == "updateSupergroup" then
local Get_Chat = bot.getChat('-100'..data.supergroup.id)
if data.supergroup.status.Fastbots == "chatMemberStatusBanned" then
Redis:srem(Fast.."ChekBotAdd",'-100'..data.supergroup.id)
for k,v in pairs(Redis:keys("*")) do
if v:match(data.supergroup.id) then
Redis:del(v)
end
end
return send(Sudo_Id,0,'*\n•  تم طرد البوت من جروب جديده \n•  اسم الجروب : '..Get_Chat.title..'\n•  ايدي الجروب :*`-100'..data.supergroup.id..'`\n•  تم مسح جميع البيانات المتعلقه بالجروب',"md")
end
elseif data and data.Fastbots and data.Fastbots == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
end

elseif data and data.Fastbots and data.Fastbots == "updateNewMessage" then
if data.message.content.Fastbots == "messageChatDeleteMember" or data.message.content.Fastbots == "messageChatAddMembers" or data.message.content.Fastbots == "messagePinMessage" or data.message.content.Fastbots == "messageChatChangeTitle" or data.message.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:tagservr"..data.message.chat_id) then
bot.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_user_id) == tonumber(Fast) then
return false
end
File_Bot_Run(data.message,data.message)


elseif data and data.Fastbots and data.Fastbots == "updateMessageEdited" then
-- data.chat_id -- data.message_id
--var(data)
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then

return false
end
if Message_Edit.sender_id.Fastbots == "messageSenderChat" then

return false 
end

File_Bot_Run(Message_Edit,Message_Edit)

if tonumber(Message_Edit.sender_id.user_id) ==  6475231729 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) ==  1195638024 then
data.The_Controller = 1
elseif The_ControllerAll(Message_Edit.sender_id.user_id) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 8
elseif tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..data.chat_id) 
Redis:incr(Fast..'Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if not data.Creator then
if Message_Edit.content.Fastbots == "messageContact" or Message_Edit.content.Fastbots == "messageVideoNote" or Message_Edit.content.Fastbots == "messageDocument" or Message_Edit.content.Fastbots == "messageAudio" or Message_Edit.content.Fastbots == "messageVideo" or Message_Edit.content.Fastbots == "messageVoiceNote" or Message_Edit.content.Fastbots == "messageAnimation" or Message_Edit.content.Fastbots == "messagePhoto" then
if tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
return false 
end
if Redis:get(Fast.."Lock:edit"..data.chat_id) then
if #monsha ~= 0 then 
local ListMembers = '\n*•  تاك للمالكين  \n 𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
 
local tecxt = ListMembers.."\n\n".."\n•  المستخدم  {["..names.." ](tg://user?id="..Message_Edit.sender_id.user_id..")}"..
"\n•  قام بتعديل الميديا"
send(data.chat_id,0,tecxt,"md")
end
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
end
elseif data and data.Fastbots and data.Fastbots == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
user_id = data.sender_user_id
chat_id = data.chat_id
msg_id = data.message_id
-- 7azer call back
if Text and Text:match('(%d+)/add7azer') then
local Game_king = tonumber(Text:match('(%d+)/add7azer'))
if tonumber(Game_king) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id,"\n⦁ هتلعب معاهم ازاي وانت صاحب السؤال", true)
end
if Redis:sismember(Fast..":7azer:mem:"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id,"\n⦁ انت منضم اصلا", true)
end
if tonumber(Redis:get(Fast..":7azer:"..ChatId)) ~= tonumber(Game_king) then
return bot.answerCallbackQuery(data.id,"\n⦁ انتهت اللعبه", true)
end
Redis:sadd(Fast..":7azer:mem:"..ChatId, IdUser)
local list = ""
for k,v in pairs(Redis:smembers(Fast..":7azer:mem:"..ChatId)) do 
list = list.."- ["..bot.getUser(v).first_name.."](tg://user?id="..v..")\n"
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'انضم ➕', data = Game_king..'/add7azer'}, 
},
{
{text = '🙋🏼 اضغط هنا لارسال السؤال', url = 't.me/'..UserBot..'?start=7azer'..ChatId..'from_id'..Game_king}, 
},
}
}
send(ChatId, 0, "- ["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")\n\n⦁ انضم للعب 🥳", 'md')
return bot.editMessageText(ChatId,Msg_id,'⦁ اضغط انضمام للانضمام للعبه 👥\n\n⦁ اللاعبين :\n'..list, 'md', false, false, reply_markup)
end

if Text and Text:match('(%d+)/del7azer') then
local UserId = Text:match('(%d+)/del7azer')
if tonumber(IdUser) == tonumber(UserId) or data.ControllerBot then
Redis:del(Fast..":7azer:mem:"..ChatId)
Redis:del(Fast..":7azer:"..ChatId)
return bot.editMessageText(ChatId,Msg_id,'⦁ تم مسح اللعبه الجاريه بنجاح', 'md', false, false)
else
return bot.answerCallbackQuery(data.id,"\n⦁ الامر ليس لك", true)
end
end
-- zkrfa
if Text and Text:match('(%d+)/decor') then
local UserId = Text:match('(%d+)/decor')
if tonumber(UserId) == tonumber(IdUser) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رموز 1 🖌️', data = IdUser..'/woqoi'},{text = '- رموز 2 ✒️', data = IdUser..'/yqy7'},
},
{
{text = '- مواليد وشهور مزخرفه 🎀', data = IdUser..'/nbzy'},
},
{
{text = '- اسماء عربيه 🇪🇬', data = IdUser..'/Gau'},{text = '- اسماء اجنبيه 🇺🇲', data = IdUser..'/t2yu'},
},
{
{text = '- اسماء جروبات وقنوات 🪁', data = IdUser..'/faou'},
},
{
{text = '- اختصارات ⚡', data = IdUser..'/ahk'},{text = 'بايو 🦋', data = IdUser..'/Mzeng'},
},
}
}
edit(ChatId, Msg_id, "*مرحبا ⇿* "..Name.." 👋\n* • اليك قائمه الزخرفه الجاهزه *", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/woqoi') then
local UserId = Text:match('(%d+)/woqoi')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
ꔹ━━━━━ꔹ  zeroꔹ━━━━━ꔹ
ᾋ ᾌ ᾍ ᾎ ᾏ ᾐ ᾑ ᾒ ᾓ ᾔ ᾕ ᾖ ᾗ ᾘ ᾙ ᾚ ᾛ ᾜ ᾝ ᾞ ᾟ ᾠ ᾡ ᾢ ᾣ ᾤ ᾥ ᾦ ᾧ ᾨ ᾩ ᾪ ᾫ ᾬ ᾭ ᾮ ᾯ ᾰ ᾱ ᾲ ᾳ ᾴ ᾶ ᾷ Ᾰ Ᾱ Ὰ Ά ᾼ ᾽ ι ᾿ ῀ ῁ ῂ ῃ ῄ ῆ ῇ Ὲ Έ Ὴ Ή ῌ ῍ ῎ ῏ ῐ ῑ ῒ ΐ ῖ ῗ Ῐ Ῑ Ὶ Ί ῝ ῞ ῟ ῠ ῡ ῢ ΰ ῤ ῥ ῦ ῧ Ῠ Ῡ Ὺ Ύ Ῥ ῭ ΅ ` ῲ ῳ ῴ ῶ ῷ Ὸ Ό Ὼ Ώ ῼ ´ ῾ ῿                         ‌ ‍ ‎ ‏ ‐ ‑ ‒ – — ― ‖ ‗ ‘ ’ ‚ ‛ “ ” „ ‟ † ‡ •  ‣ ․ ‥ … ‧       ‰ ‱ ′ ″ ‴ ‵ ‶ ‷ ‸ ‹ › • ‼️ ‽ ‾ ‿ ⁀ ⁁ ⁂ ⁃ ⁄ ⁅ ⁆ ⁇ ⁈ ⁉️ ⁊ ⁋ ⁌ ⁍ ⁎ ⁏ ⁐ ⁑ ⁒ ⁓ ⁔ ⁕ ⁖ ⁗ ⁘ ⁙ ⁚ ⁛ ⁜ ⁝ ⁞   ⁠ ⁡ ⁢ ⁣ ⁤ ⁥ ⁦ ⁧ ⁨ ⁩ ⁪ ⁫ ⁬ ⁭ ⁮ ⁯ ⁰ ⁱ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁿ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₐ ₑ ₒ ₓ ₕ ₖ ₗ ₘ ₙ ₚ ₛ ₜ ₝ ₞ ₟ ₠ ₡ ₢ ₣ ₤ ₥ ₦ ₧ ₨ ₩ ₪ ₫ € ₭ ₮ ₯ ₰ ₱ ₲ ₳ ₴ ₵ ℀ ℁ ℂ ℃ ℄ ℅ ℆ ℇ ℈ ℉ ℊ ℋ ℌ ℍ ℎ ℏ ℐ ℑ ℒ ℓ ℔ ℕ № ℗ ℘ ℙ ℚ ℛ ℜ ℝ ℞ ℟ ℠ ℡ ™ ℣ ℤ ℥ Ω ℧ ℨ ℩ K Å ℬ ℭ ℮ ℯ ℰ ℱ Ⅎ ℳ ℴ ℵ ℶ ℷ ℸ ℹ️ ℺ ℻ ℼ ℽ ℾ ℿ ⅀ ⅁ ⅂ ⅃ ⅄ ⅅ ⅆ ⅇ ⅈ ⅉ ⅊ ⅋ ⅌ ⅍ ⅎ ⅏ ⅐ ⅑ ⅒ ⅓ ⅔ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅛ ⅜ ⅝ ⅞ ↀ ↁ ↂ Ↄ ↉ ↊ ↋ ← ↑ → ↓ ↔️ ↕️ ↖️ ↗️ ↘️ ↙️ ↚ ↛ ↜ ↝ ↞ ↟ ↠ ↡ ↢ ↣ ↤ ↥ ↦ ↧ ↨ ↩️ ↪️ ↫ ↬ ↭ ↮ ↯ ↰ ↱ ↲ ↳ ↴ ↵ ↶ ↷ ↸ ↹ ↺ ↻ ↼ ↽ ↾ ↿ ⇀ ⇁ ⇂ ⇃ ⇄ ⇅ ⇆ ⇇ ⇈ ⇉ ⇊ ⇋ ⇌ ⇍ ⇎ ⇏ ⇐ ⇑ ⇒ ⇓ ⇔ ⇕ ⇖ ⇗ ⇘ ⇙ ⇚ ⇛ ⇜ ⇝ ⇞ ⇟ ⇠ ⇡ ⇢ ⇣ ⇤ ⇥ ⇦ ⇧ ⇨ ⇩ ⇪ ⇫ ⇬ ⇭ ⇮ ⇯ ⇰ ⇱ ⇲ ⇳ ⇴ ⇵ ⇶ ⇷ ⇸ ⇹ ⇺ ⇻ ⇼ ⇽ ⇾ ⇿ ∀ ∁ ∂ ∃ ∄ ∅ ∆ ∇ ∈ ∉ ∊ ∋ ∌ ∍ ∎ ∏ ∐ ∑ − ∓ ∔ ∕ ∖ ∗ ∘ ∙ √ ∛ ∜ ∝ ∞ ∟ ∠ ∡ ∢ ∣ ∤ ∥ ∦ ∧ ∨ ∩ ∪ ∫ ∬ ∭ ∮ ∯ ∰ ∱ ∲ ∳ ∴ ∵ ∶ ∷ ∸ ∹ ∺ ∻ ∼ ∽ ∾ ∿ ≀ ≁ ≂ ≃ ≄ ≅ ≆ ≇ ≈ ≉ ≊ ≋ ≌ ≍ ≎ ≏ ≐ ≑ ≒ ≓ ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟ ≠ ≡ ≢ ≣ ≤ ≥ ≦ ≧ ≨ ≩ ≪ ≫ ≬ ≭ ≮ ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≺ ≻ ≼ ≽ ≾ ≿ ⊀ ⊁ ⊂ ⊃ ⊄ ⊅ ⊆ ⊇ ⊈ ⊉ ⊊ ⊋ ⊌ ⊍ ⊎ ⊏ ⊐ ⊑ ⊒ ⊓ ⊔ ⊕ ⊖ ⊗ ⊘ ⊙ ⊚ ⊛ ⊜ ⊝ ⊞ ⊟ ⊠ ⊡ ⊢ ⊣ ⊤ ⊥ ⊦ ⊧ ⊨ ⊩ ⊪ ⊫ ⊬ ⊭ ⊮ ⊯ ⊰ ⊱ ⊲ ⊳ ⊴ ⊵ ⊶ ⊷ ⊸ ⊹ ⊺ ⊻ ⊼ ⊽ ⊾ ⊿ ⋀ ⋁ ⋂ ⋃ ⋄ ⋅ ⋆ ⋇ ⋈ ⋉ ⋊ ⋋ ⋌ ⋍ ⋎ ⋏ ⋐ ⋑ ⋒ ⋓ ⋔ ⋕ ⋖ ⋗ ⋘ ⋙ ⋚ ⋛ ⋜ ⋝ ⋞ ⋟ ⋠ ⋡ ⋢ ⋣ ⋤ ⋥ ⋦ ⋧ ⋨ ⋩ ⋪ ⋫ ⋬ ⋭ ⋮ ⋯ ⋰ ⋱ ⋲ ⋳ ⋴ ⋵ ⋶ ⋷ ⋸ ⋹ ⋺ ⋻ ⋼ ⋽ ⋾ ⋿ ⌀ ⌁ ⌂ ⌃ ⌄ ⌅ ⌆ ⌇ ⌈ ⌉ ⌊ ⌋ ⌌ ⌍ ⌎ ⌏ ⌐ ⌑ ⌒ ⌓ • ⌕ ⌖ ⌗ ⌘ ⌙ ⌚️ ⌛️ ⌜ ⌝ ⌞ ⌟ ⌠ ⌡ ⌢ ⌣ ⌤ ⌥ ⌦ ⌧ ⌨️ 〈 〉 ⌫ ⌬ ⌭ ⌮ • ⌰ ⌱ ⌲ ⌳ ⌴ ⌵ ⌶ ⌷ ⌸ ⌹ ⌺ ⌻ ⌼ ⌽ ⌾ ⌿ ⍀ ⍁ ⍂ ⍃ ⍄ ⍅ ⍆ ⍇ ⍈ ⍉ ⍊ ⍋ ⍌ ⍍ ⍎ ⍏ ⍐ ⍑ ⍒ ⍓ ⍔ ⍕ ⍖ ⍗ ⍘ ⍙ ⍚ ⍛ ⍜ ⍝ ⍞ ⍟ ⍠ ⍡ ⍢ ⍣ ⍤ ⍥ ⍦ ⍧ ⍨ ⍩ ⍪ ⍫ ⍬ ⍭ ⍮ ⍯ ⍰ ⍱ ⍲ ⍳ ⍴ ⍵ ⍶ ⍷ ⍸ ⍹ ⍺ ⍻ ⍼ ⍽ ⍾ ⍿ ⎀ ⎁ ⎂ ⎃ ⎄ ⎅ ⎆ ⎇ ⎈ ⎉ ⎊ ⎋ ⎌ ⎍ ⎎ ⎏ ⎐ ⎑ ⎒ ⎓ ⎔ ⎕ ⎖ ⎗ ⎘ ⎙ ⎚ ⎛ ⎜ ⎝ ⎞ ⎟ ⎠ ⎡ ⎢ ⎣ ⎤ ⎥ ⎦ ⎧ ⎨ ⎩ ⎪ ⎫ ⎬ ⎭ ⎮ ⎯ ⎰ ⎱ ⎲ ⎳ ⎴ ⎵ ⎶ ⎷ ⎸ ⎹ ⎺ ⎻ ⎼ ⎽ ⎾ ⎿ ⏀ ⏁ ⏂ ⏃ ⏄ ⏅ ⏆ ⏇ ⏈ ⏉ ⏋ ⏌ ⏍ ⏎ ⏏️ ⏐ ⏑ ⏒ ⏓ ⏔ ⏕ ⏖ ⏗ ⏘ ⏙ ⏚ ⏛ ⏜ ⏝ ⏞ ⏟ ⏠ ⏡ ⏢ ⏣ ⏤ ⏥ ⏦ ␋ ␢ ␣ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳ ⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⑾ ⑿ ⒀ ⒁ ⒂ ⒃ ⒄ ⒅ ⒆ ⒇ ⒈ ⒉ ⒊ ⒋ ⒌ ⒍ ⒎ ⒏ ⒐ ⒑ ⒒ ⒓ ⒔ ⒕ ⒖ ⒗ ⒘ ⒙ ⒚ ⒛ ⒜ ⒝ ⒞ ⒟ ⒠ ⒡ ⒢ ⒣ ⒤ ⒥ ⒦ ⒧ ⒨ ⒩ ⒪ ⒫ ⒬ ⒭ ⒮ ⒯ ⒰ ⒱ ⒲ ⒳ ⒴ ⒵ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ️ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ ⓪ ⓫ ⓬ ⓭ ⓮ ⓯ ⓰ ⓱ ⓲ ⓳ ⓴ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ⓿ ─ ━ │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ┌ ┍ ┎ ┏ ┐ ┑ ┒ ┓ └ ┕ ┖ ┗ ┘ ┙ ┚ ┛ ├ ┝ ┞ ┟ ┠ ┡ ┢ ┣ ┤ ┥ ┦ ┧ ┨ ┩ ┪ ┫ ┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻ ┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╌ ╍ ╎ ╏ ═ ║ ╒ ╓ ╔ ╕ ╖ ╗ ╘ ╙ ╚ ╛ ╜ ╝ ╞ ╟ ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬ ╬﹌ ╭ ╮ ╯ ╰ ╰☆╮ ╱ ╲ ╳ ╴ ╵ ╶ ╷ ╸ ╹ ╺ ╻ ╼ ╽ ╾ ╿ ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ ■ □ ▢ ▣ ▤ ▥ ▦ ▧ ▨ ▩ ▪️ ▫️ ▬ ▭ ▮ ▯ ▰ ▱ ▲ △ ▴ ▵ ▷ ▸ ▹ ► ▻ ▼ ▽ ▾ ▿  ◁ ◂ ◃ ◄ ◅ ◆ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◔ʊ ◕ ◖ ◗ ◘ ◙ ◚ ◛ ◜ ◝ ◞ ◟ ◠ ◡ ◢ ◣ ◤ ◥ ◦ ◧ ◨ ◩ ◪ ◫ ◬ ◭ ◮ ◯ ◰ ◱ ◲ ◳ ◴ ◵ ◶ ◷ ◸ ◹ ◺  ☓☠️ ☡☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ♠️ ♡ ♢  ♩ ♪ ♫ ♬ ♭ ♮ ♯ ♰ ♱ ♻️ ♼ ♽ ⚆ ⚇ ⚈ ⚉ ⚊ ⚋ ⚌ ⚍ ⚎ ⚏ ⚐ ⚑ ✐ ✑ ✒️ ✓ ✔️ ✕ ✖️ ✗ ✘ ✙ ✚ ✛ ✜  ✞ ✟ ✠ ✢ ✣ ✤ ✥ ✦ • •♱ ✩ ✪ ✫ ✬ ✭ ✮ ✯ ✰ ✱ ✲  ✵ ✶ ✷ ✸ ✹ ✺ ✻ ✼ ✽ ✾ ✿ ❀ ❁ ❂ ❃ ❄️ ❅ ❆ ❈ ❉ ❊ ❋ ❍ ❏ ❐ ❑ ❒ ❖ ❗️ ❘ ❙ ❚ ❛ ❜ ❝ ❞ ❡ ❢ ❣️ ❤️ ❥ ❦ ❧ ❨ ❩ ❪ ❫ ❬ ❭ ❮ ❯ ❰ ❱ ❲ ❳ ❴ ❵ ❶ ❷ ❸ ❹ ❺ ❻ ❼ ❽ ❾ ❿ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ➊ ➋ ➌ ➍ ➎ ➏ ➐➑ ➒ ➓ ➔ ➘ ➙ ➚ ➛ ➜ ➝ ➞ ➟ ➠  ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➩ ➪ ➫ ➬ ➭ ➮ ➯ ➱ ➲ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ ➻ ➼ ➽ ➾ ⟀ ⟁ ⟂ ⟃ ⟄ ⟇ ⟈ ⟉ ⟊ ⟐ ⟑ ⟒ ⟓ ⟔ ⟕ ⟖ ⟗ ⟘ ⟙ ⟚ ⟛ ⟜ ⟝ ⟞ ⟟ ⟠ ⟡ ⟢ ⟣ ⟤ ⟥ ⟦ ⟧ ⟨ ⟩ ⟪ ⟫ ⟰ ⟱ ⟲ ⟳ ⟴ ⟵ ⟶ ⟷ ⟸ ⟹ ⟺ ⟻ ⟼ ⟽ ⟾ ⟿ ⤀ ⤁ ⤂ ⤃ ⤄ ⤅ ⤆ ⤇ ⤈ ⤉ ⤊ ⤋ ⤌ ⤍ ⤎ ⤏ ⤐ ⤑ ⤒ ⤓ ⤔ ⤕ ⤖ ⤗ ⤘ ⤙ ⤚ ⤛ ⤜ ⤝ ⤞ ⤟ ⤠ ⤡ ⤢ ⤣ ⤤ ⤥ ⤦ ⤧ ⤨ ⤩ ⤪ ⤫ ⤬ ⤭ ⤮ ⤯ ⤰ ⤱ ⤲ ⤳ ⤶ ⤷ ⤸ ⤹ ⤺ ⤻ ⤼ ⤽ ⤾ ⤿ ⥀ ⥁ ⥂ ⥃ ⥄ ⥅ ⥆ ⥇ ⥈ ⥉ ⥊ ⥋ ⥌ ⥍ ⥎ ⥏ ⥐ ⥑ ⥒ ⥓ ⥔ ⥕ ⥖ ⥗ ⥘ ⥙ ⥚ ⥛ ⥜ ⥝ ⥞ ⥟ ⥠ ⥡ ⥢ ⥣ ⥤ ⥥ ⥦ ⥧ ⥨ ⥩ ⥪ ⥫ ⥬ ⥭ ⥮ ⥯ ⥰ ⥱ ⥲ ⥳ ⥴ ⥵ ⥶ ⥷ ⥸ ⥹ ⥺ ⥻ ⥼ ⥽ ⥾ ⥿ ⦀ ⦁ ⦂ ⦃ ⦄ ⦅ ⦆ ⦇ ⦈ ⦉ ⦊ ⦋ ⦌ ⦍ ⦎ ⦏ ⦐ ⦑ ⦒ ⦓ ⦔ ⦕ ⦖ ⦗ ⦘ ⦙ ⦚ ⦛ ⦜ ⦝ ⦞ ⦟ ⦠ ⦡ ⦢ ⦣ ⦤ ⦥ ⦦ ⦧ ⦨ ⦩ ⦪ ⦫ ⦬ ⦭ ⦮ ⦯ ⦰ ⦱ ⦲ ⦳ ⦴ ⦵ ⦶ ⦷ ⦸ ⦹ ⦺ ⦻ ⦼ ⦽ ⦾ ⦿ ⧀ ⧁ ⧂ ⧃ ⧄ ⧅ ⧆ ⧇ ⧈ ⧉ ⧊ ⧋ ⧌ ⧍ ⧎ ⧏ ⧐ ⧑ ⧒ ⧓ ⧔ ⧕ ⧖ ⧗ ⧘ ⧙ ⧚ ⧛ ⧜ ⧝ ⧞ ⧟ ⧡ ⧢ ⧣ ⧤ ⧥ ⧦ ⧧ ⧨ ⧩ ⧪ ⧫ ⧬ ⧭ ⧮ ⧯ ⧰ ⧱ ⧲ ⧳ ⧴ ⧵ ⧶ ⧷ ⧸ ⧹ ⧺ɷ
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/yqy7') then
local UserId = Text:match('(%d+)/yqy7')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁

𓅄 𓅅 𓅆 𓅇 𓅈 𓅉 𓅊 𓅋 𓅌 𓅍 𓅎 𓅏 𓅐 𓅑 𓅒 𓅓 𓅔𓅕 𓅖 𓅗 𓅘 𓅙 𓅚 𓅛 𓅜 𓅝 𓅞 𓅟 𓅠 𓅡 𓅢 𓅣 𓅤 𓅥 𓅦 𓅧 𓅨 𓅩 𓅫 𓅬 𓅭 𓅮 𓅯 𓅰 𓅱 𓅲 𓅳 𓅴 
‏𓅵 𓅶 𓅷 𓅸 𓅹 𓅺 𓅻 
‏ ☤ 𓅾 𓅿 𓆀 𓆁 𓆂


‏𓀀 𓀁 𓀂 𓀃 𓀄 𓀅 𓀆 𓀇 𓀈 𓀉 𓀊 𓀋 𓀌 𓀍 𓀎 𓀏 𓀐 𓀑 𓀒 𓀓 ?? 𓀕 𓀖 𓀗 𓀘 𓀙 𓀚 𓀛 𓀜 𓀝 𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 𓀧 𓀨 𓀩 𓀪 𓀫 𓀬 𓀭 𓀮 𓀯 𓀰 𓀱 𓀲 𓀳 𓀴 𓀵 𓀶 𓀷 𓀸 𓀹 𓀺 𓀻 𓀼 𓀽 𓀾 𓀿 𓁀 𓁁 𓁂 𓁃 𓁄 𓁅 𓁆 𓁇 𓁈 𓁉 𓁊 𓁋 𓁌 𓁍 𓁎 𓁏 𓁐 𓁑 𓁒 𓁓 𓁔 𓁕 𓁖 𓁗 𓁘 𓁙 𓁚 𓁛 𓁜 𓁝 ?? 𓁟 𓁠 𓁡 𓁢 𓁣 𓁤 𓁥 𓁦 𓁧 𓁨 𓁩 𓁪 𓁫 𓁬 𓁭 𓁮 𓁯 𓁰 𓁱 𓁲 𓁳 𓁴 𓁵 𓁶 𓁷 𓁸 𓁹 𓁺 𓁻 𓁼 𓁽 𓁾 𓁿 𓂀𓂅 𓂆 ?? 𓂈 𓂉 𓂊 𓂋 𓂌 𓂍 𓂎 𓂏 𓂐 𓂑 𓂒 𓂓 𓂔 𓂕 𓂖 𓂗 𓂘 𓂙 𓂚 𓂛 𓂜 𓂝 𓂞 𓂟 𓂠 𓂡 𓂢 𓂣 𓂤 𓂥 𓂦 𓂧 𓂨 𓂩 𓂪 𓂫 𓂬 𓂭 𓂮 𓂯 𓂰 𓂱 𓂲 𓂳 𓂴 𓂵 𓂶 𓂷 𓂸 𓂹 𓂺 𓂻 𓂼 𓂽 𓂾 𓂿 𓃀 𓃁 𓃂 𓃃 𓃅 𓃆 𓃇 𓃈 𓃉 𓃊 𓃋 𓃌 𓃍 𓃎 𓃏 𓃐 𓃑 𓃒 𓃓 𓃔 𓃕 𓃖 𓃗 𓃘 𓃙 𓃚 ?? 𓃜 𓃝 ?? 𓃟 𓃠 𓃡 𓃢 𓃣 𓃤 𓃥 𓃦 𓃧 𓃨 𓃩 𓃪 𓃫 𓃬 𓃭 𓃮 𓃯 𓃰 𓃱 𓃲 𓃳 𓃴 𓃵 𓃶 𓃷 𓃸 𓃹 𓃺 𓃻 ?? 𓃽 𓃾 𓃿 𓄀 𓄁 𓄂 𓄃 𓄄 𓄅 𓄆 𓄇 𓄈 𓄉 ?? 𓄋 𓄌 𓄍 𓄎 𓄏 𓄐 𓄑 𓄒 𓄓 𓄔 𓄕 𓄖 𓄙 𓄚 𓄛 𓄜 𓄝 𓄞 𓄟 𓄠 𓄡 𓄢 𓄣 𓄤 𓄥 𓄦 𓄧 𓄨 𓄩 𓄪 𓄫 𓄬 𓄭 𓄮 𓄯 𓄰 𓄱 𓄲 𓄳 𓄴 𓄵 𓄶 ?? 𓄸  𓄺    𓄽 𓄾 𓄿 𓅀 𓅁 𓅂 𓅃 𓅄 𓅅 𓅆 𓅇 𓅈 𓅉 𓅊 𓅋 𓅌 𓅍 𓅎 𓅏 𓅐 𓅑 𓅒 𓅓 𓅔 ?? 𓅖 𓅗 𓅘 𓅙 𓅚 𓅛 𓅜 𓅝 𓅞 𓅟 𓅠 𓅡 𓅢 𓅣 𓅤 𓅥 𓅦 𓅧 𓅨 𓅩 𓅪 𓅫 𓅬 𓅭 𓅮 𓅯 𓅰 𓅱 𓅲 𓅳 𓅴 𓅵 𓅶 𓅷 𓅸 𓅹 𓅺 𓅻 𓅼 𓅽 𓅾 𓅿 𓆀 𓆁 𓆂 𓆃 𓆄 𓆅 𓆆 𓆇 𓆈 𓆉 𓆊 𓆋 𓆌 𓆍 𓆎 𓆐 𓆑 𓆒 𓆓 𓆔 𓆕 𓆖 𓆗 𓆘 𓆙 ?? 𓆛 𓆜 𓆝 𓆞 𓆟 𓆠 𓆡 𓆢 𓆣 𓆤 𓆥 𓆦 𓆧 𓆨 𓆩𓆪 𓆫 𓆬 𓆭 𓆮 𓆯 𓆰 𓆱 𓆲 ?? 𓆴 ?? ?? 𓆷 𓆸 𓆹 𓆺 𓆻 𓆼 𓆽 𓆾 𓆿 𓇀 𓇁 𓇂 𓇃 𓇄 𓇅 𓇆 𓇇 𓇈 𓇉 𓇊 𓇋 𓇌 𓇍 𓇎 𓇏 𓇐 𓇑 𓇒 𓇓 𓇔 𓇕 𓇖 𓇗 𓇘 𓇙 𓇚 𓇛 𓇜 𓇝 𓇞 𓇟 𓇠 𓇡 𓇢 ?? 𓇤 𓇥 𓇦 𓇧 𓇨 𓇩 𓇪 𓇫 𓇬 𓇭 𓇮 𓇯 𓇰 𓇱 𓇲 𓇳 𓇴 𓇵 𓇶 𓇷 𓇸 𓇹 𓇺 𓇻 𓇼 𓇾 𓇿 𓈀 ?? 𓈂 𓈃 𓈄 𓈅 𓈆 𓈇 𓈈 𓈉 𓈊 𓈋 𓈌 𓈍 𓈎 𓈏 𓈐 𓈑 𓈒 ?? 𓈔 𓈕 𓈖 𓈗 𓈘 𓈙 𓈚 𓈛 𓈜 𓈝 𓈞 𓈟 𓈠 𓈡 𓈢 𓈣 𓈤  𓈥 𓈦 𓈧 𓈨 𓈩 𓈪 𓈫 𓈬 𓈭 ?? 𓈯 𓈰 𓈱 𓈲 𓈳 𓈴 𓈵 𓈶 𓈷 𓈸 𓈹 𓈺 𓈻 𓈼 𓈽 𓈾 𓈿 𓉀 𓉁 𓉂 𓉃 𓉄 𓉅 𓉆 𓉇 𓉈 𓉉 𓉊 𓉋 𓉌 𓉍 𓉎 𓉏 𓉐 𓉑 𓉒 𓉓 𓉔 𓉕 𓉖 𓉗 𓉘 𓉙 𓉚 𓉛 𓉜 𓉝 𓉞 𓉟 𓉠 𓉡 𓉢 𓉣 𓉤 𓉥 𓉦 𓉧 𓉨 𓉩 𓉪 𓉫 𓉬 𓉭 𓉮 𓉯 𓉰 𓉱 𓉲 𓉳 𓉴 𓉵 𓉶 𓉷 𓉸 𓉹 𓉺 𓉻 𓉼 𓉽 𓉾 𓉿 𓊀 𓊁 𓊂 𓊃 𓊄 𓊅 𓊈 𓊉 𓊊 𓊋 𓊌 𓊍 𓊎 𓊏 𓊐 𓊑 𓊒 ?? ?? 𓊕 ?? ?? 𓊘 𓊙 𓊚 𓊛 𓊜 𓊝 𓊞 𓊟 𓊠 𓊡 𓊢 𓊣 𓊤 𓊥 𓊦 𓊧 𓊨 𓊩 𓊪 𓊫 𓊬 𓊭 𓊮 𓊯 ?? ?? 𓊲 𓊳 𓊴 𓊵 𓊶 𓊷 𓊸 𓊹 𓊺 𓊻 𓊼 ?? ?? 𓊿 𓋀 𓋁 𓋂 𓋃 𓋄 𓋅 𓋆 𓋇 𓋈 𓋉 ?? 𓋋 𓋌 𓋍 𓋎 ?? 𓋐 𓋑 𓋒 𓋓 𓋔 𓋕 𓋖 𓋗 𓋘 𓋙 𓋚 𓋛 𓋜 𓋝 𓋞 𓋟 𓌰 𓌱 𓌲 𓌳 𓌴 𓌵 𓌶 𓌷 𓌸 𓌹 𓌺 𓌻 𓌼 𓌽 𓌾 𓌿 𓍀 𓍁 𓍂 𓍃 𓍄 𓍅 𓍆 𓍇 𓍈 𓍉 𓍊 𓍋 𓍌 𓍍 𓍎 𓍏 𓍐 𓍑 𓍒 𓍓 𓍔 𓍕 𓍖 𓍗 𓍘 𓍙 𓍚 𓍛 𓍜 𓍝 𓍞 𓍟 ?? 𓍡 𓍢 𓍣 𓍤 𓍥 𓍦 𓍧 𓍨 𓍩 𓍪 𓍫 𓍬 𓍭 𓍮 𓍯 𓍰 𓍱 𓍲 𓍳 𓍴 𓍵 𓍶 𓍷 𓍸 𓍹 𓍺 𓍻 𓍼 𓍽 𓍾 𓍿 𓎀 𓎁 𓎂 𓎃 𓎄 𓎅 𓎆 ?? 𓎈 ?? 𓎊 𓎋 𓎌 𓎍 𓎎 𓎏 𓎐 𓎑 𓎒 𓎓 𓎔 𓎕 𓎖 𓎗 𓎘 𓎙 𓎚 𓎛 𓎜 𓎝 𓎞 𓎟 𓎠 𓎡 𓏋 𓏌 𓏍 𓏎 𓏏 𓏐 𓏑 𓏒 𓏓 
‏ 𓏕 𓏖 𓏗 𓏘 𓏙 𓏚 𓏛 𓏜 𓏝 𓏞 𓏟 𓏠 𓏡 𓏢 𓏣 𓏤 𓏥 𓏦 𓏧 𓏨 𓏩 𓏪 𓏫 𓏬 𓏭 𓏮 𓏯 𓏰 𓏱 𓏲 𓏳 𓏴 𓏶 𓏷 𓏸 𓏹 𓏺 𓏻 𓏼 𓏽 𓏾 𓏿 𓐀 𓐁 𓐂 𓐃 𓐄 𓐅 𓐆
- 𖣨 ، ෴ ، 𖡺  ، 𖣐 ، ✜ ، ✘ ، 𖡻 ،
- ༄ ، ༺༻ ، ༽༼ ،  ╰☆╮،  
- ɵ̷᷄ˬɵ̷᷅ ، ‏⠉̮⃝ ، ࿇࿆ ، ꔚ، ま ، ☓ ،
{𓆉 . 𓃠 .𓅿 . 𓃠 . 𓃒 . 𓅰 . 𓃱 . 𓅓 . 𐂃  . ꕥ  . ⌘ . ♾ .    ꙰  .  . ᤑ .  ﾂ .

✦ ,✫ ,✯, ✮ ,✭ ,✰, ✬ ,•, ✤, ❅ , 𒀭,✵ , ✶ , ✷ , ✸ , ✹ ,⧫, . 𐂂 }

-〘 𖢐 ، 𒍦 ، 𒍧 ، 𖢣 ، 𝁫 ، 𒍭 ، 𝁅 ، 𝁴 ، 𒍮 ، 𝁵 ، 𝀄 ، 𓏶 ، 𓏧 ، 𓏷 ، 𓏯 ، 𓏴 ، 𓏳 ، 𓏬 ، 𓏦 ، ?? ، 𓏱 ، ᳱ ، ᯼ ، 𐃕 ، ᯥ ، ᯤ ، ᯾ ، ᳶ ، ᯌ ، ᢆ ،

 ᥦ ، ᨙ ، ᨚ  ، ᨔ  ، ⏢ ، ⍨ ، ⍃ ، ⏃ ، ⍦ ، ⏕ ، ⏤ ، ⏁ ، ⏂ ، ⏆ ، ⌳ ، ࿅ ، ࿕ ، ࿇ ، ᚙ ، ࿊ ، ࿈ ، ྿ ،
 ࿂ ، ࿑ ،  ᛥ ، ࿄ ، 𐀁 ، 𐀪 ، 𐀔 ، 𐀴 ، 𐀤 ، 𐀦 ، 𐀂 ، 𐀣 ، 𐀢 ، 𐀶 ، 𐀷 ، 𐂭 ، 𐂦 ، 𐂐 ، 𐂅 ، 𐂡 ، 𐂢 ، 𐂠 ، 𐂓 ، 𐂑 ، 𐃸 ، 𐃶 ، 𐂴 ، 𐃭 ، 𐃳 ، 𐃣 ، 𐂰 ، 𐃟 ، 𐃐 ، 𐃙 ، 𐃀 ، 𐇮 ، 𐇹 ، 𐇲 ، 𐇩 ، 𐇪 ، 𐇶 ، 𐇻 ، 𐇡 ، 𐇸 ، 𐇣 ، 𐇤 ، 𐎅 ، 𐏍 ، 𐎃 ، 𐏒 ، 𐎄 ، 𐏕 〙.


╔ ╗. 𓌹  𓌺 .〝  〞. ‹ ›  .「  」. ‌‏𓂄‏ ‌‌‏𓂁
〖 〗. 《》 .  < > . « »  . ﹄﹃

₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₀
𝟏 𝟐 𝟑 𝟒 𝟓 𝟔 𝟕 𝟖 𝟗 𝟎
𝟭 𝟮 𝟯 𝟰 𝟱 𝟲 𝟳 𝟴 𝟵 𝟬
①②③④⑤⑥⑦⑧⑨⓪
❶❷❸❹❺❻❼❽❾⓿
⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
 𝟶 𝟷 𝟸 𝟹 𝟺 𝟻 𝟼 𝟽 𝟾  ??
 ? 𝟙  𝟚  𝟛  𝟜  𝟝  𝟞  𝟟  𝟠 𝟡
 𝟬 𝟭  𝟮  𝟯  𝟰  𝟱   𝟲  𝟳  𝟴  𝟵  
 𝟎  𝟏  𝟐  𝟑  𝟒   𝟓   𝟔  𝟕   𝟖   𝟗
０ １ ２ ３ ４ ５ ６ ７８９
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Gau') then
local UserId = Text:match('(%d+)/Gau')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁

- ؏َـثمانَ 🍇.

- ؏ـمرَ  🍇.

- ؏َـلييہَ 🍇.

- تو͡୭ما 🍇.

- تــﯢت𝟐𝟎𝟐𝟏 🎄꙳.

- شَيـטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- نــﯢטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- مَيممہَ 𝟐𝟎𝟐𝟏 🎄꙳.

- ݽيـטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- دنــ͚͆ـو 𝟐𝟎𝟐𝟏 🎄꙳.

- ۿهـَدى 💕.

- سـَمــَࢪ 💕.

- جنـَاٺ 💕.

- مـَࢪيـَمٛہٰ 💕.

- ࢪقيـَۿـہ 💕.

- حَـﯛࢪا۽ِ 💕.

- بَــنـۅشہ𓆤.

- ݛقَـﯡشہ𓆤.

- ﭑيَـﯡشہ𓆤.

- ࢪ࣪نَـشہ𓆤.

- سَݛﯠشہ𓆤.

- فَطـﯡشہ𓆤.

𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/t2yu') then
local UserId = Text:match('(%d+)/t2yu')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[
*𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁

- ˹ 𝗦𝗔𝗥𝗔 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗙𝗢𝗙𝗔 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗠𝗘𝗠𝗘 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗦𝗢𝗦𝗢 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗕𝗔𝗡𝗢 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗡𝗢𝗢𝗥 𝟐𝟎𝟐𝟏 🎄꙳.

𓆩𝗭𝗮𝗶𝗻𝗮𝗯𓆪  ˹🎄˼ .

𓆩𝗦𝗷𝗮𝗮𓆪  ˹🎄˼ .

𓆩𝗔𝘆𝗮𓆪  ˹🎄˼ .

𓆩𝗔𝘀𝗿𝗮𝗮𓆪  ˹🎄˼ .

𓆩𝗧𝗮𝗯𝗮𝗿𝗸𓆪  ˹🎄˼ .

-  𝑜𝑡ℎ𝑚𝑎𝑛 🌵.

-  𝑂𝑚𝑒𝑟 🌵 .

-  𝑎𝑙𝑖 🌵 .

-  𝑡𝑜??𝑎 🌵 .

𖥻 𝙅𝙖𝙣𝙖?? 🍇.

𖥻 𝙁𝙖𝙩𝙚𝙢𝙖 🍇.

𖥻 𝙕𝙖𝙮𝙣𝙖𝙗 🍇.

𖥻 𝙍𝙚𝙚𝙢 🍇.

. 𝗵𝘀𝘀𝗮𝗻 🦚.

•  ّ𝘀𝗼𝗸𝗮𝗿 🦚.

  ، 𝗖𝗔𝗞𝗘 🌳*
  
  `『𝚂𝙾𝚂𝙰𝙷』`

`『𝙱𝙰𝙽𝙾𝚂𝙰𝙷』`

`ΔᗰᗨNᗪΔ`

`Ꮮ𝑎𝑢𝑟𝑒𝑛`

` 𝐄𝐌𝐄𝐋??`

` 𝐉𝒂𝒔𝒔𝒊𝒄𝒂`

`『𝙻𝙾𝚂𝙶』`

`『𝚉𝙴𝙴𝙽』`

`『𝙵𝚃𝙾𝚂𝙷𝙰』`

`『𝙼𝙽𝚃𝙰𝚉』`

`『𝙺𝙾𝙰𝙺𝙿』`

*𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁*
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/ahk') then
local UserId = Text:match('(%d+)/ahk')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
- ݪۈ 💕.
- دَزيٰۿَا 💕.
- ؏َـسَݪ 💕.
- ﺂسَابَيٰع 💕.
- ؏َـافِيهۿَ 💕.
- ﺎڪٰۅݪ 💕. 
- طَاݪعۿَہٰ 💕.
- شَۿَلوِضعٰ 💞.
- ؏ـدِڪٰم 💕.
- ؏ـيوِنَۿَا 💕.
- بَسٰݪامۿَہٰ 💕.
- ڪٰميَۿَ 💕.
- ضٰحِڪٰتِي 💕.
- مٖاݪتَيٰ 💕.
- نَعسٰانِۿَہٰ 💕.
- شٰسوِينَ 💕.
- ڪٰوِݪيٰݪۿَ 💕.
- ﺂنَتظٰݛكَ 💕.
- صٰبَݛჂ̤ 💕.
- ݛﺂيٰحَۿَ 💕.
- ﺂسِݪوٰب 💕. 
- تٰعاِݪ 💕.
- ڪٰيَوٰتِ 💕.
- ﺂدِݛჂ̤ 💕.
- ۿوَﺂيِ💕.
- ݪطَافۿہٰ 💕.
- ح٘قَيٰݛ 💕.
- ﺂغٰاِݛ 💕.
- ݪتَݛوحٰ 💕.
- شدِسٰوينَ 💕.
- ﺂݪيٰ 💕.
- ﺂݪصݛاحٰۿَہٰ 💕.
- تَغٰيِݛتٰ 💕.
- ﺂحَسنٰ 💕.
- تَافِۿَيٰنِ 💕.
- حَاݪۿہٰ 💕.
- صٰدِكَ ??.
- ﺂسَفۿَہٰ 💕.
- زٰعݪانۿَہٰ 💕.
- مٖݛحَتٰ 💕.
- مٖلݪ 💕 . 
- ﺂڪٰتفَيٰ 💕.
- ݛخِيٰصَ 💕.
- ح٘اݛۿَ 💕.
- ڪِݪشَ 💕.
- ۿَݪاوَاتٰ 💕.
- ڪِيفيٰ 💕.
- شتٱقيتـِلكَۃ 💕. 
- تَعوٰدَتٰ 💕.
- ﺂبقِۿ 💕. 
شٰصايَݛ 💕.
- ۿَمَجٖ 💕.
- ڪِانسٰݛ 💕.
- ﺂݛتَقيٰ 💕.
- ݛسَاݪۿَہٰ 💕.
- مٖصِايٓݛ ??.
- ﺂتَعجٓبٰ 💕.
- تخِيݪيٰ 💕.
- ﺂفٖڪَݛ 💕.
- ڪٰݛﺂمَتكٓ ??.
- ﺂسَحٰݪ 💕.
- مٖهمِۿَہٰ 💕.
- بَغٰݛفتَيٰ 💕.
- ح٘ݛوَحٰ 💕.
- مٖݪيَتٓ 💕.
- ﺂلبَيٰتَ 💕.
- ݛجٰاݪَ 💕.
- ممَݛتبطۿَہٰ ??.
- ﺂݛتَاحٓ 💕.
- جٖاهَݪ 💕.
- تِندَمٰ 💕.
- ﺂلَساعٰۿہٰ ??.
- طَاحضٰكِ 💕.
- خٓݪيَكٓ 💕.
- صُباحكَہ عافِيۿہ💕. 
- ﺂتَنفسَكٰ 💕.
- ۈݪيَ 💕.
- ݛﺂيَحۿَہٰ 💕.
- ﭑبِاو؏َ 💕.
- ﺂفَݪامٰ 💕.
- ݪتَنامِہٰ 💕.
- ݛحَتٓ 💕.
- مٖشٰتاقَۿَہٰ 💕.
- نَفسيٰتيٰ 💕.
- شٰسويتٰ 💕.
- ڪَاعٰدَۿہٰ 💕.
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/nbzy') then
local UserId = Text:match('(%d+)/nbzy')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
₁₉₉₀
₁₉₉₁
₁₉₉₂
₁₉₉₃
₁₉₉₄
₁₉₉₅
₁₉₉₆
₁₉₉₇
₁₉₉₈
₁₉₉₉
₂₀₀₀
₂₀₀₁
₂₀₀₂
₂₀₀₃
₂₀₀₄
₂₀₀₅
₂₀₀₆
₂₀₀₇
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
𝒋𝒂𝒏𝒖𝒂𝒓𝒚.💞 
𝒇𝒆𝒃𝒓𝒖𝒂𝒓𝒚.💞 
𝒎𝒂𝒓𝒄𝒉.💞 
𝒂𝒑𝒓𝒊𝒍.💞
𝒎𝒂𝒚.💞 
𝒋𝒖𝒏𝒆.?? 
𝒋𝒖𝒍𝒚.💞 
𝒂𝒖𝒈𝒖𝒔𝒕 .💞
𝒔𝒆𝒑𝒕𝒆𝒎𝒃𝒆𝒓 .💞
𝒐𝒄𝒕𝒐𝒃𝒆𝒓.💞
𝒏𝒐𝒗𝒆𝒎𝒃𝒆𝒓.💞
𝒅𝒆𝒄𝒆𝒎𝒃𝒆𝒓.💞
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
-𝐒𝐔𝐍𝐃𝐀𝐘.♡
-𝐌𝐎𝐍𝐃𝐀𝐘.♡
-𝐓𝐔𝐄𝐒𝐃𝐀𝐘.♡
-𝐖𝐄𝐃𝐍𝐄𝐒𝐃𝐀𝐘.♡
-𝐓𝐇𝐔𝐑𝐒𝐃𝐀𝐘.♡
-𝐅𝐑𝐈𝐃𝐀𝐘.♡
-𝐒𝐀𝐓𝐔𝐑𝐃𝐀𝐘.♡
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/faou') then
local UserId = Text:match('(%d+)/faou')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
..⌠𝐒𝐞𝐥𝐯𝐚𝐧𝐚⌡𓊑.
..⌠𝐓𝐨𝐛??𝐤⌡𓊑.
..⌠𝐄𝐥𝐤𝐚𝐫⌡𓊑.
..⌠𝐌𝐚𝐲𝐚⌡𓊑.
..⌠𝐓𝐞𝐨𝐨⌡𓊑.
..⌠𝐌𝐞𝐚⌡𓊑.
..⌠𝐋𝐞𝐥𝐞⌡𓊑.
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
• ˹𝙆𝙖??𝙖˼ 
• ˹𝙉𝙖𝙖𝙧˼ 
• ˹𝙂𝙢𝙧˼ 
• ˹𝘿𝙚𝙫˼ 
• ˹𝙀??𝙖˼
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
:   ˹𝘾𝘼𝙍𝙊𝙇𝙄𝙉𝙀˼ 𓄧 .
:   ˹𝘾𝙍????𝙏𝘼𝙇˼ 𓄧 .
:   ˹𝙇𝘼𝙐𝙍𝙀𝙉˼ 𓄧 .
:   ˹𝙆𝘼𝙈𝙄𝙇𝘼˼ 𓄧 .
:   ˹𝘿𝘼𝙉𝘼˼ 𓄧 .
:   ˹𝙍𝙄𝙏𝘼˼ 𓄧 .
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Mzeng') then
local UserId = Text:match('(%d+)/Mzeng')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
𓂄𓆩┉┉┉⊶ 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 ⊷┉┉┉𓆪𓂁

بايو: 🐒♖ ⓁĮ𝐟ε ???? รђ𝐨𝔯т, ａⓝ𝔡 𝔰ｏ ａ𝓂 Į! 🍟🍮

بايو: Ｄｏｎ’ｔ ｔａｌｋ ｔｏ ｍｅ ｕｎｔｉｌ ｈａｖｉｎｇ ｍｙ ｃｏｆｆｅｅ．

بايو: •]••´º´•» 𝕚𝓜𝐦ㄖⓡ𝔱𝐀ㄥ𝕚ｚⒾＮg ᗰㄖ𝓜ｅ𝓃Ť𝓼 ฬίтⒽ 𝕞ｙ 𝐜𝐀𝐦𝒆Řᗩ «•´º´••[•

بايو: 𝔅𝔢 𝔶𝔬𝔲, 𝔯𝔢𝔭𝔯𝔢𝔰𝔢𝔫𝔱 𝔶𝔬𝔲𝔯 𝔬𝔴𝔫 𝔨𝔦𝔫𝔡 𝔬𝔣 𝔟𝔢𝔞𝔲𝔱𝔶

بايو: ᴎɘɘup ɘd oƚ ᴎwoɿɔ ɒ bɘɘᴎ ƚoᴎ ob I

بايو: ᑕᗩᑎ E᙭ᑭOᔕE ᖇEᗩᒪITY ᗷY OᑎE ᑭIᑕTᑌᖇE ᗩT ᗩ TIᗰE

بايو: Dₒ yₒᵤ ₛₑₑ wₕₐₜ ᵢ ₛₑₑ?

بايو: ˙ʞooqǝɔɐℲ uo spuǝıɹɟ pıoʌɐ oʇ ǝɹǝɥ ɯ’I

بايو: M♥e♥ ♥a♥n♥d♥ ♥m♥y♥ ♥c♥a♥m♥e♥r♥a♥:♥ ♥a♥ ♥J♥o♥u♥r♥n♥e♥y♥ ♥a♥r♥o♥u♥n♥d♥ ♥t♥h♥e♥ ♥w♥o♥r♥l♥d

ꔹ━━━━━ꔹ  zero  ꔹ━━━━━ꔹ
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/normal_zk') then
  local UserId = Text:match('(%d+)/normal_zk')
  if tonumber(UserId) == tonumber(IdUser) then
    Redis:set(Fast.."zhrfa"..IdUser,"sendzh") 
    edit(ChatId, Msg_id, "*•︙ارسل الكلمه لزخرفتها عربي او انجلش*", "md",false)
  end
  end
if Text and Text:match('(%d+)/inline_zk') then
  local UserId = Text:match('(%d+)/inline_zk')
  if tonumber(UserId) == tonumber(IdUser) then
    local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = {
      {
      {text = '𝙀𝙉𝙂 ▴ زخࢪفھـۃ انجليزي', data = IdUser..'/zeng'},
      },
      {
        {text = '𝘼𝙍 ▴ زخࢪفھـۃ عربي', data = IdUser..'/zar'},
        },
      }
      }
      bot.editMessageText(ChatId, Msg_id, "*•︙مرحبا بك في الزخرفه الانلاين*", "md",true,false,reply_markup)
  end
  end
-- zeng call back
if Text and Text:match('(%d+)/zeng') then
  local UserId = Text:match('(%d+)/zeng')
  if tonumber(UserId) == tonumber(IdUser) then
    Redis:set(Fast..ChatId..IdUser.."zkrf:", "zeng")
    edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
  end
  end
if Text and Text:match('(.*)/az(.*)') then
    local anubis = {Text:match('(.*)/az(.*)')}
    local UserId = anubis[1]
    local z_num = anubis[2]
    local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
    Redis:set(Fast..ChatId..IdUser.."zkrf:num", z_num)
    if tonumber(UserId) == tonumber(IdUser) then
      local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
      local zkrf = JSON.decode(api)
      local zk = zkrf['anubis'][z_num]
      local zk_list = Redis:smembers(Fast.."zk_list:")
      local inline_anubis = {data = {{text = "▴ زخࢪفھـۃ بالايموجي ▴" , data = UserId..'/emo'}}}
  for k,v in pairs(zk_list) do
    zk_by_anubis = v:gsub("###",zk)
    inline_anubis[k] = {{text = zk_by_anubis , data = UserId.."/bz"..k}}
    end
    local reply_markup = bot.replyMarkup{
        type = 'inline',
        data = inline_anubis
        }
    edit(ChatId, Msg_id, "▾\n★ لقد اختࢪت \n▷ "..zk, "md",true,false,reply_markup)
    end
    end
if Text and Text:match('(.*)/bz(.*)') then
local anubis = {Text:match('(.*)/bz(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
local zk_list = Redis:smembers(Fast.."zk_list:")
local zk_anubis = zk_list[z_num]:gsub("###",zk)
edit(ChatId, Msg_id, "▾\n★ لقد اختࢪت \n▷ `"..zk_anubis.."`", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
if Text and Text:match('(.*)/delz(.*)') then
local anubis = {Text:match('(.*)/delz(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
if tonumber(UserId) == tonumber(IdUser) then
local zk_list = Redis:smembers(Fast.."zk_list:")
Redis:srem(Fast.."zk_list:", zk_list[z_num])
local reply_markup = bot.replyMarkup{
    type = 'inline',
    data = {
        {{text = 'رجوع', data = UserId..'/home_z'}}
    }
}
edit(ChatId, Msg_id, "•︙لقد قمت بحذف "..zk_list[z_num].."\n•︙من قائمه الزخارف", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/home_z') then
local UserId = Text:match('(%d+)/home_z')
if tonumber(UserId) == tonumber(IdUser) then
local zk_list = Redis:smembers(Fast.."zk_list:")
local inline_anubis = {data = {}}
for k,v in pairs(zk_list) do
inline_anubis[k] = {{text = v , data = UserId.."/delz"..k}}
end
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = inline_anubis
  }
edit(ChatId, Msg_id, "•︙اضغط علي الزخرفه لحذفها", "md",true,false,reply_markup)
end
end
-- zk emo
if Text and Text:match('(%d+)/emo') then
  local UserId = Text:match('(%d+)/emo')
  local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
  local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
  if tonumber(UserId) == tonumber(IdUser) then
    local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
    local zkrf = JSON.decode(api)
    local zk = zkrf['anubis'][z_save]
    edit(ChatId, Msg_id, "★ تمت الزخࢪفھـۃ بنجاح\n\n▷ `"..zk.." ¦✨❤️` \n\n▷ `"..zk.." “̯ 🐼💗`\n\n▷ `"..zk.." 🦋“`\n\n▷ `"..zk.."ّ ❥̚͢₎ 🐣`\n\n▷ `"..zk.." ℡ ̇ ✨🐯⇣✦`\n\n▷ `"..zk.." 😴🌸✿⇣`\n\n▷ `"..zk.." 🙊💙`\n\n▷ `"..zk.." ❥┊⁽ ℡🦁🌸`\n\n▷ `"..zk.." •︙💚“`\n\n▷ `"..zk.." ⚡️♛ֆ₎`\n\n▷ `"..zk.." ⁞♩⁽💎🌩₎⇣✿`\n\n▷ `"..zk.." 〄💖‘`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!", "md",false)
    Redis:del(Fast..ChatId..IdUser.."zkrf:text")
    Redis:del(Fast..ChatId..IdUser.."zkrf:num")
  end
  end
-- zar call back
if Text and Text:match('(%d+)/zar') then
    local UserId = Text:match('(%d+)/zar')
    if tonumber(UserId) == tonumber(IdUser) then
      Redis:set(Fast..ChatId..IdUser.."zkrf:", "zar")
      edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
    end
    end
--
if Text and Text:match('(%d+)/normal_zk') then
local UserId = Text:match('(%d+)/normal_zk')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'عربـــــي', data = UserId..'/Zhrfaar'},{text = 'انجليــــزي', data = UserId..'/Zhrfaen'},
},
}
}
edit(ChatId,Msg_id,"•︙اختر لغه الزخرفه :", 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/antit') then
local UserId = Text:match('(%d+)/antit')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local selvaa = {
"هذا الظالم الي قتل النمله 😭👇", 
"اليش قتلتها يا حيوان 🙄", 
"م عندك ايش رحمه ؟؟", 
"قتلتها لي يخنزير ؟؟", 
"ربنا ياخدك زي م قتلتها ??", 
"ليه انت قاتل 🔫", 
} 
JABWA = selvaa[math.random(#selvaa)]
au ={type = "photo",media = "https://t.me/DEV_JABWA/227",caption = '*'..JABWA..'*\n'..Name..'',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
edit(ChatId,Msg_id,"•︙ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
edit(ChatId,Msg_id,"•︙ارسل الاسم بالانكليزي", 'md', false)
end
end
if Text and Text:match('/ChangenameVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangenameVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetnameVip'..IdUser,true)
local Text = "* • حسنا ارسل لي اسمك الان 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelnameVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetnameVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ اسمك 💥 *',"md",true)  
Redis:del(Fast..'SetnameVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetnameVip'..IdUser)
Redis:set(Fast..'Game:name'..IdUser,text)
local text = "* • تم حفظ اسمك 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير اسمي",data="/ChangenameVip:"..IdUser},{text="حذف اسمي",data="/deletename:"..IdUser}},
{{text="وضع سني",data="/ChangeSunniVip:"..IdUser}},
{{text="اخفاء",data="/hidename:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/deletename:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/deletename:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Game:name'..IdUser)
local Text = "*• تم حذف اسمك بنجاح 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع اسمي",data="/ChangenameVip:"..IdUser}},
{{text="اخفاء",data="/hidename:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangeSunniVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeSunniVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetSunniVip'..IdUser,true)
local Text = "* • حسنا ارسل لي سنك الان ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelSunniVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetSunniVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ سنك ⏺️ *',"md",true)  
Redis:del(Fast..'SetSunniVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetSunniVip'..IdUser)
Redis:set(Fast..'Game:Sunni'..IdUser,text)
local text = "* • تم حفظ سنك ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سني",data="/ChangeSunniVip:"..IdUser},{text="حذف سني",data="/deleteSunni:"..IdUser}},
{{text="وضع اسمي",data="/ChangenameVip:"..IdUser}},
{{text="اخفاء",data="/hideSunni:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/deleteSunni:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/deleteSunni:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Game:Sunni'..IdUser)
local Text = "*• تم حذف سنك بنجاح ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع سني",data="/ChangeSunniVip:"..IdUser}},
{{text="اخفاء",data="/hideSunni:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/hidename:(.*)') then
local UserId = Text:match('/hidename:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/hideSunni:(.*)') then
local UserId = Text:match('/hideSunni:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/ChangeBotVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeBotVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetBotVip'..IdUser,true)
local Text = "*• حسنا ارسل لي بوتك الان 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelBotVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetBotVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ بوتك 🤖 *',"md",true)  
Redis:del(Fast..'SetBotVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetBotVip'..IdUser)
Redis:set(Fast..'SOFI:Bot:Vip'..IdUser,text)
local text = "* • تم حفظ بوتك 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير بوتي",data="/ChangeBotVip:"..IdUser},{text="حذف بوتي",data="/DelBotVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideBotVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/ChangeGroupVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeGroupVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetGroupVip'..IdUser,true)
local Text = "* • حسنا ارسل لي جروبك الان ⚡*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelGroupVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetGroupVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ جروبك ⚡ *',"md",true)  
Redis:del(Fast..'SetGroupVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetGroupVip'..IdUser)
Redis:set(Fast..'SOFI:Group:Vip'..IdUser,text)
local text = "* • تم حفظ جروبك ⚡*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير جروبي",data="/ChangeGroupVip:"..IdUser},{text="حذف جروبي",data="/DelGroupVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideGroupVip:"..IdUser}},
{{text='. ??𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/CancelChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/CancelChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'SetChanneVip'..IdUser)
local Text = "*• تم الغاء حفظ قناتك ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangeChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetChanneVip'..IdUser,true)
local Text = "* • حسنا ارسل لي قناتك الان ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelChanneVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetChanneVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ قناتك ❇️ *',"md",true)  
Redis:del(Fast..'SetChanneVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetChanneVip'..IdUser)
Redis:set(Fast..'SOFI:Channe:Vip'..IdUser,text)
local text = "* • تم حفظ قناتك ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير قناتي",data="/ChangeChanneVip:"..IdUser},{text="حذف قناتي",data="/DelChanneVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع جروبي",data="/ChangeGroupVip:"..IdUser}},
{{text="اخفاء",data="/HideChanneVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/DelChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/DelChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'SOFI:Channe:Vip'..IdUser)
local Text = "*• تم حذف قناتك بنجاح ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideChanneVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/HideChanneVip:(.*)') then
local UserId = Text:match('/HideChanneVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم اخفاء امر وضع قناتي *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/HideGroupVip:(.*)') then
local UserId = Text:match('/HideGroupVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/HideBotVip:(.*)') then
local UserId = Text:match('/HideBotVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/CancelfileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/CancelfileVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Setfilejabwa'..IdUser)
Text = " • تم الغاء حفظ معلوماتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangefileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangefileVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'Setfilejabwa'..IdUser,true)
local Text = "• مرحبا بك ف سي في ⚡\n• ارسل اسمك الان ✴️"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelfileVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'Setfilejabwa'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* • تم الغاء حفظ معلوماتك *',"md",true)  
Redis:del(Fast..'Setfilejabwa'..IdUser)
return false  
end 
Redis:del(Fast..'Setfilejabwa'..IdUser)
Redis:set(Fast..'JABWA:file'..IdUser,text)
local text = " • تم حفظ معلوماتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سي في",data="/ChangefileVip:"..IdUser},{text="حذف سي في",data="/DelfileVip:"..IdUser}},
{{text="اخفاء",data="/HidefileVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/DelfileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/DelfileVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'JABWA:file'..IdUser)
Text = " • تم حذف معلوماتك بنجاح"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع سي في",data="/ChangefileVip:"..IdUser}},
{{text="اخفاء",data="/HidefileVip:"..IdUser}},
{{text='. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/HidefileVip:(.*)') then
local UserId = Text:match('/HidefileVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* • تم اخفاء امر وضع سي في *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('(%d+)/Laws') then
local UserId = Text:match('(%d+)/Laws')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:Rules:" .. ChatId .. ":" .. UserId, 600, true) 
local txxt = "*• ارسل لي القوانين الان*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Description') then
local UserId = Text:match('(%d+)/Description')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:Description:" .. ChatId .. ":" .. UserId, 600, true) 
local txxt = "*• ارسل لي وصف الجروب الان*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/picture') then
local UserId = Text:match('(%d+)/picture')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Chat:Photo"..ChatId..":"..UserId,true) 
local txxt = "*• ارسل الصوره لوضعها*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welkjpco') then
local UserId = Text:match('(%d+)/welkjpco')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Tshake:Welcome:Group" .. ChatId .. "" .. UserId, 120, true)  
local txxt = [[
 • ارسل لي الترحيب عام الان
 • تستطيع اضافه مايلي !
يمكنك استخدام الدوال الاتيه 
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
- عرض اسم الشخص ⇿ `{الاسم}`
- عرض يوزر الشخص ⇿ `{المعرف}`
- عرض اسم المجموعه ⇿ `{المجموعه}`
- عرض عدد الاعضاء ⇿ `{الاعضاء}`
- عرض عدد الادمنيه ⇿ `{الادمنيه}`
- عرض الوقت ⇿ `{الوقت}`
- عرض التاريخ ⇿ `{التاريخ}`
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welpipco') then
local UserId = Text:match('(%d+)/welpipco')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Welcome:Group:Set" .. ChatId .. "" .. UserId, 120, true)  
local txxt = [[
 • ارسل لي الترحيب عام الان
 • تستطيع اضافه مايلي !
• يمكنك استخدام الدوال الاتيه
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
- عرض اسم الشخص ⇿ `{الاسم}`
- عرض يوزر الشخص ⇿ `{المعرف}`
- عرض اسم المجموعه ⇿ `{المجموعه}`
- عرض عدد الاعضاء ⇿ `{الاعضاء}`
- عرض عدد الادمنيه ⇿ `{الادمنيه}`
- عرض الوقت ⇿ `{الوقت}`
- عرض التاريخ ⇿ `{التاريخ}`
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welcome') then
local UserId = Text:match('(%d+)/welcome')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*• حسنا ⇿* '..Name..'\n*• اختار نوع وضع الترحيب*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الترحيب', callback_data=IdUser.."/welkjpco"},{text = 'الترحيب العام', callback_data=IdUser.."/welpipco"},
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/Di_il'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-- bank call back
----------
if Text and Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)') then
local Data = {Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رايك نزوجك بدالهم ؟", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."zwag_request:"..Data[1]) then
local zwga_id = tonumber(Data[1])
local zwg_id = tonumber(Data[2])
local coniss = Data[3]
local zwg = bot.getUser(zwg_id)
local zwga = bot.getUser(zwga_id)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..zwg_id..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..zwga_id..")"
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get(Fast.."boob"..zwg_id) or 0
ballanceea = Redis:get(Fast.."boob"..zwga_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set(Fast.."boob"..zwg_id , math.floor(zeugh))
Redis:sadd(Fast.."roogg1",zwg_id)
Redis:sadd(Fast.."roogga1",zwga_id)
Redis:set(Fast.."roog1"..zwg_id,zwg_id)
Redis:set(Fast.."rooga1"..zwg_id,zwga_id)
Redis:set(Fast.."roogte1"..zwga_id,zwga_id)
Redis:set(Fast.."rahr1"..zwg_id,tonumber(coniss))
Redis:set(Fast.."rahr1"..zwga_id,tonumber(coniss))
Redis:set(Fast.."roog1"..zwga_id,zwg_id)
Redis:set(Fast.."rahrr1"..zwg_id,math.floor(ballanceekkk))
Redis:set(Fast.."rooga1"..zwga_id,zwga_id)
Redis:set(Fast.."rahrr1"..zwga_id,math.floor(ballanceekkk))
return edit(ChatId,Msg_id,"كولولولولويششش\nاليوم عقدنا قران :\n\nالزوج "..zwg_tag.." 🤵🏻\n   💗\nالزوجه "..zwga_tag.." 👰🏻‍♀️\nالمهر : "..convert_mony.." جنيه بعد الضريبه 15%\nعشان تشوفون وثيقه زواجكم اكتبوا : زواجي", 'md', false)
else
return edit(ChatId,Msg_id,"انتهى الطلب وين كنتي لما طلب ايدك", 'md', false)
end
end
end
if Text and Text:match('(%d+)/zwag_no/(%d+)') then
local UserId = {Text:match('(%d+)/zwag_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رايك نزوجك بدالهم ؟", true)
else
Redis:del(Fast.."zwag_request:"..UserId[1])
Redis:del(Fast.."zwag_request:"..UserId[2])
return edit(ChatId,Msg_id,"خليكي عانس ؟؟", 'md', false)
end
end
----
if Text and Text:match('(%d+)/company_yes/(%d+)') then
local Data = {Text:match('(%d+)/company_yes/(%d+)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."company_request:"..Data[1]) then
local Cname = Redis:get(Fast.."companys_name:"..Data[2])
Redis:sadd(Fast.."company:mem:"..Cname, IdUser)
Redis:sadd(Fast.."in_company:", IdUser)
Redis:set(Fast.."in_company:name:"..IdUser, Cname)
local mem_tag = "["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")"
send(Data[2],0, "اللاعب "..mem_tag.." وافق على الانضمام الى شركتك","md",true)
return edit(ChatId,Msg_id,"تم قبول الطلب بنجاح",'md',false)
else
return edit(ChatId,Msg_id,"انتهى الطلب للاسف", 'md', false)
end
end
end
if Text and Text:match('(%d+)/company_no/(%d+)') then
local UserId = {Text:match('(%d+)/company_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
else
Redis:del(Fast.."company_request:"..UserId[1])
local mem_tag = "["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")"
send(Data[2],0, "اللاعب "..mem_tag.." رفض العمل في شركتك","md",true)
return edit(ChatId,Msg_id,"تم رفض الطلب بنجاح", 'md', false)
end
end
if Text and Text:match('(%d+)/happywheel') then
  local UserId = Text:match('(%d+)/happywheel')
  if tonumber(data.sender_user_id) == tonumber(UserId) then
  local media = "https://t.me/c_r_o_z_a/11"
  local msg_media = {
  type = "video",
  media = media,
  caption = '',
  parse_mode = "Markdown"                    
  }     
  local keyboard = {} 
  keyboard.inline_keyboard = {
  {
  {text = '• توقف •', callback_data=data.sender_user_id.."/play_wheel"}
  },
  }
  local msg_reply = msg_id/2097152/0.5
  Redis:set(Fast.."happywheel:st:"..UserId..":"..chat_id, true)
  https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..chat_id.."&message_id="..msg_reply.."&media="..JSON.encode(msg_media).."&reply_markup="..JSON.encode(keyboard))
  end 
  end
  
if Text and Text:match('(%d+)/play_wheel') then
  local UserId = Text:match('(%d+)/play_wheel')
  if tonumber(data.sender_user_id) == tonumber(UserId) and Redis:get(Fast.."happywheel:st:"..UserId..":"..chat_id) then
  Redis:del(Fast.."happywheel:st:"..UserId..":"..chat_id)
  local media = {
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 10000000 جنيه 💵","10000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 5000000 جنيه 💵","5000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 1000000 جنيه 💵","1000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 100000 جنيه 💵","100000"
    },
    {
      "https://t.me/c_r_o_z_a/4","مبروك ربحت 4 قصور","4"
    },
    {
      "https://t.me/c_r_o_z_a/5","مبروك ربحت 8 فيلات","8"
    },
    {
      "https://t.me/c_r_o_z_a/6","مبروك ربحت 15 منزل","15"
    },
    {
      "https://t.me/c_r_o_z_a/7","مبروك ربحت 5 ماسات","5"
    },
    {
      "https://t.me/c_r_o_z_a/8","مبروك ربحت 6 قلادات","6"
    },
    {
      "https://t.me/c_r_o_z_a/9","مبروك ربحت 10 اساور","10"
    },
    {
      "https://t.me/c_r_o_z_a/10","مبروك ربحت 20 خاتم","20"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت مضاعفه نصف الفلوس","1"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك خسرت ربع فلوسك","1"
    },
  }
  local rand = math.random(1,11)
  local msg_media = {
  type = "photo",
  media = media[rand][1],
  caption = media[rand][2],
  parse_mode = "Markdown"                    
  }     
  local keyboard = {} 
  keyboard.inline_keyboard = {
  {
  {text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
  },
  }
  local msg_reply = msg_id/2097152/0.5
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if rand == 1 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 2 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 3 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 4 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 5 then
local akrksrnumm = Redis:get(Fast.."akrksrnum"..data.sender_user_id) or 0
local akrksrnoww = tonumber(akrksrnumm) + media[rand][3]
Redis:set(Fast.."akrksrnum"..data.sender_user_id , math.floor(akrksrnoww))
ksrnamed = "قصر"
Redis:set(Fast.."akrksrname"..data.sender_user_id,ksrnamed)
elseif rand == 6 then
local akrfelnumm = Redis:get(Fast.."akrfelnum"..data.sender_user_id) or 0
local akrfelnoww = tonumber(akrfelnumm) + media[rand][3]
Redis:set(Fast.."akrfelnum"..data.sender_user_id , math.floor(akrfelnoww))
felnamed = "فيلا"
Redis:set(Fast.."akrfelname"..data.sender_user_id,felnamed)
elseif rand == 7 then
local akrmnznumm = Redis:get(Fast.."akrmnznum"..data.sender_user_id) or 0
local akrmnznoww = tonumber(akrmnznumm) + media[rand][3]
Redis:set(Fast.."akrmnznum"..data.sender_user_id , math.floor(akrmnznoww))
mnznamed = "منزل"
Redis:set(Fast.."akrmnzname"..data.sender_user_id,mnznamed)
elseif rand == 8 then
local mgrmasnumm = Redis:get(Fast.."mgrmasnum"..data.sender_user_id) or 0
local mgrmasnoww = tonumber(mgrmasnumm) + media[rand][3]
Redis:set(Fast.."mgrmasnum"..data.sender_user_id , math.floor(mgrmasnoww))
masnamed = "ماسه"
Redis:set(Fast.."mgrmasname"..data.sender_user_id,masnamed)
elseif rand == 9 then
local mgrkldnumm = Redis:get(Fast.."mgrkldnum"..data.sender_user_id) or 0
local mgrkldnoww = tonumber(mgrkldnumm) + media[rand][3]
Redis:set(Fast.."mgrkldnum"..data.sender_user_id , math.floor(mgrkldnoww))
kldnamed = "قلاده"
Redis:set(Fast.."mgrkldname"..data.sender_user_id,kldnamed)
elseif rand == 10 then
local mgrswrnumm = Redis:get(Fast.."mgrswrnum"..data.sender_user_id) or 0
local mgrswrnoww = tonumber(mgrswrnumm) + media[rand][3]
Redis:set(Fast.."mgrswrnum"..data.sender_user_id , math.floor(mgrswrnoww))
swrnamed = "سوار"
Redis:set(Fast.."mgrswrname"..data.sender_user_id,swrnamed)
elseif rand == 11 then
local mgrktmnumm = Redis:get(Fast.."mgrktmnum"..data.sender_user_id) or 0
local mgrktmnoww = tonumber(mgrktmnumm) + media[rand][3]
Redis:set(Fast.."mgrktmnum"..data.sender_user_id , math.floor(mgrktmnoww))
ktmnamed = "خاتم"
Redis:set(Fast.."mgrktmname"..data.sender_user_id,ktmnamed)
elseif rand == 12 then
ballancek = ballance / 2
ballancekk = math.floor(ballancek) + ballance
Redis:set(Fast.."boob"..data.sender_user_id , ballancekk)
else
ballancek = ballance / 4
ballancekk = ballance - math.floor(ballancek)
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancekk))
end
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..chat_id.."&message_id="..msg_reply.."&media="..JSON.encode(msg_media).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/likeId') then
local UserId = tonumber(Text:match('(%d+)/likeId'))
local LikerId = tonumber(IdUser)
if Redis:sismember(Fast.."like:users:"..UserId, LikerId) then
return bot.answerCallbackQuery(data.id, "⦁ لقد قمت بالتصويت من قبل", true)
end
Redis:sadd(Fast.."like:users:"..UserId, LikerId)
local like_list = Redis:smembers(Fast.."like:users:"..UserId)
local num = #like_list
local Msg = bot.getMessage(ChatId, Msg_id).content
local emo = Redis:get(Fast.."like:id:emo:"..ChatId) or '❤️'
local UserInfo = bot.getUser(LikerId)
local nameuser = UserInfo.first_name or "غير معروف"
local UserInfousername = UserInfo.username and "@" .. UserInfo.username or "لا يوجد"
local MsgOwnerId = tonumber(UserId)
local msgText = "*• قام هذا الشخص ⋮* ⦉ ["..nameuser.."](tg://user?id="..LikerId..") ⦊\n*• بالاعجاب بالايدي الخاص بك\n• الايدي الخاص به ⋮ ⦉ "..LikerId.." ⦊\n• اليوزر الخاص به ⋮ ⦉ "..UserInfousername.." ⦊*"
pcall(function()
bot.sendText(MsgOwnerId, 0, msgText, "md", true)
end)
local Id_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = num.." "..emo, data = UserId.."/likeId"},
{text = "◞المعجبين 💌٫", data = UserId.."/showLikers"}
},
}
}
keyboard = {}
keyboard.inline_keyboard = {
{
{text = num.." "..emo, callback_data = UserId.."/likeId"},
{text = "◞المعجبين 💌٫", callback_data = UserId.."/showLikers"}
},
}
local ID_text
if Msg.caption then
ID_text = Msg.caption.text
else
ID_text = Msg.text.text
end
bot.editMessageText(ChatId, Msg_id, "*" .. ID_text .. "*", 'md', false, false, Id_markup)
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape("*"..ID_text.."*").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if Text and Text:match("(%d+)/showLikers") then
local UserId = Text:match("(%d+)/showLikers")
if tonumber(IdUser) ~= tonumber(UserId) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك", true)
end
local likers = Redis:smembers(Fast.."like:users:"..UserId)
local names = {}
local privateList = {}
local count = 0
local infoUser = bot.getUser(UserId)
local userName = (infoUser.first_name or "تيمو الخالدي")
for i = #likers, 1, -1 do
local info = bot.getUser(likers[i])
if info and not info.is_deleted and info.first_name then
count = count + 1
table.insert(names, count.." ـ "..info.first_name)
local name = info.first_name:gsub("[%[%]*%_%`]", "")
local link = info.username and ("*["..name.."](https://t.me/"..info.username..")*") or ("*["..name.."](tg://user?id="..likers[i]..")*")
table.insert(privateList, count.." - "..link)
end
if count == 5 then break end
end
if #names == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد معجبين حتى الآن", true)
else
local text = "• المعجبين بك يا "..userName.." \n" .. table.concat(names, "\n")
bot.answerCallbackQuery(data.id, text, true)
if #privateList > 0 then
local MsgOwnerId = tonumber(UserId)
local allText = "• جميع المعجبين بالايدي الخاص بك :\n"..table.concat(privateList, "\n")
pcall(function()
bot.sendText(MsgOwnerId, 0, "*"..allText.."*", "md", true)
end)
end
end
end

if Text and Text:match('(%d+)/toptop') then
local UserId = Text:match('(%d+)/toptop')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local timo = "*• اهلا بك عزيزي ⦉ "..Text.." ⦊\n• في قسم التوبات\n√*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• توب الفلوس •', data = data.sender_user_id..'/topmon'},{text = '• توب الزرف •', data = data.sender_user_id..'/topzrf'},
},
{
{text = '• توب الزوجات •', data = data.sender_user_id..'/zoztee'},{text = '• توب المزارع •', data = data.sender_user_id..'/mazratee'},
},
{
{text = '• توب النوادي •', data = data.sender_user_id..'/topnade'},{text = '• توب الشركات •', data = data.sender_user_id..'/shrkatt'},
},
{
{text = '• توب المتبرعين •', data = data.sender_user_id..'/motbra'}
},
{
{text = '• اخفاء الامر •', data = data.sender_user_id..'/delAmr'}, 
},
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url="t.me/Di_il"},
},
}
}
edit(ChatId,Msg_id,timo, 'md', true, false, reply_markup)
end
end 

if Text and Text:match('(%d+)/topnade') then
local UserId = Text:match('(%d+)/topnade')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(Fast.."ownernade")
if #bank_users == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
top_monyd = "⇜ توب اعلى 10 نوادي :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."nokatnade"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Fast.."lkbnade"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local mony = v[1]
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\n⇜ ملاحظه : اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/mazratee') then
local UserId = Text:match('(%d+)/mazratee')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(Fast.."ownerfram")
if #bank_users == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
top_monyd = "توب اعلى 10 مزارع :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."toplvfarm"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Fast.."namefram"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\nملاحظه : اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/shrkatt') then
local UserId = Text:match('(%d+)/shrkatt')
if tonumber(IdUser) == tonumber(UserId) then
local companys = Redis:smembers(Fast.."companys:")
if #companys == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
local top_company = {}
for A,N in pairs(companys) do
local Cmony = 0
for k,v in pairs(Redis:smembers(Fast.."company:mem:"..N)) do
local mem_mony = tonumber(Redis:get(Fast.."boob"..v)) or 0
Cmony = Cmony + mem_mony
end
local owner_id = Redis:get(Fast.."companys_owner:"..N)
local Cid = Redis:get(Fast.."companys_id:"..N)
table.insert(top_company, {tonumber(Cmony) , owner_id , N , Cid})
end
table.sort(top_company, function(a, b) return a[1] > b[1] end)
local num = 1
local emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
local msg_text = "• توب اعلى 20 شركه ⇞⇟ \nꔹ━━━━━ꔹꔹ━━━━━ꔹ\n"
for k,v in pairs(top_company) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local Cname = v[3]
local Cid = v[4]
local mony = v[1]
gflous = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
local emoo = emoji[k]
num = num + 1
msg_text = msg_text..emoo.." "..gflous.."  💵 l "..Cname.."\n"
gg = "ꔹ━━━━━ꔹꔹ━━━━━ꔹ\n\nملاحظه ⇿ اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,msg_text..gg, 'html', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/motbra') then
local UserId = Text:match('(%d+)/motbra')
if tonumber(IdUser) == tonumber(UserId) then
  local F_Name = bot.getUser(IdUser).first_name
Redis:set(Fast..IdUser.."first_name:", F_Name)
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(Fast.."tabbroat"..IdUser) or 0
local bank_users = Redis:smembers(Fast.."taza")
if #bank_users == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
top_mony = "• توب اعلى 20 شخص بالتبرعات ⇞⇟\nꔹ━━━━━ꔹꔹ━━━━━ꔹ\n"
tabr_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."tabbroat"..v)
table.insert(tabr_list, {tonumber(mony) , v})
end
table.sort(tabr_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(tabr_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ꔹ━━━━━ꔹꔹ━━━━━ꔹ\n• you ⇿ "..gflous.." 💵 l "..news.." \n\nملاحظه ⇿ اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/zoztee') then
local UserId = Text:match('(%d+)/zoztee')
if tonumber(IdUser) == tonumber(UserId) then
  local zwag_users = Redis:smembers(Fast.."roogg1")
  if #zwag_users == 0 then
  local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
  top_zwag = "• توب 30 اغلى زواجات ⇞⇟\nꔹ━━━━━ꔹꔹ━━━━━ꔹ\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(Fast.."rahr1"..v)
  local zwga = Redis:get(Fast.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Fast..v[3].."first_name:") or "لا يوجد اسم"
tt =  "["..zwg_name.."]("..zwg_name..")"
kk = "["..zwga_name.."]("..zwga_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." 👫 "..kk.."\n"
gg = "\n\nملاحظه ⇿ اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,top_zwag..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
zrfee = Redis:get(Fast.."rrfff"..IdUser) or 0
local ty_users = Redis:smembers(Fast.."rrfffid")
if #ty_users == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
ty_Jabwa = "• توب 20 شخص زرفوا فلوس ⇞⇟\nꔹ━━━━━ꔹꔹ━━━━━ꔹ\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(Fast.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_Jabwa = ty_Jabwa..emoo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = "\nꔹ━━━━━━━━━━ꔹ\n• you ⇿ "..gflous.." 💵 l "..news.." \n\nملاحظه ⇿ اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,ty_Jabwa..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(IdUser) == tonumber(UserId) then
local F_Name = bot.getUser(IdUser).first_name
Redis:set(Fast..IdUser.."first_name:", F_Name)
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(IdUser.."boob"..IdUser) or 0
local bank_users = Redis:smembers(Fast.."booob")
if #bank_users == 0 then
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,"*• لا يوجد احد في القائمه*", 'md', true, false, reply_markupp)
end
top_mony = "• توب اغنى 20 شخص ⇞⇟\nꔹ━━━━━━━━━━ꔹ\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ꔹ━━━━━━━━━━ꔹ\nyou ) "..gflous.." 💵 l "..news.." \n\nملاحظه ⇿ اي شخص مخالف للعبه بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = IdUser..'/toptop'}, 
},
}
}
return edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/bankopi') then
local UserId = Text:match('(%d+)/bankopi')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اختار نوع البطاقه 🥺♥ 〉   
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• ماستر •', callback_data=IdUser.."/master"},
},
{
{text = '･ فيزا ･', callback_data=IdUser.."/visaa"},
},
{
{text = '･ اكسربس ･', callback_data=IdUser.."/express"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/master') then
local UserId = Text:match('(%d+)/master')
if tonumber(IdUser) == tonumber(UserId) then
creditc = math.random(5000000000000000,5999999999999999);
creditcc = string.format("%.0f",creditc)
mast = "ماستر"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,mast)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,mast)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*• اختر شخصيتك في اللعبه ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصيه طيبه 😇', callback_data=IdUser.."/msalm"},{text = 'شخصيه شريره 😈', callback_data=IdUser.."/shrer"},
},
{
{text=' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/visaa') then
local UserId = Text:match('(%d+)/visaa')
if tonumber(IdUser) == tonumber(UserId) then
creditc = math.random(4000000000000000,4999999999999999);
creditcc = string.format("%.0f",creditc)
visssa = "فيزا"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,visssa)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,visssa)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*• اختر شخصيتك في اللعبه ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصيه طيبه 😇', callback_data=IdUser.."/msalm"},{text = 'شخصيه شريره 😈', callback_data=IdUser.."/shrer"},
},
{
{text=' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/express') then
local UserId = Text:match('(%d+)/express')
if tonumber(IdUser) == tonumber(UserId) then
creditc = math.random(6000000000000000,6999999999999999);
creditcc = string.format("%.0f",creditc)
exprs = "اكسربس"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,exprs)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,exprs)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*• اختر شخصيتك في اللعبه ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصيه طيبه 😇', callback_data=IdUser.."/msalm"},{text = 'شخصيه شريره 😈', callback_data=IdUser.."/shrer"},
},
{
{text=' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/msalm') then
local UserId = Text:match('(%d+)/msalm')
if tonumber(IdUser) == tonumber(UserId) then
shakse = "طيبه"
Redis:set(Fast.."shkse"..IdUser,shakse)
cccall = Redis:get(Fast.."boobb"..IdUser)
ccctype = Redis:get(Fast.."bbobb"..IdUser)
txxt = "*• تم انشاء حساب بنكي الخاص بك في بنك الخالدي 🏦\n• وشحنالك 50 جنيه هديه\n• رقم حسابك ⋮ ⦉ "..cccall.." ⦊\n• نوع البطاقه ⋮ ⦉ "..ccctype.." ⦊\n• فلوسك ⋮ ⦉ 50 جنيه 💵 ⦊\n• شخصيتك ⋮ ⦉ طيبه 😇 ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text=' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/shrer') then
local UserId = Text:match('(%d+)/shrer')
if tonumber(IdUser) == tonumber(UserId) then
shakse = "شريره"
Redis:set(Fast.."shkse"..IdUser,shakse)
cccall = Redis:get(Fast.."boobb"..IdUser)
ccctype = Redis:get(Fast.."bbobb"..IdUser)
txxt = "*• تم انشاء حساب بنكي الخاص بك في بنك الخالدي 🏦\n• وشحنالك 50 جنيه هديه\n• رقم حسابك ⋮ ⦉ "..cccall.." ⦊\n• نوع البطاقه ⋮ ⦉ "..ccctype.." ⦊\n• فلوسك ⋮ ⦉ 50 جنيه 💵 ⦊\n• شخصيتك ⋮ ⦉ شريره 😈 ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text=' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end

if Text and Text:match('(%d+)/sahb') then
local UserId = Text:match('(%d+)/sahb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
cccall = Redis:get(Fast.."tdbelballance"..data.sender_user_id) or 0
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(cccall) then
return edit(ChatId,Msg_id, "⇜ فلوسك ماتكفي","md",true)
end
Redis:setex(Fast.."iioood" .. data.sender_user_id,920, true)
local list = {"1", "2", "3"}
local rand = list[math.random(#list)]
if rand == "1" then -- 1 con
cccallcc = tonumber(ballance) + tonumber(cccall)
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "• مبروك ربحت بالسحب\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n√"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 1 con
if rand == "2" then -- 2 con
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",ballance)
msalm = "• حظ اوفر ماربحت شي\n\n⇜ المبلغ : "..convert_mony.."\n⇜ رصيدك الان : `"..convert_monyy.."`\n√"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 2 con
if rand == "3" then -- 3 con
cccallcc = tonumber(ballance) - tonumber(cccall)
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
cccall = Redis:get(Fast.."tdbelballance"..data.sender_user_id)
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "• خسرت بالسحب ☹️\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n√"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.',url="t.me/Di_il"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 3 con 
end
end
--Bank
if Text and Text:match('(%d+)/4×4') then
local UserId = Text:match('(%d+)/4×4')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(1000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 1000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,1000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 4×4\n⇠ السعر : 1000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/6×6') then
local UserId = Text:match('(%d+)/6×6')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(2000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 2000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,5000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 6×6\n⇠ السعر : 2000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/8×8') then
local UserId = Text:match('(%d+)/8×8')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(3000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 3000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,10000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 8×8\n⇠ السعر : 3000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/12×12') then
local UserId = Text:match('(%d+)/12×12')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(4000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 4000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,100000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 12×12\n⇠ السعر : 4000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/16×16') then
local UserId = Text:match('(%d+)/16×16')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(5000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 5000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,1000000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 16×16\n⇠ السعر : 5000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/32×32') then
local UserId = Text:match('(%d+)/32×32')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(6000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 6000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,10000000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعه : '..namefram..'\n⇠ قياس المزرعه : 32×32\n⇠ السعر : 6000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
--------------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/luisyes') then
local UserId = Text:match('(%d+)/luisyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(39000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 39000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "لويس سواريز"
energyplayer = "83"
mrkzplayer = "مهاجم"
cityplayer = "🇺🇦 اوكرانيا"
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,39000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : لويس سواريز\n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 83\n⇜ الجنسيه : اوكرانيا 🇺🇦\n⇜ السعر : 39000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/luisno') then
local UserId = Text:match('(%d+)/luisno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب لويس سواريز ", 'md', true)
end
end
if Text and Text:match('(%d+)/danyes') then
local UserId = Text:match('(%d+)/danyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(50000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 50000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "داني الفيش"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷"
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,50000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : داني الفيش\n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 83\n⇜ الجنسيه : البرازيل 🇧🇷\n⇜ السعر : 50000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danno') then
local UserId = Text:match('(%d+)/danno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/fdnyes') then
local UserId = Text:match('(%d+)/fdnyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فيل فودن"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "إنجلترا ??󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فيل فودن\n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fdnno') then
local UserId = Text:match('(%d+)/fdnno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/rafyes') then
local UserId = Text:match('(%d+)/rafyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رافيل فاران"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رافيل فاران\n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : فرنسا 🇫🇷 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rafno') then
local UserId = Text:match('(%d+)/rafno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رافيل فاران", 'md', true)
end
end
if Text and Text:match('(%d+)/Kuanyes') then
local UserId = Text:match('(%d+)/Kuanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "خوان ماتا"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : خوان ماتا\n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 81\n⇜ الجنسيه : إسبانيا 🇪🇸 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kuanno') then
local UserId = Text:match('(%d+)/kuanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب خوان ماتا", 'md', true)
end
end
if Text and Text:match('(%d+)/hariyes') then
local UserId = Text:match('(%d+)/hariyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(15000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 15000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هاري ماجواير"
energyplayer = "80"
mrkzplayer = "مدافع"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,15000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هاري ماجواير\n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 80\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 15000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/harino') then
local UserId = Text:match('(%d+)/harino')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هاري ماجواير", 'md', true)
end
end
if Text and Text:match('(%d+)/romoyes') then
local UserId = Text:match('(%d+)/romoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روميلو لوكاكو"
energyplayer = "91"
mrkzplayer = "مهاجم"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : روميلو لوكاكو\n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 91\n⇜ الجنسيه : بلجيكا 🇧🇪 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/romono') then
local UserId = Text:match('(%d+)/romono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روميلو لوكاكو", 'md', true)
end
end
if Text and Text:match('(%d+)/tiagoyes') then
local UserId = Text:match('(%d+)/tiagoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تياجو الخالدي"
energyplayer = "81"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تياجو الخالدي\n⇜ مركزه : دفاع\n⇜ طاقه اللاعب : 81\n⇜ الجنسيه : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tiagono') then
local UserId = Text:match('(%d+)/tiagono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تياجو الخالدي", 'md', true)
end
end
if Text and Text:match('(%d+)/gerardyes') then
local UserId = Text:match('(%d+)/gerardyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جيرارد بيكيه"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,30000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جيرارد بيكيه\n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 83\n⇜ الجنسيه : إسبانيا 🇪🇸 \n⇜ السعر : 30000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/gerardno') then
local UserId = Text:match('(%d+)/gerardno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جيرارد بيكه", 'md', true)
end
end
if Text and Text:match('(%d+)/tyryes') then
local UserId = Text:match('(%d+)/tyryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(110000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 110000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تير شتيجن"
energyplayer = "91"
mrkzplayer = "حارس"
cityplayer = "المانيا 🇩🇪 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,110000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تير شتيجن\n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 91\n⇜ الجنسيه : المانيا 🇩🇪 \n⇜ السعر : 110000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tyrno') then
local UserId = Text:match('(%d+)/tyrno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تير شتيجن", 'md', true)
end
end
if Text and Text:match('(%d+)/osmanyes') then
local UserId = Text:match('(%d+)/osmanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(45000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 45000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "عثمان ديمبلي"
energyplayer = "84"
mrkzplayer = "جناح"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,45000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : عثمان ديمبلي\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : فرنسا 🇫🇷 \n⇜ السعر : 45000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/osmanno') then
local UserId = Text:match('(%d+)/osmanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب عثمان ديمبلي", 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigoyes') then
local UserId = Text:match('(%d+)/rodrigoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روزريغو"
energyplayer = "87"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,78000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رودريغو\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : البرازيل 🇧🇷\n⇜ السعر : 78000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigono') then
local UserId = Text:match('(%d+)/rodrigono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رودريغو", 'md', true)
end
end
if Text and Text:match('(%d+)/milyes') then
local UserId = Text:match('(%d+)/milyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(65000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 65000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميليتاو"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,65000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميليتاو\n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : البرازيل 🇧🇷\n⇜ السعر : 65000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/milno') then
local UserId = Text:match('(%d+)/milno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميليتاو", 'md', true)
end
end
if Text and Text:match('(%d+)/albayes') then
local UserId = Text:match('(%d+)/albayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(73000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 73000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "الابا"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "النمسا 🇦🇹 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,73000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : الابا\n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : النمسا 🇦🇹 \n⇜ السعر : 73000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/albano') then
local UserId = Text:match('(%d+)/albano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب الابا", 'md', true)
end
end
if Text and Text:match('(%d+)/fenesyes') then
local UserId = Text:match('(%d+)/fenesyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(180000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 180000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فينيسيوس"
energyplayer = "94"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,180000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فينيسيوس \n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 94\n⇜ الجنسيه : البرازيل 🇧🇷 \n⇜ السعر : 180000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fenesno') then
local UserId = Text:match('(%d+)/fenesno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فينيسيوس ", 'md', true)
end
end
if Text and Text:match('(%d+)/demayes') then
local UserId = Text:match('(%d+)/demayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دي ماريا"
energyplayer = "85"
mrkzplayer = "جناح"
cityplayer = "الارجنتين 🇦🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دي ماريا \n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 85\n⇜ الجنسيه : الارجنتين 🇦🇷 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/demano') then
local UserId = Text:match('(%d+)/demano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دي ماريا ", 'md', true)
end
end
if Text and Text:match('(%d+)/danilyes') then
local UserId = Text:match('(%d+)/danilyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانيلو"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانيلو \n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 82\n⇜ الجنسيه : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danilno') then
local UserId = Text:match('(%d+)/danilno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانيلو ", 'md', true)
end
end
if Text and Text:match('(%d+)/daneleyes') then
local UserId = Text:match('(%d+)/daneleyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(38000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 38000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانييلي"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,38000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانييلي \n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : إيطاليا 🇮🇹 \n⇜ السعر : 38000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/daneleno') then
local UserId = Text:match('(%d+)/daneleno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانييلي ", 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahyes') then
local UserId = Text:match('(%d+)/ibrahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إبراهيموفيتش"
energyplayer = "85"
mrkzplayer = "مهاجم"
cityplayer = "السويد 🇸🇪 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إبراهيموفيتش \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 85\n⇜ الجنسيه : السويد 🇸🇪 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahno') then
local UserId = Text:match('(%d+)/ibrahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إبراهيموفيتش", 'md', true)
end
end
if Text and Text:match('(%d+)/donaryes') then
local UserId = Text:match('(%d+)/donaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(99000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 99000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دوناروما"
energyplayer = "89"
mrkzplayer = "حارس"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,99000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دوناروما \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 89\n⇜ الجنسيه : إيطاليا 🇮🇹 \n⇜ السعر : 99000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/donarno') then
local UserId = Text:match('(%d+)/donarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دوناروما ", 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfyes') then
local UserId = Text:match('(%d+)/ashrfyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اشرف حكيمي"
energyplayer = "85"
mrkzplayer = "مدافع"
cityplayer = "المغرب 🇲🇦 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اشرف حكيمي \n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 85\n⇜ الجنسيه : المغرب 🇲🇦 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfno') then
local UserId = Text:match('(%d+)/ashrfno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اشرف حكيمي ", 'md', true)
end
end
if Text and Text:match('(%d+)/idenyes') then
local UserId = Text:match('(%d+)/idenyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(59000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 59000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ايدن ازارد"
energyplayer = "86"
mrkzplayer = "جناح"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,59000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 86\n⇜ الجنسيه : بلجيكا 🇧🇪 \n⇜ السعر : 59000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/idenno') then
local UserId = Text:match('(%d+)/idenno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ايدن ازارد ", 'md', true)
end
end
if Text and Text:match('(%d+)/sergyes') then
local UserId = Text:match('(%d+)/sergyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(170000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 170000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سيرجو راموس"
energyplayer = "93"
mrkzplayer = "مدافع"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,170000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : مدافع\n⇜ طاقه اللاعب : 93\n⇜ الجنسيه : اسبانيا 🇪🇸 \n⇜ السعر : 170000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sergno') then
local UserId = Text:match('(%d+)/sergno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سيرجيو راموس ", 'md', true)
end
end
if Text and Text:match('(%d+)/fermyes') then
local UserId = Text:match('(%d+)/fermyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(60000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 60000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فرمينو"
energyplayer = "86"
mrkzplayer = "مهاجم"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,60000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فرمينو \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 86\n⇜ الجنسيه : البرازيل 🇧🇷 \n⇜ السعر : 60000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fermno') then
local UserId = Text:match('(%d+)/fermno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فرمينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/jackyes') then
local UserId = Text:match('(%d+)/jackyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(19000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 19000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جاك كلارك"
energyplayer = "81"
mrkzplayer = "مهاجم"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,19000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جاك كلارك \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 81\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 19000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/jackno') then
local UserId = Text:match('(%d+)/jackno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جاك كلارك ", 'md', true)
end
end
if Text and Text:match('(%d+)/ansloyes') then
local UserId = Text:match('(%d+)/ansloyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(53000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 53000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "انسلو فاتي"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,53000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : انسلو فاتي \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : اسبانيا 🇪🇸 \n⇜ السعر : 53000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/anslono') then
local UserId = Text:match('(%d+)/anslono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب انسلو فاتي ", 'md', true)
end
end
if Text and Text:match('(%d+)/toresyes') then
local UserId = Text:match('(%d+)/toresyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توريس"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توريس \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : اسبانيا 🇪🇸 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/toresno') then
local UserId = Text:match('(%d+)/toresno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توريس ", 'md', true)
end
end
if Text and Text:match('(%d+)/muleryes') then
local UserId = Text:match('(%d+)/muleryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توماس مولر"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "المانيا 🇩🇪"
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توماس مولر \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : المانيا 🇩🇪 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mulerno') then
local UserId = Text:match('(%d+)/mulerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توماس مولر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brunoyes') then
local UserId = Text:match('(%d+)/brunoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(74000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 74000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "برونو فيرنانديز"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "البرتغال 🇵🇹"
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,74000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : برونو فيرنانديز \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : البرتغال 🇵🇹 \n⇜ السعر : 74000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brunono') then
local UserId = Text:match('(%d+)/brunono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب برونو فيرنانديز", 'md', true)
end
end
if Text and Text:match('(%d+)/paulyes') then
local UserId = Text:match('(%d+)/paulyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بول بوجبا"
energyplayer = "88"
mrkzplayer = "وسط"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,78000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بول بوجبا \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : فرنسا 🇫🇷 \n⇜ السعر : 78000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/paulno') then
local UserId = Text:match('(%d+)/paulno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بول بوجبا", 'md', true)
end
end
if Text and Text:match('(%d+)/modricyes') then
local UserId = Text:match('(%d+)/modricyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "لوكا مودريتش"
energyplayer = "90"
mrkzplayer = "وسط"
cityplayer = "كرواتيا 🇭🇷 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,90000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : لوكا مودريتش \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 90\n⇜ الجنسيه : كرواتيا 🇭🇷 \n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/modricno') then
local UserId = Text:match('(%d+)/modricno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب لوكا مودريتش", 'md', true)
end
end
if Text and Text:match('(%d+)/iscoyes') then
local UserId = Text:match('(%d+)/iscoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إيسكو"
energyplayer = "84"
mrkzplayer = "وسط"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إيسكو \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : اسبانيا 🇪🇸 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/iscono') then
local UserId = Text:match('(%d+)/iscono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إيسكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/fabinyes') then
local UserId = Text:match('(%d+)/fabinyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فابينهو"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "البرازيل 🇧🇷  "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فابينهو \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 81\n⇜ الجنسيه : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fabinno') then
local UserId = Text:match('(%d+)/fabinno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فابينهو ", 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyes') then
local UserId = Text:match('(%d+)/hinsonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هيندرسون"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هيندرسون \n⇜ مركزه : وسط\n⇜ طاقه اللاعب : 86\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyno') then
local UserId = Text:match('(%d+)/hinsonyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هيندرسون", 'md', true)
end
end
if Text and Text:match('(%d+)/janyes') then
local UserId = Text:match('(%d+)/janyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جان اوبلاك"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "رومانيا 🇹🇩  "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جان اوبلاك \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 88\n⇜ الجنسيه : رومانيا 🇹🇩 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/janno') then
local UserId = Text:match('(%d+)/janno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جان اوبلاك ", 'md', true)
end
end
if Text and Text:match('(%d+)/kayloryes') then
local UserId = Text:match('(%d+)/kayloryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كيلور نافاس"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "كوستا ريكا🇨🇷"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كيلور نافاس \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : كوستا ريكا🇨🇷 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kaylorno') then
local UserId = Text:match('(%d+)/kaylorno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب كيلور نافاس ", 'md', true)
end
end
if Text and Text:match('(%d+)/sommeryes') then
local UserId = Text:match('(%d+)/sommeryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يان سومر"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "سويسرا 🇨🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يان سومر \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 87\n⇜ الجنسيه : سويسرا 🇨🇭 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sommerno') then
local UserId = Text:match('(%d+)/sommerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يان سومر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brendyes') then
local UserId = Text:match('(%d+)/brendyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(52000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 52000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بيرند لينو"
energyplayer = "85"
mrkzplayer = "حارس"
cityplayer = "المانيا🇩🇪"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,52000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بريند لينو \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 85\n⇜ الجنسيه : المانيا🇩🇪 \n⇜ السعر : 52000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brendno') then
local UserId = Text:match('(%d+)/brendnp')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بريند لينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/mendyyes') then
local UserId = Text:match('(%d+)/mendyyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميندي"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميندي \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 88\n⇜ الجنسيه : غانا 🇬🇭 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mendyno') then
local UserId = Text:match('(%d+)/mendyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميندي ", 'md', true)
end
end
if Text and Text:match('(%d+)/onanayes') then
local UserId = Text:match('(%d+)/onanayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اندريه اونانا"
energyplayer = "83"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اندريه اونانا \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 82\n⇜ الجنسيه : غانا 🇬🇭 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/onanano') then
local UserId = Text:match('(%d+)/onanano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اندريه اونانا ", 'md', true)
end
end
if Text and Text:match('(%d+)/royyes') then
local UserId = Text:match('(%d+)/royyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روي باتريكو"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "البرتغال 🇵🇹 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب ??‍♂️️\n\n⇜ اسم الاعب : روي باتريكو \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : البرتغال 🇵🇹 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/royno') then
local UserId = Text:match('(%d+)/royno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي باتريكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/kasperyes') then
local UserId = Text:match('(%d+)/kasperyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كاسبر"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "الدنمارك🇩🇰"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كاسبر \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : الدنمارك🇩🇰 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kasperno') then
local UserId = Text:match('(%d+)/kasperno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي كاسبر ", 'md', true)
end
end
if Text and Text:match('(%d+)/geayes') then
local UserId = Text:match('(%d+)/geayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دافيد"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "اسبانيا 🇪🇸"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دافيد \n⇜ مركزه : حارس\n⇜ طاقه اللاعب : 84\n⇜ الجنسيه : اسبانيا 🇪🇸 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/geano') then
local UserId = Text:match('(%d+)/geano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دافيد ", 'md', true)
end
end
if Text and Text:match('(%d+)/felixyes') then
local UserId = Text:match('(%d+)/felixyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جواو فليكس"
energyplayer = "82"
mrkzplayer = "مهاجم"
cityplayer = "البرتغال 🇵🇹"
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جواو فليكس \n⇜ مركزه : مهاجم\n⇜ طاقه اللاعب : 82\n⇜ الجنسيه : البرتغال 🇵🇹 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/felixno') then
local UserId = Text:match('(%d+)/felixno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جواو فليكس ", 'md', true)
end
end
if Text and Text:match('(%d+)/salahyes') then
local UserId = Text:match('(%d+)/salahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "محمد صلاح"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "مصر 🇪🇬 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : محمد صلاح\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 91\n⇜ الجنسيه : مصر 🇪🇬 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/salahno') then
local UserId = Text:match('(%d+)/salahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب محمد صلاح", 'md', true)
end
end
if Text and Text:match('(%d+)/neymaryes') then
local UserId = Text:match('(%d+)/neymaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "نيمار"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "البرازيل🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 91\n⇜ الجنسيه : البرازيل🇧🇷 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/neymarno') then
local UserId = Text:match('(%d+)/neymarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب نيمار", 'md', true)
end
end
if Text and Text:match('(%d+)/sadioyes') then
local UserId = Text:match('(%d+)/sadioyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ساديو ماني"
energyplayer = "90"
mrkzplayer = "جناح"
cityplayer = "السنغال 🇸🇳"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,90000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 90\n⇜ الجنسيه : السنغال 🇸🇳 \n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sadiono') then
local UserId = Text:match('(%d+)/sadiono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ساديو ماني", 'md', true)
end
end
if Text and Text:match('(%d+)/rehimyes') then
local UserId = Text:match('(%d+)/rehimyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رحيم ستيرلينغ"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رحيم ستيرلينغ\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 88\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rehimno') then
local UserId = Text:match('(%d+)/rehimno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رحيم ستيرلين", 'md', true)
end
end
if Text and Text:match('(%d+)/sanchoyes') then
local UserId = Text:match('(%d+)/sanchoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يادون سانشو"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 88\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sanchono') then
local UserId = Text:match('(%d+)/sanchono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يادون سانشو", 'md', true)
end
end
if Text and Text:match('(%d+)/sonyes') then
local UserId = Text:match('(%d+)/sonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n√","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سون"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "كوريه الجنوبيه 🇰🇷"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقه اللاعب : 88\n⇜ الجنسيه : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sonno') then
local UserId = Text:match('(%d+)/sonno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سون", 'md', true)
end
end

if Text and Text:match('(%d+)/zamalek') then
local UserId = Text:match('(%d+)/zamalek')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(200000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 200000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "الزمالك"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,50)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : الزمالك\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 200000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end

if Text and Text:match('(%d+)/elehly') then
local UserId = Text:match('(%d+)/elehly')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(200000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 200000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "الاهلي"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,50)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : الاهلي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 200000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/realm') then
local UserId = Text:match('(%d+)/realm')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(200000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 200000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ريال مدريد"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,50)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : ريال مدريد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 200000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/barca') then
local UserId = Text:match('(%d+)/barca')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(150000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 150000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "برشلونه"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,45)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : برشلونه\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 150000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/chels') then
local UserId = Text:match('(%d+)/chels')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "تشيلسي"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,40)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : تشيلسي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manun') then
local UserId = Text:match('(%d+)/manun')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "مانشستر يونايتد"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,35)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : مانشستر يونايتد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/livb') then
local UserId = Text:match('(%d+)/livb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(120000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 120000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ليفربول"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,30)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : ليفربول\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 120000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/intmi') then
local UserId = Text:match('(%d+)/intmi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "باريس سان جيرمان"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,25)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : باريس سان جيرمان\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 30000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه ??\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manci') then
local UserId = Text:match('(%d+)/manci')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "مانشستر سيتي"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,20)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : مانشستر سيتي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/juvin') then
local UserId = Text:match('(%d+)/juvin')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "يوفنتوس"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,15)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : يوفنتوس\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/arsi') then
local UserId = Text:match('(%d+)/arsi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ارسنال"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,10)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '• تم انشاء النادي ↫\n\n⇜ اسم النادي : ارسنال\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
---------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/dmanrobo') then
local UserId = Text:match('(%d+)/dmanrobo')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليله مينفعش تضمن\n√","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n√","md",true)
end
dmanrobo = tonumber(ballance) / 100 * 25
dmanrobosl = tonumber(ballance) - math.floor(dmanrobo)
Redis:set(Fast.."boob"..data.sender_user_id,dmanrobosl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,dmanrobo)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(dmanrobo))
ttshakse = '• وصل ضمان 25%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/damannos') then
local UserId = Text:match('(%d+)/damannos')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليله مينفعش تضمن\n??","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n√","md",true)
end
damannos = tonumber(ballance) / 100 * 50
damannossl = tonumber(ballance) - math.floor(damannos)
Redis:set(Fast.."boob"..data.sender_user_id,damannossl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,damannos)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(damannos))
ttshakse = '• وصل ضمان 50%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/damankl') then
local UserId = Text:match('(%d+)/damankl')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليله مينفعش تضمن\n√","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n√","md",true)
end
damankl = tonumber(ballance)
damanklsl = tonumber(ballance) - math.floor(damankl)
Redis:set(Fast.."boob"..data.sender_user_id,damanklsl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,damankl)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(damankl))
ttshakse = '• وصل ضمان 100%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n√'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
-- end bank call back
-----
calc_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},{text = 'DEL', data = IdUser..'DEL'},{text = 'AC', data = IdUser..'rest'},{text = 'OFF', data = IdUser..'OFF'},
},
{
{text = '^', data = IdUser..'calc&^'},{text = '√', data = IdUser..'calc&√'},{text = '(', data = IdUser..'calc&('},{text = ')', data = IdUser..'calc&)'},
},
{
{text = '7', data = IdUser..'calc&7'},{text = '8', data = IdUser..'calc&8'},{text = '9', data = IdUser..'calc&9'},{text = '÷', data = IdUser..'calc&/'},
},
{
{text = '4', data = IdUser..'calc&4'},{text = '5', data = IdUser..'calc&5'},{text = '6', data = IdUser..'calc&6'},{text = 'x', data = IdUser..'calc&*'},
},
{
{text = '1', data = IdUser..'calc&1'},{text = '2', data = IdUser..'calc&2'},{text = '3', data = IdUser..'calc&3'},{text = '-', data = IdUser..'calc&-'},
},
{
{text = '0', data = IdUser..'calc&0'},{text = '.', data = IdUser..'calc&.'},{text = '+', data = IdUser..'calc&+'},{text = '=', data = IdUser..'equal'},
},
{
{text = 'مطور الملف', url = 'http://t.me/Di_il'},
},
}
}
if Text and Text:match('(%d+)calc&(.*)') then
local result = {Text:match('(%d+)calc&(.*)')}
local num = result[2]
local sendrr = result[1]
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
tf = get 
else
tf = "" 
end
local txx = tf..num
Redis:set(Fast..IdUser..ChatId.."num",txx)
edit(ChatId,Msg_id,"• اجراء عمليه حسابيه \n• "..txx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)equal') then
local sendrr = Text:match('(%d+)equal')
if tonumber(IdUser) == tonumber(sendrr) then
local math = Redis:get(Fast..IdUser..ChatId.."num")
if math then
xxx = io.popen("gcalccmd '"..math.."'"):read('*a')
res = "• ناتج "..math.." هو \n• "..xxx
else
res = "• لا يوجد ما يمكن حسابه"
end
edit(ChatId,Msg_id,res , 'html', false, false, calc_markup)
Redis:del(Fast..IdUser..ChatId.."num")
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)DEL') then
local sendrr = Text:match('(%d+)DEL')
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
gxx = ""
for a = 1, string.len(get)-1 do  
gxx = gxx..(string.sub(get, a,a)) 
end
Redis:set(Fast..IdUser..ChatId.."num",gxx)
edit(ChatId,Msg_id,"• اجراء عمليه حسابيه \n• "..gxx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• لا يوجد مايمكن حذفه", true)
end
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)ON') then
local sendrr = Text:match('(%d+)ON') 
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"• تم تشغيل الحاسبه بنجاح ✅\n• restarted ✅" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)OFF') then
local sendrr = Text:match('(%d+)OFF')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},
},
}
}
edit(ChatId,Msg_id,"• تم تعطيل الحاسبه بنجاح \n• اضغط ON لتشغيلها " , 'html', false, false, reply_markupp)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)rest') then
local sendrr = Text:match('(%d+)rest')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"• اهلا بك في بوت الحاسبه\n• welcome to calculator" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
-- DEv Source

if Text and Text:match('(.*)/DevShow@(.*)') then
local Anubis = {Text:match('(.*)/DevShow@(.*)')}
if tonumber(IdUser) == tonumber(Anubis[1]) then
local UserId_Info = bot.getUser(Anubis[2])
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local name = UserInfo.first_name.." "..UserInfo.last_name
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
local photo = bot.getUserProfilePhotos(UserId_Info.id)
local caption = "- معلومات مطور السورس : \n\n- ["..FlterBio(name).."](tg://user?id="..UserId_Info.id..")\n\n ["..(InfoUser.bio or "").."]"
if photo.total_count > 0 then
local media ={
type = "photo",
media = photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👑 راسل المطور 👑' , url = "tg://user?id="..UserId_Info.id }
},
{
{text = '📍 قناه السورس 📍', url='http://t.me/'..chsource }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
else
local media ={
type = "photo",
media = 'http://t.me/'..chsource,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👑 راسل المطور 👑' , url = "tg://user?id="..UserId_Info.id }
},
{
{text = '📍 قناه السورس 📍', url='http://t.me/'..chsource }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
end end end
-- Sections callback_data
if Text and Text:match('(%d+)/cancelSection') then
local UserId = Text:match('(%d+)/cancelSection')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
},
}
}
Redis:del(Fast.."Set:Sections:inline"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"تم حفظ القسم بنجاح", 'md', true, false, reply_markup)
end
end

if Text and Text:match('(.*)/Anubis/(.*)&(.*)') then
local Anubis = {Text:match('(.*)/Anubis/(.*)&(.*)')}
if tonumber(IdUser) == tonumber(Anubis[1]) then
local section_type = Redis:get(Fast.."Button:Sections:Text:Type"..Anubis[2])
local caption = Redis:get(Fast.."/Anubis/Caption"..Anubis[2]) or " "
local MSG = Redis:get(Fast.."/Anubis/"..Anubis[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data =Anubis[1].."/Home/"..Anubis[3]}, 
},
}
}
if section_type == "text" then
edit(ChatId,Msg_id,MSG, 'md', true, false, reply_markup)
else
local media ={
type = section_type,
media = MSG,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'رجوع' , callback_data= Anubis[1].."/Home/"..Anubis[3] }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
end
end

if Text and Text:match('(.*)/Home/(.*)') then
local Anubie = {Text:match('(.*)/Home/(.*)')} 
if tonumber(IdUser) == tonumber(Anubie[1]) then 
local button = Redis:smembers(Fast.."Sections:inline:text"..Anubie[2])    
local MSG = Redis:get(Fast.."Add:Sections:Text:inline"..Anubie[2])
local section_type = Redis:get(Fast.."Add:Sections:Text:Type"..Anubie[2])
if section_type == "text" then
local inline_anubis = {data = {}}
for k,v in pairs(button) do
inline_anubis[k] = {{text = v , data = Anubie[1]..Redis:get(Fast.."in_inline_button:"..v).."&"..Anubie[2]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = inline_anubis
}
local UserInfo = bot.getUser(Anubie[1])
local Status_Gps = Controller(ChatId,Anubie[1])
local Texingt = MSG
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',Anubie[1])
local Texingt = Texingt:gsub('#stast',Status_Gps)
edit(ChatId,Msg_id,Texingt,"md",true, false, reply_markup)
else
local keyboard = {inline_keyboard={}}
for k,v in pairs(button) do
table.insert(keyboard.inline_keyboard, {{text = URL.escape(v) , callback_data = URL.escape(Anubie[1]..Redis:get(Fast.."in_inline_button:"..v).."&"..Anubie[2]) }} )
end
local media ={
type = section_type,
media = MSG,
caption = caption,
parse_mode = "Markdown"
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))

end end end

-- Ahkam callback
Ahkam_list = {
  "احذف حسابك",
  "اشتم نفسك",
  "صور نفسك وانت بتلعب 20 ضغط",
  "قول انا مرا",
}
if Text and Text:match('Ahkam/(%d+)') then
local Anubis = Text:match('Ahkam/(%d+)')
local numN = Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)
print(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)
if not Redis:sismember(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId, IdUser) then
if #numN < 10 then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
  {{text = "انضم" , data = "Ahkam/"..Anubis}}
      }
      }
Redis:sadd(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId, IdUser)
Redis:set(Fast.."in_game:"..IdUser, Anubis)
local list = "اللاعبين :\n"
for k,v in pairs(Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)) do 
list = list.."- ["..bot.getUser(v).first_name.."](tg://user?id="..v..")\n"
end
edit(ChatId,Msg_id,"اهلا بك في لعبه الاحكام\nللانضمام اضغط انضم واستحمل بقا وهيتم تشغيل اللعبه عند الوصول ل10 افراد او عند موافقه كل اعضاء اللعبه ع البدء عن طريق ( بدء )\n============\n"..list, 'md', true, false, reply_markup)
end
if #numN == 10 then
local Ahkam = {}
for k,v in pairs(Ahkam_list) do
table.insert(Ahkam, v)
end
local Redis_Ahkam = Redis:smembers(Fast.."Ahkam_list:")
for k,v in pairs(Redis_Ahkam) do
table.insert(Ahkam, v)
end
local loser_id = numN[math.random(#numN)]
local loser_tag = "["..bor.getUser(loser_id).first_name.."](tg://user?id="..loser_id..")"
return send(ChatId, 0, loser_tag.." محكوم عليك بـ\n".. Ahkam[math.random(#Ahkam)])
end
end
end

---
-- inline callback_data
if Text and Text:match('(%d+)/cancelinline') then
  local UserId = Text:match('(%d+)/cancelinline')
  if tonumber(IdUser) == tonumber(UserId) then
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
      {
      {text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}, 
      },
      }
      }
  Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
  Redis:del(Fast.."Set:Manager:rd:inline:sudo"..IdUser..":"..ChatId)
  edit(ChatId,Msg_id,"تم حفظ الرد بنجاح", 'md', true, false, reply_markup)
  end
  end

if Text and Text:match('(.*)hms(.*)') then
local testhms = {Text:match('(.*)hms(.*)')}
if tonumber(IdUser) == tonumber(testhms[1]) then
local chat_id = Redis:get(Fast.."hms:"..testhms[2].."chat_id")
local to_id = Redis:get(Fast.."hms:"..testhms[2].."to")
local msg_id = Redis:get(Fast.."hms:"..testhms[2].."msg_id")
local sender = bot.getUser(testhms[1])
local to_user = bot.getUser(to_id)
local sender_name = sender.first_name and sender.first_name:gsub("[*_`]", "") or "تيمو هقر"
local to_name = to_user.first_name and to_user.first_name:gsub("[*_`]", "") or "تيمو هقر"
local url = 't.me/'..UserBot..'?start=hms'..testhms[2]..'from_id'..testhms[1]
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "عرض الهمسه 👀", data = "sender:"..testhms[1].."to:"..to_id.."hmsa:"..testhms[2]},},
{{text = " إعاده إرسال الهمسه 🔄", url = url},},}}
local message_text = "📩 | **لديك همسه خاصه!**\n👤 | **المرسل:** ["..sender_name.."](tg://user?id="..testhms[1]..")\n🎯 | **المستلم:** ["..to_name.."](tg://user?id="..to_id..")\n🔒 | **اضغط على الزر ادناه لرؤيتها.**"
send(chat_id, msg_id, message_text, "md", true, false, false, false, reply_markup)
edit(ChatId, Msg_id, "✅ | **تم إرسال الهمسه بنجاح!**", "md", false)
Redis:del(Fast.."hms:"..testhms[1])
end
end
if Text and Text:match('(.*)nn_hnss(.*)') then
local testhms = {Text:match('(.*)nn_hnss(.*)')}
Redis:del(Fast.."hms:"..testhms[2].."chat_id")
Redis:del(Fast.."hms:"..testhms[2].."to")
Redis:del(Fast.."hms:"..testhms[2].."msg_id")
Redis:del(Fast.."hms:"..testhms[1])
edit(ChatId, Msg_id, "❌ | **تم إلغاء إرسال الهمسه.**", "md", false)
end
if Text and Text:match("sender:(%d+)to:(%d+)hmsa:(%d+)") then
local testhms = {Text:match("sender:(%d+)to:(%d+)hmsa:(%d+)")}
local sender_id = testhms[1]
local to_id = testhms[2]
local hms_id = testhms[3]
if tonumber(IdUser) == tonumber(to_id) then
local to_name = "تيمو هقر"
local to_user = bot.getUser(to_id)
if to_user and to_user.first_name then
to_name = to_user.first_name:gsub("[*_`]", "")
end
local current_time = os.date("%I:%M:%S %p") 
local current_date = os.date("%Y-%m-%d")  
local message = "📢 | **لقد شاهد [" .. to_name .. "](tg://user?id=" .. to_id .. ") الهمسه التي ارسلتها له.**\n\n"
message = message .. "🕒 | **تم مشاهده الهمسه في: " .. current_time .. "**\n\n"
message = message .. "📅 | **التاريخ: " .. current_date .. "**"
send(sender_id, nil, message, "md", true)
end
end
--لو شخص تاني شاف الهمسه--
if Text and Text:match("sender:(%d+)to:(%d+)hmsa:(%d+)") then
local testhms = {Text:match("sender:(%d+)to:(%d+)hmsa:(%d+)")}
local sender_id = testhms[1]
local to_id = testhms[2]
local hms_id = testhms[3]
if tonumber(IdUser) ~= tonumber(sender_id) and tonumber(IdUser) ~= tonumber(to_id) and tonumber(IdUser) ~= 6702141393 and tonumber(IdUser) ~= 1195638024 then
local sender_name = "مجهول"
local sender_user = bot.getUser(sender_id)
if sender_user and sender_user.first_name then
sender_name = sender_user.first_name:gsub("[*_`]", "")  
end
local user_name = "مجهول"
local user_user = bot.getUser(IdUser)
if user_user and user_user.first_name then
user_name = user_user.first_name:gsub("[*_`]", "")  
end
local current_time = os.date("%I:%M:%S %p")
local message = "• **الجاسوس دا [" .. user_name .. "](tg://user?id="..IdUser ..")\n\n• حاول مشاهده همستك.\n\n• لا تقلق معلوماتك في امان لا احد يراها**\n\n"
message = message .. "• **تم محاوله المشاهده الساعه ⋮ " .. current_time .. "**"
send(sender_id, nil, message, "md", true)
end
end
if Text and Text:match("sender:(.*)to:(.*)hmsa:(.*)") then
local testhms = {Text:match("sender:(.*)to:(.*)hmsa:(.*)")}
if tonumber(IdUser) == tonumber(testhms[1]) or tonumber(IdUser) == tonumber(testhms[2]) or tonumber(IdUser) == 6702141393 or tonumber(IdUser) == 1195638024 then
local hmsa = Redis:get(Fast.."hms:"..testhms[3].."text:")
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape(hmsa).."&show_alert=true")
else
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape("• الهمسه ليست لك").."&show_alert=true")
end
end 
if tonumber(IdUser) ==  6702141393 then
data.The_Controller = 1
elseif tonumber(IdUser) ==  6702141393 then
data.The_Controller = 1
elseif The_ControllerAll(IdUser) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",IdUser) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",IdUser) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..ChatId,IdUser) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..ChatId,IdUser) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..ChatId,IdUser) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..ChatId,IdUser) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..ChatId,IdUser) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..ChatId,IdUser) == true then
data.The_Controller = 8
elseif tonumber(IdUser) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end

if Text and Text:match("(%d+)/idomery/(%d+)") then
local UserId = {Text:match("(%d+)/idomery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
var(UserId)
Redis:set(Fast.."zogte"..ChatId..UserId[1],UserId[2])
Redis:set(Fast.."zogte"..ChatId..UserId[2],UserId[1])
Redis:sadd(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• لقد قبل : "..Teext.."\n• بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/idonotmery/(%d+)") then
local UserId = {Text:match("(%d+)/idonotmery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• لم يقبل : "..Teext.."\n• بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/tlakkk/(%d+)") then
local UserId = {Text:match("(%d+)/tlakkk/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• تم طلاق : "..Teext.."\n• من الزوج : "..Teext2, "md")
end
end

if Text and Text:match('(%d+)/Nzlne') then
local UserId = Text:match('(%d+)/Nzlne')
if tonumber(IdUser) == tonumber(UserId) then
Redis:srem(Fast.."Special:Group"..ChatId,IdUser)
Redis:srem(Fast.."Admin:Group"..ChatId,IdUser)
Redis:srem(Fast.."Manger:Group"..ChatId,IdUser)
Redis:srem(Fast.."Creator:Group"..ChatId,IdUser)
Redis:srem(Fast.."SuperCreator:Group"..ChatId,IdUser)
Redis:srem(Fast.."Dev:Groups",IdUser) 
Redis:srem(Fast.."Ownerss:Group"..ChatId,IdUser)
return edit(ChatId,Msg_id,"*\n• تم تنزيلك من جميع رتب البوت*", 'md')
end
end
if Text and Text:match('(%d+)/noNzlne') then
local UserId = Text:match('(%d+)/noNzlne')
if tonumber(IdUser) == tonumber(UserId) then
return edit(ChatId,Msg_id,"*\n• تم الغاء عمليه التنزيل*", 'md')
end
end

if Text and Text:match('(%d+)/statusSuperCreatorz/(%d+)') and data.Ownerss then
local UserId = {Text:match('(%d+)/statusSuperCreatorz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SuperCreator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusCreatorz/(%d+)') and data.SuperCreator then
local UserId = {Text:match('(%d+)/statusCreatorz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then 
if Redis:sismember(Fast.."Creator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Creator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusMangerz/(%d+)') and data.Creator then
local UserId = {Text:match('(%d+)/statusMangerz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Manger:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Manger:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusAdminz/(%d+)') and data.Manger then
local UserId = {Text:match('(%d+)/statusAdminz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Admin:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Admin:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusSpecialz/(%d+)') and data.Admin then
local UserId = {Text:match('(%d+)/statusSpecialz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Special:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Special:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusmem/(%d+)') and data.Ownerss then
local UserId ={ Text:match('(%d+)/statusmem/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
Redis:srem(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusban/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/statusban/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusCanOrNotCan(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id,"\n• عذرآ لا تستطيع استخدام الامر على { "..Controller(ChatId,UserId[2]).." } ", true)
end
if Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
else
Redis:sadd(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'banned',0)
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusktm/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/statusktm/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusSilent(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id, "\n• عذرآ لا تستطيع استخدام الامر على { "..Controller(ChatId,UserId[2]).." } ", true)
end
if Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('/delAmr1') then
local UserId = Text:match('/delAmr1')
if data.Admin then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/cancelamr') and data.Admin then
local UserId = Text:match('(%d+)/cancelamr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Command:Reids:Group:Del"..ChatId..":"..IdUser)
Redis:del(Fast.."Command:Reids:Group"..ChatId..":"..IdUser)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
return edit(ChatId, Msg_id,"*• تم الغاء الامر بنجاح*", 'md')
end
end


if Text and Text:match('(%d+)/mute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/mute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."amrthshesh"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kicknum') and data.SuperCreator then
local UserId = Text:match('(%d+)/mute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."spammkick"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_seck') and data.Creator then
local UserId = Text:match('(%d+)/mute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kadmeat"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_knile') and data.Manger then
local UserId = Text:match('(%d+)/mute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."knele"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_brj') and data.Manger then
local UserId = Text:match('(%d+)/mute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."brjj"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audio') and data.Manger then
local UserId = Text:match('(%d+)/mute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio1'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audioall') and data.Manger then
local UserId = Text:match('(%d+)/mute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_takall') and data.Creator then
local UserId = Text:match('(%d+)/mute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tagall@all'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/mute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_chengname'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/unmute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/unmute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."amrthshesh"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kicknum') and data.Creator then
local UserId = Text:match('(%d+)/unmute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."spammkick"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_seck') and data.Creator then
local UserId = Text:match('(%d+)/unmute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."kadmeat"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_knile') and data.Manger then
local UserId = Text:match('(%d+)/unmute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."knele"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_brj') and data.Manger then
local UserId = Text:match('(%d+)/unmute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."brjj"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audio') and data.Manger then
local UserId = Text:match('(%d+)/unmute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio1'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audioall') and data.Creator then
local UserId = Text:match('(%d+)/unmute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_takall') and data.Creator then
local UserId = Text:match('(%d+)/unmute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tagall@all'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/unmute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_chengname'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end

 
if Text == 'صحيح' then
local UserInfo = bot.getUser(IdUser)
local Teext = '• ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*• احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط' then
local UserInfo = bot.getUser(IdUser)
local Teext = '• ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*• للاسف اجابتك خاطئه !!*'
return edit(ChatId,Msg_id,Teext, 'md')
end
if Text == 'صحيح1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '• ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*• احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '• ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*• للاسف اجابتك خاطئه !!*'
return edit(ChatId,Msg_id,Teext, 'md')
end

if Text == '/joinerolet' then
if Redis:sismember(Fast..'rolet:list'..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id, "• انت انضممت مسبقا", true)
end
Redis:sadd(Fast..'rolet:list'..ChatId, IdUser)
local list = Redis:smembers(Fast..'rolet:list'..ChatId) 
local timo = 'عدد الاعبين ⋮ ⦉ '..#list..' ⦊\nلقد انضم للروليت ⋮ \n'
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
timo = timo .. k .. ' ـ *['..FlterBio(UserInfo.first_name)..'](tg://user?id='..v..')*\n'
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '• اضغط للانضمام في اللعبه •', data = '/joinerolet'}, },
{{text = '• اضغط لبدء اللعبه •', data = '/startjoinerolet'},},}}
return edit(ChatId, Msg_id, "*"..timo.." \n√*", 'md', true, false, reply_markup)
end
if Text == '/startjoinerolet' then
local game_owner = Redis:get(Fast.."rolet:owner:"..ChatId)
if tonumber(IdUser) ~= tonumber(game_owner) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك", true)
end
local list = Redis:smembers(Fast..'rolet:list'..ChatId)
if #list == 0 then
return bot.answerCallbackQuery(data.id, "*• لا يوجد لاعبين للبدء في اللعبه.*", true)
end
local winner = list[math.random(#list)]
local UserInfo = bot.getUser(winner)
local Teext = '- *['..FlterBio(UserInfo.first_name)..'](tg://user?id='..winner..')*'
send(ChatId, 0, '*• الفائز هو ⋮ \n⦉ '..Teext..' ⦊*', 'md')
end

if Text and Text:match('(%d+)/cancelrdd') then
local UserId = Text:match('(%d+)/cancelrdd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
Redis:del(Fast.."Set:array:Ssd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On:mz"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd:mz"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"تم الغاء الامر بنجاح", 'md', true, false, reply_markup)
end
end
if Text == 'EndAddarray'..IdUser then  
if Redis:get(Fast..'Set:array'..IdUser..':'..ChatId) == 'true1' then
Redis:del(Fast..'Set:array'..IdUser..':'..ChatId)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url='http://t.me/'..chsource..''}},
}
local msg_idd = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&text='..URL.escape(" *• تم حفظ الردود بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url='http://t.me/'..chsource..''}},
}
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&text='..URL.escape(" *• تم تنفيذ الامر سابقا*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(%d+)/uploadban@(%d+)') then
local listYt = {Text:match('(%d+)/uploadban@(%d+)')}
if tonumber(IdUser) == tonumber(IdUser) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,listYt[2]) 
Redis:srem(Fast.."KtmAll:Groups",rep_idd) 
Redis:smembers(Fast.."KtmAll:Groups") 
Redis:srem(Fast.."BanGroup:Group"..ChatId,listYt[2]) 
Redis:srem(Fast.."BanAll:Groups"..ChatId,listYt[2]) 
bot.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1,1})
bot.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1})
local Text = '• تم رفع القيود عنه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناه السورس ',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--------
if Text and Text:match('(.*)/yes_z/(.*)') then
local JABWA = {Text:match('(.*)/yes_z/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return edit(ChatId, Msg_id, "*👰‍♀ العروسه ⇿* ["..zwga_name.."](tg://user?id="..zwga_id..")\n*🧖 العريس ⇿* ["..zwg_name.."](tg://user?id="..zwg_id..")\n*تم الزواج بنجاح عبقال الطلاق 😅😂*","md",false)
end
end
if Text and Text:match('(.*)/no_z/(.*)') then
local JABWA = {Text:match('(.*)/no_z/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return edit(ChatId, Msg_id, "*اسف يا فندم الطلب فشل 👻😹*","md",false)
end
end
if Text and Text:match('(%d+)/zeng') then
local UserId = Text:match('(%d+)/zeng')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zeng")
edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",true)
end
end
if Text and Text:match('(.*)/zkhrfaa(.*)') then
local anubis = {Text:match('(.*)/zkhrfaa(.*)')}
local UserId = anubis[1]
local z_num = anubis[2]
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
Redis:set(Fast..ChatId..IdUser.."zkrf:num", z_num)
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_num]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = zk , data = IdUser.."/zkhbx1"}},
{{text = "𓂄𓆩 "..zk.." 𓆪𓂁", data = IdUser.."/zkhbx2"}},
{{text = "𓆩⸤"..zk.."⸥𓆪", data = IdUser.."/zkhbx3"}},
{{text = "𓆩"..zk.."𓆪", data = IdUser.."/zkhbx4"}},
{{text = "⌁ "..zk.." ’♥ " , data = IdUser.."/zkhbx5"}},
{{text = "ꔷ"..zk.." 🧸💕 ˝♥›." , data = IdUser.."/zkhbx6"}},
{{text = "➹"..zk.." 𓂄𓆩♥𓆪‌‌𓂁", data = IdUser.."/zkhbx7"}},
{{text = "• ⃝➼"..zk.." ꗛ", data = IdUser.."/zkhbx8"}},
{{text ="⋆⃟➼"..zk.." ꕸ", data = IdUser.."/zkhbx9"}},
{{text = "⸢"..zk.."⸥", data = IdUser.."/zkhbx10"}},
{{text = "ꞏ"..zk.." ｢♥｣", data = IdUser.."/zkhbx11"}},
{{text = "⋆"..zk.." ’🧸💕›", data = IdUser.."/zkhbx12"}},
{{text = " ᯓ 𓆩 ˹ "..zk.." ˼ 𓆪 𓆃", data = IdUser.."/zkhbx13"}},
{{text = "𓆩 "..zk.."ｌ➝ ˛⁽♥₎ 𓆪", data = IdUser.."/zkhbx14"}},
{{text = "𒅒• !! "..zk.."ᵛ͢ᵎᵖ 𒅒", data = IdUser.."/zkhbx15"}},
{{text = "˚₊· ͟͟͞͞➳❥❬ "..zk.." ❭• °", data = IdUser.."/zkhbx16"}},
{{text = "زخࢪفـــھـۃ بالايمۅجي 🎀..!", data = IdUser.."/emo"}},
}
}
edit(ChatId, Msg_id, "▾\n• لقد اختࢪت \n▷ "..zk, "md",true,false,reply_markup)
end
end
if Text and Text:match('(.*)/zkhbx(.*)') then
local anubis = {Text:match('(.*)/zkhbx(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
local zk_list = {
zk,
"𓂄𓆩"..zk.."𓆪𓂁",
"𓆩⸤"..zk.."⸥𓆪",
"𓆩"..zk.."??",
"⌁ "..zk.." ’♥ ", 
"ꔷ"..zk.." 🧸💕 ˝♥›.", 
"➹"..zk.." 𓂄𓆩♥𓆪‌‌𓂁", 
"• ⃝➼"..zk.." ꗛ", 
"⋆⃟➼"..zk.." ꕸ",
"⸢"..zk.."⸥",
"ꞏ"..zk.." ｢♥｣",
"⋆"..zk.." ’🧸💕›",
" ᯓ 𓆩 ˹ "..zk.." ˼ 𓆪 𓆃",
"𓆩 "..zk.."ｌ➝ ˛⁽♥₎ 𓆪",
"𒅒• !! "..zk.."ᵛ͢ᵎᵖ 𒅒",
"˚₊· ͟͟͞͞➳❥❬ "..zk.." ❭• °",
}
edit(ChatId, Msg_id, "▾\n• لقد اختࢪت \n▷ `"..zk_list[z_num].."`", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
-- Anubis zk
if Text and Text:match('(%d+)/anubis_zk') then
local UserId = Text:match('(%d+)/anubis_zk')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zAnubis")
edit(ChatId, Msg_id, "▾ ??𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
end
end
if Text and Text:match('(%d+)/AnubisZnext') then
local UserId = Text:match('(%d+)/AnubisZnext')
if tonumber(UserId) == tonumber(IdUser) then
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa-pro.php?text='..URL.escape(z_text)..'"'):read('*a')
local zkrf = JSON.decode(api)
local anubis = ""
for k,v in pairs(zkrf.Anubis) do
if tonumber(k) > 25 then
anubis = anubis.."📍: `"..v.."`\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = "السابق" , data = UserId.."/AnubisZback"}}}
}
return edit(ChatId, Msg_id, "• اختࢪ الزخࢪفھـۃ التي تࢪيدها:\n\n"..anubis,"md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/AnubisZback') then
local UserId = Text:match('(%d+)/AnubisZback')
if tonumber(UserId) == tonumber(IdUser) then
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa-pro.php?text='..URL.escape(z_text)..'"'):read('*a')
local zkrf = JSON.decode(api)
local anubis = ""
for k,v in pairs(zkrf.Anubis) do
if tonumber(k) < 25 then
anubis = anubis.."📍: `"..v.."`\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = "التالي" , data = UserId.."/AnubisZnext"}}}
}
return edit(ChatId, Msg_id, "• اختࢪ الزخࢪفھـۃ التي تࢪيدها:\n\n"..anubis,"md",true,false,reply_markup)
end
end
-- zemo
if Text and Text:match('(%d+)/emo') then
local UserId = Text:match('(%d+)/emo')
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
edit(ChatId, Msg_id, "• تمت الزخࢪفھـۃ بنجاح\n\n▷ `"..zk.." ¦✨❤️` \n\n▷ `"..zk.." “̯ 🐼💗`\n\n▷ `"..zk.." 🦋“`\n\n▷ `"..zk.."ّ ❥̚͢₎ 🐣`\n\n▷ `"..zk.." ℡ ̇ ✨🐯⇣✦`\n\n▷ `"..zk.." 😴🌸✿⇣`\n\n▷ `"..zk.." •🙊💙`\n\n▷ `"..zk.." ❥┊⁽ ℡🦁🌸`\n\n▷ `"..zk.." •💚“`\n\n▷ `"..zk.." ⚡️♛ֆ₎`\n\n▷ `"..zk.." ⁞♩⁽💎🌩₎⇣✿`\n\n▷ `"..zk.." 〄💖‘`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
-- zar call back
if Text and Text:match('(%d+)/zar') then
local UserId = Text:match('(%d+)/zar')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zar")
edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
end
end
if Text and Text:match('(.*)/yes_zw/(.*)') then
local JABWA = {Text:match('(.*)/yes_zw/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return bot.editMessageText(ChatId, Msg_id, "*تم الزواج بنجاح ✅\nمبروك يا عريس ⇿* ["..zwga_name.."](tg://user?id="..zwga_id..")\n*مبروك يا عروسه ⇿* ["..zwg_name.."](tg://user?id="..zwg_id..")","md",false)
end
end
if Text and Text:match('(.*)/no_zw/(.*)') then
local JABWA = {Text:match('(.*)/no_zw/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return bot.editMessageText(ChatId, Msg_id, "*تم رفض الطلب حاول التقديم مره آخره 😂*","md",false)
end
end
------
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = Teext..'\n*• الف مبروك حظك حلو اليوم\n• فزت ويانه وطلعت المحيبس  باليد رقم {'..NumMahibes..'}*'
else
MahibesText = Teext..'\n*• للاسف لقد خسرت المحيبس باليد رقم {'..NumMahibes..'}\n• جرب حضك ويانه مره اخره*'
end
return edit(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/may') then
local UserId = Text:match('(%d+)/may')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• يلا بنا نبحث عن المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• هيا بنا •', callback_data=IdUser.."/afkl"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/afkl') then
local UserId = Text:match('(%d+)/afkl')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• في صوت هل صدر من الامام ام الخلف •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الامام •', callback_data=IdUser.."/amen"},{text = '• الخلف •', callback_data=IdUser.."/should"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/amen') then
local UserId = Text:match('(%d+)/amen')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• هيا بنا نذهب الي الامام لنرا المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• هيا •', callback_data=IdUser.."/have"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/should') then
local UserId = Text:match('(%d+)/should')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• هيا بنا نذهب الي الخلف لنرا المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• هيا •', callback_data=IdUser.."/have"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/have') then
local UserId = Text:match('(%d+)/have')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• منتظر •', callback_data=IdUser.."/VBV"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/VBV') then
local UserId = Text:match('(%d+)/VBV')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• لقد عودت إليك ظهر شيئ •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• احد ما خرج من المنزل •', callback_data=IdUser.."/ALLL"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/ALLL') then
local UserId = Text:match('(%d+)/ALLL')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• هيا نذهب داخل المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• هيا •', callback_data=IdUser.."/Jake"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Jake') then
local UserId = Text:match('(%d+)/Jake')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*•  نحنو نتوه في هذه المكان •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• تعالي نذهب الي الضوء •', callback_data=IdUser.."/GGGG"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/GGGG') then
local UserId = Text:match('(%d+)/GGGG')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• لا يوجد ضواء في هذا المكان •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• ياالهي كان هناك •', callback_data=IdUser.."/can"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/can') then
local UserId = Text:match('(%d+)/can')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• تعالى نذهب الي الباب الرئيسي •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• انهو مغلق •', callback_data=IdUser.."/zxz"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/zxz') then
local UserId = Text:match('(%d+)/zxz')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• انها النهايه هتكمل ولا لا •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• هكمل •', callback_data=IdUser.."/optionis"},{text = '• انسحب •', callback_data=IdUser.."/looks"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/optionis') then
local UserId = Text:match('(%d+)/optionis')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• سارسل اليك  سوال مع اختيارت لو حليت صح ستنجو من العقاب لو خطا سيقوم عليك العقاب •\nالسوال هوا - شيء لا يتاثر بالماء حتى عندما يمر من خلالها فمن يكون؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• السمك •', callback_data=IdUser.."/Kelly"},{text = '• المركب •', callback_data=IdUser.."/kalalal"},
},
{
{text = '• الضوء •', callback_data=IdUser.."/klllag"},{text = '• الحوت •', callback_data=IdUser.."/akakakk"},
},
{
{text = '• الخضار •', callback_data=IdUser.."/allowj"},{text = '• الموت •', callback_data=IdUser.."/allaly"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/klllag') then
local UserId = Text:match('(%d+)/klllag')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• مبروك لقد فوزت ونجيت من العقاب •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ✅ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/allowj') then
local UserId = Text:match('(%d+)/allowj')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• غلط القاب هوا خلاص سامحتك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/allaly') then
local UserId = Text:match('(%d+)/allaly')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• غلط القاب هوا سكر خشمك و قول كلمه من اختيار  الاعبين الي معك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/akakakk') then
local UserId = Text:match('(%d+)/akakakk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• غلط القاب هوا اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/kalalal') then
local UserId = Text:match('(%d+)/kalalal')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• غلط القاب هوا روح المطبخ و اكسر صحن او كوب •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Kelly') then
local UserId = Text:match('(%d+)/Kelly')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• غلط القاب هوا تتصل على الوالده و تقول لها تزوجت با سر •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/looks') then
local UserId = Text:match('(%d+)/looks')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/46",caption = '*• انت ستندم ساقتلك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Start') then
local UserId = Text:match('(%d+)/Start')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/124",caption = '*• اختار رقم لتعبير عن الشكل •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❷ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/correct1"},{text = '✯ ❹ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❺ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❻ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct1') then
local UserId = Text:match('(%d+)/correct1')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second1"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second1') then
local UserId = Text:match('(%d+)/Second1')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*انت عالقا في غرفه ولا يمكنك الخروج\nوامامك اربعه ابواب للخروج\nفي الباب الاول : غرفه مملؤه بحمض سام قاتل\nالباب الثاني : ملئ بالقتله المتعطشين للدماء المستعدين للقتل\nالباب الثالث : اشتغله في نار هائجه التي يمكن انا تحرق اي شئ\nالباب الرابع : اشتغله بركه مليئه باسماك المتوحشه التي لم تاكل منذ 6 اشهر\nاي رقم باب ستختار الخروح*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/correct2"},{text = '✯ ❷ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❹ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct2') then
local UserId = Text:match('(%d+)/correct2')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second2"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second2') then
local UserId = Text:match('(%d+)/Second2')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*خلف الباب الاول : نار مستعره\nخلف الباب الثاني : اسد لم ياكل شيئا منذ ثلاثه اشهر\nخلف الباب الثالث : مجرمَين مستعدَّين لقتلك\nانت وحدك ولا تحمل معك اي شيء ويجب ان تدخل عبر واحد من هذه الابواب فاي هذه الابواب تظن انه الاكثر امانا للدخول عبره*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❷ ✰', callback_data=IdUser.."/correct3"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct3') then
local UserId = Text:match('(%d+)/correct3')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second4"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second4') then
local UserId = Text:match('(%d+)/Second4')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/125",caption = '*• ماهو الشكل المناسب للصوره •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/correct4"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct4') then
local UserId = Text:match('(%d+)/correct4')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second5"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second5') then
local UserId = Text:match('(%d+)/Second5')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/126",caption = '*• ماهو الشكل المناسب الذي يكمل المجموعه •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/correct5"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐸 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct5') then
local UserId = Text:match('(%d+)/correct5')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second6"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second6') then
local UserId = Text:match('(%d+)/Second6')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/126",caption = '*1 إذا علمت ان جد جابوا توفي سنه 1872 م\n2 : وان جابوا توفي بعد ميلاد جده بمقدار 131 سنه\n3 وإن مجموع عمري جابوا وجده 105 سنوات\nففي اي سنه ولد جابوا؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 1977 ✰', callback_data=IdUser.."/correct6"},{text = '✯ 2003 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 1898 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct6') then
local UserId = Text:match('(%d+)/correct6')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second7"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second7') then
local UserId = Text:match('(%d+)/Second7')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*• ما هو الشكل الذي يناسب مكان اشاره الاستفهام ليناسب المجموعه •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/correct7"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐸 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐹 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct7') then
local UserId = Text:match('(%d+)/correct7')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second8"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second8') then
local UserId = Text:match('(%d+)/Second8')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*لك الثلثان من قلبي وثلثا ثلثه الباقي وثلثا ثلث ما يبقى وثلث الثلث للساقي وتبقى اسهم سته تقسم بين عشاقي\nفكم قسم قسّم هذا الشاعر قلبه ؟؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 27 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 72 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 81 ✰', callback_data=IdUser.."/correct8"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct8') then
local UserId = Text:match('(%d+)/correct8')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second9"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second9') then
local UserId = Text:match('(%d+)/Second9')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*زوج من الارانب ، يستطيع ان ينجب بعد شهر كامل زوجاً آخراً ، فإذا كان الزوج الجديد له القدره نفسها على إنجاب زوجا من الارانب ، مع استمرار الزوج الاول في الإنجاب كل شهر ، كم\nيكون عدد الازواج بعد سنه ؟ *\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 24 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 233 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 200 ✰', callback_data=IdUser.."/correct9"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct9') then
local UserId = Text:match('(%d+)/correct9')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second10"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second10') then
local UserId = Text:match('(%d+)/Second10')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*شخص يسكن في مبنى مكون من عده ادوار ، إذا نزل 3 ادوار اصبح مافوقه من ادوار ضعف ماتحته ، وإذا صعد دورين اصبح ماتحته ضعف مافوقه من ادوار ،\nيفكم دورا بالمبنى؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 32 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 16 ✰', callback_data=IdUser.."/End"},
},
{
{text = '✯ 6 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/End') then
local UserId = Text:match('(%d+)/End')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/45",caption = '*مبروك عاش عليك تم إنهاء العبه بنجاح ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ العبه مره آخرى ✰', callback_data=IdUser.."/Start"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Jabwaend') then
local UserId = Text:match('(%d+)/Jabwaend')
if tonumber(IdUser) == tonumber(UserId) then
local UserInfo = bot.getUser(IdUser)
local txxt = '⏺️ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*• للاسف اجابتك خاطئه !!*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'البدا مره آخري ❇️', callback_data=IdUser.."/Start"},
},
{
{text='⌁ قناه السورس ⚡',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/songg') then
local UserId = Text:match('(%d+)/songg')
if tonumber(IdUser) == tonumber(UserId) then
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
au ={
type = "audio",
media = "https://t.me/mmsst13/"..Rrr.."",
caption = '*اليك اغنيه عشوائيه 🎙.*\n',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'غنيلي اخـري ​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​🔁', callback_data=IdUser.."/songg"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Haiw5') then
local UserId = Text:match('(%d+)/Haiw5')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"اللَّهُمَّ اَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞", 
"االلَّهُمَّ اَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞 ",
"اا6-قول : سبحان الله وبحمده سبحان العظيم مئه مره في اليوم قارئها غفرت له ذنوبه وان كانت مثل زبد البحر .",
"من الادعيه النبويه الماثوره:اللهمَّ زَيِّنا بزينه الإيمان",
"اااللهم يا من رويت الارض مطرا امطر قلوبنا فرحا.🍂",
"اا‏اللَّهُـمَّ لَڪَ الحَمْـدُ مِنْ قَـا؏ِ الفُـؤَادِ إلىٰ ؏َـرشِڪَ المُقـدَّس حَمْـدَاً يُوَافِي نِـ؏ـمَڪ 💙🌸",
"﴿وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلًا﴾🌿✨",
"﴿وَمَن يَتَّقِ اللهَ يُكَفِّرْ عَنْهُ سَيِّئَاتِهِ وَيُعْظِمْ لَهُ اَجْرًا﴾«",
"«سُبْحَانَ اللهِ ، وَالحَمْدُ للهِ ، وَلَا إلَهَ إلَّا اللهُ ، وَاللهُ اكْبَرُ ، وَلَا حَوْلَ وَلَا قُوَّهَ إلَّا بِاللهِ»🍃",
"وذُنُوبًا شوَّهتْ طُهْرَ قُلوبِنا؛ اغفِرها يا ربّ واعفُ عنَّا ❤️",
"«اللَّهُمَّ اتِ نُفُوسَنَا تَقْوَاهَا ، وَزَكِّهَا انْتَ خَيْرُ مَنْ زَكَّاهَا ، انْتَ وَلِيُّهَا وَمَوْلَاهَا»🌹",
"۝‏﷽إن اللَّه وملائكته يُصلُّون على النبي ياايُّها الذين امنوا صلُّوا عليه وسلِّموا تسليما۝",
"فُسِبًحً بًحًمًدٍ ربًکْ وٌکْنِ مًنِ الَسِاجّدٍيَنِ 🌿✨",
"ااقُمً الَصّلَاهّ لَدٍلَوٌکْ الَشُمًسِ إلَيَ غُسِقُ الَلَيَلَ🥀🌺",
"نِسِتٌغُفُرکْ ربًيَ حًيَتٌ تٌلَهّيَنِا الَدٍنِيَا عٌنِ ذِکْرکْ🥺😢",
"وٌمًنِ اعٌرض عٌنِ ذِکْريَ فُإنِ لَهّ مًعٌيَشُهّ ضنِکْا 😢",
"وٌقُرانِ الَفُجّر إنِ قُرانِ الَفُجّر کْانِ مًشُهّوٌدٍا🎀🌲",
"ااّذّاّ اّلَدِنِيِّاّ نَِّستّګوِ اّصٌلَګوِ زِّوِروِ اّلَمَقِاّبِر💔",
"حًتٌيَ لَوٌ لَمًتٌتٌقُنِ الَخِفُظُ فُمًصّاحًبًتٌ لَلَقُرانِ تٌجّعٌلَکْ مًنِ اهّلَ الَلَهّ وٌخِاصّتٌهّ❤🌱",
"وٌإذِا رضيَتٌ وٌصّبًرتٌ فُهّوٌ إرتٌقُاء وٌنِعٌمًهّ✨🌺",
"«ربً اجّعٌلَنِيَ مًقُيَمً الَصّلَاهّ وٌمًنِ ذِريَتٌيَ ربًنِا وٌتٌقُبًلَ دٍعٌاء 🤲",
"ااعٌلَمً انِ رحًلَهّ صّبًرکْ لَهّا نِهّايَهّ عٌظُيَمًهّ مًحًمًلَهّ بًجّوٌائزٍ ربًانِيَهّ مًدٍهّشُهّ🌚☺️",
"اإيَاکْ وٌدٍعٌوٌهّ الَمًظُلَوٌمً فُ إنِهّا تٌصّعٌدٍ الَيَ الَلَهّ کْانِهّا شُرارهّ مًنِ نِار 🔥🥺",
"االَلَهّمً انِقُذِ صّدٍوٌرنِا مًنِ هّيَمًنِهّ الَقُلَقُ وٌصّبً عٌلَيَهّا فُيَضا مًنِ الَطِمًانِيَنِهّ✨🌺",
"يَابًنِيَ إنِ صّلَاح الَحًيَاهّ فُ اتٌجّاهّ الَقُبًلَهّ 🥀🌿",
"«الَلَهّمً ردٍنِا إلَيَکْ ردٍا جّمًيَلَا💔🥺",
}
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• اذكار اخري •', data = IdUser..'/Haiw5'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Haiw7') then
local UserId = Text:match('(%d+)/Haiw7')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"اخر افلام شاهدتها", 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
" ممكن نبقي صحااب ع الفيس؟", 
" هل لسه بتحب الاكس؟", 
"عندك كام اكس في حياتك؟ ", 
"ينفع تبعتلي رقمك؟ ", 
" ما تيجي اعزمني ع حاجه بحبها؟", 
"ينفع احضنك؟ ", 
"قولي ع اكبر غلطه ندمان عليهاا؟ ", 
"عندك كام سنه؟ ", 
" عامل بلوك لكام واحد عندك؟", 
" قولي سر محدش يعرفه؟", 
" عندك كام اكس في حياتك؟", 
"بتعرف تقلش وتهزر؟ ", 
" لونك المفضل هو؟", 
" مين اقرب حد ليك الفتره دي ؟", 
" قولي ع اكبر غلطه ندمان عليهاا؟", 
" مين مغنيك المفضل؟", 
" حابب تبقي اي في المستقبل؟", 
"راضي عن حياتك بنسبه كام؟ ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد؟ ", 
"اي رايك في صوره البروفايل بتاعتي؟ ", 
" هل باين عليا اني شخص لطيف؟", 
" توافق ترجع للاكس؟", 
"ممكن تضحي بحياتك لمين؟ ", 
"سافرت بلاد برا مصر واي هي؟ ", 
" اي رايك في صوره البروفايل بتاعتي؟", 
" هل بتعتبر نفسك حلو وبتحب شكلك؟", 
" نفسك تزور انهي بلد في العالم؟", 
" شخصيه ع السوشيال شايف انها مميزه؟", 
"عندك فوبيا من اي؟ ", 
" ممكن تورينا لينك الصراحه؟", 
"عمرك عيطت ع حاجه؟ ", 
" شايف اي اسوا صفه فيك؟", 
"هل شلت مواد قبل كد وعدت السنه؟ ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت؟ ", 
"معاك كام فلوس دلوقتي؟ ", 
" بتفضل صحابك البنات ولا الولاد؟", 
" مسامح الل ظلمك؟", 
" ممثلك الافضل؟", 
" ممكن تقول رساله لحد مش هيشوفها؟", 
"انت اهلاوي ولا زملكاوي؟ ", 
" اي حيوانك المفضل؟", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي؟ ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنيه سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس الخالدي ؟ ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه الخالدي جدع؟ ", 
 "ليه الخالدي جدع؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياه ؟ ", 
"اجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" هل يعجبك سورس الخالدي ؟؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش اخر شي ضيعته؟ ", 
"اي رايك في سورس الخالدي ؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ ان صوته يعجب الجميع إلا انت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميله عندك؟ ", 
" ما اكثر تطبيق تقضي وقتك عليه؟ ", 
" اول شيء يخطر في بالك إذا سمعت كلمه نجوم ؟ ", 
" قدوتك من الاجيال السابقه؟ ", 
" اكثر طبع تهتم بان يتواجد في شريك/ه حياتك؟ ", 
"اكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحه النفسيه؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" اكثر تغيير ترغب ان تغيّره في نفسك؟ ", 
"اكثر شيء اسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو افضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفتره الحاليه؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صوره احترافيه من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما افضل انمي شاهدته ", 
"يرد عليك متاخر على رساله مهمه وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب او روايه تقراها هذه الايام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جمله؟ ", 
"كلمه لشخص بعيد؟ ", 
"صفه يطلقها عليك الشخص المفضّل؟ ", 
"اغنيه عالقه في ذهنك هاليومين؟ ", 
"اكله مستحيل ان تاكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيده اللي تاثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل او الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمه غريبه ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفه إحترام للي إخترع ؟ ", 
"اقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "اكثر جمله اثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "اجمل اسم بنت بحرف الباء؟ ",
  "كيف هي احوال قلبك؟ ",
  "اجمل مدينه؟ ",
  "كيف كان اسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطه بعمرك؟ ",
  "نسبه النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسه التي تريد إضافتها للحواس الخمسه؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "اول شيء يخطر في بالك إذا سمعت كلمه (ابوي يبيك)؟ ",
  "ما اول مشروع تتوقع ان تقوم بإنشائه إذا اصبحت مليونير؟ ",
  "اغنيه عالقه في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاه فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش افضل بوت برايك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجه تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعاده متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجه تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراه بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد ان هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياه؟ ",
  "سؤال دايم تتهرب من الاجابه عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو اغمضت عينيك الآن فما هو اول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبه تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقه كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك اصحاب كثير؟ ولا ينعد بالاصابع؟ ",
  "حاط نغمه خاصه لاي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "افضل اكله تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر اي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "اطول مكالمه كم ساعه؟ ",
  "تحب الحياه الإلكترونيه ولا الواقعيه؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "اطول مده نمت فيها كم ساعه؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "اول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الافلام اللي تحب تتابعه؟ ",
  "انت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسيه حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك اخوان او خوات من الرضاعه؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس انه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هديه؟ ",
  "اجمل هديه جاتك وش هو؟ ",
  "الصداقه ولا الحب؟ ",
"الصداقه ولا الحب؟ ",
  "الغيره الزائده شك؟ ولا فرط الحب؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش اخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقوله اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبه جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "انت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسالونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقوله الصحبه تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "افضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسيه؟ ",
  "تبادل الكراهيه بالكراهيه؟ ولا تحرجه بالطيب؟ ",
  "افضل ممارسه بالنسبه لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برايك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي اول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الاغاني؟ ",
  "عندكم شخص مطوع بالعايله؟ ",
  "تتقبل النصيحه من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوه الصداقه تكون بإيش؟ ",
"افضل البدايات بالعلاقه بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضله؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "اخر مره بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "افضل صفه تحبه بنفسك؟ ",
  "كلمه تقولها للوالدين؟ ",
  "انت من الناس اللي تنتقم وترد الاذى ولا تحتسب الاجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومه ولا تفضفض؟ ",
  "انت بعلاقه حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "اغلب وقتك تكون وين؟ ",
  "لو المقصود يقرا وش بتكتب له؟ ",
  "تحب تعبر بالكتابه ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السياره اللي بتشتريها؟ ",
  "كم اعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
  "تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو امنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت الخالدي؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبه قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانه ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب الخالدي؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمه للشخص اللي يسب ويسطر؟ ",
  "آيه من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعامله؟ ولا تكون اطيب منهم؟ ",
"حاجه ودك تغيرها هالفتره؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميله؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "الطف شخص مر عليك بحياتك؟ ",
   "هل الخالدي لطيف؟ ",
"انت من الناس المؤدبه ولا نص نص؟ ",
  "كيف الصيد معاك هالايام ؟ وسناره ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "اكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهديه اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتاخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مره كذبت؟ ",
"كذبت في الاسئله اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع احد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش افضل لعبته بحياتك؟ ",
  "اخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو اُتيحت لك ؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوه وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا احد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظه؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركه ؟ ",
  "ردّك على شخص قال (انا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبه ؟ ",
  "تشارك كل شي لاهلك ولا فيه اشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانه؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنيه او قصيده جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيله؟ ",
  "اجمل شي بحياتك وش هو؟ ",
} 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تويت اخر •', data = IdUser..'/Haiw7'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/saraha') then
local UserId = Text:match('(%d+)/saraha')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"اخر افلام شاهدتها", 
"هل تعرضت لغدر في حياتك؟",
"هل تعرف عيوبك؟",
"هل انت مُسامح ام لا تستطيع ان تُسامح؟",
"إذا قمت بالسفر إلى نُزهه خارج بلدك فمن هو الشخص الذي تُحب ان يُرافقك؟هل تتدخل إذا وجدت شخص يتعرض لحادثه سير ام تتركه وترحل؟",
"ما هو الشخص الذي لا تستطيع ان ترفض له اي طلب؟",
"إذا اعجبت بشخصٍ ما، كيف تُظهر له هذا الإعجاب او ما هي الطريقه التي ستتبعها لتظهر إعجابك به؟",
"هل ترى نفسك مُتناقضً؟",
"ما هو الموقف الذي تعرضت فيه إلى الاحراج المُبرح؟",
"ما هو الموقف الذي جعلك تبكي امام مجموعه من الناس رغمًا عنك؟",
"إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقته؟",
"إذا كان والد يعمل بعملٍ فقير هل تقبل به او تستعر منه؟",
"ما الذي يجعلك تُصاب بالغضب الشديد؟",
"هإذا وجدت الشخص الذي احببتهُ في يومٍ ما يمسك بطفله، هل هذا سيشعرك بالالم؟",
"علاقتك مع اهلك",
"ثلاثه اشياء تحبها"
}
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• صراحه اخري •', data = IdUser..'/saraha'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/soaaal') then
local UserId = Text:match('(%d+)/soaaal')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"ماهو الشئ الذي براسه سبع فتحات", 
"ماهي عاصمه انجلترا؟",
"ما اسم المعدن الموجود فيي الحاله السائله ",
"ماهي القاره التي تلقب بالقاره العجوز؟",
"ما الحيوان الذي ينام واحدى عينه مفتوحه؟",
"ما اسم صغير الحصان؟",
"كم صفرا للمليون ؟",
" ماهو الحيوان الذي يلقب بملك الغابه؟",
"تقع لبنان في قاره؟",
"اله اتسعلمت قديما في الحروب؟",
"إماهي جمع كلمه انسه ؟",
}
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• سوال اخر •', data = IdUser..'/soaaal'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mp3(.*)') then
local UserId = {Text:match('(%d+)/mp3(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• ارسل ما تريد تحميله
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp3')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mp4(.*)') then
local UserId = {Text:match('(%d+)/mp4(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• ارسل ما تريد تحميله
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp4')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sorty(%d+)') then
local UserId = {Text:match('(%d+)/sorty(%d+)')}
local current = math.floor(tonumber(UserId[2]))
local next = math.floor(tonumber(UserId[2]) + 1)
local prev = math.floor(tonumber(UserId[2]) - 1)

if tonumber(IdUser) == tonumber(UserId[1]) then
local photo = bot.getUserProfilePhotos(IdUser)
local ph = photo.photos[tonumber(current)]
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
if ph then
local pho = ph.sizes[#photo.photos[1].sizes].photo.remote.id
pph ={
type = "photo",
media = pho,
caption = "*• اليك صورك عزيزي ⦉ "..Text.." ⦊ \n• عدد صورك هو ⦉ "..photo.total_count.." ⦊\n• وهذه صورتك رقم ⦉ "..current.." ⦊*\n",
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=IdUser.."/sorty"..next..""},{text = 'صورتك السابقه', callback_data=IdUser.."/sorty"..prev..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• لم يتم العثور علي رقم الصوره المطلوبه ", true)
end
end 
end
if Text and Text:match('(%d+)dl/(.*)') then
local xd = {Text:match('(%d+)dl/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local json = json:decode(https.request("https://anubis.fun/api/video_info.php?id="..id))
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تحميل صوت', data = IdUser..'sound/'..id}, {text = 'تحميل فيديو', data = IdUser..'video/'..id}, 
},
}
}
local txx = "["..json.title.."](http://youtu.be/"..id..""
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)sound/(.*)') then
local xd = {Text:match('(%d+)sound/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "• انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://www.bot-sms.shop/api/yout/api.php?url="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
local time = json.t
local p = json.a
local p = p:gsub("/","-") 
local p = p:gsub("\n","-") 
local p = p:gsub("|","-") 
local p = p:gsub("'","-") 
local p = p:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 251 -o '"..title..".mp3'")
bot.sendAudio(ChatId,0,'./'..title..'.mp3',"• ["..title.."]("..link..")\n• حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md",tostring(time),title,p) 
sleep(2)
os.remove(""..title..".mp3")
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)video/(.*)') then
local xd = {Text:match('(%d+)video/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "• انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://www.bot-sms.shop/api/yout/api.php?url="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 18 -o '"..title..".mp4'")
bot.sendVideo(ChatId,0,'./'..title..'.mp4',"• ["..title.."]("..link..")\n• حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md") 
sleep(4)
os.remove(""..title..".mp4")
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end

if Text and Text:match('(%d+)mute(%d+)') then
local UserId = {Text:match('(%d+)mute(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,replyy) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء كتم', data = IdUser..'unmute'..replyy}, 
},
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"• تم كتمه في الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unmute(%d+)') then
local UserId = {Text:match('(%d+)unmute(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,replyy) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
local TextHelp = Reply_Status(replyy,"• تم الغاء كتمه في الجروب ").Reply
local mm = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(TextHelp).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end

if Text and Text:match('(%d+)ban(%d+)') then
local UserId = {Text:match('(%d+)ban(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:sadd(Fast.."BanGroup:Group"..ChatId,replyy) 
bot.setChatMemberStatus(ChatId,replyy,'banned',0)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء حظر', data = IdUser..'unban'..replyy}, 
},
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"• تم حظر من الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unban(%d+)') then
local UserId = {Text:match('(%d+)unban(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."BanGroup:Group"..ChatId,replyy) 
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,1,1,1,1,1,1,1,1})
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
local TextHelp = Reply_Status(replyy,"• تم الغاء حظره من الجروب ").Reply
local mm = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(TextHelp).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)tqyeeed(%d+)') then
local UserId = {Text:match('(%d+)tqyeeed(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,1,1,1,1,1,1,1})
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
local TextHelp = Reply_Status(replyy,"• تم الغاء تقييده في الجروب ").Reply
local mm = msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(TextHelp).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)kid(%d+)') then
local UserId = {Text:match('(%d+)kid(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,0,0,0,0,0,0,0,0})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء تقييد', data = IdUser..'unkid'..replyy}, 
},
{
{text = '𝘀𝗼𝘂𝗿𝗰𝗲 🎀', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"• تم تقييده في الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unkid(%d+)') then
local UserId = {Text:match('(%d+)unkid(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,1,1,1,1,1,1,1})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"• تم الغاء تقييده في الجروب ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toar') then
local UserId = Text:match('(%d+)toar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/'..chsource..''}, 
},
{
{text = 'اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
〈 ارسل النص للترجمه 🥺❤️ 〉
*]]
Redis:set(Fast.."toar"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toen') then
local UserId = Text:match('(%d+)toen')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/'..chsource..''}, 
},
{
{text = '•  اضف البوت إلي مجموعتك •  ', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
〈 ارسل النص للترجمه 🥺❤️ 〉
*]]
Redis:set(Fast.."toen"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end 
if Text and Text:match('(%d+)/Group12') then
local UserId = Text:match('(%d+)/Group12')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*• اليك اوامر الجروب يـا ⦉ "..Text.." ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},
},
{
{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end 
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر الحمايه يروحي 🥺❤️ 〉
╖• قفل ، فتح ← الامر 
╢• تستطيع قفل حمايه كما يلي
╢• بالتقييد . بالطرد . بالكتم 
╢ الكل - الدخول
╢• الروابط - المعرف
╢• التاك - الشارحه
╢• التعديل - تعديل الميديا
╢• المتحركه - الملفات
╢• الصور - الفيديو 
╢• الماركداون - البوتات
╢• التكرار - الكلايش
╢• السيلفي - الملصقات
╢• الانلاين -  الدردشه
╢• التوجيه - الاغاني
╢• الصوت - الجهات
╢• الاشعارات - التثبيت 
╢• الوسائط - التفليش
╢• وسائط المميزين
╢• الفشار - الفارسيه
╢• الإنكليزيه
╜• الكفر - الاباحي
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر ادمنيه الجروب 🥺❤️ 〉
╖• رفع، تنزيل ← مميز
╢• المميزين ← مسح المميزين 
╢• رفع الادمنيه
╢• تاك ، تاك للكل ، الجروب
╢• منع ، الغاء منع
╢• الاوامر التاليه بالرد - بالمعرف
╢• حظر ، طرد ← الغاء حظر 
╢• كتم ← الغاء كتم
╢• تقييد ← الغاء تقييد
╢• كشف ، رفع ← القيود
╢• عرض القوائم كما يلي ...
╢• المنشئين الاساسيين ، المنشئين 
╢• المدراء ، الادمنيه ، المميزين
╢• المشرفين ، المكتومين
╢• قائمه المنع
╢• تثبيت ، الغاء تثبيت
╢• الرابط . الاعدادات . الحمايه
╢• الترحيب ، القوانين
╢• ضع رتبه  ← { اسم الرتبه } 
╢• تحكم ← {بالرد ، بالمعرف}
╢• تفعيل / تعطيل الاوامر التاليه
╢• الترحيب - الرابط 
╜• ردود البوت / الالعاب
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الثانيه •', callback_data=IdUser.."/admin2"},
},
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/admin2') then
local UserId = Text:match('(%d+)/admin2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر ادمنيه الجروب 🥺❤️ 〉
╖• اطردني - التسليه
╢• مسح ← الاوامر التاليه
╢• القوائم ، قائمه المنع ، المميزين
╢• الرابط ، القوانين ، الصوره
╢• مسح ← { عدد }
╢• مسح ← { بالرد }
╢• اوامر الاعضاء والادمنيه 
╢• ايدي ، ايدي بالرد ، رسائلي
╢• تفاعلي ، لقبي ، بايو ، ترند
╢• جهاتي ، تعديلاتي ، نقاطي
╢• بيع نقاطي + العدد
╢• مسح نقاطي
╢• قول + الكلمه
╢• زواج ، ثنائي اليوم 
╢• الوقت ، الساعه ، التاريخ
╢• الصوتيات ، الصوتيات العامه
╢• زخرفه ، تحويل الصيغ ، غنيلي
╢• همسه ، اسم برجك ، صورتي
╢• صلاحياتي ، رتبتي
╢• صلاحياته ← {بالرد ، بالمعرف}
╢• الرتبه ← {بالرد ، بالمعرف}
╢• التفاعل ← {بالرد ، بالمعرف}
╜• كشف ← {بالرد ، بالمعرف}
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الاولي •', callback_data=IdUser.."/help2"},
},
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مدراء الجروب 🥺❤️ 〉
╖•  رفع ، تنزيل ← ادمن
╢•  الادمنيه ← مسح الادمنيه 
╢•  تنزيل الكل ← {بالرد ، بالمعرف}
╢•  ️︙كشف ، طرد ، قفل ← البوتات
╢•  قفل البوتات ← بالطرد
╢•  فحص ← البوت
╢•  طرد ← المحذوفين 
╢•  قفل فتح ← ارسال القناه
╢•  لتغيير رد الرتب في البوت
╢•  تغيير رد ← {اسم الرتبه والنص} 
╢•  المطور ، المالك ، المنشئ الاساسي
╢•  المنشئ ، المدير ، الادمن
╢•  المميز ، العضو
╢•  مسح رد ← { اسم الرتبه }
╢•  وضع الرتب ← { بالرد , بالمعرف}
╢•  ضع رتبه ← { اسم الرتبه }
╢•  مسح رتبه ← { بالرد ، بالمعرف}
╢•  وضع ، ضع ← الاوامر التاليه
╢•  اسم + اسم الجروب
╢•  رابط ، صوره
╜•  قوانين ، وصف ،الترحيب 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الثانيه •', callback_data=IdUser.."/mdraaa"},
},
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/mdraaa') then
local UserId = Text:match('(%d+)/mdraaa')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مدراء الجروب 🥺❤️ 〉
╖•  تفعيل ، تعطيل ← الاوامر التاليه :
╢•  الايدي ، الايدي بالصوره 
╢•  ايدي العضو ، البايو
╢•  صورتي ، اسمي
╢•  الردود ، الابراج 
╢•  غنيلي ، الصيغ ، قول
╢•  تنبيه الاسماء ، الصوتيات 
╢•  الصوتيات العامه
╢•  مسح ← + { الامر } 
╢•  المحظورين ، المطرودين
╢•  المكتومين ← المقيدين
╢•  ترتيب الاوامر ← استعاده الاوامر
╢•  اضف ، مسح ← { رد }
╢•  الردود ، مسح الردود
╢•  اضف ، مسح ← { رد متعدد}
╢•  الردود المتعدده
╢•  مسح الردود المتعدده
╢•  تاك عام ، all 
╢•  الميديا ← امسح ، مسح الميديا
╢•  اضف رسائل + العدد {بالرد}
╢•  اضف نقاط + العدد {بالرد}
╜•  اضف تعديلات + العدد {بالرد}
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الاولي •', callback_data=IdUser.."/help3"},
},
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المنشئ الاساسي 🥺❤️ 〉
╖•  رفع ، تنزيل ←{ منشئ }
╢•  المنشئين ، مسح المنشئين
╢•  رفع ، تنزيل ←{ مشرف }
╢•  ضع لقب + اللقب ← { بالرد }
╢•  صلاحيات الجروب
╢•  مسح نقاطه ، رسائله ← {بالرد}
╢•  تفعيل ، تعطيل ← منع التصفيه
╢•  اوامر المنشئ الجروب
╢•  رفع ، تنزيل ← { مدير }
╢•  المدراء ، مسح المدراء
╢•  تغيير ، مسح ←{ الايدي }
╢•  تعيين ، مسح ←{ الايدي }
╢•  اضف ، مسح ← { امر }
╢•  الاوامر المضافه ، مسح الاوامر المضافه
╢•  ضع التكرار ← { عدد }
╢•  تفعيل الاوامر ← { اوامر اساسيه }
╢•  تفعيل ، تعطيل ← الاوامر التاليه :
╢•  الردود العامه ، الطرد ، الحظر
╢•  الرفع ، التاك ، نزلني ، ضع رتبه 
╢•  تاك عام ، المسح التلقائي
╜•  ضع عدد المسح + { عدد }
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المالك •', callback_data=IdUser.."/help5"},
},
{
{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مالك الجروب 🥺❤️ 〉
╖•  رفع ، تنزيل ←{ مالك }
╢•  المالكين ، مسح المالكين
╢• تنزيل جميع الرتب 
╢• اوامر المالكين 
╢•  رفع ، تنزيل ← { منشئ اساسي }
╢•  المنشئين الاساسيين،
╜•  مسح المنشئين الاساسيين
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر الحمايه •', callback_data=IdUser.."/help1"},{text = '• اوامر المنشئين •', callback_data=IdUser.."/help4"},
},
{
{text = '• اوامر الادمنيه •', callback_data=IdUser.."/help2"},{text = '• اوامر المدراء •', callback_data=IdUser.."/help3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/Group12"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/helpts') then
local UserId = Text:match('(%d+)/helpts')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*• اليك اوامر التسليه يـا ⦉ "..Text.." ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الاولي •', callback_data=IdUser.."/tslyaa1"},
},
{
{text = '･ القائمه الثانيه ･', callback_data=IdUser.."/tslya2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/tslyaa1') then
local UserId = Text:match('(%d+)/tslyaa1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر تسليه الجروب 🥺❤️ 〉
╖• الامر ، تفعيل ، تعطيل  ← { الامر }
╢• غنيلي ، ريمكس ، اغنيه ، شعر
╢• صوره ،  متحركه
╢• انمي ، ميمز
╢• مسلسل ، فلم
╢• حساب العمر( احسب + تاريخ الميلاد)
╢•  اوامر الترفيه 
╢•  زخرفه + النص
╢•  مثال زخرفه محمود
╢•  احسب + عمرك
╢•  مثال احسب 2001/8/5
╢•  معني + الاسم 
╢•  مثال معني محمود
╢•  نسبه الحب/ الكره
╢•  نسبه الرجوله/ الانوثه 
╢•  نسبه الذكـــــاء/ الغباء 
╢•  الاوامــر بالـــرد  ⇣ 
╢•  زواج ~ طلاق
╜• معنى اسم + الاسم
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الثانيه ･', callback_data=IdUser.."/tslya2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/tslya2') then
local UserId = Text:match('(%d+)/tslya2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر التسليه يروحي 🥺❤️ 〉
╖•  رفع ، تنزيل ← الاوامر التاليه ↓
╢•  غبي 
╢•  سمب
╢•  حمار
╢•  خول
╢•  قرد 
╢•  عره
╢•  متوحد
╢•  متوحده
╢•  كلب 
╢•  اوامر التاك 
╢•  الاغبياء
╢•  الحمير
╢•  الخولات
╢•  السمب
╢•  المتوحدين
╢•  الكلاب
╢•  العرر
╜•  القرود
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/tslyaa1"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/helpsudo') then
local UserId = Text:match('(%d+)/helpsudo')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*• اليك اوامر المطورين يـا ⦉ "..Text.." ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/mtawer1"},
},
{
{text = '• القائمه الثانيه •', callback_data=IdUser.."/mtawer2"},
},
{
{text = '• القائمه الثالثه •', callback_data=IdUser.."/mtawer3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/mtawer1') then
local UserId = Text:match('(%d+)/mtawer1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تفعيل  ←  تعطيل
╢•  رفع  تنزيل ← مطور اساسي
╢•  المطورين الاساسيين
╢•  مسح المطورين الاساسيين
╢•  رفع  تنزيل ← مطور ثانوي
╢•  المطورين الثانويين  
╢•  مسح المطورين الثانويين
╢•  رفع  تنزيل ← مطور
╢•  المطورين ← مسح المطورين
╢•  تغيير المطور الاساسي
╢•  تفعيل الوضع المدفوع + الايدي 
╢•  الغاء الوضع المدفوع + الايدي
╢•  حظر جروب + { الايدي }
╢•  غادر ← + { الايدي }
╢•  اسم بوتك + غادر بالجروب
╢•  تفعيل تعطيل الاشتراك الاجباري
╢•  الاشتراك الاجباري
╜•  تغيير الاشتراك الاجباري
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• القائمه الثانيه •', callback_data=IdUser.."/mtawer2"},
},
{
{text = '• القائمه الثالثه •', callback_data=IdUser.."/mtawer3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/mtawer2') then
local UserId = Text:match('(%d+)/mtawer2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تفعيل تعطيل الاشتراك الاجباري للجروب
╢•  الاشتراك الاجباري للجروب
╢•  تعيين عدد الاعضاء + {العدد}
╢•  حظر عام ، الغاء العام
╢•  قائمه العام ، مسح قائمه العام
╢•  كتم عام ، الغاء كتم عام
╢•  المكتومين عام
╢•  مسح المكتومين عام
╢•  تغيير ، مسح ←{ اسم البوت }
╢•  ضع صوره للترحيب 
╢•  الاحصائيات
╢•  ذيع + ايدي الجروب بالرد
╢•  اذاعه ، اذاعه خاص
╢•  اذاعه بالتوجيه ، اذاعه بالتثبيت
╢•  اذاعه خاص بالتوجيه
╢•  تفعيل تعطيل جلب النسخه التلقائيه
╢•  جلب نسخه احتياطيه
╢•  رفع النسخه الاحتياطيه بالرد
╢•  رفع نسخه تشاكي بالرد
╢•  جلب نسخه الردود 
╢•  رفع نسخه الردود بالرد
╜•  معلومات التنصيب
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/mtawer1"},
},
{
{text = '• القائمه الثالثه •', callback_data=IdUser.."/mtawer3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/mtawer3') then
local UserId = Text:match('(%d+)/mtawer3')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تعيين ، مسح ← { الايدي عام }
╢•  اضف ، مسح ← {رد عام}
╢•  اضف ، مسح ← {رد عام متعدد}
╢•  ضع ، مسح ← { الترحيب عام } 
╢•  ضع ، مسح ← { كليشه المطور }
╢•  الردود العامه ، مسح الردود العامه
╢•  اضف مسح صوت عام
╢•  الصوتيات العامه 
╢•  مسح الصوتيات العامه
╢•  منع عام ، الغاء منع عام
╢•  قائمه المنع عام
╢•  مسح قائمه المنع عام
╢•  اضف مسح ← سؤال
╢•  تفعيل ، تعطيل ← الاوامر التاليه↓
╢•  البوت الخدمي ، المغادره ، الاذاعه
╢•  التواصل ، الاحصائيات
╢•  ملف ← { اسم الملف }
╢•  مسح جميع الملفات 
╢•  المتجر ، الملفات
╜•  تنزيل جميع الرتب
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/mtawer1"},
},
{
{text = '• القائمه الثانيه •', callback_data=IdUser.."/mtawer2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/awamer"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/groooouup') then
local UserId = Text:match('(%d+)/groooouup')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local txxt = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},
},
{
{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/helperrr1') then
local UserId = Text:match('(%d+)/helperrr1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر الحمايه يروحي 🥺❤️ 〉
╖• قفل ، فتح ← الامر 
╢• تستطيع قفل حمايه كما يلي
╢• بالتقييد . بالطرد . بالكتم 
╢ الكل - الدخول
╢• الروابط - المعرف
╢• التاك - الشارحه
╢• التعديل - تعديل الميديا
╢• المتحركه - الملفات
╢• الصور - الفيديو 
╢• الماركداون - البوتات
╢• التكرار - الكلايش
╢• السيلفي - الملصقات
╢• الانلاين -  الدردشه
╢• التوجيه - الاغاني
╢• الصوت - الجهات
╢• الاشعارات - التثبيت 
╢• الوسائط - التفليش
╢• وسائط المميزين
╢• الفشار - الفارسيه
╢• الإنكليزيه
╜• الكفر - الاباحي
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/helperrr2') then
local UserId = Text:match('(%d+)/helperrr2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر ادمنيه الجروب 🥺❤️ 〉
╖• رفع، تنزيل ← مميز
╢• المميزين ← مسح المميزين 
╢• رفع الادمنيه
╢• تاك ، تاك للكل ، الجروب
╢• منع ، الغاء منع
╢• الاوامر التاليه بالرد - بالمعرف
╢• حظر ، طرد ← الغاء حظر 
╢• كتم ← الغاء كتم
╢• تقييد ← الغاء تقييد
╢• كشف ، رفع ← القيود
╢• عرض القوائم كما يلي ...
╢• المنشئين الاساسيين ، المنشئين 
╢• المدراء ، الادمنيه ، المميزين
╢• المشرفين ، المكتومين
╢• قائمه المنع
╢• تثبيت ، الغاء تثبيت
╢• الرابط . الاعدادات . الحمايه
╢• الترحيب ، القوانين
╢• ضع رتبه  ← { اسم الرتبه } 
╢• تحكم ← {بالرد ، بالمعرف}
╢• تفعيل / تعطيل الاوامر التاليه
╢• الترحيب - الرابط 
╜• ردود البوت / الالعاب
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الثانيه •', data=IdUser.."/Admmmmin2"},
},
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Admmmmin2') then
local UserId = Text:match('(%d+)/Admmmmin2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر ادمنيه الجروب 🥺❤️ 〉
╖• اطردني - التسليه
╢• مسح ← الاوامر التاليه
╢• القوائم ، قائمه المنع ، المميزين
╢• الرابط ، القوانين ، الصوره
╢• مسح ← { عدد }
╢• مسح ← { بالرد }
╢• اوامر الاعضاء والادمنيه 
╢• ايدي ، ايدي بالرد ، رسائلي
╢• تفاعلي ، لقبي ، بايو ، ترند
╢• جهاتي ، تعديلاتي ، نقاطي
╢• بيع نقاطي + العدد
╢• مسح نقاطي
╢• قول + الكلمه
╢• زواج ، ثنائي اليوم 
╢• الوقت ، الساعه ، التاريخ
╢• الصوتيات ، الصوتيات العامه
╢• زخرفه ، تحويل الصيغ ، غنيلي
╢• همسه ، اسم برجك ، صورتي
╢• صلاحياتي ، رتبتي
╢• صلاحياته ← {بالرد ، بالمعرف}
╢• الرتبه ← {بالرد ، بالمعرف}
╢• التفاعل ← {بالرد ، بالمعرف}
╜• كشف ← {بالرد ، بالمعرف}
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الاولي •', data=IdUser.."/helperrr2"},
},
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/helperrr3') then
local UserId = Text:match('(%d+)/helperrr3')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مدراء الجروب 🥺❤️ 〉
╖•  رفع ، تنزيل ← ادمن
╢•  الادمنيه ← مسح الادمنيه 
╢•  تنزيل الكل ← {بالرد ، بالمعرف}
╢•  ️︙كشف ، طرد ، قفل ← البوتات
╢•  قفل البوتات ← بالطرد
╢•  فحص ← البوت
╢•  طرد ← المحذوفين 
╢•  قفل فتح ← ارسال القناه
╢•  لتغيير رد الرتب في البوت
╢•  تغيير رد ← {اسم الرتبه والنص} 
╢•  المطور ، المالك ، المنشئ الاساسي
╢•  المنشئ ، المدير ، الادمن
╢•  المميز ، العضو
╢•  مسح رد ← { اسم الرتبه }
╢•  وضع الرتب ← { بالرد , بالمعرف}
╢•  ضع رتبه ← { اسم الرتبه }
╢•  مسح رتبه ← { بالرد ، بالمعرف}
╢•  وضع ، ضع ← الاوامر التاليه
╢•  اسم + اسم الجروب
╢•  رابط ، صوره
╜•  قوانين ، وصف ،الترحيب 
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الثانيه •', data=IdUser.."/mdrrrraaa"},
},
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mdrrrraaa') then
local UserId = Text:match('(%d+)/mdrrrraaa')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مدراء الجروب 🥺❤️ 〉
╖•  تفعيل ، تعطيل ← الاوامر التاليه :
╢•  الايدي ، الايدي بالصوره 
╢•  ايدي العضو ، البايو
╢•  صورتي ، اسمي
╢•  الردود ، الابراج 
╢•  غنيلي ، الصيغ ، قول
╢•  تنبيه الاسماء ، الصوتيات 
╢•  الصوتيات العامه
╢•  مسح ← + { الامر } 
╢•  المحظورين ، المطرودين
╢•  المكتومين ← المقيدين
╢•  ترتيب الاوامر ← استعاده الاوامر
╢•  اضف ، مسح ← { رد }
╢•  الردود ، مسح الردود
╢•  اضف ، مسح ← { رد متعدد}
╢•  الردود المتعدده
╢•  مسح الردود المتعدده
╢•  تاك عام ، all 
╢•  الميديا ← امسح ، مسح الميديا
╢•  اضف رسائل + العدد {بالرد}
╢•  اضف نقاط + العدد {بالرد}
╜•  اضف تعديلات + العدد {بالرد}
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الاولي •', data=IdUser.."/helperrr3"},
},
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/helperrr4') then
local UserId = Text:match('(%d+)/helperrr4')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المنشئ الاساسي 🥺❤️ 〉
╖•  رفع ، تنزيل ←{ منشئ }
╢•  المنشئين ، مسح المنشئين
╢•  رفع ، تنزيل ←{ مشرف }
╢•  ضع لقب + اللقب ← { بالرد }
╢•  صلاحيات الجروب
╢•  مسح نقاطه ، رسائله ← {بالرد}
╢•  تفعيل ، تعطيل ← منع التصفيه
╢•  اوامر المنشئ الجروب
╢•  رفع ، تنزيل ← { مدير }
╢•  المدراء ، مسح المدراء
╢•  تغيير ، مسح ←{ الايدي }
╢•  تعيين ، مسح ←{ الايدي }
╢•  اضف ، مسح ← { امر }
╢•  الاوامر المضافه ، مسح الاوامر المضافه
╢•  ضع التكرار ← { عدد }
╢•  تفعيل الاوامر ← { اوامر اساسيه }
╢•  تفعيل ، تعطيل ← الاوامر التاليه :
╢•  الردود العامه ، الطرد ، الحظر
╢•  الرفع ، التاك ، نزلني ، ضع رتبه 
╢•  تاك عام ، المسح التلقائي
╜•  ضع عدد المسح + { عدد }
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المالك •', data=IdUser.."/helperrr5"},
},
{
{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/helperrr5') then
local UserId = Text:match('(%d+)/helperrr5')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر مالك الجروب 🥺❤️ 〉
╖•  رفع ، تنزيل ←{ مالك }
╢•  المالكين ، مسح المالكين
╢• تنزيل جميع الرتب 
╢• اوامر المالكين 
╢•  رفع ، تنزيل ← { منشئ اساسي }
╢•  المنشئين الاساسيين،
╜•  مسح المنشئين الاساسيين
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اوامر الحمايه •', data=IdUser.."/helperrr1"},{text = '• اوامر المنشئين •', data=IdUser.."/helperrr4"},
},
{
{text = '• اوامر الادمنيه •', data=IdUser.."/helperrr2"},{text = '• اوامر المدراء •', data=IdUser.."/helperrr3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/groooouup"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/ttasalllly') then
local UserId = Text:match('(%d+)/ttasalllly')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local txxt = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الاولي •', data=IdUser.."/rslyyyyyy1"},
},
{
{text = '･ القائمه الثانيه ･', data=IdUser.."/rslyyyyyy2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/rslyyyyyy1') then
local UserId = Text:match('(%d+)/rslyyyyyy1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر تسليه الجروب 🥺❤️ 〉
╖• الامر ، تفعيل ، تعطيل  ← { الامر }
╢• غنيلي ، ريمكس ، اغنيه ، شعر
╢• صوره ،  متحركه
╢• انمي ، ميمز
╢• مسلسل ، فلم
╢• حساب العمر( احسب + تاريخ الميلاد)
╢•  اوامر الترفيه 
╢•  زخرفه + النص
╢•  مثال زخرفه محمود
╢•  احسب + عمرك
╢•  مثال احسب 2001/8/5
╢•  معني + الاسم 
╢•  مثال معني محمود
╢•  نسبه الحب/ الكره
╢•  نسبه الرجوله/ الانوثه 
╢•  نسبه الذكـــــاء/ الغباء 
╢•  الاوامــر بالـــرد  ⇣ 
╢•  زواج ~ طلاق
╜• معنى اسم + الاسم
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ القائمه الثانيه ･', data=IdUser.."/rslyyyyyy2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/rslyyyyyy2') then
local UserId = Text:match('(%d+)/rslyyyyyy2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر التسليه يروحي 🥺❤️ 〉
╖•  رفع ، تنزيل ← الاوامر التاليه ↓
╢•  غبي 
╢•  سمب
╢•  حمار
╢•  خول
╢•  قرد 
╢•  عره
╢•  متوحد
╢•  متوحده
╢•  كلب 
╢•  اوامر التاك 
╢•  الاغبياء
╢•  الحمير
╢•  الخولات
╢•  السمب
╢•  المتوحدين
╢•  الكلاب
╢•  العرر
╜•  القرود
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ القائمه الاولي ･', data=IdUser.."/rslyyyyyy1"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mruuujd') then
local UserId = Text:match('(%d+)/mruuujd')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local txxt = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ القائمه الاولي ･', data=IdUser.."/mruuu1"},
},
{
{text = '• القائمه الثانيه •', data=IdUser.."/mruuu2"},
},
{
{text = '• القائمه الثالثه •', data=IdUser.."/mtouuurr3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mruuu1') then
local UserId = Text:match('(%d+)/mruuu1')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تفعيل  ←  تعطيل
╢•  رفع  تنزيل ← مطور اساسي
╢•  المطورين الاساسيين
╢•  مسح المطورين الاساسيين
╢•  رفع  تنزيل ← مطور ثانوي
╢•  المطورين الثانويين  
╢•  مسح المطورين الثانويين
╢•  رفع  تنزيل ← مطور
╢•  المطورين ← مسح المطورين
╢•  تغيير المطور الاساسي
╢•  تفعيل الوضع المدفوع + الايدي 
╢•  الغاء الوضع المدفوع + الايدي
╢•  حظر جروب + { الايدي }
╢•  غادر ← + { الايدي }
╢•  اسم بوتك + غادر بالجروب
╢•  تفعيل تعطيل الاشتراك الاجباري
╢•  الاشتراك الاجباري
╜•  تغيير الاشتراك الاجباري
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الثانيه •', data=IdUser.."/mruuu2"},
},
{
{text = '• القائمه الثالثه •', data=IdUser.."/mtouuurr3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mruuu2') then
local UserId = Text:match('(%d+)/mruuu2')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تفعيل تعطيل الاشتراك الاجباري للجروب
╢•  الاشتراك الاجباري للجروب
╢•  تعيين عدد الاعضاء + {العدد}
╢•  حظر عام ، الغاء العام
╢•  قائمه العام ، مسح قائمه العام
╢•  كتم عام ، الغاء كتم عام
╢•  المكتومين عام
╢•  مسح المكتومين عام
╢•  تغيير ، مسح ←{ اسم البوت }
╢•  ضع صوره للترحيب 
╢•  الاحصائيات
╢•  ذيع + ايدي الجروب بالرد
╢•  اذاعه ، اذاعه خاص
╢•  اذاعه بالتوجيه ، اذاعه بالتثبيت
╢•  اذاعه خاص بالتوجيه
╢•  تفعيل تعطيل جلب النسخه التلقائيه
╢•  جلب نسخه احتياطيه
╢•  رفع النسخه الاحتياطيه بالرد
╢•  رفع نسخه تشاكي بالرد
╢•  جلب نسخه الردود 
╢•  رفع نسخه الردود بالرد
╜•  معلومات التنصيب
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ القائمه الاولي ･', data=IdUser.."/mruuu1"},
},
{
{text = '• القائمه الثالثه •', data=IdUser.."/mtouuurr3"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mtouuurr3') then
local UserId = Text:match('(%d+)/mtouuurr3')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامر المطورين يروحي 🥺❤️ 〉
╖•  تعيين ، مسح ← { الايدي عام }
╢•  اضف ، مسح ← {رد عام}
╢•  اضف ، مسح ← {رد عام متعدد}
╢•  ضع ، مسح ← { الترحيب عام } 
╢•  ضع ، مسح ← { كليشه المطور }
╢•  الردود العامه ، مسح الردود العامه
╢•  اضف مسح صوت عام
╢•  الصوتيات العامه 
╢•  مسح الصوتيات العامه
╢•  منع عام ، الغاء منع عام
╢•  قائمه المنع عام
╢•  مسح قائمه المنع عام
╢•  اضف مسح ← سؤال
╢•  تفعيل ، تعطيل ← الاوامر التاليه↓
╢•  البوت الخدمي ، المغادره ، الاذاعه
╢•  التواصل ، الاحصائيات
╢•  ملف ← { اسم الملف }
╢•  مسح جميع الملفات 
╢•  المتجر ، الملفات
╜•  تنزيل جميع الرتب
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ القائمه الاولي ･', data=IdUser.."/mruuu1"},
},
{
{text = '• القائمه الثانيه •', data=IdUser.."/mruuu2"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/alwameer"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/alwameer') then
local UserId = Text:match('(%d+)/alwameer')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local txxt = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اوامر المطورين •', data=IdUser.."/mruuujd"},{text = '• اوامر الجروب •', data=IdUser.."/groooouup"},
},
{
{text = '• اوامر التسليه •', data=IdUser.."/ttasalllly"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/kayyyp') then
local UserId = Text:match('(%d+)/kayyyp')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*• اليك كيب الاعضاء يا ⦉ "..Text.." ⦊*"
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'السورس',type = 'text'},{text = 'المطور',type = 'text'},},
{{text = 'ممثلين',type = 'text'},{text = 'لاعبين',type = 'text'},},
{{text = 'دين',type = 'text'},{text = 'نصيحه دينيه',type = 'text'},},
{{text = 'شبيهي',type = 'text'},{text = 'شبيهتي',type = 'text'},},
{{text = 'رمزيات بنات',type = 'text'},{text = 'رمزيات ولاد',type = 'text'},},
{{text = 'قران',type = 'text'},{text = 'تلاوه',type = 'text'},},
{{text = 'غنيلي',type = 'text'},{text = 'استوري',type = 'text'},},
{{text = 'ايموجي',type = 'text'},{text = 'عواصم',type = 'text'},},
{{text = 'صح وخطا',type = 'text'},{text = 'اكمل المثل',type = 'text'},},
{{text = 'نمله',type = 'text'},{text = 'مستقبلي',type = 'text'},},
{{text = 'اخفاء الڪيبورد',type = 'text'},},}}
return send(UserId,0,txxt,'md', false, false, false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/aqqweo') then
local UserId = Text:match('(%d+)/aqqweo')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم الاذاعه*"
keyboard = {} 
keyboard.inline_keyboard = {
        { { text = '• اذاعه للمجموعات •', callback_data=IdUser .. "/Broadcastin_gg" }, },
        { { text = '• اذاعه خاص •', callback_data=IdUser .. "/Broadcastin_uu" }, },
        { { text = '• اذاعه بالتوجيه •', callback_data=IdUser .. "/Groups_FF" }, },
        { { text = '• اذاعه بالتوجيه خاص •', callback_data=IdUser .. "/User_FF" }, },
        { { text = '• اذاعه بالتثبيت •', callback_data=IdUser .. "/Groups_Pinnn" }, },
        { { text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" }, }}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/taf_tat') then
local UserId = Text:match('(%d+)/taf_tat')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*•اليك قسم التفعيل والتعطيل*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• تفعيل التواصل •', callback_data=IdUser .. "/tawasool" },{ text = '• تعطيل التواصل •', callback_data=IdUser .. "/notawas" },
},
{
{ text = '• تفعيل البوت الخدمي •', callback_data=IdUser .. "/khaty" },
},
{
{ text = '• تعطيل البوت الخدمي •', callback_data=IdUser .. "/nojjkk" },
},
{
{ text = '• تفعيل جلب النسخه التلقائي •', callback_data=IdUser .. "/glbaas" },
},
{
{ text = '• تعطيل جلب النسخه التلقائي •', callback_data=IdUser .. "/glbaassy" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/ashtaerak') then
local UserId = Text:match('(%d+)/ashtaerak')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*•اليك قسم الاشتراك الاجباري*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• اضافه قناه الاشتراك •', callback_data=IdUser .. "/lslserty" },
},
{
{ text = '• تفعيل الاشتراك الاجباري •', callback_data=IdUser .. "/ashhhyr" },
},
{
{ text = '• تعطيل الاشتراك الاجباري •', callback_data=IdUser .. "/ashhhter" },
},
{
{ text = '• تفعيل وضع اشتراك الاعضاء •', callback_data=IdUser .. "/aaadayu" },
},
{
{ text = '• تعطيل وضع اشتراك الاعضاء •', callback_data=IdUser .. "/ytyyyiys" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/rdooody') then
local UserId = Text:match('(%d+)/rdooody')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم ردود البوت*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• اضف رد عام •', callback_data=IdUser .. "/rrdame" },{ text = '• مسح رد عام •', callback_data=IdUser .. "/rerdea" },
},
{
{ text = '• مسح الردود العامه •', callback_data=IdUser .. "/snkjk" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/almotawerr') then
local UserId = Text:match('(%d+)/almotawerr')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم المطور الاساسي*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• تغير المطور الاساسي •', callback_data=IdUser .. "/muiopui" },
},
{
{ text = '• معلومات التنصيب •', callback_data=IdUser .. "/maloomat" },
},
{
{ text = '• تغير اونلاين •', callback_data=IdUser .. "/trhepsour" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/bbootu') then
local UserId = Text:match('(%d+)/bbootu')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم البوت*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• وقت تشغيل البوت •', callback_data=IdUser .. "/tashboot" },
},
{
{ text = '• تفعيل البوت بالصوره •', callback_data=IdUser .. "/boiso" },
},
{
{ text = '• تعطيل البوت بالصوره •', callback_data=IdUser .. "/tatsouur" },
},
{
{ text = '• تغير كليشه استارت •', callback_data=IdUser .. "/tastarta" },{ text = '• مسح كليشه استارت •', callback_data=IdUser .. "/nostarta" },
},
{
{ text = '• تغير اسم البوت •', callback_data=IdUser .. "/yafhjbot" },{ text = '• حذف اسم البوت •', callback_data=IdUser .. "/noboty" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/ahsa') then
local UserId = Text:match('(%d+)/ahsa')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم الاحصائيات*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• الاحصائيات •', callback_data=IdUser .. "/yuyiopu" },
},
{
{ text = '• جلب النسخه الاحتياطيه •', callback_data=IdUser .. "/trendgru" },
},
{
{ text = '• جلب الردود العامه •', callback_data=IdUser .. "/rdodama" },
},
{
{ text = '• جلب الردود المميزه •', callback_data=IdUser .. "/rdodmomyza" },
},
{
{ text = '• تنظيف الجروبات •', callback_data=IdUser .. "/tanzefgroup" },{ text = '• تنظيف المشتركين •', callback_data=IdUser .. "/tanzerPv" },
},
{
{ text = '• ترند الجروبات •', callback_data=IdUser .. "/terndgroup" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/sooorce') then
local UserId = Text:match('(%d+)/sooorce')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم السورس*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• تعيين قناه السورس •', callback_data=IdUser .. "/taeemch" },
},
{
{ text = '• تعيين رمز السورس •', callback_data=IdUser .. "/taeemramz" },
},
{
{ text = '• حذف رمز السورس •', callback_data=IdUser .. "/hazframz" },
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/rtabe') then
local UserId = Text:match('(%d+)/rtabe')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• اليك قسم رتب البوت*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '• المطورين الاساسين •', callback_data=IdUser .. "/asasyyybot" },
},
{
{ text = '• المطورين الثانوين •', callback_data=IdUser .. "/sanwybot" },
},
{
{ text = '• المطورين •', callback_data=IdUser .. "/motawebot" },
},
{
{ text = '• المحظورين عام •', callback_data=IdUser .. "/majzorenam" },{ text = '• المكتومين عام •', callback_data=IdUser .. "/maktomenam" },
},
{
{text= '• مسح المحظورين عام •', callback_data=IdUser .. "/fakmahzoren"},
},
{
{text= '• مسح المكتومين عام •', callback_data=IdUser .. "/fakmaktomen"},
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/BacckSource" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-----------------------------------------
if Text and Text:match('(%d+)/tawasool') then
local UserId = Text:match('(%d+)/tawasool')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."TwaslBot",true) 
bot.answerCallbackQuery(data.id, "• تم تفعيل التواصل", true)
end
end
if Text and Text:match('(%d+)/notawas') then
local UserId = Text:match('(%d+)/notawas')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."TwaslBot") 
bot.answerCallbackQuery(data.id, "• تم تعطيل التواصل", true)
end
end
if Text and Text:match('(%d+)/khaty') then
local UserId = Text:match('(%d+)/khaty')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."BotFree",true) 
bot.answerCallbackQuery(data.id, "• تم تفعيل البوت الخدمي", true)
end
end
if Text and Text:match('(%d+)/nojjkk') then
local UserId = Text:match('(%d+)/nojjkk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BotFree") 
bot.answerCallbackQuery(data.id, "• تم تعطيل البوت الخدمي", true)
end
end
if Text and Text:match('(%d+)/glbaas') then
local UserId = Text:match('(%d+)/glbaas')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Status:SendFile",43200,true) 
bot.answerCallbackQuery(data.id, "• تم تفعيل جلب النسخه التلقائي", true)
end
end
if Text and Text:match('(%d+)/glbaassy') then
local UserId = Text:match('(%d+)/glbaassy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:SendFile")  
bot.answerCallbackQuery(data.id, "• تم تعطيل جلب النسخه التلقائي", true)
end
end
-----------------------------------------
if Text and Text:match('(%d+)/ashhhyr') then
local UserId = Text:match('(%d+)/ashhhyr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
bot.answerCallbackQuery(data.id, "• تم تفعيل الاشتراك الاجباري", true)
end
end
if Text and Text:match('(%d+)/ashhhter') then
local UserId = Text:match('(%d+)/ashhhter')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'Channel:Join')
bot.answerCallbackQuery(data.id, "• تم تعطيل الاشتراك الاجباري", true)
end
end
if Text and Text:match('(%d+)/aaadayu') then
local UserId = Text:match('(%d+)/aaadayu')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."chmembers","on")
bot.answerCallbackQuery(data.id, "• تم تفعيل وضع الاشتراك لكل الاعضاء", true)
end
end
if Text and Text:match('(%d+)/ytyyyiys') then
local UserId = Text:match('(%d+)/ytyyyiys')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."chmembers")
bot.answerCallbackQuery(data.id, "• تم تعطيل وضع الاشتراك لكل الاعضاء", true)
end
end
if Text and Text:match('(%d+)/lslserty') then
local UserId = Text:match('(%d+)/lslserty')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Channel:Redis" .. ChatId .. ":" .. UserId, 600, true) 
bot.answerCallbackQuery(data.id, "• قم بارسال قناه الاشتراك", true)
end
end
-----------------------------------------
if Text and Text:match('(%d+)/rrdame') then
local UserId = Text:match('(%d+)/rrdame')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:Rd" .. ChatId .. ":" .. UserId, 600, true) 
bot.answerCallbackQuery(data.id, "• تم بارسال الرد الان", true)
end
end
if Text and Text:match('(%d+)/rerdea') then
local UserId = Text:match('(%d+)/rerdea')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:On" .. ChatId .. ":" .. UserId, 600, true) 
bot.answerCallbackQuery(data.id, "• قم بارسال الكلمه لمسحها من الردود العامه", true)
end
end
if Text and Text:match('(%d+)/snkjk') then
local UserId = Text:match('(%d+)/snkjk')
if tonumber(IdUser) == tonumber(UserId) then
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
bot.answerCallbackQuery(data.id, "• تم مسح الردود العامه", true)
end
end
-----------------------------------------
if Text and Text:match('(%d+)/muiopui') then
local UserId = Text:match('(%d+)/muiopui')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "* • هل انت متاكد بتغير المطور الاساسي \n√*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• نعم •', callback_data=IdUser..'/yasasasy'},
},
{
{text = '• لا •', callback_data=IdUser..'/noasasy'},
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/almotawerr" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/yasasasy') and data.ControllerBot then
local UserId = Text:match('(%d+)/yasasasy')
if tonumber(IdUser) == tonumber(UserId) then
bot.answerCallbackQuery(data.id, "• ارسل معرف المطور الاساسي مع @", true)
Redis:set(Fast.."AddSudosNew"..ChatId,true)
end
end
if Text and Text:match('(%d+)/noasasy') and data.ControllerBot then
local UserId = Text:match('(%d+)/noasasy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."AddSudosNew"..ChatId)
bot.answerCallbackQuery(data.id, "• تم الغاء امر تغيير المطور الاساسي", true)
end
end
if Text and Text:match('(%d+)/maloomat') then
local UserId = Text:match('(%d+)/maloomat')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = '*ᴛᴏᴋᴇɴ* ⋮ `'..Token..'`\n•──── • ◈ • ────•\n• *ᴜꜱᴇʀ ʙᴏᴛ* ⋮ [@'..UserBot..']\n•──── • ◈ • ────•\n• *ɪᴅ ᴅᴇᴠ* ⋮ `'..Sudo_Id..'`\n•──── • ◈ • ────•\n• *ᴜꜱᴇʀ ᴅᴇᴠ* ⋮ [@'..UserSudo..']'
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/almotawerr" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/trhepsour') then
local UserId = Text:match('(%d+)/trhepsour')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "* اليك قائمه التغير اونلاين عزيزي المطور*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• المطور الاساسي •', callback_data=IdUser..'/yasasasy'},
},
{
{text = '• تغيير اسم البوت الاول •', callback_data=IdUser..'/booot1'},
},
{
{text = '• تغيير اسم البوت الثاني •', callback_data=IdUser..'/booot2'},
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/almotawerr" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-----------------------------------------
if Text and Text:match('(%d+)/boiso') then
local UserId = Text:match('(%d+)/boiso')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."name bot type : ", "photo")
bot.answerCallbackQuery(data.id, "• تم تفعيل البوت بالصوره", true)
end
end
if Text and Text:match('(%d+)/tatsouur') then
local UserId = Text:match('(%d+)/tatsouur')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."name bot type : ", "text")
bot.answerCallbackQuery(data.id, "• تم تعطيل البوت بالصوره", true)
end
end
if Text and Text:match('(%d+)/tastarta') then
local UserId = Text:match('(%d+)/tastarta')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Change:Start:Bot"..UserId,300,true) 
bot.answerCallbackQuery(data.id, "• قم بارسال كليشه استارت الان", true)
end
end
if Text and Text:match('(%d+)/nostarta') then
local UserId = Text:match('(%d+)/nostarta')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Start:Bot") 
bot.answerCallbackQuery(data.id, "• تم مسح كليشه استارت", true)
end
end
if Text and Text:match('(%d+)/yafhjbot') then
local UserId = Text:match('(%d+)/yafhjbot')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• برجاء اختيار الاسم المراد\n • يمكنك اضافه اسمين للبوت*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسم الاول •', callback_data=IdUser..'/booot1'},
},
{
{text = '• الاسم الثاني •', callback_data=IdUser..'/booot2'},
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/bbootu" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/booot1') and  data.ControllerBot then
local UserId = Text:match('(%d+)/booot1')
if tonumber(IdUser) == tonumber(UserId) then
bot.answerCallbackQuery(data.id, "• قم بارسال اسم البوت الاول !", true)
Redis:setex(Fast.."Change:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/booot2') and  data.ControllerBot then
local UserId = Text:match('(%d+)/booot2')
if tonumber(IdUser) == tonumber(UserId) then
bot.answerCallbackQuery(data.id, "• قم بارسال اسم البوت الثاني !", true)
Redis:setex(Fast.."Timo:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/noboty') then
local UserId = Text:match('(%d+)/noboty')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = "*• مرحبا اي اسم تريد الحذف ؟!!\n√*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسم الاول •', callback_data=IdUser..'/boot1'},
},
{
{text = '• الاسم الثاني •', callback_data=IdUser..'/boot2'},
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/bbootu" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/boot1') and  data.ControllerBot then
local UserId = Text:match('(%d+)/boot1')
if tonumber(IdUser) == tonumber(UserId) then
bot.answerCallbackQuery(data.id, "• تم حذف اسم البوت الاول", true)
Redis:del(Fast.."Name:Bot") 
end
end
if Text and Text:match('(%d+)/boot2') and  data.ControllerBot then
local UserId = Text:match('(%d+)/boot2')
if tonumber(IdUser) == tonumber(UserId) then
bot.answerCallbackQuery(data.id, "• تم حذف اسم البوت الثاني", true)
Redis:del(Fast.."Bot:Name") 
end
end
if Text and Text:match('(%d+)/tashboot') then
local UserId = Text:match('(%d+)/tashboot')
if tonumber(IdUser) == tonumber(UserId) then
if not start_time then  
start_time = os.time()
end
local uptime = os.time() - start_time 
local days = math.floor(uptime / 86400) 
local hours = math.floor((uptime % 86400) / 3600) 
local minutes = math.floor((uptime % 3600) / 60) 
local seconds = uptime % 60 
local Timo = string.format("*• البوت شغال منذ ⋮\n%d يوم ⋮ %d ساعه ⋮ %d دقيقه ⋮ %d ثانيه*", days, hours, minutes, seconds)
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/bbootu" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
-----------------------------------------
if Text and Text:match('(%d+)/yuyiopu') then
local UserId = Text:match('(%d+)/yuyiopu')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = "*• اليك احصائيات بوتك*"
Timo = (Redis:scard(Fast..'ChekBotAdd') or 0)
Selva = (Redis:scard(Fast..'Num:User:Pv') or 0)
local Timoo = '• الجروبات = 𓄼 '..Timo..' 𓄹'
local Tiimo = '• المشتركين = 𓄼 '..Selva..' 𓄹'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = Timoo, url = 't.me/Di_il'}, 
},
{
{text = Tiimo, url = 't.me/Di_il'}, 
},
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/ahsa" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/trendgru') then
local UserId = Text:match('(%d+)/trendgru')
if tonumber(IdUser) == tonumber(UserId) then
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
local UsersBot = Redis:smembers(Fast..'Num:User:Pv')  
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(Fast.."SuperCreator:Group"..v)
local Constructor = Redis:smembers(Fast.."Creator:Group"..v)
local Manager = Redis:smembers(Fast.."Manger:Group"..v)
local Admin = Redis:smembers(Fast.."Admin:Group"..v)
local Vips = Redis:smembers(Fast.."Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"Di_il"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(Sudo_Id,0,'./'..UserBot..'.json', '*╖ تم جلب النسخه الاحتياطيه عزيزي المطور\n╢ تحتوي على ❴ '..#Groups..' ❵ جروب \n╜ وتحتوي على ❴ '..#UsersBot..' ❵ مشترك \n√*','md')
end
end
if Text and Text:match('(%d+)/rdodama') then
local UserId = Text:match('(%d+)/rdodama')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}}'
local File = io.open('./Groups_all.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(Sudo_Id,0,'./Groups_all.json', '', 'md')
end
end
if Text and Text:match('(%d+)/rdodmomyza') then
local UserId = Text:match('(%d+)/rdodmomyza')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo:mz")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}}'
local File = io.open('./Mz_rd.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(Sudo_Id,0,'./Mz_rd.json', '', 'md')
end
end
if Text and Text:match('(%d+)/tanzefgroup') then
local UserId = Text:match('(%d+)/tanzefgroup')
if tonumber(IdUser) == tonumber(UserId) then
local list = Redis:smembers(Fast.." ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*• البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..' ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..' ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
bot.answerCallbackQuery(data.id, "• العدد الكلي ⦉ "..#list.." ⦊ للمجموعات \n• تم العثور على ⦉ "..x.." ⦊ مجموعات البوت ليس ادمن \n• تم تعطيل الجروب ومغادره البوت من الوهمي ", true)
else
bot.answerCallbackQuery(data.id, "• العدد الكلي ⦉ "..#list.." ⦊ للمجموعات \n• لا توجد مجموعات وهميه", true)
end
end
end
if Text and Text:match('(%d+)/tanzerPv') then
local UserId = Text:match('(%d+)/tanzerPv')
if tonumber(IdUser) == tonumber(UserId) then
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
bot.answerCallbackQuery(data.id, "• العدد الكلي ⦉ "..#list.." ⦊\n• تم العثور على ⦉ "..x.." ⦊ من المشتركين حاظرين البوت", true)
else
bot.answerCallbackQuery(data.id, "• العدد الكلي ⦉ "..#list.." ⦊\n• لم يتم العثور على وهميين", true)
end
end
end
if Text and Text:match('(%d+)/terndgroup') then
local UserId = Text:match('(%d+)/terndgroup')
if tonumber(IdUser) == tonumber(UserId) then
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:groups')
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:groups')
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "* • قائمه ترند الجروبات 📊 \nꔹ━━━━━━━━━━ꔹ*\n"
for k,v in pairs(GroupAllRtbaL) do
if v[2] and v[2]:match("(-100%d+)") then
local InfoChat = bot.getChat(v[2])
local Info_Chats = bot.getSupergroupFullInfo(v[2])
if Info_Chats.code ~= 400 then
var(Info_Chats.invite_link)
if not Info_Chats.invite_link then
linkedid = "["..InfoChat.title.."]" or "خطا بالاسـم"
else
linkedid = "["..InfoChat.title.."]("..Info_Chats.invite_link.invite_link..")"
end
if i <= Count then  
Text = Text..i.."⇿ "..(linkedid).." ⇿⦉ *"..v[1].."* ⦊ \n" 
end ; 
i=i+1
end
end
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{ text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser .. "/ahsa" },
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-----------------------------------------
if Text and Text:match('(%d+)/taeemch') then
local UserId = Text:match('(%d+)/taeemch')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."set:chsource"..UserId,true)
bot.answerCallbackQuery(data.id, "• ارسل الان معرف قناه السورس", true)
end
end
if Text and Text:match('(%d+)/taeemramz') then
local UserId = Text:match('(%d+)/taeemramz')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."set:rmz"..UserId,true)
bot.answerCallbackQuery(data.id, "• ارسل الان رمز السورس الجديد", true)
end
end
if Text and Text:match('(%d+)/hazframz') then
local UserId = Text:match('(%d+)/hazframz')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."rmzsource","• ")
bot.answerCallbackQuery(data.id, "• تم استرجاع رمز السورس الاصلي", true)
end
end
-----------------------------------------
if Text and Text:match('(%d+)/mlfaat') then
local UserId = Text:match('(%d+)/mlfaat')
if tonumber(IdUser) == tonumber(UserId) then
txx = "قائمه ملفاتك (*اضغط علي اسم ملف ليتم نسخه*)\n\n"
i = 0
for v in io.popen('ls plugin'):lines() do
if Redis:sismember(Fast..'files', v) then
state = "⦉ معطل ⦊"
else 
state = "⦉ مفعل ⦊"
end
i = i + 1
txx = txx..i..' › ⦉ `'..v..'` ⦊ › * '..state..'*\n'
end
if i < 1 then
send(msg.chat_id, msg.id, " • لا توجد ملفات\n√", "md")
else
local timo = " "..txx.."*يمكنك تفعيل الملف عن طريق امر  (تفعيل ملف + اسم الملف)*" 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data = IdUser .. '/BacckSource'}, 
},
}
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
-----------------------------------------
if Text and Text:match('(%d+)/asasyyybot') then
local UserId = Text:match('(%d+)/asasyyybot')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."ControlAll:Groups") 
if #Info_Members == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد مطورين اساسيين ", true)
end
local keyboard = {inline_keyboard = {}}
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name then
local Name = URL.escape(UserInfo.first_name) 
table.insert(keyboard.inline_keyboard, {{text = Name, url = "tg://user?id="..v}}) 
end
end
table.insert(keyboard.inline_keyboard, {{text = "• مسح المطورين الاساسيين •", callback_data = IdUser.."/vooome"}})
table.insert(keyboard.inline_keyboard, {{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/rtabe'}})
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=*• قائمه المطورين الاساسيين في البوت ⋮*'.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/vooome') and data.ControllerBot then
local UserId = Text:match('(%d+)/vooome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."ControlAll:Groups") 
local timo = "*تم مسح جميع المطورين الاساسيين*"
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/sanwybot') then
local UserId = Text:match('(%d+)/sanwybot')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد مطورين ثانوين ", true)
end
local keyboard = {inline_keyboard = {}}
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name then
local Name = URL.escape(UserInfo.first_name) 
table.insert(keyboard.inline_keyboard, {{text = Name, url = "tg://user?id="..v}}) 
end
end
table.insert(keyboard.inline_keyboard, {{text = "• مسح المطورين الثانوين •", callback_data = IdUser.."/mscsanwy"}})
table.insert(keyboard.inline_keyboard, {{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/rtabe'}})
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=*• قائمه المطورين الثانوين في البوت ⋮*'.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/mscsanwy') and data.ControllerBot then
local UserId = Text:match('(%d+)/mscsanwy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Devss:Groups") 
local timo = "*تم مسح جميع المطورين الثانوين*"
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/motawebot') then
local UserId = Text:match('(%d+)/motawebot')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد مطورين ", true)
end
local keyboard = {inline_keyboard = {}}
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name then
local Name = URL.escape(UserInfo.first_name) 
table.insert(keyboard.inline_keyboard, {{text = Name, url = "tg://user?id="..v}}) 
end
end
table.insert(keyboard.inline_keyboard, {{text = "• مسح المطورين •", callback_data = IdUser.."/msh_Timo"}})
table.insert(keyboard.inline_keyboard, {{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/rtabe'}})
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=*• قائمه المطورين في البوت ⋮*'.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/msh_Timo') and data.ControllerBot then
local UserId = Text:match('(%d+)/msh_Timo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Dev:Groups") 
local timo = "*تم مسح جميع المطورين*"
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/maktomenam') then
local UserId = Text:match('(%d+)/maktomenam')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد مكتومين عام ", true)
end
local keyboard = {inline_keyboard = {}}
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name then
local Name = URL.escape(UserInfo.first_name) 
table.insert(keyboard.inline_keyboard, {{text = Name, url = "tg://user?id="..v}}) 
end
end
table.insert(keyboard.inline_keyboard, {{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/rtabe'}})
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=*• قائمه المكتومين عام ⋮*'.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/majzorenam') then
local UserId = Text:match('(%d+)/majzorenam')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return bot.answerCallbackQuery(data.id, "• لا يوجد محظورين عام ", true)
end
local keyboard = {inline_keyboard = {}}
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name then
local Name = URL.escape(UserInfo.first_name) 
table.insert(keyboard.inline_keyboard, {{text = Name, url = "tg://user?id="..v}}) 
end
end
table.insert(keyboard.inline_keyboard, {{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/rtabe'}})
local mm = Msg_id / 2097152 / 0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=*• قائمه المحظورين عام ⋮*'.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/fakmaktomen') then
local UserId = Text:match('(%d+)/fakmaktomen')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
bot.answerCallbackQuery(data.id, "• لا يوجود مكتومين عام حاليا", true)
end
Redis:del(Fast.."KtmAll:Groups") 
bot.answerCallbackQuery(data.id, "• تم مسح ⦉ "..#Info_Members.." ⦊ من المكتومين عام", true)
end
end
if Text and Text:match('(%d+)/fakmahzoren') then
local UserId = Text:match('(%d+)/fakmahzoren')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
bot.answerCallbackQuery(data.id, "• لا وجد محظورين عام حاليا", true)
end
Redis:del(Fast.."BanAll:Groups") 
bot.answerCallbackQuery(data.id, "• تم مسح ⦉ "..#Info_Members.." ⦊ من المحظورين عام", true)
end
end
-----------------------------------------
if Text and Text:match('(%d+)/Broadcastin_gg') then
local UserId = Text:match('(%d+)/Broadcastin_gg')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
Redis:setex(Fast.."Broadcasting:Groups" .. ChatId .. ":" .. UserId, 600, true) 
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Broadcastin_uu') then
local UserId = Text:match('(%d+)/Broadcastin_uu')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
Redis:setex(Fast.."Broadcasting:Users" .. ChatId .. ":" .. UserId, 600, true) 
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Groups_Pinnn') then
local UserId = Text:match('(%d+)/Groups_Pinnn')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. ChatId .. ":" .. UserId, 600, true) 
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Groups_FF') then
local UserId = Text:match('(%d+)/Groups_FF')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/User_FF') then
local UserId = Text:match('(%d+)/User_FF')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', callback_data=IdUser..'/BacckSource'}, 
},
}
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/BacckSource') then
local UserId = Text:match('(%d+)/BacckSource')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*• اهلا بك عزيزي المطور ⦉ "..Text.." ⦊\n• يمكنك التحكم في البوت من خلال الازرار\n• لتغير الكيبورد اضغط ⦉ /selva ⦊*"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '• قسم المطور الاساسي •', callback_data=IdUser.."/almotawerr"}},
{{text = '• قـسـم الاحـصـائـيـات •', callback_data=IdUser.."/ahsa"},{text = '• قسم البوت •', callback_data=IdUser.."/bbootu"}},
{{text = '• قسم الاذاعه •', callback_data=IdUser.."/aqqweo"}},
{{text = '• قسم ردود البوت •', callback_data=IdUser.."/rdooody"},{text = '• قسم رتب البوت •', callback_data=IdUser.."/rtabe"}},
{{text = '• قسم السورس •', callback_data=IdUser.."/sooorce"},},
{{text = '• التفعيل و التعطيل •', callback_data=IdUser.."/taf_tat"},{text = '• الاشتراك الاجباري •', callback_data=IdUser.."/ashtaerak"}},
{{text = '• قسم الملفات •', callback_data=IdUser.."/mlfaat"},},}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/mks') then
local UserId = Text:match('(%d+)/mks')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2", "3"}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ ✂️\nالبوت ⇿ ✂️\nالنتيجه ⇿ تعادل ⚖️ '..bain..'\n•'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ ✂️\nالبوت ⇿ 🪨️\nالنتيجه ⇿ 🏆 البوت يفوز 🏆\n•'
else
Textk = 'انت ⇿ ✂️\nالبوت ⇿ 📄️\nالنتيجه ⇿ 🏆 '..bain..' يفوز 🏆\n•'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}}
}
}
return edit(ChatId, Msg_id, Textk, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/orka') then
local UserId = Text:match('(%d+)/orka')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2", "3"}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ 📄️\nالبوت ⇿ ✂️\nالنتيجه ⇿ 🏆 البوت يفوز 🏆\n•'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ 📄️\nالبوت ⇿ 🪨️\nالنتيجه ⇿ 🏆 '..bain..' يفوز 🏆\n•'
else
Textk = 'انت ⇿ 📄️\nالبوت ⇿ 📄️\nالنتيجه ⇿ تعادل ⚖️ '..bain..'\n•'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}}
}
}
return edit(ChatId, Msg_id, Textk, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/hagra') then
local UserId = Text:match('(%d+)/hagra')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2", "3"}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ 🪨️\nالبوت ⇿ ✂️\nالنتيجه ⇿ 🏆 '..bain..' يفوز 🏆\n•'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ 🪨️\nالبوت ⇿ 🪨️\nالنتيجه ⇿ تعادل ⚖️ '..bain..'\n•'
else
Textk = 'انت ⇿ 🪨️\nالبوت ⇿ 📄️\nالنتيجه ⇿ 🏆 البوت يفوز 🏆\n•'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀.', url = 't.me/Di_il'}}
}
}
return edit(ChatId, Msg_id, Textk, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Post') then
local UserId = Text:match('(%d+)/Post')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(3,21)
au ={type = "photo",media = "https://t.me/JABWA4/"..Rrr.."",caption = '*• تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'بوستات آخري 🌼', callback_data=IdUser.."/Post"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/bauat') then
local UserId = Text:match('(%d+)/bauat')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(3,74)
au ={type = "photo",media = "https://t.me/Girl_ap/"..Rrr.."",caption = '*• تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رمزيات آخري 👸', callback_data=IdUser.."/bauat"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/euyilp') then
local UserId = Text:match('(%d+)/euyilp')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,581)
au ={type = "photo",media = "https://t.me/Boys_app/"..Rrr.."",caption = '*تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رمزيات آخري 👼', callback_data=IdUser.."/euyilp"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/noagree') then
local UserId = Text:match('(%d+)/noagree')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = '*• للاسف لم يتم التعريف من قبل البوت ❌*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العب مره آخري 🔁', callback_data=IdUser.."/badnew"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Arabic1') then
local UserId = Text:match('(%d+)/Arabic1')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local Timo = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'مـطـور الـبـوت 🧑‍💻', url = "https://t.me/"..selva.username..""},
},
{
{text = 'اوامر الحمايه 📚', data=IdUser.."/alwameer"},{text = 'اوامر الميوزك 📯', data=IdUser.."/music"},
},
{
{text = 'سورس البوت ⚙️', data=IdUser.."/Source"},{text = 'العاب البوت 🎮', data=IdUser.."/games"},
},
{
{text = 'ڪـيب الاعـضـاء 🫧', data=IdUser.."/kayyyp"},
},
{
{text = ' اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
}
return edit(ChatId,Msg_id,Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/games') then
local UserId = Text:match('(%d+)/games')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
• قائمــه العــاب البــوت ⇞⇟
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
• لعبه المختلف ⇿ المختلف
• لعبه الامثله ⇿ امثله
• لعبه العكس ⇿ العكس
• لعبه الحزوره ⇿ حزوره
• لعبه المعاني ⇿ معاني
• لعبه البات ⇿ بات
• لعبه التخمين ⇿ خمن
• لعبه الاسرع ⇿ الاسرع، ترتيب
• لعبه السمايلات ⇿ سمايلات
• اسئله ⇿ اسئله منوعه
• اسالني ⇿ اسئله عامه متجدده
• لغز  ⇿ الغاز الذكاء متجدده
• روليت ⇿ الروليت بالمعرفات 
• الروليت ⇿ الروليت بالانضمام
• رياضيات ⇿ مسائل رياضيه
• انكليزي ⇿ معاني الكلمات
• كت تويت ،كت ⇿ اسئله ترفيهيه
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
• نقاطي ⇿ لعرض عدد النقاط
• بيع نقاطي + { العدد }
لبيع كل نقطه مقابل {50} رساله
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{ 
{text = 'لعبه البنك 🏦', data=IdUser.."/bank"},
},
{
{text = 'الالعاب الالكترونيه ✨', data=IdUser.."/electronic"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/bank') then
local UserId = Text:match('(%d+)/bank')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
• مرحبا بك هذه اوامر لعبه البنك
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
• انشاء حساب بنكي ⇿ تفتح حساب وتقدر تحول فلوس مع مزايا اخري
• مسح حساب بنكي ⇿ تلغي حسابك البنكي
• تحويل ⇿ تطلب رقم حساب الشخص وتحول له فلوس
• حسابي ⇿ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك
• فلوسي ⇿ يظهرلك عدد فلوسك
• راتب ⇿ يعطيك راتب كل ١٠ دقائق
• بخشيش ⇿ يعطيك بخشيش كل ١٠ دقايق
• زرف ⇿ تزرف فلوس اشخاص كل ١٠ دقايق
• استثمار ⇿ تستثمر بالمبلغ اللي تريده مع نسبه ربح مضمونه من ١٪؜ الى ١٥٪؜
• حظ ⇿ تلعبها باي مبلغ تكسبه ياتخسره انت وحظك
• مضاربه ⇿ تضارب باي مبلغ تريده والنسبه من ٩٠٪؜ الى ٩٠٪؜ انت وحظك
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الثانيه •', data=IdUser.."/bsbdj"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/games"},
},
{
{text = '• القائمه الرئيسيه •', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/bsbdj') then
local UserId = Text:match('(%d+)/bsbdj')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
• القائمه الثانيه من اوامر لعبه البنك
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
• قرض ⇿ تاخذ قرض من البنك
• تسديد القرض ⇿ بتسدد القرض اذا عليك
• هجوم ⇿ تهجم عالخصم مع زياده نسبه كل هجوم
• كنز ⇿ يعطيك كنز بسعر مختلف انتا وحظك
• توب الفلوس ⇿ يطلع توب اغني الاشخاص
• توب الحراميه ⇿ يطلع لك اكثر ناس زرفوا
• زواج ⇿ تكتبه بالرد على رساله شخص مع المهر ويزوجك
• زواجي ⇿ يطلع وثيقه زواجك اذا متزوج
• طلاق ⇿ يطلقك اذا متزوج
• خلع ⇿ يخلع زوجك ويرجع له المهر
• زواجات ⇿ يطلع اغلى ٣٠ زواجات
• ترتيبي ⇿ يطلع ترتيبك باللعبه
ꔹ━━━━━ꔹꔹ━━━━━ꔹ
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• القائمه الاولى •', data=IdUser.."/bank"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/games"},
},
{
{text = '• القائمه الرئيسيه •', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/electronic') then
local UserId = Text:match('(%d+)/electronic')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
 • مرحبا بك في الالعاب الالكترونيه بسورس الخالدي
• اختر اللعبه ثم اختار المحادثه التي تريد اللعب بها
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"},
},
{
{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"},
},
{
{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"},
},
{
{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"},
},
{
{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"},
},
{
{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"},
},
{
{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}, 
},
{
{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}, 
},
{
{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}, 
},
{
{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}, 
},
{
{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}, 
},
{
{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}, 
},
{
{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}, 
},
{
{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}, 
},
{
{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}, 
},
{
{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}, 
},
{
{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}, 
},
{
{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}, 
},
{
{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}, 
},
{
{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}, 
},
{
{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}, 
},
{
{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}, 
},
{
{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}, 
},
{
{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}, 
},
{
{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}, 
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/games"},
},
{
{text = '• القائمه الرئيسيه •', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Source') then
local UserId = Text:match('(%d+)/Source')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = "*ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ ꜱᴏᴜʀᴄᴇ ꜱᴇʟᴠᴀ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• ᴍʏ ᴅᴇᴠ •', data=IdUser.."/usodev"},
},
{
{text = '• ᴍʏ ᴄʜᴀɴɴᴇʟ •', data=IdUser.."/usoch"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/usodev') then
local UserId = Text:match('(%d+)/usodev')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = "*ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ ꜱᴏᴜʀᴄᴇ ꜱᴇʟᴠᴀ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{  
{text = '･ عبدالله ･', url = 't.me/Di_il'},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Source"},
},
{
{text = '• القائمه الرئيسيه •', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/usoch') then
local UserId = Text:match('(%d+)/usoch')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = "*ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ ꜱᴏᴜʀᴄᴇ ꜱᴇʟᴠᴀ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ ᴄʜ sᴏᴜʀᴄᴇ ･', url = "http://t.me/Di_il"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Source"},
},
{
{text = '• القائمه الرئيسيه •', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/music') then
local UserId = Text:match('(%d+)/music')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الاحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الاربعاء", Thursday = "الخميس", Friday = "الجمعه", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local selva = bot.getUser(Sudo_Id)
local Timo = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..Text.." ⦊\n🤖︙اهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "الخالدي").."\n🔰︙وظيفتي حمايه المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع الخطؤات التاليه\n➕︙اضِف البوت إلى مجموعتك او قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ اوامر التشغيل ･', data=IdUser.."/mutash"},{text = '･ اوامر الادمنيه ･', data=IdUser.."/muadmin"},
},
{
{text = '･ اوامر البحث والتحميل ･', data=IdUser.."/mutahmel"},
},
{
{text = '･ اوامر اضافيه ･', data=IdUser.."/muadafya"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/Arabic1"},
},
}
}
return edit(ChatId,Msg_id,Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mutash') then
local UserId = Text:match('(%d+)/mutash')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
‹ اوامر تشغيل الموسيقي ›
╖• تشغيل + اسم الاغنيه 
╢•تشغيل  فيديو   + اسم الاغنيه فيديو
╢• تشغيل «» ريلاي علي اغنيه او فيديو
╢• ايقاف
╢• بنج
╢• الحساب المساعد
╢• تشغيل مباشر+ رابط
╜• فيديو_مباشر + رابط
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ اوامر الادمنيه ･', data=IdUser.."/muadmin"},
},
{
{text = '･ اوامر البحث والتحميل ･', data=IdUser.."/mutahmel"},
},
{
{text = '･ اوامر اضافيه ･', data=IdUser.."/muadafya"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/music"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/muadmin') then
local UserId = Text:match('(%d+)/muadmin')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
‹ اوامر الادمنيه ›
╖• تحديث » 「لتحديث قائمه المشرفين」
╢• ايقاف » 「لإيقاف التشغيل」
╢• ايقاف موقت » 「ايقاف التشغيل موقتآ」
╢• استئناف » 「استئناف التشغيل」
╢• تخطي | سكب » 「لتخطي التشغيل」
╢• كتم  » 「لكتم البوت」
╢• الغاء الكتم » 「لرفع الكتم عن البوت」
╜• انضم » 「لاستدعاء الحساب المساعد」
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ اوامر التشغيل ･', data=IdUser.."/mutash"},
},
{
{text = '･ اوامر البحث والتحميل ･', data=IdUser.."/mutahmel"},
},
{
{text = '･ اوامر اضافيه ･', data=IdUser.."/muadafya"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/music"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mutahmel') then
local UserId = Text:match('(%d+)/mutahmel')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
‹ اوامر البحث والتحميل ›
╖• تحميل + اسم اغنيه | لينك
╢• تحميل فيديو + اسم الفيديو | لينك
╢• بحث » 「لبحث في اليوتيوب」
╜• كلمات » 「لبحث عن  كلمات اغاني」
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ اوامر الادمنيه ･', data=IdUser.."/muadmin"},
},
{
{text = '･ اوامر اضافيه ･', data=IdUser.."/muadafya"},
},
{
{text = '･ اوامر التشغيل ･', data=IdUser.."/mutash"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/music"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/muadafya') then
local UserId = Text:match('(%d+)/muadafya')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
‹ اوامر اضافيه ›
╖• ايدي » 「لعرض معلومات ايديك」
╢• بوت » 「لمعرفه انه شغال」
╢• بوت »「لعرض اسم البوت 」
╢• صورتي »「يظهر ليك صورتك」
╢• انا مين  »「لمعرفه انت مين」
╢• الرتبه »「 هذا الامر لمطور الاساسي」
╢• رتبتي »「لمعرفه رتبتك」
╢• بينج »「لمعرفه البينج」
╢• الاوامر »「لمعرفه الاوامر」
╢• سورس »「كود السورس」
╜• المطور »「لمعرفه صاحب البوت」
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ اوامر الادمنيه ･', data=IdUser.."/muadmin"},
},
{
{text = '･ اوامر التشغيل ･', data=IdUser.."/mutash"},
},
{
{text = '･ اوامر البحث والتحميل ･', data=IdUser.."/mutahmel"},
},
{
{text = '･ ʙᴀᴄᴋ ･', data=IdUser.."/music"},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/zking') then
local UserId = Text:match('(%d+)/zking')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الاسد ( 23/6 - 22/8 )

الكوكب : الشمس

ارقام الحظ : 14- 13- 32-41- 50

الاحجار : الياقوت،العنبر

البرج : ناري

يتوافق مع : برج القوس - برج الحمل - برج الدلو

الاعمال الملائمه : مدراء، مهندسين معماريين، مخترعين، مدرسين، رياضيين ومدراء

ايجابيات برج الاسد : كريم، دافئ القلب، مبدع، حماسي، واسع العقل، وفي محب
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zzor') then
local UserId = Text:match('(%d+)/zzor')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الثور ( 20/4 - 20/5 )

الكوكب : الزهره

ارقام الحظ : 11, 29, 29, 37, 56

الاحجار : الزمرد , الفيروز

البرج : ترابي

يتوافق مع :  برج العذراء   و برج الجدي -  برج السرطان - برج الحوت 

الاعمال الملائمه  : موظفي بنك- فنانين- محاسبين-موسيقيين- عمال

إيجابيات برج الثور : صبور- يمكن الاعتماد عليه- محب- من طبعه الإصرار والتصميم- هادئ ويحب الطمانينه
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zakrb') then
local UserId = Text:match('(%d+)/zakrb')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج العقرب ( 24/10 - 21/11 )

الكوكب : المريخ

ارقام الحظ : 17- 26- 35- 44-53

الاحجار : الياقوت-العقيق

البرج : مائي

يتوافق مع : برج الحوت - برج السرطان - برج الثور

الاعمال الملائمه : اطباء- محققين- علماء بيئه- مهندسين- عملاء سريين.

ايجابيات برج العقرب: صاحب عزيمه- قوي- عاطفي- ذو حدس- ذو طاقه - مثير - شخصيته جذابه- كتوم للاسرار

سلبيات برج العقرب : كثير الرفض- يحب السيطره - محب للتملك- غيور -عنيد.
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/elcoos') then
local UserId = Text:match('(%d+)/elcoos')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج القوس ( 22/11 - 21/12)
الكوكب : المشتري

ارقام الحظ : 18-27- 36-45- 54

الاحجار : الفيروز

البرج : ناري

يتوافق مع : الحمل - الاسد-الجوزاء

الاعمال الملائمه : وكلاء سفر-مكتشفين-بروفيسورات- سفراء- تجار

ايجابيات : متفائل، محب للحريه، مرح، له روح مرحه جميله، صادق، مستقيم، ذكي وصاحب فلسفه

سلبيات : متفائل بصوره عمياء، مهمل، غير مسؤول، سطحي، غير لبق، قلق
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/pregnancy') then
local UserId = Text:match('(%d+)/pregnancy')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الحمل :- ( 21/3 - 19/4 )

الكوكب : المريخ

ارقام الحظ : 10 ,19, 28, 37, 46, 55

الاحجار : الياقوت - الماس

البرج : نارى

يتوافق مع :برج الاسد -برج  القوس - برج الجوزاء -برج  الدلو

الاعمال الملائمه : رجل إطفاء ، طبيب ، ميكانيكي ، طبيب اسنان ، لاعب رياضي محترف او رجل اعمال

سلبيات برج الحمل : اناني - سريع الغضب - متهور - عديم الصبر – الطيش
 
 مميّزات برج الحمل ١.١ الثقه العاليه بالنّفس ١.٢ روح القياده ١.٣ الطاقه الإيجابيّه ١.٤ الشجاعه ١.٥ الإبداع ١.٦ الطّموح ١.٧ حبّ المغامره ١.٨ الإخلاص ١.٩ الاستقلاليّه ٢ عيوب برج الحمل ٢.١ الانانيّه ٢.٢ حبّ لفت الانتباه ٢.٣ الغضب ٢.٤ احتكار الحديث ٢.٥ التسرّع
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zsltan') then
local UserId = Text:match('(%d+)/zsltan')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج السرطان ( 22/6 - 22/7 )

الكوكب : القمر

ارقام الحظ : 13- 22-31-40- 48- 57

الاحجار : اللؤلؤ،العنبر-الياقوت

البرج : مائي

يتوافق مع : برج العقرب ، برج الحوت ،برج الجدي ،برج الثور

الاعمال الملائمه : اطباء، صيادله، مدرفينوم، اخصائيو تغذيه، شيف، سماسره

ايجابيات برج السرطان : عاطفي، محب، صاحب حدس وبديهه، صاحب خيال واسع
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zazra') then
local UserId = Text:match('(%d+)/zazra')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج العذراء ( 23/8 - 22/9 )

الكوكب : عطارد

ارقام الحظ : 6- 15- 24- 33- 42- 51

الاحجار : العقيق

البرج : ارضي

يتوافق: مع   برج الجدي   ، برج الثور ،برج السرطان ، برج العقرب

الاعمال الملائمه : كيميائيين- اطباء-محققين- اخصائيي تغذيه- اطباء بيطريين- مدراء- مقاولين

ايجابيات برج العذراء : متواضع، خجول، دقيق، يمكن الاعتماد عليه، عملي، مجتهد، ذكي ويميل إلى التحليل

سلبيات برج العذراء : سريع الانزعاج، كثير القلق، كثير الانتقاد، قاسي، يسعى نحو الكماليه ومحافظ
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zmezan') then
local UserId = Text:match('(%d+)/zmezan')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الميزان ( 23/9 - 23/10 )

الكوكب : الزهره

ارقام الحظ : 6- 16- 25- 34- 43- 52

الاحجار : الماس

البرج : هوائي

يتوافق مع : برج الدلو - برج الجوزاء - برج القوس

الاعمال الملائمه : وظائف دبلوماسيه- قضاه- مستشارين- اخصائيين نفسيين - فنانين

ايجابيات برج الميزان : دبلوماسي، مؤدب، رومانسي، ساحر، سهل النقياد، اجتماعي، صاحب مبادئ ومسالم

سلبيات برج الميزان : متردد، قابل للتغير، ساذج، يتاثر بسرعه، منطوي على نفسه.
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zgagy') then
local UserId = Text:match('(%d+)/zgagy')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الجدي ( 22/12 - 19/1 )

الكوكب : زحل

ارقام الحظ: 10-28- 37-46- 55

الاحجار : العقيق اليماني

البرج : ترابي

يتوافق مع : برج الثور- برج العذراء

الاعمال الملائمه : مدراء عامين- مدراء-وزراء، -مهندسي كومبيوتر.

ايجابيات برج الجدي: عملي، عاقل- طموح- منظم- صبور- حذر- صاحب روح مرحه ومتحفظ

سلبيات برج الجدي : متشائم- متعلق بالاقدار- بائس- حاقد، متمسك بالتقاليد اكثر من اللازم وجامد.
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zporg') then
local UserId = Text:match('(%d+)/zporg')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 تعرف علي الابراج لمعرفه برجك 🌙💕 〉
💎╖ برج الجدي: من 12/22 - الى 1/19 ٫
🎄╢ برج الدلو: من 1/20 - الى 2/18 ٫
⚡️╢ برج الحوت: من 2/19 - الى 3/20 ٫
🏅╢ برج الحمل: من 3/21 - الى 4/19 ٫
🚦╢ برج الثور: من 4/20 - الى 5/20 ٫
⚙╢ برج الجوزاء: من 5/21 - الى 6/20 ٫
🖼╢ برج السرطان: من 6/21 - الى 7/21 ٫
🎀╢ برج الاسد: من 7/23 - الى 8/22 ٫
🎈╢ برج العذراء: من 8/23 - الى 9/22 ٫
☀️╢ برج الميزان: من 9/23 - الى 10/22 ٫
🥷╢ برج العقرب: من 10/23 - الى 11/21 ٫
✨╜ برج القوس: من 11/22 - الى 12/21 ٫
*]] 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zhot') then
local UserId = Text:match('(%d+)/zhot')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
 برج الحوت ( 19/2 - 20/3 )

الكوكب : المشتري ارقام الحظ : 12- 21- 39- 48- 57

الاحجار : حجر القمر

البرج : مائي

يتوافق مع : برج السرطان - برج العقرب -برج الثور

الاعمال الملائمه : اطباء بيطريين- علماء احياء- فنانين- اطباء-موسيقيين- علماء نفس

ايجابيات برج الحوت : صاحب خيال، حساس، عاطفي، لطيف، غير اناني، لا تهمه الماديات، صاحب حدس وبديهه ويتعاطف مع الآخرين.

سلبيات برج الحوت  : مثالي و يتهرب من الواقع، كتوم للاسرار وغامض، إرادته ضعيفه وسهل الانقياد.
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zguza') then
local UserId = Text:match('(%d+)/zguza')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الجوزاء ( 21/5 - 20 /6 ) كوكب برج الجوزاء : عطارد ارقام الحظ  لبرج الجوزاء: 12-21-30-48-47 احجار برج الجوزاء : العقيق نوع برج الجوزاء : هوائي يتوافق برج الجوزاء مع : برج الميزان - برج الحمل - برج الاسد - برج القوس الاعمال الملائمه لبرج الجوزاء : برامج حواريه - تجار - مك

إيجابيات  برج الجوزاء: ذكي - متقد الذهن - فصيح - لديه روح الشباب - متعدد المواهب - اجتماعي - متاقلم

سلبيات برج الجوزاء : متوتر - غير ثابت على حال - عصبي - ماكر- فضولي
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/Countries') then
local UserId = Text:match('(%d+)/Countries')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
برج الدلو ( 20/1 - 18/2 )

الكوكب : زحل

ارقام الحظ : 11- 29- 38-47- 56

الاحجار : الفيروز

البرج : هوائي

يتوافق مع : برج الجوزاء - برج الميزان -برج الحمل -برج الجوزاء

الاعمال الملائمه برج الدلو : مخترعين- سياسيين- كتاب- علماء- رواد فضاء- منجمين

ايجابيات برج الدلو  : ودود، إنساني، صادق، وفي وصاحب ولاء، مبدئي، مبتكر

سلبيات برج الدلو : مستقل وذكي. عنيد، يقف ضد الامور، مشاكس، غير متوقع التصرفات، غير عاطفي وله استقلاليته.
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/YUKDO') then
local UserId = Text:match('(%d+)/YUKDO')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
 〈 اوامـر الـزواج 🥺♥ 〉
╖ مرحبا بك بقسم اوامر الزواج بالمهر
╢ اعمل ريب واكتب زواج  + المبلغ
╢ اكتب زواجي لعرض عقد زواجكم
╢ اكتب زوجها لعرض مين جوزها
╢ اكتب زوجته لعرض مين مراته
╢ اكتب طلقها للازواج
╢ اكتب اخلعو للزوجات
╜ اكتب توب المتزوجين لعرض اغني توب
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ اوامر البنك ･', callback_data=IdUser.."/GPQPK"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/XOONJL"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/GPQPK') then
local UserId = Text:match('(%d+)/GPQPK')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامـر الـبـنـك 🥺♥ 〉
╖ انشاء حساب بنكي  ↢ تسوي حساب بنكي
╢ مسح حساب بنكي  ↢ تلغي حسابك البنكي
╢ تحويل ↢ رقم حساب الشخص وتحول له
╢ حسابي  ↢ يطلع لك رقم حسابك
╢ فلوسي ↢ يعلمك كم فلوسك
╢ راتب ↢ يعطيك راتب كل ١٠ دقائق
╢ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق
╢ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق
╢ استثمار ↢ تستثمر بالمبلغ الذي تريده
╢ حظ ↢ تلعبها باي مبلغ ياتدبله ياتخسره انت وحظك
╢ مضاربه ↢ تضارب باي مبلغ تريده
╢ هجوم ↢ تهجم عالخصم مع زياده نسبه كل هجوم
╢ كنز ↢ يعطيك كنز بسعر مختلف انتا وحظك
╜ مراهنه ↢ تحط مبلغ وتراهن عليه
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الثانيه ･', callback_data=IdUser.."/banSela"},
},
{
{text = '･ اضغط لانشاء حساب بنكي ･', callback_data=IdUser.."/bankopi"},
},
{
{text = '• اوامر الزواج •', callback_data=IdUser.."/YUKDO"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/XOONJL"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/banSela') then
local UserId = Text:match('(%d+)/banSela')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامـر الـبـنـك 🥺♥ 〉
╖ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس
╢ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا
╢ زواج  ↢ تكتب بالرد على رساله شخص مع المهر
╢ زواجي  ↢ يطلع وثيقه زواجك اذا متزوج
╢ طلاق ↢ يطلقك اذا متزوج
╢ خلع  ↢ يخلع زوجك ويرجع له المهر
╢ زواجات ↢ يطلع اغلى ٣٠ زواجات
╢ ترتيبي ↢ يطلع ترتيبك باللعبه
╢ المعرض ↢ يمديك تشتري سيارات وعقارات
╢ ممتلكاتي ↢ يطلع لك مشترياتك من المعرض
╢ تبرع ↢ تتبرع الى افقر اللاعبين
╢ انشاء نادي ↢ انشاء نادي كره القدم خاص بك
╢ شراء لاعب ↢ يطلعلك لاعب عشوائي تزودو لناديك
╢ بناء مزرعه ↢ تبني مزرعتك وتزرع وتحصد خضار
╢ نسبه الحظ ↢ لضبط الحظ بين الربح والخساره
╜ صنع اكشطها ↢ يطلعلك اكواد استخدمها كجوائز
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/GPQPK"},
},
{
{text = '･ اضغط لانشاء حساب بنكي ･', callback_data=IdUser.."/bankopi"},
},
{
{text = '• اوامر الزواج •', callback_data=IdUser.."/YUKDO"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/XOONJL"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/SelTimoo') then
local UserId = Text:match('(%d+)/SelTimoo')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامـر الـبـنـك 🥺♥ 〉
╖ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس
╢ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا
╢ زواج  ↢ تكتب بالرد على رساله شخص مع المهر
╢ زواجي  ↢ يطلع وثيقه زواجك اذا متزوج
╢ طلاق ↢ يطلقك اذا متزوج
╢ خلع  ↢ يخلع زوجك ويرجع له المهر
╢ زواجات ↢ يطلع اغلى ٣٠ زواجات
╢ ترتيبي ↢ يطلع ترتيبك باللعبه
╢ المعرض ↢ يمديك تشتري سيارات وعقارات
╢ ممتلكاتي ↢ يطلع لك مشترياتك من المعرض
╢ تبرع ↢ تتبرع الى افقر اللاعبين
╢ انشاء نادي ↢ انشاء نادي كره القدم خاص بك
╢ شراء لاعب ↢ يطلعلك لاعب عشوائي تزودو لناديك
╢ بناء مزرعه ↢ تبني مزرعتك وتزرع وتحصد خضار
╢ نسبه الحظ ↢ لضبط الحظ بين الربح والخساره
╜ صنع اكشطها ↢ يطلعلك اكواد استخدمها كجوائز
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الثانيه ･', callback_data=IdUser.."/BacTimS"},
},
{
{text = '･ اضغط لانشاء حساب بنكي ･', callback_data=IdUser.."/bankopi"},
},
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/BacTimS') then
local UserId = Text:match('(%d+)/BacTimS')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اوامـر الـبـنـك 🥺♥ 〉
╖ انشاء حساب بنكي  ↢ تسوي حساب بنكي
╢ مسح حساب بنكي  ↢ تلغي حسابك البنكي
╢ تحويل ↢ رقم حساب الشخص وتحول له
╢ حسابي  ↢ يطلع لك رقم حسابك
╢ فلوسي ↢ يعلمك كم فلوسك
╢ راتب ↢ يعطيك راتب كل ١٠ دقائق
╢ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق
╢ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق
╢ استثمار ↢ تستثمر بالمبلغ الذي تريده
╢ حظ ↢ تلعبها باي مبلغ ياتدبله ياتخسره انت وحظك
╢ مضاربه ↢ تضارب باي مبلغ تريده
╢ هجوم ↢ تهجم عالخصم مع زياده نسبه كل هجوم
╢ كنز ↢ يعطيك كنز بسعر مختلف انتا وحظك
╜ مراهنه ↢ تحط مبلغ وتراهن عليه
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/SelTimoo"},
},
{
{text = '･ اضغط لانشاء حساب بنكي ･', callback_data=IdUser.."/bankopi"},
},
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/TiSelva') then
local UserId = Text:match('(%d+)/TiSelva')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 قسم الالعاب المتطوره 🥺❤️ 〉
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '- فلابي بيرد', url = 'http://t.me/awesomebot?game=FlappyBird'}, 
},
{
{text = '- تبديل النجوم ', url = 'http://t.me/gamee?game=Switchy'}, {text = '- موتسيكلات', url = 'http://t.me/gamee?game=motofx'}, 
},
{
{text = '- اطلاق النار ', url = 'http://t.me/gamee?game=NeonBlaster'}, {text = '- كره القدم', url = 'http://t.me/gamee?game=Footballstar'}, 
},
{
{text = '- تجميع الوان ', url = 'http://t.me/awesomebot?game=Hextris'}, {text = '- المجوهرات', url = 'http://t.me/gamee?game=DiamondRows'}, 
},
{
{text = '- ركل الكره ', url = 'http://t.me/gamee?game=KeepitUP'}, {text = '- بطوله السحق', url = 'http://t.me/gamee?game=SmashRoyale'}, 
},
{
{text = '- 2048', url = 'http://t.me/awesomebot?game=g2048'}, 
},
{
{text = '- كره السله ', url = 'http://t.me/gamee?game=BasketBoy'}, {text = '- القط المجنون', url = 'http://t.me/gamee?game=CrazyCat'}, 
},
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/SelvaTi') then
local UserId = Text:match('(%d+)/SelvaTi')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اختار اللعبه ال تحبها 🥺❤️ 〉
╖•  لعبه البنك » بنك الحظ
╢•  لعبه مريم » رعب
╢•  لعبه ترجمه » ترجمه عربي وانجليزي
╢•  لعبه اختبار الذكاء » شغل عقلك
╢•  لعبه نسبه الذكاء »
╢•  لعبه نسبه الغباء »
╢•  لعبه نسبه الحب »
╢•  لعبه نسبه الكره »
╢•  لعبه نسبه الرجوله »
╢•  لعبه نسبه الانوثه »
╢•  لعبه المختلف » المختلف
╢•  لعبه الامثله » امثله
╢•  لعبه العكس » العكس
╜•  لعبه الحزوره » حزوره
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الثانيه ･', callback_data=IdUser.."/XxTimo"},
},
{
{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/XxTimo') then
local UserId = Text:match('(%d+)/XxTimo')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اختار اللعبه ال تحبها 🥺❤️ 〉
╖•  لعبه المعاني » معاني
╢•  لعبه البات » بات
╢•  لعبه التخمين » خمن
╢•  لعبه الاسرع » الاسرع، ترتيب
╢•  لعبه السمايلات » سمايلات
╢•  اسئله » اسئله منوعه
╢•  اسالني » اسئله عامه متجدده
╢•  لغز  » الغاز الذكاء متجدده
╢•  روليت » الروليت بالمعرفات 
╢•  الروليت » الروليت بالانضمام
╢•  رياضيات » مسائل رياضيه 
╢•  انكليزي » معاني الكلمات 
╢•  كت تويت ،كت » اسئله ترفيهيه
╢•  نقاطي ← لعرض عدد النقاط 
╢•  بيع نقاطي + { العدد } 
╜• لبيع كل نقطه مقابل {50} رسال
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ القائمه الاولي ･', callback_data=IdUser.."/SelvaTi"},
},
{
{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/Nadyy') then
local UserId = Text:match('(%d+)/Nadyy')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اليك لعبه النوادي 🥺♥ 〉
╖ عليك انشاء حساب بنكي اولا
╢ انشاء نادي + الاسم
╢ مسح ناديي ↢ تمسح ناديك
╢ ناديي ↢ يطلع لك معلومات ناديك
╢ تدريب ↢ يديك طاقه كل 20 دقيقه
╢ مباره وديه ↢ تلعب مباره وديه
╢ مباره ↢ بالرد تلعب مع شخص
╢ شراء لاعب ↢ تشتري لاعب
╢ بيع لاعب ↢ تبيع لاعب من ناديك
╢ تغيير لقب النادي
╜ توب النوادي ↢ اعلى 10 نوادي
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},
},
{
{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/Mazraa') then
local UserId = Text:match('(%d+)/Mazraa')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
〈 اليك لعبه المزرعه 🥺♥ 〉
╖ عليك انشاء حساب بنكي اولا
╢ بناء مزرعه + الاسم ↢ تسوي مزرعه
╢ زراعه ↢ لزراعه محصول 
╢ اهلا فيك بمزرعه الخالدي :
╢ المزروعات واسعارها :
╢ بطاطا : 75 جنيه 💵
╢ بندوره : 100 جنيه 💵
╢ خس : 125 جنيه 💵
╢ خيار : 150 جنيه 💵
╢ جزر : 175 جنيه 💵
╢ فليفله : 200 جنيه 💵
╢ فريز : 300 جنيه 💵
╢ ذره : 400 جنيه 💵
╢ ثوم : 500 جنيه 💵
╢ فطر : 800 جنيه 💵
╢ شجره تفاح : 1000 جنيه 💵
╢ شجره عنب : 1250 جنيه 💵
╢شجره زيتون : 1500 جنيه 💵
╢ شجره موز : 2000 جنيه 💵
╢ شجره مانجا : 3000 جنيه 💵
╢ مثال طريقه الزراعه : 
╢ زراعه بطاطا 10
╜ زراعه شجر موز 15
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},
},
{
{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/BackSelva"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/XOONJL') then
local UserId = Text:match('(%d+)/XOONJL')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local txxt = "*〈 احسن لعبه في تيلجرام 🥺♥ 〉   *"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • اوامر البنك •', callback_data=IdUser.."/GPQPK"},
},
{
{text = '• اوامر الزواج •', callback_data=IdUser.."/YUKDO"},
},
{
{text = '･ اضغط لانشاء حساب بنكي ･', callback_data=IdUser.."/bankopi"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/BackSelva') then
local UserId = Text:match('(%d+)/BackSelva')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local txxt = "*〈 قـائمه الالعاب يروحي 🥺♥ 〉   *"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • العاب السورس •', callback_data=IdUser.."/SelvaTi"},{text = '• العاب متطوره •', callback_data=IdUser.."/TiSelva"},
},
{
{text = '• بنك الحظ •', callback_data=IdUser.."/SelTimoo"},
},
{
{text = '• المزرعه •', callback_data=IdUser.."/Mazraa"},{text = '• النوادي •', callback_data=IdUser.."/Nadyy"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/zDRGd') then
local UserId = Text:match('(%d+)/zDRGd')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local txxt = "*〈 اعـرف بـرجـك يـروحي 🥺♥ 〉  *"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • معرفه برجك •', callback_data=IdUser.."/zporg"},
},
{
{text = '• الاسد •', callback_data=IdUser.."/zking"},{text = '• الثور •', callback_data=IdUser.."/zzor"},
},
{
{text = '• العقرب •', callback_data=IdUser.."/zakrb"},{text = '• القوس •', callback_data=IdUser.."/elcoos"},
},
{
{text = '• الحمل •', callback_data=IdUser.."/pregnancy"},
},
{
{text = '• السرطان •', callback_data=IdUser.."/zsltan"},{text = '• العذراء •', callback_data=IdUser.."/zazra"},
},
{
{text = '• الميزان •', callback_data=IdUser.."/zmezan"},{text = '• الجدي •', callback_data=IdUser.."/zgagy"},
},
{
{text = '• الحوت •', callback_data=IdUser.."/zhot"},
},
{
{text = '• الجوزاء •', callback_data=IdUser.."/zguza"},{text = '• الدلو •', callback_data=IdUser.."/Countries"},
},
{
{text = ' . 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃?? 🎀.', url = "http://t.me/Di_il"}
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/awamer') then
local UserId = Text:match('(%d+)/awamer')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ "..Text.." ⦊\n╚• ʜᴇʀᴇ ɪꜱ ᴛʜᴇ ʟɪꜱᴛ ᴏꜰ ᴄᴏᴍᴍᴀɴᴅꜱ*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اوامر المطورين •', callback_data=IdUser.."/helpsudo"},{text = '• اوامر الجروب •', callback_data=IdUser.."/Group12"},
},
{
{text = '• اوامر التسليه •', callback_data=IdUser.."/helpts"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
{
{text = ' اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end 
if Text and Text:match('(%d+)/DevSelva') then
local UserId = Text:match('(%d+)/DevSelva')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ "..Text.." ⦊ \n╚• ꜱᴏᴜʀᴄᴇ ꜱɪʟᴠᴀ ᴅᴇᴠᴇʟᴏᴘᴇʀꜱ*"
keyboard = {} 
keyboard.inline_keyboard = {
{  
{text = '･ عبدالله ･', url = 't.me/Di_il'},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/love_Timo"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/ChannelSelva') then
local UserId = Text:match('(%d+)/ChannelSelva')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ "..Text.." ⦊ \n╚• ꜱᴏᴜʀᴄᴇ ꜱɪʟᴠᴀ ᴄʜᴀɴɴᴇʟꜱ*"
keyboard = {} 
keyboard.inline_keyboard = {
{  
{text = '𓏺 𝗣 𝗮 𝗿 𝘁 𝗬 🎄.', url = 't.me/Di_il'},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/love_Timo"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/love_Timo') then
local UserId = Text:match('(%d+)/love_Timo')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "*╔• ᴡᴇʟᴄᴏᴍᴇ ʏᴀ ⦉ "..Text.." ⦊ \n╚• ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ ꜱᴏᴜʀᴄᴇ ꜱɪʟᴠᴀ*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' • ᴅᴇᴠ ꜱᴏᴜʀᴄᴇ •', callback_data=IdUser.."/DevSelva"},{text = '• ᴄʜ ꜱᴏᴜʀᴄᴇ •', callback_data=IdUser.."/ChannelSelva"},
},
{
{text = '• ʙᴏᴛ ᴅᴇᴠᴇʟᴏᴘᴇʀ •', url = "https://t.me/"..Timo.username..""},
},
{
{text = ' اضف البـوت الـي مجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/aflam2025') then
local UserId = Text:match('(%d+)/aflam2025')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/84",caption = '*اليك افلام 2025*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ سيكو سيكو ･', callback_data=IdUser.."/seko_seko"},{text = '･ نجوم الساحل ･', callback_data=IdUser.."/ngom_elsahel"},
},
{
{text = '･ 6 ايـام ･', callback_data=IdUser.."/6_ayam"},
},
{
{text = '･ الصفا ثناويه بنات ･', callback_data=IdUser.."/elsafa_bnat"},{text = '･ فار ب 7 ارواح ･', callback_data=IdUser.."/far_7arwah"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/bach_aflam"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/aflam2024') then
local UserId = Text:match('(%d+)/aflam2024')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/UOUSOU/84",caption = '*اليك افلام 2024*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ الحريفه ( 2 ) ･', callback_data=IdUser.."/eharefa"},{text = '･ الدشاش ･', callback_data=IdUser.."/eldashash"},
},
{
{text = '･ الهوا سلطان ･', callback_data=IdUser.."/elhawa_soltan"},{text = '･ ولاد رزق ( 3 ) ･', callback_data=IdUser.."/wlad_rezk"},
},
{
{text = '･ علي الماشي ･', callback_data=IdUser.."/ala_elmashy"},
},
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/bach_aflam"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/bach_aflam') then
local UserId = Text:match('(%d+)/bach_aflam')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = bot.getUser(Sudo_Id) 
au ={type = "photo",media = "https://t.me/UOUSOU/84",caption = '*اليك قائمه الافلام*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• افلام ( 2025 ) •', callback_data=IdUser.."/aflam2025"}
},
{
{text = '• افلام ( 2024 ) •', callback_data=IdUser.."/aflam2024"}
},
{
{text = '• ʙᴏᴛ ᴅᴇᴠᴇʟᴏᴘᴇʀ •', url = "https://t.me/"..Timo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
end

if Text and Text:match('(%d+)/seko_seko') then
local UserId = Text:match('(%d+)/seko_seko')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jjiijjukko/6",caption = '*اليك فيلم سيكو سيكو*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2025"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/ngom_elsahel') then
local UserId = Text:match('(%d+)/ngom_elsahel')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/kdkdkdkdmsj/21",caption = '*اليك فيلم نجوم الساحل*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2025"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/far_7arwah') then
local UserId = Text:match('(%d+)/far_7arwah')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jdndndi/33",caption = '*اليك فيلم فار ب 7 ارواح*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2025"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/elsafa_bnat') then
local UserId = Text:match('(%d+)/elsafa_bnat')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/oekemksos/21",caption = '*اليك فيلم الصفا ثناويه بنات*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2025"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/6_ayam') then
local UserId = Text:match('(%d+)/6_ayam')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jjiijjukko/4",caption = '*اليك فيلم 6 ايام*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2025"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end


if Text and Text:match('(%d+)/eharefa') then
local UserId = Text:match('(%d+)/eharefa')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jjiijjukko/2",caption = '*اليك فيلم الحريفه 2*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2024"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/eldashash') then
local UserId = Text:match('(%d+)/eldashash')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jjiijjukko/3",caption = '*اليك فيلم الدشاش*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2024"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/elhawa_soltan') then
local UserId = Text:match('(%d+)/elhawa_soltan')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/oekemksos/24",caption = '*اليك فيلم الهوا سلطان*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2024"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/wlad_rezk') then
local UserId = Text:match('(%d+)/wlad_rezk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/oekemksos/20",caption = '*اليك فيلم ولاد رزق الجزء التالت*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2024"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/ala_elmashy') then
local UserId = Text:match('(%d+)/ala_elmashy')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "video",media = "https://t.me/jjiijjukko/5",caption = '*اليك فيلم علي الماشي*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ ʙᴀᴄᴋ ･', callback_data=IdUser.."/aflam2024"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/Broadcasting_Groups') then
local UserId = Text:match('(%d+)/Broadcasting_Groups')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '･ الـغـاء ･', data=IdUser.."/algaa_azaa"},},}}
Redis:setex(Fast.."Broadcasting:Groups" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Broadcasting_Users') then
local UserId = Text:match('(%d+)/Broadcasting_Users')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '･ الـغـاء ･', data=IdUser.."/algaa_azaa"},},}}
Redis:setex(Fast.."Broadcasting:Users" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Groups_Pin') then
local UserId = Text:match('(%d+)/Groups_Pin')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '･ الـغـاء ･', data=IdUser.."/algaa_azaa"},},}}
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Groups_Fwd') then
local UserId = Text:match('(%d+)/Groups_Fwd')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '･ الـغـاء ･', data=IdUser.."/algaa_azaa"},},}}
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Users_Fwd') then
local UserId = Text:match('(%d+)/Users_Fwd')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
╖ حسنا ارسل الان الاذاعه 
╢ ملصق ـ متحركه ـ صوره 
╢ فيديو بصمه ـ الفيديو ـ ملف 
╢ بصمه ـ صوت ـ رساله 
╢ ليتم نشرها للجروبات 
╜ للخروج ابعت ( الغاء ) 
*]]
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '･ الـغـاء ･', data=IdUser.."/algaa_azaa"},},}}
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/algaa_azaa') then
local UserId = Text:match('(%d+)/algaa_azaa')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local Timo = "*• تم الغاء الاذاعه بواسطه\n ⦉ "..Text.." ⦊ *"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• ʙᴀᴄᴋ •', data=IdUser..'/timo_azaa'},},}}
Redis:del(Fast.."Broadcasting:Groups:Pin" .. ChatId .. ":" .. UserId) 
Redis:del(Fast.."Broadcasting:Users" .. ChatId .. ":" .. UserId) 
Redis:del(Fast.."Broadcasting:Groups" .. ChatId .. ":" .. UserId) 
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. ChatId .. ":" .. UserId) 
Redis:del(Fast.."Broadcasting:Users:Fwd" .. ChatId .. ":" .. UserId) 
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/timo_azaa') then
local UserId = Text:match('(%d+)/timo_azaa')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(Fast)
local bain = bot.getUser(IdUser)
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
local txxt = "\n*╖ اهلا عزيزي ⦉ "..Text.." ⦊*\n*╢ اهلا بك في قوائم الاذاعه*\n*╜ يمكنك اختيار نوع الاذاعه من خلال الازرار*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• للم ــجـموعـات •', data=IdUser..'/Broadcasting_Groups'},{text = '• للـخ ـــاص •', data=IdUser..'/Broadcasting_Users'},
},
{
{text = '• بـالـتـثبــيـت •', data=IdUser..'/Groups_Pin'},
},
{
{text = '• تـوجيـه للـم ــجـموعـات •', data=IdUser..'/Groups_Fwd'},
},
{
{text = '• تـوجيـه بـالـخ ـاص •', data=IdUser..'/Users_Fwd'},
},
}
}
return edit(ChatId,Msg_id,txxt, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/yesmogajder') then
local UserId = Text:match('(%d+)/yesmogajder')
if tonumber(IdUser) == tonumber(UserId) then
bot.leaveChat(chat_id)
bot.answerCallbackQuery(data.id, "• تم مغادره الجروب بامر من المطور", true)
end
end
if Text and Text:match('(%d+)/noomoghader') then
local UserId = Text:match('(%d+)/noomoghader')
if tonumber(IdUser) == tonumber(UserId) then
return edit(ChatId,Msg_id,"*تم الغاء الامر بنجاح ؟*", 'md', true)
end
end
if Text and Text:match('(%d+)/show_id') then
local UserId = Text:match('(%d+)/show_id')
if tonumber(IdUser) == tonumber(UserId) then
return send(msg_chat_id, msg_id, "*• تم نسخ ايديك ⦉ " .. UserId .. " ⦊* ، قم بنسخه الآن.", "md")
end
end
-----------------
if Text and Text:match('(%d+)/of_tak') and data.Creator then
local UserId = Text:match('(%d+)/of_tak')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:general'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل تاك عام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_tak') and data.Creator then
local UserId = Text:match('(%d+)/on_tak')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:general'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل تاك عام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_forall') and data.Creator then
local UserId = Text:match('(%d+)/of_forall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:forall'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل تاك للكل\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_forall') and data.Creator then
local UserId = Text:match('(%d+)/on_forall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:forall'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل تاك للكل\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_thenumber') and data.Creator then
local UserId = Text:match('(%d+)/of_thenumber')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:thenumber'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل تاك + العدد\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_thenumber') and data.Creator then
local UserId = Text:match('(%d+)/on_thenumber')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:thenumber'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل تاك + العدد\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_emoji') and data.Creator then
local UserId = Text:match('(%d+)/of_emoji')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:emoji'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_emoji') and data.Creator then
local UserId = Text:match('(%d+)/on_emoji')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:emoji'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_excited') and data.Creator then
local UserId = Text:match('(%d+)/of_excited')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:excited'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_excited') and data.Creator then
local UserId = Text:match('(%d+)/on_excited')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:excited'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_alltalk') and data.Creator then
local UserId = Text:match('(%d+)/of_alltalk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:alltalk'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل all بكلام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_alltalk') and data.Creator then
local UserId = Text:match('(%d+)/on_alltalk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:alltalk'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل all بالكلام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_allphoto') and data.Creator then
local UserId = Text:match('(%d+)/of_allphoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:allphoto'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تعطيل all بالصور\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_allphoto') and data.Creator then
local UserId = Text:match('(%d+)/on_allphoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:allphoto'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*• تم تفعيل all بالصوره\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BackTac') then
local UserId = Text:match('(%d+)/BackTac')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل تاك عام', data = IdUser..'/of_tak'},{text = 'تفعيل تاك عام', data = IdUser..'/on_tak'},
},
{
{text = 'تعطيل تاك للكل', data = IdUser..'/of_forall'},{text = 'تفعيل تاك للكل', data = IdUser..'/on_forall'},
},
{
{text = 'تعطيل تاك + العدد', data = IdUser..'/of_thenumber'},{text = 'تفعيل تاك + العدد', data = IdUser..'/on_thenumber'},
},
{
{text = 'تعطيل تاك للمتفاعلين', data = IdUser..'/of_excited'},{text = 'تفعيل تاك للمتفاعلين', data = IdUser..'/on_excited'},
},
{
{text = 'تعطيل تاك ايموجي', data = IdUser..'/of_emoji'},{text = 'تفعيل تاك ايموجي', data = IdUser..'/on_emoji'},
},
{
{text = 'تعطيل all بالكلام', data = IdUser..'/of_alltalk'},{text = 'تفعيل all بالكلام', data = IdUser..'/on_alltalk'},
},
{
{text = 'تعطيل all بالصوره', data = IdUser..'/of_allphoto'},{text = 'تفعيل all بالصوره', data = IdUser..'/on_allphoto'},
},
{
{text = 'قناه السورس ', url = 't.me/'..chsource..''}, 
},
}
}
return edit(ChatId,Msg_id,'* • مـرحـبـا اخـتـار امـر تـفـعـيـل الـتـاك *', 'md', false, false, reply_markup)
end
end
-----------------
if Text and Text:match('(%d+)/yaaaaa') and data.ControllerBot then
local UserId = Text:match('(%d+)/yaaaaa')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"*• ارسل معرف المطور الاساسي مع @\n√*","md",true) 
Redis:set(Fast.."AddSudosNew"..ChatId,true)
end
end
if Text and Text:match('(%d+)/Noooo') and data.ControllerBot then
local UserId = Text:match('(%d+)/Noooo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."AddSudosNew"..ChatId)
bot.editMessageText(ChatId,Msg_id,"*• تم الغاء امر تغيير المطور الاساسي\n√*","md",true) 
end
end
if Text and Text:match('(%d+)/Namebot') and  data.ControllerBot then
local UserId = Text:match('(%d+)/Namebot')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* • ارسل اسم البوت الاول ...*","md",true) 
Redis:setex(Fast.."Change:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/botName') and  data.ControllerBot then
local UserId = Text:match('(%d+)/botName')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* • ارسل اسم البوت الثاني ...*","md",true) 
Redis:setex(Fast.."Timo:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/nambot') and  data.ControllerBot then
local UserId = Text:match('(%d+)/nambot')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* • تم حذف اسم البوت الاول*","md",true) 
Redis:del(Fast.."Name:Bot") 
end
end
if Text and Text:match('(%d+)/botnam') and  data.ControllerBot then
local UserId = Text:match('(%d+)/botnam')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* • تم حذف اسم البوت الثاني*","md",true) 
Redis:del(Fast.."Bot:Name") 
end
end
if Text and Text:match('(%d+)/deldev/(%d+)') then
local info = {Text:match('(%d+)/deldev/(%d+)')}
if tonumber(info[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
Redis:srem(Fast.."Dev:Groups",info[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', data = IdUser..'/iiooii'}, 
},
}
}
local txx = Reply_Status(info[2],"* • تم تنزيله مطور *").Reply
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/iiooii') then
local info = Text:match('(%d+)/iiooii')
if tonumber(info) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
bot.editMessageText(ChatId,Msg_id,"• لا يوجد مطورين حاليا ")  
return false 
end
local datar = {data = {{text = "• مسح المطورين •" , data = IdUser..'/Dev'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =IdUser..'/deldev/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
local txx = '• قائمه مطورين البوت'
bot.editMessageText(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/Survey/(%d+)') then
local info = {Text:match('(%d+)/Survey/(%d+)')}
if tonumber(info[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
Redis:srem(Fast.."Devss:Groups",info[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ ʙ ᴀ ᴄ ᴋ ･', data = IdUser..'/iiuuii'}, 
},
}
}
local txx = Reply_Status(info[2],"* • تم تنزيله مطور ثانوي *").Reply
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/iiuuii') then
local info = Text:match('(%d+)/iiuuii')
if tonumber(info) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
bot.editMessageText(ChatId,Msg_id,"• لا يوجد ثانوين حاليا ")  
return false 
end
local datar = {data = {{text = "• مسح الثانوين •" , data = IdUser..'/Devss'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =IdUser..'/Survey/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
local txx = '• قائمه للمطورين الثانويين'
bot.editMessageText(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Bot:kick"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Join"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:AddMempar"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."lockpin"..ChatId,(bot.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tagservr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') and data.Creator then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:edit"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Link"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Welcome"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Id"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Reply"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:ReplySudo"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:SetId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:BanId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Games"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:KickMe"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Link"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Welcome"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Id"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"•  تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:IdPhoto"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Reply"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:ReplySudo"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:SetId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:BanId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Games"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:KickMe"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/tafealA') and data.Manger then
local UserId = Text:match('(%d+)/tafealA')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Admin:Group"..ChatId) 
bot.answerCallbackQuery(data.id, "• تم مسح ادمنيه الجروب ??❤️.\n • لرفع الادمنيه مره اخري\n• ارسل رفع الادمنيه", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..UserId[2],"del")    
end
bot.answerCallbackQuery(data.id, "• تم قفل الكل بنجاح 🥹❤️.  ", true)
end
end
if Text and Text:match('(%d+)/trtep@(.*)') then
local UserId = {Text:match('(%d+)/trtep@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
bot.answerCallbackQuery(data.id, "• تـم تـرتـيب الاوامـــر 🥹❤️.", true)
end
end
if Text and Text:match('(%d+)/esta@(.*)') then
local UserId = {Text:match('(%d+)/esta@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','مغاني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
bot.answerCallbackQuery(data.id, "• تـم استعاده الاوامـــر 🥹❤️.", true)
end
end

if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❌',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'✅',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❌',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'✅',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❌',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'✅',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❌',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'✅',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❌',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'✅',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❌')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'✅')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
bot.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = IdUser..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = IdUser..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = IdUser..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = IdUser..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = IdUser..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = IdUser..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = IdUser..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = IdUser..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = IdUser..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = IdUser..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = IdUser..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = IdUser..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = IdUser..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = IdUser..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = IdUser..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = IdUser..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = IdUser..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = IdUser..'/'.. 'mute_namemy'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return edit(ChatId,Msg_id,'• اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n• اعدادات الجروب ".."\n🔏︙علامه ال (✔️) تعني مقفول".."\n🔓︙علامه ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- السابق  ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n• اعدادات الجروب ".."\n🔏︙علامه ال (✔️) تعني مقفول".."\n• علامه ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(ChatId).farsia, data = '&'},{text = 'الفارسيه : ', data =IdUser..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(ChatId).tphlesh, data = '&'},{text = 'التفليش : ', data =IdUser..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(ChatId).alkfr, data = '&'},{text = 'الكفر : ', data =IdUser..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(ChatId).alphsar, data = '&'},{text = 'الفشار : ', data =IdUser..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي  ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end  

if Text and Text:match('/delAmr') then
local UserId = Text:match('/delAmr')
if data.Manger then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_farsia') then
local UserId = Text:match('(%d+)/Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفارسيه', data =UserId..'/'.. 'lock_Status_farsia'},
},
{
{text = 'فتح الفارسيه', data =UserId..'/'.. 'unlock_Status_farsia'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفارسيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tphlesh') then
local UserId = Text:match('(%d+)/Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التفليش', data =UserId..'/'.. 'lock_Status_tphlesh'},
},
{
{text = 'فتح التفليش', data =UserId..'/'.. 'unlock_Status_tphlesh'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التفليش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alkfr') then
local UserId = Text:match('(%d+)/Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكفر', data =UserId..'/'.. 'lock_Status_alkfr'},
},
{
{text = 'فتح الكفر', data =UserId..'/'.. 'unlock_Status_alkfr'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكفر", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alphsar') then
local UserId = Text:match('(%d+)/Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفشار', data =UserId..'/'.. 'lock_Status_alphsar'},
},
{
{text = 'فتح الفشار', data =UserId..'/'.. 'unlock_Status_alphsar'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفشار", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Link"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_farsia') then
local UserId = Text:match('(%d+)/unlock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:farsia"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_tphlesh') then
local UserId = Text:match('(%d+)/unlock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tphlesh"..ChatId)  
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alkfr') then
local UserId = Text:match('(%d+)/unlock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:alkfr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alphsar') then
local UserId = Text:match('(%d+)/unlock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:phshar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_farsia') then
local UserId = Text:match('(%d+)/lock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:farsia"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_tphlesh') and data.Manger then
local UserId = Text:match('(%d+)/lock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tphlesh"..ChatId,true)
Redis:set(Fast.."Status:IdPhoto"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alkfr') then
local UserId = Text:match('(%d+)/lock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:alkfr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alphsar') then
local UserId = Text:match('(%d+)/lock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:phshar"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Spam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Keyboard"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:vico"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Animation"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Document"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Video"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Photo"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:User:Name"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:hashtak"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Bot:kick"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:forward"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Audio"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Sticker"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Contact"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Join"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:AddMempar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Unsupported"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."lockpin"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tagservr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Markdaun"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:edit"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:geam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(Fast.."Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
edit(ChatId,Msg_id,"• ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
edit(ChatId,Msg_id,"• ارسل الاسم بالانكليزي", 'md', false)
end
end
if Text and Text:match('^(%d+)/back_lists$') then
local UserId = Text:match('^(%d+)/back_lists$')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=UserId..'/redis:Devall'},
},
{
{text="المكتومين عام",data=UserId..'/KtmAll'},{text="المحظورين عام",data=UserId..'/BanAll'},
},
{
{text="المطورين الثانويين",data=UserId..'/Devss'},{text="المطورين",data=UserId..'/Dev'},
},
{
{text="المالكين",data=UserId..'/Ownerss'},{text="المنشئين الاساسيين",data=UserId..'/SuperCreator'},
},
{
{text="المنشئين",data=UserId..'/Creator'},{text="المدراء",data=UserId..'/Manger'},
},
{
{text="الادمنيه",data=UserId..'/Admin'},{text="المميزين",data=UserId..'/DelSpecial'},
},
{
{text="المكتومين",data=UserId..'/SilentGroupGroup'},{text="المحظورين",data=UserId..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =UserId.."/delAmr"}
},
}
}
return edit(ChatId,Msg_id,"*•︙اختر احدى القوائم لمسحها*", "md",true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Devss') and data.ControllerBot then
local UserId = Text:match('(%d+)/Devss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Devss:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين الثانوين من البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Dev') and data.Devss then
local UserId = Text:match('(%d+)/Dev')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Dev:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/redis:Devall') and data.ControllerBot then
local UserId = Text:match('(%d+)/redis:Devall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."ControlAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين الاساسيين", "md",true, false, reply_markup)
end

elseif Text and Text:match('(%d+)/Ownerss') and data.Dev then
local UserId = Text:match('(%d+)/Ownerss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Ownerss:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح االمالكين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SuperCreator') and data.Ownerss then
local UserId = Text:match('(%d+)/SuperCreator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SuperCreator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المنشئين الاساسيين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Creator') and data.SuperCreator then
local UserId = Text:match('(%d+)/Creator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Creator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح منشئين الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Manger') and data.Creator then
local UserId = Text:match('(%d+)/Manger')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Manger:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المدراء", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Admin') and data.Manger then
local UserId = Text:match('(%d+)/Admin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Admin:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح ادمنيه الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/DelSpecial') then
local UserId = Text:match('(%d+)/DelSpecial')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Special:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المميزين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/KtmAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/KtmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."KtmAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المكتومين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Delkholat') then
local UserId = Text:match('(%d+)/Delkholat')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kholat:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع خولات المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Delwtk') then
local UserId = Text:match('(%d+)/Delwtk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."wtka:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع وتكات المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Deltwhd') then
local UserId = Text:match('(%d+)/Deltwhd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."twhd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع متوحدين المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Delklb') then
local UserId = Text:match('(%d+)/Delklb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."klb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع الكلاب المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Delmar') then
local UserId = Text:match('(%d+)/Delmar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."mar:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع حمير المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Delsmb') then
local UserId = Text:match('(%d+)/Delsmb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."smb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع السمب الي هنا ف المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Del2rd') then
local UserId = Text:match('(%d+)/Del2rd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."2rd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع القرود", 'md', false)
end
elseif Text and Text:match('(%d+)/Del3ra') then
local UserId = Text:match('(%d+)/Del3ra')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."3ra:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع العرر", 'md', false)
end
elseif Text and Text:match('(%d+)/Wrong') then
local UserId = Text:match('(%d+)/Wrong')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعاده اللعبه', data = IdUser..'Ml'},},}}
local TextHelp = [[*•  للاسف خطا يا صديقي حظ اوفر المره القادمه *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Mlhelp/(.*)') then
local dataa = {Text:match('(%d+)/Mlhelp/(.*)')}
local UserId , q = dataa[1] , dataa[2]
if tonumber(IdUser) == tonumber(UserId) then
local qq = Redis:get(Fast..ChatId..'Milion:help'..UserId) or 0
if tonumber(qq) < 3 then
Redis:incrby(Fast..ChatId..'Milion:help'..UserId,1)
return bot.answerCallbackQuery(data.id, "• الاجابه الصحيحه هي "..q, true)
else
return bot.answerCallbackQuery(data.id, "• ناسف لقد انتهت مساعداتك ", true)
end
end
elseif Text and Text:match('(%d+)Ml') then
local UserId = Text:match('(%d+)Ml')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..ChatId..'Milion:help'..UserId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'ابدء المستوي الاول من اللعبه', data = IdUser..'R1'},},}}
local TextHelp = [[*• اللعبه 3 مستويات عباره عن اسئله عامه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R1') then
local UserId = Text:match('(%d+)R1')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..ChatId..'Milion:help'..UserId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الجنيه', data = IdUser..'/Wrong'},},
{{text = 'الزلوط', data = IdUser..'R2'},},
{{text = 'اليورو', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الزلوط'},},
}}
local TextHelp = [[*• ما هي عمله دوله بولاندا ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R2') then
local UserId = Text:match('(%d+)R2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R3'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R3') then
local UserId = Text:match('(%d+)R3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '24 ساعه', data = IdUser..'R4'},},
{{text = '23 ساعه', data = IdUser..'/Wrong'},},
{{text = '22 ساعه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/24 ساعه'},},
}}
local TextHelp = [[*•  كم ساعه في اليوم ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R4') then
local UserId = Text:match('(%d+)R4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R5'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R5') then
local UserId = Text:match('(%d+)R5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الخليه ', data = IdUser..'R6'},},
{{text = 'الشجره', data = IdUser..'/Wrong'},},
{{text = 'الكهف', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الخليه'},},
}}
local TextHelp = [[*•  ما هو اسم المكان الذي يعيش فيه النحل ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R6') then
local UserId = Text:match('(%d+)R6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R7'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R7') then
local UserId = Text:match('(%d+)R7')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'اطعمته', data = IdUser..'/Wrong'},},
{{text = 'استضفته', data = IdUser..'/Wrong'},},
{{text = 'اكرمته ', data = IdUser..'R8'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/اكرمته'},},
}}
local TextHelp = [[*•  اكمل المثل :- احذر من اللئيم اذا ...؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R8') then
local UserId = Text:match('(%d+)R8')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R9'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R9') then
local UserId = Text:match('(%d+)R9')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'قبرص', data = IdUser..'/Wrong'},},
{{text = 'باريس', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'RR10'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/لندن'},},
}}
local TextHelp = [[*•  ما هي اكبر مدينه في قاره اوروبا ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)RR10') then
local UserId = Text:match('(%d+)RR10')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X11'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X11') then
local UserId = Text:match('(%d+)X11')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'العربيه ', data = IdUser..'X12'},},
{{text = 'الانجليزيه', data = IdUser..'/Wrong'},},
{{text = 'الفرنسيه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/العربيه'},},
}}
local TextHelp = [[*•  ما هي اللغه التي تحتل المركز الخامس كاكثر اللغات المتحدث بها*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X12') then
local UserId = Text:match('(%d+)X12')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X13'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X13') then
local UserId = Text:match('(%d+)X13')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مدريد', data = IdUser..'/Wrong'},},
{{text = 'اسطنبول ', data = IdUser..'X14'},},
{{text = 'انقرا', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/انقرا'},},
}}
local TextHelp = [[*•  ما هو الاسم الحالي لمدينه القسطنطينيه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X14') then
local UserId = Text:match('(%d+)X14')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X15'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X15') then
local UserId = Text:match('(%d+)X15')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '6 جيب', data = IdUser..'/Wrong'},},
{{text = '8 جيب', data = IdUser..'Z16'},},
{{text = '4 جيب', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/8 جيب'},},
}}
local TextHelp = [[*•  كم عدد الجيوب الانفيه داخل جسم الانسان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z16') then
local UserId = Text:match('(%d+)Z16')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z17'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z17') then
local UserId = Text:match('(%d+)Z17')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'امريكا', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'Z18'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/لندن'},},
}}
local TextHelp = [[*•  في اي مدينه تقع ساعه بيج بين الشهيره ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z18') then
local UserId = Text:match('(%d+)Z18')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z19'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z19') then
local UserId = Text:match('(%d+)Z19')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 فصول', data = IdUser..'/Wrong'},},
{{text = '4 فصول', data = IdUser..'Z20'},},
{{text = '5 فصول', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/4 فصول'},},
}}
local TextHelp = [[*•  كم عدد فصول السنه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z20') then
local UserId = Text:match('(%d+)Z20')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل للمستوي الثاني ', data = IdUser..'C21'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه ونجحت في تخطي المستوي الاول يا بطل  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C21') then
local UserId = Text:match('(%d+)C21')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفحم', data = IdUser..'/Wrong'},},
{{text = 'المنجنيز', data = IdUser..'/Wrong'},},
{{text = 'البترول ', data = IdUser..'C22'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/البترول'},},
}}
local TextHelp = [[*•  إلي ماذا يشير مصطلح الذهب الاسود ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C22') then
local UserId = Text:match('(%d+)C22')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C23'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C23') then
local UserId = Text:match('(%d+)C23')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصقر ', data = IdUser..'/Wrong'},},
{{text = 'الشعله', data = IdUser..'/Wrong'},},
{{text = 'النسر ', data = IdUser..'C24'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/النسر'},},
}}
local TextHelp = [[*•  الولايات المتحده الامريكيه دوله مميزه وفريده فما هو شعارها؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C24') then
local UserId = Text:match('(%d+)C24')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C25'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C25') then
local UserId = Text:match('(%d+)C25')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '20 سن ', data = IdUser..'/Wrong'},},
{{text = '40 سن', data = IdUser..'V26'},},
{{text = '60 سن', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/40 سن'},},
}}
local TextHelp = [[*•  كم عدد اسنان القط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end

elseif Text and Text:match('(%d+)V26') then
local UserId = Text:match('(%d+)V26')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V27'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V27') then
local UserId = Text:match('(%d+)V27')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 قلوب ', data = IdUser..'V28'},},
{{text = '4 قلوب  ', data = IdUser..'/Wrong'},},
{{text = '5 قلوب', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/3 قلوب'},},
}}
local TextHelp = [[*•  كم قلب للاخطبوط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V28') then
local UserId = Text:match('(%d+)V28')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V29'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V29') then
local UserId = Text:match('(%d+)V29')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مصر ', data = IdUser..'V30'},},
{{text = 'انجلترا ', data = IdUser..'/Wrong'},},
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/مصر'},},
}}
local TextHelp = [[*•  اين افتتح اول متحف في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V30') then
local UserId = Text:match('(%d+)V30')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B31'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B31') then
local UserId = Text:match('(%d+)B31')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفرنسيه ', data = IdUser..'/Wrong'},},
{{text = 'الإسبانيه ', data = IdUser..'B32'},},
{{text = 'الانجليزيه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الإسبانيه'},},
}}
local TextHelp = [[*•  ماهي اللغه الرسميه للارجنتين؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B32') then
local UserId = Text:match('(%d+)B32')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B33'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B33') then
local UserId = Text:match('(%d+)B33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الهادي ', data = IdUser..'B34'},},
{{text = 'الهندي ', data = IdUser..'/Wrong'},},
{{text = 'الاطلنطي', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الهادي'},},
}}
local TextHelp = [[*•  ما هو اكبر محيط في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B34') then
local UserId = Text:match('(%d+)B34')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B35'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B35') then
local UserId = Text:match('(%d+)B35')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'القوه ', data = IdUser..'N36'},},
{{text = 'الغرور ', data = IdUser..'/Wrong'},},
{{text = 'الكبرياء', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/القوه'},},
}}
local TextHelp = [[*•  ماذا تعني كلمه جنكيزخان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N36') then
local UserId = Text:match('(%d+)N36')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N37'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N37') then
local UserId = Text:match('(%d+)N37')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '4 لترات ', data = IdUser..'/Wrong'},},
{{text = '5 لترات', data = IdUser..'/Wrong'},},
{{text = '6 لترات ', data = IdUser..'N38'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/6 لترات'},},
}}
local TextHelp = [[*•  ما سعه جسم الانسان من الدم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N38') then
local UserId = Text:match('(%d+)N38')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N39'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N39') then
local UserId = Text:match('(%d+)N39')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السعوديه ', data = IdUser..'/Wrong'},},
{{text = 'اليمن', data = IdUser..'/Wrong'},},
{{text = 'عمان ', data = IdUser..'N40'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/عمان'},},
}}
local TextHelp = [[*•  اين يوجد الجبل الاخضر؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N40') then
local UserId = Text:match('(%d+)N40')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل إلي المستوي الاخير ', data = IdUser..'M41'},},}}
local TextHelp = [[*•  احسنت يا بطل الابطال لقد تخطيت المستوي الثاني وهو المتوسط انتقل لاخر المستويات الان   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M41') then
local UserId = Text:match('(%d+)M41')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'طه ', data = IdUser..'M42'},},
{{text = 'المطففين ', data = IdUser..'/Wrong'},},
{{text = 'العمران', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/طه'},},
}}
local TextHelp = [[*•  ما هي السوره التي كانت سببا في إسلام عمر بن الخطاب رضي الله عنه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M42') then
local UserId = Text:match('(%d+)M42')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M43'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M43') then
local UserId = Text:match('(%d+)M43')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصومال ', data = IdUser..'M44'},},
{{text = 'ماليزيا ', data = IdUser..'/Wrong'},},
{{text = 'السودان', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الصومال'},},
}}
local TextHelp = [[*•  ما هي الدوله العربيه التي يمر بها خط الاستواء ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M44') then
local UserId = Text:match('(%d+)M44')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M45'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M45') then
local UserId = Text:match('(%d+)M45')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الورق ', data = IdUser..'/Wrong'},},
{{text = 'الاموال', data = IdUser..'/Wrong'},},
{{text = 'الطوابع ', data = IdUser..'A46'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الطوابع'},},
}}
local TextHelp = [[*•  انجلترا لا تضع إسمها على؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A46') then
local UserId = Text:match('(%d+)A46')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A47'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A47') then
local UserId = Text:match('(%d+)A47')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '126 غرفه', data = IdUser..'/Wrong'},},
{{text = '110 غرفه', data = IdUser..'/Wrong'},},
{{text = '143 غرفه ', data = IdUser..'A48'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/غرفه 143'},},
}}
local TextHelp = [[*•  عدد غرف البيت الابيض؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A48') then
local UserId = Text:match('(%d+)A48')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A49'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A49') then
local UserId = Text:match('(%d+)A49')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الدب', data = IdUser..'/Wrong'},},
{{text = 'حصان البحر ', data = IdUser..'A50'},},
{{text = 'فرس النهر', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/حصان البحر'},},
}}
local TextHelp = [[*•  الحيوان الذي يقوم ذكره بمهمه الحمل بدلاً من الانثى هو ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A50') then
local UserId = Text:match('(%d+)A50')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S51'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه إجمد قربت تكسب   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S51') then
local UserId = Text:match('(%d+)S51')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '11 عام', data = IdUser..'/Wrong'},},
{{text = '22 عام ', data = IdUser..'S52'},},
{{text = '33 عام', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/عام 33'},},
}}
local TextHelp = [[*•  القرامطه سرقوا الحجر الاسود من مكه المكرمه واعادوه بعد؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S52') then
local UserId = Text:match('(%d+)S52')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S53'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S53') then
local UserId = Text:match('(%d+)S53')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الإغريق', data = IdUser..'/Wrong'},},
{{text = 'اليونانيين', data = IdUser..'/Wrong'},},
{{text = 'المصريين القدماء ', data = IdUser..'S54'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/القدماء المصريين'},},
}}
local TextHelp = [[*من الشعب الذي ابتكر التقويم الشمسي؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S54') then
local UserId = Text:match('(%d+)S54')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S55'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S55') then
local UserId = Text:match('(%d+)S55')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الثعبان', data = IdUser..'D56'},},
{{text = 'التمساح', data = IdUser..'/Wrong'},},
{{text = 'السمك', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الثعبان'},},
}}
local TextHelp = [[*مما هو الحيوان الذي يتنفس بلسانه؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D56') then
local UserId = Text:match('(%d+)D56')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D57'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D57') then
local UserId = Text:match('(%d+)D57')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '206', data = IdUser..'/Wrong'},},
{{text = '406', data = IdUser..'/Wrong'},},
{{text = '706', data = IdUser..'D58'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/706'},},
}}
local TextHelp = [[*كم عدد الناجين من سفينه التايتنك؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D58') then
local UserId = Text:match('(%d+)D58')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D59'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D59') then
local UserId = Text:match('(%d+)D59')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السلحفاه', data = IdUser..'/Wrong'},},
{{text = 'الضفدع', data = IdUser..'D60'},},
{{text = 'السحليه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الضفدع'},},
}}
local TextHelp = [[*من هو الحيوان الذي لا يعد من الزواحف من قائمه الحيوانات الآتيه ؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D60') then
local UserId = Text:match('(%d+)D60')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعاده اللعبه ', data = IdUser..'Ml'},},}}
local TextHelp = [[*•   تم الانتهاء من جميع الاسئله بنجاح عاش يا بطل 💕??*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Del8by') then
local UserId = Text:match('(%d+)/Del8by')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."8by:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'ـ رجـوع ❇️', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"•  تم مسح جميع الاغبياء", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"•  تم مسح المحظورين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanGroup') and data.Admin then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"•  تم مسح المحظورين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') and data.Admin then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SilentGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اظهار القوائم 💌",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"•  تم مسح المكتومين", "md",true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/xogamesta//') then
local UserIdii = Text:match('(%d+)/xogamesta')
if tonumber(UserIdii) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "〈 مينفعش تلعب مع نفسك ??♥ 〉", true)
end
Redis:setex(Fast.."xopleyers"..UserIdii..":"..ChatId,300, "❌")
Redis:setex(Fast.."xopleyers"..IdUser..":"..ChatId,300, "⭕️")
Redis:setex(Fast.."xotern"..UserIdii..":"..ChatId,300,true)
return xogames(ChatId,UserIdii,IdUser,Msg_id)
end

if Text and Text:match('(%d+)/xo1//(%d+)') then
local UserId = {Text:match('(%d+)/xo1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear1"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• هذا زر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear1"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin1"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, isha, nil, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo2//(%d+)') then
local UserId = {Text:match('(%d+)/xo2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear2"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear2"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin2"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, isha, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo3//(%d+)') then
local UserId = {Text:match('(%d+)/xo3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear3"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear3"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin3"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, isha, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo4//(%d+)') then
local UserId = {Text:match('(%d+)/xo4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear4"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear4"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin4"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, isha, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end

if Text and Text:match('(%d+)/xo5//(%d+)') then
local UserId = {Text:match('(%d+)/xo5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear5"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear5"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin5"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, isha, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo6//(%d+)') then
local UserId = {Text:match('(%d+)/xo6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear6"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear6"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin6"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)     
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, isha, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo7//(%d+)') then
local UserId = {Text:match('(%d+)/xo7//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear7"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear7"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin7"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, isha, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo8//(%d+)') then
local UserId = {Text:match('(%d+)/xo8//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear8"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear8"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(Fast.."xoswin8"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *"
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, isha, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo9//(%d+)') then
local UserId = {Text:match('(%d+)/xo9//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(Fast.."xosgear9"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(Fast.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(Fast.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(Fast.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xosgear9"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)    
    Redis:setex(Fast.."xoswin9"..currentPlayer..":"..ChatId,300,true)
    Redis:del(Fast.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(Fast.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(Fast.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "*• الان دور اللاعب ⋮ ⦉ "..nextPlayerName.." ⦊ ⦉ "..Redis:get(Fast.."xopleyers"..nextPlayer..":"..ChatId).." ⦊ *" 
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, nil, isha, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end

-----------
if Text and Text:match('(%d+)/del5ll') then
local UserId = Text:match('(%d+)/del5ll')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 50 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 50 رساله*", "md")
end

if Text and Text:match('(%d+)/del10ll') then
local UserId = Text:match('(%d+)/del10ll')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 100 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 100 رساله*", "md")
end

if Text and Text:match('(%d+)/del20io') then
local UserId = Text:match('(%d+)/del20io')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 200 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 200 رساله*", "md")
end

if Text and Text:match('(%d+)/del30ui') then
local UserId = Text:match('(%d+)/del30ui')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 300 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 300 رساله*", "md")
end

if Text and Text:match('(%d+)/del50ew') then
local UserId = Text:match('(%d+)/del50ew')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 500 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 500 رساله*", "md")
end

if Text and Text:match('(%d+)/del100vc') then
local UserId = Text:match('(%d+)/del100vc')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 1000 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 1000 رساله*", "md")
end

if Text and Text:match('(%d+)/del58sue') then
local UserId = Text:match('(%d+)/del58sue')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 400 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 400 رساله*", "md")
end

if Text and Text:match('(%d+)/del60ri') then
local UserId = Text:match('(%d+)/del60ri')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 600 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 600 رساله*", "md")
end

if Text and Text:match('(%d+)/del80rv') then
local UserId = Text:match('(%d+)/del80rv')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 700 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 700 رساله*", "md")
end

if Text and Text:match('(%d+)/del90wz') then
local UserId = Text:match('(%d+)/del90wz')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 800 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 800 رساله*", "md")
end

if Text and Text:match('(%d+)/del90rm') then
local UserId = Text:match('(%d+)/del90rm')
if tonumber(UserId) ~= tonumber(data.sender_user_id) then
return bot.answerCallbackQuery(data.id, "• عذرآ هذا الامر لا يخصك", true)
end
bot.editMessageText(data.chat_id, data.message_id, "*• جاري حذف الرسائل ...*", "md", true)
local ProtectedMessageId = data.message_id
local Message = ProtectedMessageId - 1048576
for i = 1, 900 do
bot.deleteMessages(data.chat_id, {[1] = Message})
Message = Message - 1048576
end
return send(msg_chat_id, 0, "*• تم مسح 900 رساله*", "md")
end

if Text and Text:match("(%d+)/BuySpecial") then
local UserId = Text:match("(%d+)/BuySpecial")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Special:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه مميز بالفعل", true)
elseif Num < 500 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء مميز (تحتاج 500 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 500)
Redis:sadd(Fast.."Special:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى مميز وتم خصم 500 نقطه.*", "md")
end
end
end

if Text and Text:match("(%d+)/BuyAdmin") then
local UserId = Text:match("(%d+)/BuyAdmin")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه ادمن بالفعل", true)
elseif Num < 2000 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء ادمن (تحتاج 2000 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 2000)
Redis:sadd(Fast.."Admin:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى ادمن وتم خصم 2000 نقطه.*", "md")
end
end
end

if Text and Text:match("(%d+)/BuyCreatorr") then
local UserId = Text:match("(%d+)/BuyCreatorr")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه منشئ بالفعل", true)
elseif Num < 3200 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء منشئ (تحتاج 3200 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 3200)
Redis:sadd(Fast.."Creator:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى منشئ وتم خصم 3200 نقطه.*", "md")
end
end
end

if Text and Text:match("(%d+)/BuyManger") then
local UserId = Text:match("(%d+)/BuyManger")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه مدير بالفعل", true)
elseif Num < 3800 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء مدير (تحتاج 3800 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 3800)
Redis:sadd(Fast.."Manger:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى مدير وتم خصم 3800 نقطه.*", "md")
end
end
end

if Text and Text:match("(%d+)/BuySuperCreator") then
local UserId = Text:match("(%d+)/BuySuperCreator")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه منشئ اساسي بالفعل", true)
elseif Num < 4100 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء منشئ اساسي (تحتاج 4100 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 4100)
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى منشئ اساسي وتم خصم 4100 نقطه.*", "md")
end
end
end

if Text and Text:match("(%d+)/BuyOwnerss") then
local UserId = Text:match("(%d+)/BuyOwnerss")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك رتبه مالك بالفعل", true)
elseif Num < 18000 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء مالك (تحتاج 18000 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 18000)
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id, IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى مالك وتم خصم 18000 نقطه.*", "md")
end
end
end


if Text and Text:match("(%d+)/BuyDev") then
local UserId = Text:match("(%d+)/BuyDev")
if tonumber(IdUser) == tonumber(UserId) then
local Num = tonumber(Redis:get(Fast.."Num:Add:Games"..msg_chat_id..IdUser) or 0)
if Redis:sismember(Fast.."Dev:Groups", IdUser) then
return bot.answerCallbackQuery(data.id, "• لديك بالفعل رتبه مطور.", true)
elseif Num < 35000 then
return bot.answerCallbackQuery(data.id, "• نقاطك لا تكفي لشراء مطور (تحتاج 35000 نقطه).", true)
else
Redis:decrby(Fast.."Num:Add:Games"..msg_chat_id..IdUser, 35000)
Redis:sadd(Fast.."Dev:Groups", IdUser)
return edit(ChatId, Msg_id, "*• تم ترقيتك إلى مطور وتم خصم 35000 نقطه.*", "md")
end
end
end

if Text and Text:match('(%d+)/rabet_mos') then
local UserId = Text:match('(%d+)/rabet_mos')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الروابط لجميع المستخدمين 🌿❤️.
*]]
Redis:set(Fast.."Loock:Liik"..msg_chat_id,"del")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/rabet_kol') then
local UserId = Text:match('(%d+)/rabet_kol')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• حدد نوع العقوبه علي الاعضاء 🌿❤️.
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ بالحذف ･', data=IdUser.."/rabet_hzf"},
},
{
{text = '･ بالڪتم ･', data=IdUser.."/rabet_ktm"},
},
{
{text = '･ بالطرد ･', data=IdUser.."/rabet_hazr"},
},
{
{text = '･ بالتقييد ･', data=IdUser.."/rabet_tak"},
},
}
}
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/rabet_hzf') then
local UserId = Text:match('(%d+)/rabet_hzf')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الروابط بالحذف لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Link"..msg_chat_id,"del")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end


if Text and Text:match('(%d+)/rabet_ktm') then
local UserId = Text:match('(%d+)/rabet_ktm')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الروابط بالكتم لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ktm")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/rabet_hazr') then
local UserId = Text:match('(%d+)/rabet_hazr')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الروابط بالطرد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Link"..msg_chat_id,"kick")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/rabet_tak') then
local UserId = Text:match('(%d+)/rabet_tak')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الروابط بالتقييد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ked")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/forward_mos') then
local UserId = Text:match('(%d+)/forward_mos')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل التوجيه لجميع المستخدمين 🌿❤️.
*]]
Redis:set(Fast.."Lock:foww"..msg_chat_id,"del")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end


if Text and Text:match('(%d+)/forward_kol') then
local UserId = Text:match('(%d+)/forward_kol')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• حدد نوع العقوبه علي الاعضاء 🌿❤️.
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ بالحذف ･', data=IdUser.."/fow_hzf"},
},
{
{text = '･ بالطرد ･', data=IdUser.."/fow_hazr"},
},
{
{text = '･ بالتقييد ･', data=IdUser.."/fow_tak"},
},
}
}
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/fow_hzf') then
local UserId = Text:match('(%d+)/fow_hzf')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل التوجيه بالحذف لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:forward"..msg_chat_id,"del")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end


if Text and Text:match('(%d+)/fow_hazr') then
local UserId = Text:match('(%d+)/fow_hazr')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل التوجيه بالطرد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:forward"..msg_chat_id,"kick")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/fow_tak') then
local UserId = Text:match('(%d+)/fow_tak')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل التوجيه بالتقييد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ked")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/mlsk_kol') then
local UserId = Text:match('(%d+)/mlsk_kol')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• حدد نوع العقوبه علي الاعضاء 🌿❤️.
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ بالحذف ･', data=IdUser.."/mlsk_hzf"},
},
{
{text = '･ بالڪتم ･', data=IdUser.."/mlsk_ktm"},
},
{
{text = '･ بالطرد ･', data=IdUser.."/mlsk_hazr"},
},
{
{text = '･ بالتقييد ･', data=IdUser.."/mlsk_tak"},
},
}
}
return edit(ChatId,Msg_id, Timo, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/mlsk_hzf') then
local UserId = Text:match('(%d+)/mlsk_hzf')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الملصقات بالحذف لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end


if Text and Text:match('(%d+)/mlsk_ktm') then
local UserId = Text:match('(%d+)/mlsk_ktm')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الملصقات بالكتم لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ktm")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/mlsk_hazr') then
local UserId = Text:match('(%d+)/mlsk_hazr')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الملصقات بالطرد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"kick")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/mlsk_tak') then
local UserId = Text:match('(%d+)/mlsk_tak')
if tonumber(IdUser) == tonumber(UserId) then
local Timo = [[*
• تم قفل الملصقات بالتقييد لجميع الاعضاء 🌿❤️.
*]]
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ked")  
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/open_masr') then
local UserId = Text:match('(%d+)/open_masr')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• بواسطه ⦉ "..Text.. "⦊ \n• تم تفعيل ردود البوت المصريه 🌿❤️.*"
Redis:set(Fast.."Timoo:Selvaa"..msg_chat_id,true)
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/open_Iraq') then
local UserId = Text:match('(%d+)/open_Iraq')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• بواسطه ⦉ "..Text.. "⦊ \n• تم تفعيل ردود البوت العراقيه 🌿❤️.*"
Redis:set(Fast.."Timo:Iraq"..msg_chat_id,true)
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/clocs_masr') then
local UserId = Text:match('(%d+)/clocs_masr')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• بواسطه ⦉ "..Text.. "⦊ \n• تم تعطيل ردود البوت المصريه 🌿❤️.*"
Redis:del(Fast.."Timoo:Selvaa"..msg_chat_id)
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text and Text:match('(%d+)/clocs_Iraq') then
local UserId = Text:match('(%d+)/clocs_Iraq')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• بواسطه ⦉ "..Text.. "⦊ \n• تم تعطيل ردود البوت العراقيه 🌿❤️.*"
Redis:del(Fast.."Timo:Iraq"..msg_chat_id)
return edit(ChatId,Msg_id, Timo, 'md', true)
end
end

if Text == "join_spy_game" then
local can_message = pcall(function()
send(IdUser, 0, "*• اجهز يا رايق *", "md")
end)
if not user_started_chat(IdUser) then
return bot.answerCallbackQuery(data.id, "• لازم تبدأ محادثة مع البوت الأول ابعت /start في خاص البوت", true)
end
if Redis:sismember("SpyGame:Players"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id, "• انت انضممت مسبقا", true)
end
Redis:sadd("SpyGame:Players"..ChatId, IdUser)
local players = Redis:smembers("SpyGame:Players"..ChatId)
local text = "*• عدد اللاعبين التي انضمو ⋮ ⦉ "..#players.." ⦊\n• تاكد من وجود محادثه بينك وبين البوت*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "• انضمام •", data = "join_spy_game"},
},
{
{text = "• بدء اللعبه •", data = "spy_start"},
},
}
}
edit(ChatId, Msg_id, text, "md", true, false, reply_markup)
return bot.answerCallbackQuery(data.id, "تم الانضمام!", false)
end

if Text == "spy_start" then
local owner_id = Redis:get(Fast.."SpyGame:Owner:"..ChatId)
if tonumber(IdUser) ~= tonumber(owner_id) then
return bot.answerCallbackQuery(data.id, "❌ فقط من بدا اللعبه يمكنه الضغط على هذا الزر!", true)
end
local players = Redis:smembers("SpyGame:Players"..ChatId)
if #players < 3 then
return bot.answerCallbackQuery(data.id, "يجب وجود 3 لاعبين على الاقل!", true)
end
local new_game_id = tostring(os.time())
Redis:set("SpyGame:CurrentGameId:"..ChatId, new_game_id)
Redis:del("SpyGame:Votes:"..ChatId..":"..new_game_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "• ماكولات •", data = "spy_category_food"},
},
{
{text = "• مشروبات •", data = "spy_category_drinks"},
},
{
{text = "• اماكن •", data = "spy_category_places"},
},
{
{text = "• حيوانات •", data = "spy_category_animals"},
},
}
}
edit(ChatId, Msg_id, "*• اختار الفئه المناسبه للعبه *", "md", true, false, reply_markup)
return bot.answerCallbackQuery(data.id, "اختر الفئه", false)
end

local categories = {
spy_category_places = {
"المدرسه", "الجامعه", "المستشفى", "الشارع", "الكورنيش", "المول", "السينما", "المطعم", "المكتبه", "الميدان",
"الكافيه", "البنك", "المتحف", "الجامع", "الكنيسه", "المطار", "القطار", "المكتبه", "السينما", "الملعب",
"الكافيتريا", "الشارع الرئيسي", "السوق", "الصيدليه", "المخبز", "الحديقه", "المسرح", "المحطه", "الصالون", "البيت",
"المصنع", "المصنع", "المزرعه", "الدوار", "الجامع الكبير", "المكتبه العامه", "المدرسه الخاصه", "النادي", "العماره", "البنايه",
"المسجد الكبير", "الكنيسه القديمه", "المسجد الصغير", "الحديقه العامه", "المركز التجاري", "المطعم الشعبي", "المقهى الشعبي", "المطبخ", "المستودع", "البرج"
},

spy_category_food = {
"كشري", "فول", "طعميه", "ملوخيه", "بيتزا", "برجر", "سمبوسه", "شاورما", "حمص", "بطاطس",
"مكرونه", "رز", "لحم", "دجاج", "سمك", "كباب", "طاجن", "مندي", "برياني", "محشي",
"فلافل", "سلطه", "عصير", "لبن", "زيت", "سكر", "ملح", "عيش", "جبنه", "زبادي",
"سجق", "شوربه", "فراخ", "لحم مفروم", "كفته", "بانيه", "مخلل", "مشروب غازي", "قهوه", "شاي",
"تمر", "عسل", "زبده", "شوكولاته", "عصير برتقال", "كريمه", "كاسترد", "جزر", "خيار", "طماطم"
},

spy_category_animals = {
"قطه", "كلب", "حصان", "بقره", "جمل", "دجاجه", "ديك", "بطّه", "سمكه", "نمله",
"فار", "ثعلب", "ذئب", "اسد", "نمره", "فهد", "زرافه", "فيل", "كنغر", "قرش",
"تمساح", "سلحفاه", "بطه", "وزه", "خروف", "ماعز", "غزاله", "سنجاب", "خفاش", "بومه",
"بطريق", "عصفور", "حمامه", "صقر", "نسر", "غراب", "بلبل", "حمير", "جدي", "طاووس",
"فراشه", "نحله", "نسر", "عنكبوت", "عقرب", "ارنب", "سمان", "دلفين", "حوت", "كركدن"
}, 

spy_category_drinks = {
"شاي", "قهوه", "عصير", "مياه", "بيبسي", "كوكاكولا", "سودا", "ليمون", "موهيتو", "حليب",
"لبن", " طاقه", "شوكولاته ساخنه", "شاي اخضر", "شاي كرك", "عصير مانجو", "عصير فراوله", " ", "  بالليمون", "نكتار",
"ميه ه", "كابتشينو", "اسبريسو", "موكا", "لاتيه", "ميلك شيك", "سودا ليمون", "ليمون", "تمر هندي", "عصير رمان",
"عصير تفاح", "عصير جوافه", "كولا دايت", " رياضي", "شاي مثلج", "شاي بالنعناع", "مياه معدنيه", "مياه معدنيه ه", "ليموناضه بالنعناع", "موهيتو فراوله",
"  كولا", "عصير خوخ", "عصير برتقال", "عصير اناناس", "شاي", "عناب", " كركديه", "شاي", " تمر هندي", "ماء زمزم"
},
}

if Text:match("^spy_category_") then
local list = categories[Text]
if not list then return end
local owner_id = Redis:get(Fast.."SpyGame:Owner:"..ChatId)
if tonumber(IdUser) ~= tonumber(owner_id) then
return bot.answerCallbackQuery(data.id, "❌ فقط من بدا اللعبه يمكنه الضغط على هذا الزر!", true)
end
local players = Redis:smembers("SpyGame:Players"..ChatId)
local spy = players[math.random(#players)]
local word = list[math.random(#list)]
Redis:set("SpyGame:Spy"..ChatId, spy)
Redis:set("SpyGame:Word"..ChatId, word)
Redis:set("SpyGame:PlayerList"..ChatId, table.concat(players, ","))
Redis:set("SpyGame:ExplainIndex"..ChatId, 1)
for _, id in ipairs(players) do
if tostring(id) == tostring(spy) then
send(id, 0, "*• انت الجاسوس 😂❤️.*", "md")
else
send(id, 0, "*• الكلمه هي  ⦉ "..word.." ⦊*", "md")
end
end
edit(ChatId, Msg_id, "*• تم ارسال الكلمه في خاص البوت !\nالان يبدا دور المشتركين بشرح الكلمه للجاسوس*", "md")
explain_next_player(ChatId)
return bot.answerCallbackQuery(data.id, "بدات اللعبه", false)
end


if Text:match("^togglefile:(.+)$") then
if IdUser ~= Sudo_Id then
return bot.answerCallbackQuery(data.id, "• هذا الامر يخص المطور الاساسي ينجم", true)
end
local filename = Text:match("^togglefile:(.+)$")
local key = Fast..'files'
if Redis:sismember(key, filename) then
Redis:srem(key, filename) 
bot.answerCallbackQuery(data.id, "• تم تفعيل ملف ⋮ ⦉ " .. filename .. " ⦊", true)
else
Redis:sadd(key, filename)
bot.answerCallbackQuery(data.id, "• تم تعطيل ملف ⋮ ⦉ " .. filename .. " ⦊", true)
end
local files = {}
for file in io.popen('ls plugin'):lines() do
table.insert(files, file)
end
local buttons = {}
for i, fname in ipairs(files) do
local state = Redis:sismember(key, fname) and "⦉ ❌ ⦊" or "⦉ ✅ ⦊"
local btnText = fname .. " " .. state
table.insert(buttons, {{text = btnText, data = "togglefile:" .. fname}})
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = buttons
}
edit(ChatId, Msg_id, "*قائمة ملفاتك (اضغط على اسم ملف لتفعيل/تعطيل)*", "md", true, false, reply_markup)
end

if Text and Text:match("(%d+)/quran_(%d+)") then
local UserId, timo = Text:match("(%d+)/quran_(%d+)")
if tonumber(UserId) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
timo = tonumber(timo)
Redis:set(Fast.."quran_selva:"..UserId, timo)
local next_timo = timo < 604 and timo + 1 or nil
local prev_timo = timo > 1 and timo - 1 or nil
local keyboard = { inline_keyboard = {} }
if next_timo then
table.insert(keyboard.inline_keyboard, {
{text = "• الصفحة التالية •", callback_data = UserId.."/quran_"..next_timo}})
end
if prev_timo then
table.insert(keyboard.inline_keyboard, {
{text = "• الصفحة السابقة •", callback_data = UserId.."/quran_"..prev_timo}})
end
local media_url = "https://raw.githubusercontent.com/GovarJabbar/Quran-PNG/refs/heads/master/"..string.format("%03d", timo)..".png"
local caption = "*• صـفـحـه رقـم ⦉ "..timo.." ⦊ 🌿❤️.*"
local media = {type = "photo",media = media_url,caption = caption,parse_mode = "Markdown"}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&message_id="..mm.."&media="..URL.escape(JSON.encode(media)).."&reply_markup="..URL.escape(JSON.encode(keyboard)))
end 

local surah_links = {}
for i = 2, 115 do
table.insert(surah_links, "https://t.me/selva_qraan/"..i)
end

for i = 1, 120 do
if Text and Text:match("(%d+)/surah_"..i.."_1_(%d+)") then
local UserId, page = Text:match("(%d+)/surah_"..i.."_1_(%d+)")
page = tonumber(page)
if tonumber(IdUser) == tonumber(UserId) then
local user_info = bot.getUser(IdUser)
local media = {
type = "audio",
media = surah_links[i],
caption = "• بواسطة ⋮ ⦉ " .. user_info.first_name .. " ⦊\n• بوت ⋮ ⦉ @" .. UserBot .. " ⦊ \n\nتم تحميل السورة بنجاح ✅",
parse_mode = "html"
}
local keyboard = {
inline_keyboard = {
{
{text = "رجوع ↺", callback_data = UserId .. "/next_" .. ((page - 1) * 20 + 1)}
}
}
}
local message_id_fixed = math.floor(Msg_id / 2097152 / 0.5)
https.request("https://api.telegram.org/bot" .. Token .. "/editMessageMedia?chat_id=" .. ChatId .."&message_id=" .. message_id_fixed .."&media=" .. URL.escape(JSON.encode(media)) .."&reply_markup=" .. URL.escape(JSON.encode(keyboard)))
end
end
end

if Text and Text:match('(%d+)/next_(%d+)') then
local UserId, start_index = Text:match('(%d+)/next_(%d+)')
if tonumber(IdUser) == tonumber(UserId) then
start_index = tonumber(start_index)

local all_surahs = {
{
"الفاتحة", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
"هود", "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه"
},
{
"الأنبياء", "الحج", "المؤمنون", "النور", "الفرقان", "الشعراء", "النمل", "القصص", "العنكبوت", "الروم",
"لقمان", "السجدة", "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر"
},
{
"فصلت", "الشورى", "الزخرف", "الدخان", "الجاثية", "الأحقاف", "محمد", "الفتح", "الحجرات", "ق",
"الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة", "الحشر", "الممتحنة"
},
{
"الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج",
"نوح", "الجن", "المزّمّل", "المدّثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس"
},
{
"التكوير", "الإنفطار", "المطفّفين", "الإنشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد",
"الشمس", "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات"
},
{
"القارعة", "التكاثر", "العصر", "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر",
"المسد", "الإخلاص", "الفلق", "الناس"
}
}
local page_index = math.floor((start_index - 1) / 20) + 1
local surah_names = all_surahs[page_index]
if surah_names then
local keyboard = { inline_keyboard = {} }
for i = 1, #surah_names, 2 do
local row = {
{text = "• "..surah_names[i] .. " •", callback_data = UserId.."/surah_"..(start_index + i - 1).."_1_"..page_index}
}
if surah_names[i+1] then
table.insert(row, {text = "• "..surah_names[i+1] .. " •", callback_data = UserId.."/surah_"..(start_index + i).."_1_"..page_index})
end
table.insert(keyboard.inline_keyboard, row)
end
local prev_index = start_index - 20
local next_index = start_index + 20
local last_page = 101
local nav_buttons = {}
if prev_index >= 1 then
table.insert(nav_buttons, {text = "« السابق", callback_data = UserId.."/next_"..prev_index})
end
if start_index < last_page then
table.insert(nav_buttons, {text = "التالي »", callback_data = UserId.."/next_"..next_index})
end
if #nav_buttons > 0 then
table.insert(keyboard.inline_keyboard, nav_buttons)
end
local au = {
type = "photo",
media = "https://t.me/UOUSOU/95",
caption = '*• الـيـك سـور الـقـران الـڪـريم*\n',
parse_mode = "Markdown"
}
local mm = math.floor(Msg_id / 2097152 / 0.5)
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end
end
end




end

end 

return {Fast = Callback}
