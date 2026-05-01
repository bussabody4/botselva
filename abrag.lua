function abrag(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "روزا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
end
end
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end

if text == "تفعيل الابراج" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الامر يخص المدير")
end
Redis:del(Fast..msg.chat_id.."abrag")
send(msg.chat_id,msg.id,"• تم تفعيل الابراج")
end
if text == "تعطيل الابراج" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الامر يخص المدير")
end
Redis:set(Fast..msg.chat_id.."abrag",true)
send(msg.chat_id,msg.id,"• تم تعطيل الابراج")
end

if text == "الابراج" or text == "الابرج" or text == "ابراج" then
if Redis:get(Fast..msg.chat_id.."abrag") then
return send(msg.chat_id,msg.id,"• الابراج معطله يرجي تفعيلا الاول ")
end
local t = "*〈 اعـرف بـرجـك يـروحي 🥺♥ 〉  *"
local m = "https://t.me/UOUSOU/30"
local Timo = bot.getUser(Sudo_Id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• اضغط لمعرفه برجك •', callback_data = msg.sender_id.user_id.."/zDRGd"},
},
{
{text = '• مـطـور الـبـوت •', url = "https://t.me/"..Timo.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard)) 
end

end
return {Fast = abrag}