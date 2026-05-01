--[[
تـيـممؤ
]]--

URL     = require("url")
JSON    = require("dkjson")
serpent = require("serpent")
json = require('json')
local redis_url = os.getenv("REDIS_URL") or "redis://127.0.0.1:6379"
Redis = require('redis').connect(redis_url)

http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require 'td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 Fast.lua
done
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('rm -rf bot.zip ;chmod +x *;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Fast,token=Token}
devsource = Redis:get(Fast..'devsource') or "Di_il"
chsource = Redis:get(Fast..'chsource') or "Sudanese_56"
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function requestt(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function convert_time(hours)
  local second = 0
  if hours ~= nil then
      second = hours * 3600
  end
  return second
end
function request(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
function ctime(seconds)
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00"
else
hours = string.format("%02.f", math.floor(seconds/3600));
mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return mins..":"..secs
end
end

function timo_selva(chat_id, question, options)
local https = require("ssl.https")
local ltn12 = require("ltn12")
local url = "https://api.telegram.org/bot"..Token.."/sendPoll"
local data = {
chat_id = chat_id,
question = question,
options = JSON.encode(options),
is_anonymous = false
}
local post_data = {}
for k,v in pairs(data) do
table.insert(post_data, k .. "=" .. URL.escape(tostring(v)))
end
local body = table.concat(post_data, "&")
local response_body = {}
local res, code, headers, status = https.request{
url = url,
method = "POST",
headers = {
["Content-Type"] = "application/x-www-form-urlencoded",
["Content-Length"] = tostring(#body)
},
source = ltn12.source.string(body),
sink = ltn12.sink.table(response_body)
}
print("Response code: ", code)
print("Response body: ", table.concat(response_body))
return code == 200
end
function send_timo_selva(chat_id, game_type)
local emojis = {
dice = "🎲",
basketball = "🏀",
football = "⚽️",
bowling = "🎳",
darts = "🎯"
}
local emoji = emojis[game_type]
if not emoji then
print("نوع اللعبة غير معروف: " .. tostring(game_type))
return false
end
local url = "https://api.telegram.org/bot"..Token.."/sendDice"
local data = "chat_id=" .. chat_id .. "&emoji=" .. URL.escape(emoji)
local response_body = {}
local res, code = https.request{
url = url,
method = "POST",
headers = {
["Content-Type"] = "application/x-www-form-urlencoded",
["Content-Length"] = tostring(#data)
},
source = ltn12.source.string(data),
sink = ltn12.sink.table(response_body)
}
if code == 200 then
print("تم إرسال " .. game_type)
return true
else
print("فشل في إرسال " .. game_type .. ": " .. tostring(code))
return false
end
end

function user_started_chat(user_id)
local url = "https://api.telegram.org/bot" .. Token .. "/sendMessage"
local data = "chat_id=" .. user_id .. "&text=" .. URL.escape("...")
local response_body = {}
local res, code = https.request{
url = url,
method = "POST",
headers = {
["Content-Type"] = "application/x-www-form-urlencoded",
["Content-Length"] = tostring(#data)
},
source = ltn12.source.string(data),
sink = ltn12.sink.table(response_body)
}
if code == 403 then
return false
end
return true
end 

function plugins(msg)
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") and not Redis:sismember(Fast..'files',v) then
plugin = dofile("plugin/"..v)
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
end
end

function RunCallBack(msg)
if msg.edit_date then
return
end
plugin = dofile("src/Callback.lua")
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end

function src(msg)
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
src_files = dofile("src/"..v)
if src_files and src_files.Fast and msg then
results = src_files.Fast(msg)
end
end
end
end
function start_src()
i = 0
t = "source files \n"
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_src()
function start_plugin()
i = 0
t = "plugins \n"
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_plugin()
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit(chat,rep,text,parse, dis, disn, reply_markup)
shh = tostring(text)
if Redis:get(Fast..'rmzsource') then
shh = shh:gsub("• ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(shh, v)
if j and i then
local x = string.sub(shh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
shh = shh:gsub(x,neww)
else
shh = shh
end
end
return bot.editMessageText(chat,rep,shh, parse, dis, disn, reply_markup)
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
sh = tostring(text)
if Redis:get(Fast..'rmzsource') then
sh = sh:gsub("• ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(sh, v)
if j and i then
local x = string.sub(sh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
sh = sh:gsub(x,neww)
else
sh = sh
end
end
return bot.sendText(chat,rep,sh,parse,dis, clear, disn, back, markup)
end
function ss(msg,text) 
return send(msg.chat_id,msg.id,text)
end
function calc(math) 
math = math:gsub(" ","")
if math:match("%d+") then
local res = io.popen("echo 'scale=1; "..math.."' | bc"):read('*a')
return res
else
return "• لم استطيع اجراء العمليه الحسابيه"
end
end
function getbio(User)
kk = "لا يوجد"
local url = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result then
if data.result.bio then
kk = data.result.bio
end
end
return kk
end
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function coin(coin)
local Coins = tostring(coin)
local Coins = Coins:gsub('٠','0')
local Coins = Coins:gsub('١','1')
local Coins = Coins:gsub('٢','2')
local Coins = Coins:gsub('٣','3')
local Coins = Coins:gsub('٤','4')
local Coins = Coins:gsub('٥','5')
local Coins = Coins:gsub('٦','6')
local Coins = Coins:gsub('٧','7')
local Coins = Coins:gsub('٨','8')
local Coins = Coins:gsub('٩','9')
local Coins = Coins:gsub('-','')
local conis = tonumber(Coins)
return conis
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos = {Sudo_Id,6702141393,6961465370}
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
ControllerAll = true
end
end
return ControllerAll
end
function mderall(msg)
mderall = false
local statuse = Redis:sismember(Fast.."Specialall:Group",senderr)
if statuse then
mderall = true
end
return mderall
end
function Controllerbanall(ChatId,UserId)
Status = 0
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
if UserId == 6702141393 then
Status = true
elseif UserId == 6961465370 then  
Status = true
elseif UserId == 000000000 then  
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == Fast then
Status = true
elseif Controll2 then
Status = true
elseif Devss then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 6702141393 then
Status = 'المبرمج تـيــمـو'
elseif UserId == 6961465370 then  
Status = 'عبداللھَہّ البشيړ '
elseif UserId == 000000000 then  
Status = 'مـالك الـسـورس '
elseif UserId == Sudo_Id then  
Status = 'المطـور الاساسي '
elseif Controll2 then
Status = 'المطـور الاساسي '
elseif UserId == Fast then
Status = 'البوت'
elseif Devss then
Status = 'المطـور الثانوي '
elseif Dev then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Developer:Bot:Reply"..ChatId) or 'المطـــور '
elseif Ownerss then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."PresidentQ:Group:Reply"..ChatId) or  'المــــــالك ❤️'
elseif SuperCreator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."President:Group:Reply"..ChatId) or 'المنشئ الاساسي ❤️'
elseif Creator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Constructor:Group:Reply"..ChatId) or 'المنشــىء ❤️'
elseif Manger then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Manager:Group:Reply"..ChatId) or 'المـــــدير ❤️'
elseif Admin then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Admin:Group:Reply"..ChatId) or 'الادمـــــن ❤️'
elseif StatusMember == "chatMemberStatusCreator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مالك الجروب'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مشرف الجروب'
elseif Special then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Vip:Group:Reply"..ChatId) or 'المميــز ⭐️'
else
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Mempar:Group:Reply"..ChatId) or 'العضـو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
elseif tonumber(Num) == 8 then  
Status = 'المالك'
else
Status = 'المميز'
end  
return Status
end 
function FlterBio(Bio)
local Bio = tostring(Bio)
Bio = Bio:gsub("https://[%a%d_]+",'') 
Bio = Bio:gsub("http://[%a%d_]+",'') 
Bio = Bio:gsub("telegram.dog/[%a%d_]+",'') 
Bio = Bio:gsub("telegram.me/[%a%d_]+",'') 
Bio = Bio:gsub("t.me/[%a%d_]+",'') 
Bio = Bio:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Bio = Bio:gsub("@[%a%d_]+",'')
Bio = Bio:gsub("]","")
Bio = Bio:gsub("[[]","")
return Bio
end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = bot.getChatMember(ChatId,user2).status 
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
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تغيير المعلومات ⋮ ⦉ '..(t1 or change_info)..' ⦊', data = UserId..'/groupNum1//'..user2}, 
},
{
{text = 'تثبيت الرسائل ⋮ ⦉ '..(t2 or pin_messages)..' ⦊', data = UserId..'/groupNum2//'..user2}, 
},
{
{text = 'حظر المستخدمين ⋮ ⦉ '..(t3 or restrict_members)..' ⦊', data = UserId..'/groupNum3//'..user2}, 
},
{
{text = 'دعوة المستخدمين ⋮ ⦉ '..(t4 or invite_users)..' ⦊', data = UserId..'/groupNum4//'..user2}, 
},
{
{text = 'مسح الرسائل ⋮ ⦉ '..(t5 or delete_messages)..' ⦊', data = UserId..'/groupNum5//'..user2}, 
},
{
{text = 'اضافة مشرفين ⋮ ⦉ '..(t6 or promote)..' ⦊', data = UserId..'/groupNum6//'..user2}, 
},
{
{text = '• اخفاء الامر •', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"*• تعديل صلاحيات المستخدم*", 'md', false, false, reply_markupp)
end
function editrtp(chat,user,msgid,useri)
if Redis:sismember(Fast.."BanGroup:Group"..chat,useri) then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if Redis:sismember(Fast.."SilentGroup:Group"..chat,useri) then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if Redis:sismember(Fast.."SuperCreator:Group"..chat,useri)  then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Redis:sismember(Fast.."Creator:Group"..chat,useri) then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Redis:sismember(Fast.."Manger:Group"..chat,useri) then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Redis:sismember(Fast.."Admin:Group"..chat,useri) then
Adminz = "✔"
else
Adminz = "❌"
end
if Redis:sismember(Fast.."Special:Group"..chat,useri) then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =user..'/statusSuperCreatorz/'..useri},{text = '- منشئ : '..Creatorz, data =user..'/statusCreatorz/'..useri},
},
{
{text = '- مدير : '..Mangerz, data =user..'/statusMangerz/'..useri},{text = '- ادمن : '..Adminz, data =user..'/statusAdminz/'..useri},
},
{
{text = '- مميز : '..Specialz, data =user..'/statusSpecialz/'..useri},
},
{
{text = '- الحظر : '..BanGroupz, data =user..'/statusban/'..useri},{text = '- الكتم : '..SilentGroupz, data =user..'/statusktm/'..useri},
},
{
{text = '- عضو  ', data =user..'/statusmem/'..useri},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return edit(chat,msgid,'*\n• تحكم برتب الشخص .*', 'md', true, false, reply_markup)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = bot.getChatMember(ChatId,UserId).status 
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(Fast.."Lock:phshar"..ChatId) then    
alphsar = "✅"
else 
alphsar = "❌"    
end
if Redis:get(Fast.."Lock:alkfr"..ChatId) then    
alkfr = "✅"
else 
alkfr = "❌"    
end
if Redis:get(Fast.."Lock:tphlesh"..ChatId) then    
tphlesh = "✅"
else 
tphlesh = "❌"    
end
if Redis:get(Fast.."Lock:farsia"..ChatId) then    
farsia = "✅"
else 
farsia = "❌"    
end

if Redis:get(Fast.."lockpin"..ChatId) then    
lock_pin = "✅"
else 
lock_pin = "❌"    
end
if Redis:get(Fast.."Lock:tagservr"..ChatId) then    
lock_tagservr = "✅"
else 
lock_tagservr = "❌"
end
if Redis:get(Fast.."Lock:text"..ChatId) then    
lock_text = "✅"
else 
lock_text = "❌ "    
end
if Redis:get(Fast.."Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✅"
else 
lock_add = "❌ "    
end    
if Redis:get(Fast.."Lock:Join"..ChatId) == "kick" then
lock_join = "✅"
else 
lock_join = "❌ "    
end    
if Redis:get(Fast.."Lock:edit"..ChatId) then    
lock_edit = "✅"
else 
lock_edit = "❌ "    
end
if Redis:get(Fast.."Chek:Welcome"..ChatId) then
welcome = "✅"
else 
welcome = "❌ "    
end
if Redis:hget(Fast.."Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقييد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✅"
else     
flood = "❌ "     
end
if Redis:get(Fast.."Lock:Photo"..ChatId) == "del" then
lock_photo = "✅" 
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(Fast.."Lock:Contact"..ChatId) == "del" then
lock_phon = "✅" 
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(Fast.."Lock:Link"..ChatId) == "del" then
lock_links = "✅"
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(Fast.."Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✅"
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(Fast.."Lock:User:Name"..ChatId) == "del" then
lock_user = "✅"
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقييد "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(Fast.."Lock:hashtak"..ChatId) == "del" then
lock_hash = "✅"
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقييد "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_muse = "✅"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(Fast.."Lock:Video"..ChatId) == "del" then
lock_ved = "✅"
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(Fast.."Lock:Animation"..ChatId) == "del" then
lock_gif = "✅"
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(Fast.."Lock:Sticker"..ChatId) == "del" then
lock_ste = "✅"
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(Fast.."Lock:geam"..ChatId) == "del" then
lock_geam = "✅"
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_vico = "✅"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(Fast.."Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✅"
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقييد "
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(Fast.."Lock:forward"..ChatId) == "del" then
lock_fwd = "✅"
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقييد "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(Fast.."Lock:Document"..ChatId) == "del" then
lock_file = "✅"
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(Fast.."Lock:Unsupported"..ChatId) == "del" then
lock_self = "✅"
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✅"
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(Fast.."Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✅"
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(Fast.."Lock:Spam"..ChatId) == "del" then    
lock_spam = "✅"
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam,
farsia = farsia,
tphlesh = tphlesh,
alkfr = alkfr,
alphsar = alphsar
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'انت مش بتتفاعل لي ؟'
elseif tonumber(Message) < 200 then 
MsgText = 'متشد شويه في التفاعل'
elseif tonumber(Message) < 400 then 
MsgText = 'انتي مكسوفه تتكلمي يبطه 🙈'
elseif tonumber(Message) < 700 then 
MsgText = 'في احسن من كدا هه'
elseif tonumber(Message) < 1200 then 
MsgText = 'انا عاوزك تولعها 😂🔥'
elseif tonumber(Message) < 2000 then 
MsgText = 'انت متفاعل يبن عمي'
elseif tonumber(Message) < 3500 then 
MsgText = 'بحبك اتفاعل كمان بقا 🥺♥'
elseif tonumber(Message) < 4000 then 
MsgText = 'استمر يبن عمي 😂🔥'
elseif tonumber(Message) < 4500 then 
MsgText = 'عاش كيك ليك'
elseif tonumber(Message) < 5500 then 
MsgText = 'تفاعل ام ميرفت وهي بتكلم ام باسل عشان تجوز باسل وميرفت'
elseif tonumber(Message) < 7000 then 
MsgText = 'تفاعل ام عبير وهي بتكلم ام البوب عشان تجوز البوب وعبير'
elseif tonumber(Message) < 9500 then 
MsgText = 'تفاعل ام حبيبه وهي بتكلم ام تيمو عشان تجوز تيمو لحبيبه'
elseif tonumber(Message) < 6702141393 then 
MsgText = 'كتفم التفاعل لاجلك 😂•'
end 
return MsgText 
end
function Total_groups(Message)  
local MsgText = ''  
if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 6702141393 then 
MsgText = 'ملك التلكرام 💖'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"• صلاحيات الجروب - ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
KtmAll = Redis:sismember(Fast.."KtmAll:Groups",UserId) ,
BanAll = Redis:sismember(Fast.."BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
Name_User = FlterBio(UserInfo.first_name)
local userData = bot.getUser(senderr)
local userName = userData.first_name and '*['..userData.first_name..'](tg://user?id='..userData.id..')*' or 'لا يوجد'
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return {
Lock     = '\n*• بواسطه ⇇ *'..UserInfousername..'\n*'..TextMsg..'\n• خاصيه المسح *\n√',
unLock   = '\n*• بواسطه ⇇ *'..UserInfousername..'\n'..TextMsg..'\n√',
lockKtm  = '\n*• بواسطه ⇇ *'..UserInfousername..'\n*'..TextMsg..'\n• خاصيه الكتم *\n√',
lockKid  = '\n*• بواسطه ⇇ *'..UserInfousername..'\n*'..TextMsg..'\n• خاصيه التقييد *\n√',
lockKick = '\n*• بواسطه ⇇ *'..UserInfousername..'\n*'..TextMsg..'\n• خاصيه الطرد *\n√',
Reply    = '*• المستخدم ⇇* ⦉ '..UserInfousername..' ⦊\n*'..TextMsg..'\n• بواسطه ⦉ '..userName..' ⦊\n√*'
} 
end 
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 6702141393 then
Status = true
elseif UserId == 6961465370 then  
Status = true
elseif UserId == 000000000 then  
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif Special then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 6702141393 then
Status = true
elseif UserId == 69614653700 then    
Status = true
elseif UserId == 000000000 then    
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = bot.getChatMember(msg.chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'w')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoinch(msg)
JoinChannel = true
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function ChannelJoin(msg)
JoinChannel = true
if not Redis:sismember(Fast.."BotFree:Group:",msg.chat_id) then
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
end
return JoinChannel
end

function File_Bot_Run(msg,data)  
local activated_at = tonumber(Redis:get("Fast:ActivatedAt:"..msg.chat_id)) or 0
if msg.date < activated_at then
return false 
end  
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
senderr = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
else
return false 
end
end
--[[
if msg.content.voice_note and Redis:get(Fast..msg_chat_id.."sound:cmd") then 
local mr = msg.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
text = json.msg
print(text)
end --]]
if data.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "[الخالدي]") 
text = data.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end


if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end 

if tonumber(senderr) == 6702141393 then
msg.Name_Controller = 'المبرمج تـيــمـو'
msg.The_Controller = 1
elseif tonumber(senderr) == 69614653700 then
msg.Name_Controller = 'عبداللھَہّ البشيړ'
msg.The_Controller = 1
elseif tonumber(senderr) == 000000000 then
msg.Name_Controller = 'مـالـك الـسـورس'
msg.The_Controller = 1
elseif The_ControllerAll(senderr) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'الـم ــطـور الاسـاسـي'
elseif Redis:sismember(Fast.."Devss:Groups",senderr) == true then
msg.The_Controller = 2
msg.Name_Controller = 'الـم ــطـور الـثـانوي'
elseif Redis:sismember(Fast.."Dev:Groups",senderr) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Developer:Bot:Reply"..msg.chat_id) or 'الــم ـــطور  '
elseif Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."PresidentQ:Group:Reply"..msg.chat_id) or 'م ـالك الـج ــروب '
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."President:Group:Reply"..msg.chat_id) or 'الـم ــنشـئ الاساسـي'
elseif Redis:sismember(Fast.."Creator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Constructor:Group:Reply"..msg.chat_id) or 'الـم ـنـشـئ'
elseif Redis:sismember(Fast.."Manger:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Manager:Group:Reply"..msg.chat_id) or 'الـم ـــديـر  '
elseif Redis:sismember(Fast.."Admin:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Admin:Group:Reply"..msg.chat_id) or 'الادمـــــــــن  '
elseif Redis:sismember(Fast.."Special:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Vip:Group:Reply"..msg.chat_id) or 'الـم ـــمــيـز  '
elseif tonumber(senderr) == tonumber(Fast) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Mempar:Group:Reply"..msg.chat_id) or 'العضـو '
end  
if msg.The_Controller == 1 then  
msg.Asasy = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.Devss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Dev = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.Ownerss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.SuperCreator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Creator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Manger = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Admin = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Special = true
end
if text and Redis:get(Fast.."chmembers") == "on" then
if ChannelJoin(msg) == false then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local n = UserInfo.first_name
local d = UserInfo.id
local chinfo = Redis:get(Fast.."Channel:Redis")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
return send(msg.chat_id,0,'• تنبيه يا ['..n..']('..d..') \n• عليك الاشتراك في قناه البوت للتمكن من التحدث هنا\n',"md",false, false, false, false, reply_markup)
end 
end


list_A_files = {"Callback.lua","selva.lua","locks.lua","rtba.lua","timo.lua","lido.lua","botuser.lua"}
if text and text:match("^تعطيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تعطيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"• من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:sadd(Fast..'files',file)
return send(msg.chat_id,msg.id,"• تم تعطيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"• لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"• يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"• هذا الامر يخص المطور الاساسي")
end
end

if text and text:match("^تفعيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تفعيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"• من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:srem(Fast..'files',file)
return send(msg.chat_id,msg.id,"• تم تفعيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"• لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"• يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"• هذا الامر يخص المطور الاساسي")
end
end
if text == "الملفات" then
if msg.Asasy then
local files = {}
for file in io.popen('ls plugin'):lines() do
table.insert(files, file)
end
if #files == 0 then
return send(msg.chat_id, msg.id, " • لا توجد ملفات\n√", "md")
end
local buttons = {}
for i, filename in ipairs(files) do
local state = Redis:sismember(Fast..'files', filename) and "⦉ ❌ ⦊" or "⦉ ✅ ⦊"
local btnText = filename .. " " .. state
table.insert(buttons, {{text = btnText, data = "togglefile:" .. filename}})
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = buttons
}
send(msg.chat_id, msg.id, "*قائمة ملفاتك (اضغط على اسم ملف لتفعيل/تعطيل)*", "md", false, false, false, false, reply_markup)
else
send(msg.chat_id, msg.id, " • انت لست المطور الاساسي\n√")
end
end

if text == "الملفات الاساسيه" then
if msg.Asasy then
local files = {}
for file in io.popen('ls src'):lines() do
table.insert(files, file)
end
if #files == 0 then
return send(msg.chat_id, msg.id, " • لا توجد ملفات\n√", "md")
end
local buttons = {}
for i, filename in ipairs(files) do
local selva = Redis:sismember(Fast..'files', filename) and "⦉ ✅ ⦊" or "⦉ ✅ ⦊"
local timo = filename .. " " .. selva
table.insert(buttons, {{text = timo, url = 't.me/Di_il'}})
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = buttons
}
send(msg.chat_id, msg.id, "*قائمه الملفات الاساسيه لا يمكن تعطيلها*", "md", false, false, false, false, reply_markup)
else
send(msg.chat_id, msg.id, " • انت لست المطور الاساسي\n√")
end
end



plugins(msg)
src(msg)

if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww and not Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) then
text = neww or text
end
end
if msg.sender_id.Fastbots ~= "messageSenderChat" then
if Statusrestricted(msg.chat_id,msg.sender_id.user_id).KtmAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).SilentGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilterq') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.Fastbots == "messagePhoto" then
Filters = 'الصوره'
Redis:srem(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.photo.sizes[1].photo.id)  
elseif msg.content.Fastbots == "messageAnimation" then
Filters = 'المتحركه'
Redis:srem(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.animation.animation.id)  
elseif msg.content.Fastbots == "messageSticker" then
Filters = 'الملصق'
Redis:srem(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.sticker.sticker.id)  
elseif text then
Redis:srem(Fast.."All:List:Filter",'text:'..text)  
Redis:del(Fast.."All:Filter:Group:"..text)  
Filters = 'النص'
end
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم الغاء منع عام ("..Filters..")","md",true)  
end
end

if Redis:get(Fast.."Lock:text"..msg_chat_id) and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.Fastbots == "messageChatJoinByLink" and not msg.Special then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) ~= tonumber(Fast) then
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeBot" then
if Lock_Bots == "del" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end
end



-------*****************-------*****************-------*****************

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم حفظ السؤال بنجاح')
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم مسح السؤال بنجاح')
end
end
if msg.content.audio then  
if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,msg.content.audio.audio.remote.id)  
Redis:sadd(Fast.."audio:Games:Bot",msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
return send(msg.chat_id, msg.id,'• ارسل اسم الموسيقى الان ...')
end   
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
local Id_audio = Redis:get(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:set(Fast..'Text:Games:audio'..Id_audio,text)
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id,'• تم حفظ الصوت ')
end

if Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) then
if text == ""..(Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) or '66765$47').."" then 
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
return send(msg.chat_id,msg.id,'*• الف مبروك اجابتك صحيحه تم اضافه لك 5 نقاط*')
end
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."All:text:Games:Bot",text) then
send(msg_chat_id,msg_id,'• لا يوجد صوتيه بهذا الاسم في العامه')
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."All:audio:Games"..text)
Redis:srem(Fast.."All:text:Games:Bot",text)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم مسح الصوتيه بنجاح')
return false
end

if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast..'All:Text:Games:audio'..msg.chat_id,text)
Redis:sadd(Fast.."All:text:Games:Bot",text)  
Redis:set(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
send(msg_chat_id,msg_id,'• الان ارسل الصوتيه ليتم حفظها باسم  : '..text)
return false
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'All:Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."All:audio:Games"..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."All:audio:Games"..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."text:Games:Bot"..msg.chat_id,text) then
send(msg_chat_id,msg_id,'• لا يوجد صوتيه بهذا الاسم في الجروب')
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."audio:Games"..msg.chat_id..text)
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,text)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم مسح الصوتيه بنجاح')
return false
end


if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."audio:Games"..msg.chat_id..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."audio:Games"..msg.chat_id..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم مسح السؤال بنجاح') 
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم حفظ السؤال بنجاح \n ارسل الجواب الاول') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true4")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الرابع') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true4" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as0"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return send(msg_chat_id,msg_id, '\nتم حفظ الاجوبه \n ارسل الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
send(msg_chat_id,msg_id, '\nتم مسح الغز بنجاح')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
send(msg_chat_id,msg_id, '\nتم حفظ اللغز بنجاح \n ارسل الجواب الاول')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return false 
end
end

if text then
local NewCmmd = Redis:get(Fast.."All:Get:Reides:Commands:Group"..text) or Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '1', data = msg.sender_id.user_id..'/setallmember'}, {text = '2', data = msg.sender_id.user_id..'/setforcmd'}, 
},
}
}
send(msg_chat_id,msg_id,'• تم حفظ القناه \n• اختار كيف تريد تفعيله \n• 1 : وضع الاشتراك الاجباري لكل الاعضاء \n• 2 : وضع الاشتراك الاجباري عند استخدام الاوامر فقط \n',"md",false, false, false, false, reply_markup)
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'• المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
send(msg_chat_id,msg_id,'• تم حفظ القناه ',"md",true)  
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'• المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n• ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast..'Channel:Join')
return send(msg_chat_id,msg_id,"\n• تم تعطيل الاشتراك الاجباري","md",true)  
end

if text == 'جروبات البوت' or text == 'جروبات البوت' or text == 'لينك الجروبات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local G = "جروبات البوت • \n"
local list = Redis:smembers(Fast..' ChekBotAdd')  
for k,v in pairs(list) do  
local Info_Chats = bot.getSupergroupFullInfo(v)
local Get_Chat = bot.getChat(v)
if Info_Chats and Info_Chats.invite_link then
link = Info_Chats.invite_link.invite_link
else
link = "لا يوجد" 
end
if Get_Chat and Get_Chat.title then
title = Get_Chat.title
else 
title = "لا يوجد" 
end
G = G.." اسم الجروب ⇿ "..title.."\n ايدي الجروب ⇿ "..v.."\n رابط الجروب ⇿ "..link.."\n\n"
end
bot.sendText(msg_chat_id,msg_id,G, 'html')
end
if text == 'رفع المطورين' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
i = 0
if FilesJson and FilesJson.dev then
for k,v in pairs(FilesJson.dev) do
i = i + 1
Redis:sadd(Fast.."Dev:Groups",v)  
end
x = 0
for k,v in pairs(FilesJson.devss) do
x = x + 1
Redis:sadd(Fast.."Devss:Groups",v)  
end
send(msg.chat_id,msg.id,"• تم رفع "..i.." من المطورين و "..x.." من المطورين الثانويين")
else
send(msg.chat_id,msg.id,"• الملف غير صالح")
end
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه العامه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
var(File)
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Fast) ~= tonumber(FilesJson.BotId) then
return send(msg_chat_id,msg_id,'* • عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه\n√*',"md",true)  
end -- end botid
send(msg_chat_id,msg_id,' *• جاري استرجاع المشتركين والجروبات ...\n√*',"md",true)  
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(Fast.."ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(Fast.."SuperCreator:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(Fast.."Creator:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(Fast.."Manger:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(Fast.."Admin:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(Fast.."Special:Group"..GroupId,v)
end
end 
end
return send(msg_chat_id,msg_id,'* • تم استرجاع ❴ '..X..' ❵ جروب \n • واسترجاع ❴ '..Y..' ❵ مشترك في البوت\n√*',"md",true)  
end
end
if text == 'رفع نسخه الخالدي' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(Fast) then 
return send(msg_chat_id,msg_id,'• عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(Fast.." ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(Fast.."Creator:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(Fast.."Manger:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(Fast.."Admin:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(Fast.."SuperCreator:Group"..idg,idASAS)
end;end
end
return send(msg_chat_id,msg_id,'• تم استرجاع المجموعات من نسخه الخالدي')
else
return send(msg_chat_id,msg_id,'• الملف لا يدعم هذا البوت')
end
end
end

if (Redis:get(Fast.."AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
return send(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,"*• تم تغيير المطور الاساسي بنجاح ✅ \n• اصبح ⇿ [@"..text:gsub('@','').."] *","md",false, false, false, false, reply_markup)
dofile('Fast.lua')  
return false
end
end 

if text == 'تغيير المطور الاساسي' or text == '• تغيير المطور الاساسي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• نعم •', data = senderr..'/yaaaaa'}, {text = '• لا •', data = senderr..'/Noooo'}, 
},
}
}
return send(msg_chat_id, msg_id,'* • هل انت متأكد بتغير المطور الاساسي \n√*',"md",false, false, false, false, reply_markup)
end 
if text == 'تحديث السورس' or text == 'تحديث السورس •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
os.execute('rm -rf Fast.lua')
download('http://45.32.238.150/Mero/Fast.lua','Fast.lua')
return send(msg_chat_id,msg_id,'\n*• تم تحديث السورس * ',"md",true)  
end
if text == 'معلومات التنصيب' or text == '• معلومات التنصيب •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
return send(msg_chat_id,msg_id,'\n\n• *ᴛᴏᴋᴇɴ* ⋮ `'..Token..'`\n•──── • ◈ • ────•\n• *ᴜꜱᴇʀ ʙᴏᴛ* ⋮ [@'..UserBot..']\n•──── • ◈ • ────•\n• *ɪᴅ ᴅᴇᴠ* ⋮ `'..Sudo_Id..'`\n•──── • ◈ • ────•\n• *ᴜꜱᴇʀ ᴅᴇᴠ* ⋮ [@'..UserSudo..']',"md",true)  
end
if text == "ضع صوره للترحيب" or text == "ضع صوره للترحيب •" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:setex(Fast..'welcom_ph:witting'..senderr,300,true) 
return send(msg_chat_id,msg_id, '• حسننا عزيزي \n• ︙الان قم بارسال الصوره للترحيب \n' )
end


if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات •' or text == 'الاحصائيات' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Timo = (Redis:scard(Fast..'ChekBotAdd') or 0)
Selva = (Redis:scard(Fast..'Num:User:Pv') or 0)
local Timoo = '• الجروبات = 𓄼 '..Timo..' 𓄹'
local Tiimo = '• المشتركين = 𓄼 '..Selva..' 𓄹'
local OO = "*• اليك الاحصائيات عزيزي "..msg.Name_Controller.." 🥺❤️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Timoo, url = 't.me/Sudanese_56'}, 
},
{
{text = Tiimo, url = 't.me/Sudanese_56'}, 
},
}
}
send(msg_chat_id,msg_id,OO,"md",false, false, false, false, reply_markup)
elseif text =='مجموعات' or text == 'المجموعات' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Timo = (Redis:scard(Fast..'ChekBotAdd') or 0)
local Timoo = '• الجروبات = 𓄼 '..Timo..' 𓄹'
local OO = "*• اليك الاحصائيات عزيزي "..msg.Name_Controller.." 🥺❤️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Timoo, url = 't.me/Sudanese_56'}, 
},
}
}
send(msg_chat_id,msg_id,OO,"md",false, false, false, false, reply_markup)
elseif text =='مشتركين' or text == 'المشتركين' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Selva = (Redis:scard(Fast..'Num:User:Pv') or 0)
local Tiimo = '• المشتركين = 𓄼 '..Selva..' 𓄹'
local OO = "*• اليك الاحصائيات عزيزي "..msg.Name_Controller.." 🥺❤️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Tiimo, url = 't.me/Sudanese_56'}, 
},
}
}
send(msg_chat_id,msg_id,OO,"md",false, false, false, false, reply_markup)
end
if text == "تفعيل" then
Timoo = (Redis:get(Fast.."Name:Bot") or "الخالدي")
local TIMO = "*• تم تفعيل بوت "..Timoo.." في الجروب \n• وتم تفعيل الاوامر عزيزي "..msg.Name_Controller.."\n√*"
local Selva = "*• بوت "..Timoo.." مفعل في الجروب من قبل \n• عزيزي "..msg.Name_Controller.."\n√*"
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n•*","md",true)  
end
if Redis:sismember(Fast..'Black:listBan:',msg_chat_id) then
return send(msg_chat_id,msg_id,"* • عذرآ الجروب محظوره من التفعيل *","md",true)  
end
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,Selva,"md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
send(msg_chat_id,msg_id,TIMO,"md",true) 
end
if text == "تفعيل" then
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
local Text = "*• تم رفع العضو ⇇* ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n*• مالك بنجاح\n√*"
send(msg_chat_id,msg_id, Text,"md",true)  
end
end
if text == "تفعيل" then
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الأحد", Monday = "الاثنين", Tuesday = "الثلاثاء", Wednesday = "الأربعاء", Thursday = "الخميس", Friday = "الجمعة", Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local Text = "*• تم رفع ( "..y.." ) ادمنيه فى البوت تلقائي\n√*"
local Get_Chat = bot.getChat(msg_chat_id)
local Timolua = (Redis:scard(Fast..'ChekBotAdd') or 0)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '• ترتيب الاوامر •', data = senderr..'/trtep@'},{text = '• قفل الكل •', data = senderr..'/LockAllGroup@'},},
{{text = '• مسح الادمنيه •', data = senderr..'/tafealA'},},}}
local replyy_markupp = bot.replyMarkup{type = 'inline',data = {
{{text = 'اصبح عدد مجموعاتك ⦉ '..Timolua..' ⦊ مجموعه', data = senderr.."/Timo_Jack"}},}}
send(Sudo_Id,0,'\n*\n╗• تم تفعيل مجموعة جديده\n╣• المجموعه ⇿* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n*╣• الايدي ⇿ '..msg.chat_id..' \n╣• عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n╣• عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n╣• عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n╣• عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n╣• في يوم ⋮ ⦉ '..dayOfWeek..' ⦊ الموافق ⦉ '..date..' ⦊\n╣• الساعه ⋮ ⦉ '..time..' ⦊\n╝• رابط المجموعه ⋮ ⦉ '..Info_Chats.invite_link.invite_link..' ⦊*',"md",false, false, false, false, replyy_markupp)
return send(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
end
end
if text == "تعطيل" and msg.Dev then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* • عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n•*","md",true)  
end
Redis:srem(Fast.."ChekBotAdd",msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Text = "*• تم تعطيل جروب "..Get_Chat.title.."\n• وتنزيل الادمن من الرتبه\n√*"
if not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
send(msg_chat_id,msg_id,'*• تم تعطيل البوت في الجروب\n√*',"md",true)  
end
send(Sudo_Id,0,'\n*ꔹ━━━━━ꔹꔹ━━━━━ꔹ\n╗• تم تعطيل مجموعة جديده\n╣• المجموعه ⇿* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n*╣• الايدي ⇿ '..msg.chat_id..' \n╣• عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n╣• عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n╣• عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n╣• عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n╝• رابط المجموعه ⇞⇟\nꔹ━━━━━ꔹꔹ━━━━━ꔹ\n '..Info_Chats.invite_link.invite_link..'\nꔹ━━━━━ꔹꔹ━━━━━ꔹ*',"md",true)
send(msg_chat_id,msg_id, Text,"md",true)  
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 

if text then
local GetMsg = Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 
Redis:hset(Fast..':GroupUserCountMsg:'..msg.chat_id,senderr,GetMsg)
local UserInfo = bot.getUser(senderr) 
if FlterBio(UserInfo.first_name) then
NameLUser = FlterBio(UserInfo.first_name)
else
NameLUser = FlterBio(UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupNameUser:'..msg.chat_id,senderr,NameLUser)
end
---تيمو الخالدي---
if text and text:match('^ذيع (-100%d+)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local Chatid = text:match('^ذيع (-100%d+)$') 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
send(Chatid,0,Message_Reply.content.text.text)
send(msg_chat_id,msg_id,'- تم الاذاعه الى  : '..Get_Chat.title..'\n ')
end 
---تيمو الخالدي---
if text and text:match('^حظر جروب (-100%d+)$') then
local Chatid = text:match('^حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
bot.leaveChat(Chatid)
Redis:sadd(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم حظر الجروب  : ['..Get_Chat.title..']\n - وتم مغادره البوت من الجروب')
end 
if text and text:match('^الغاء حظر جروب (-100%d+)$') then
local Chatid = text:match('^الغاء حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:srem(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء حظر الجروب ')
end 
---تيمو الخالدي---
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

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
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return send(msg_chat_id,msg_id,"\n*• عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

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
if not Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end

if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*• عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'*• البوت ليس لديه صلاحيه مسح الرسائل\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if ban.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"* • عذرأ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if ban and ban.type and ban.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"* • عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if Controllerbanall(msg_chat_id,rep_idd) == true then 
return send(msg_chat_id,msg_id,"* • عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,rep_idd).." )\n√*","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",rep_idd) 
if ban.first_name then
Text = '*• العضو ⇿* ['..ban.first_name..'](tg://user?id='..ban.id..')\n*• تم ڪـتمـه عـام\n• بواسطه ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n'
else
Text = 'لا يوجد'
end
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/156&caption=".. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true")
end
end
if text == ('الغاء كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,idd) == true then 
return send(msg_chat_id,msg_id,"\n*• عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,idd).." } *","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end

if text == 'مسح المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," •لا يوجد مكتومين عام حاليا , ","md",true)  
end
Redis:del(Fast.."KtmAll:Groups") 
return send(msg_chat_id,msg_id,"* •تم مسح {"..#Info_Members.."} من المكتومين عام *","md",true)
end

if text == 'المكتومين عام' or text == 'قائمه المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," •لا يوجد مكتومين عام حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه المكتومين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين عام', data = senderr..'/KtmAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end



--[[
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)  
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * •تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل *',_key,msg_id)
return false  
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,' * •تم حذفه بنجاح .* ',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,' * •قم بارسال الرد الذي تريد حذفه منه* ',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'ارسل الرد الذي تريد اضافته',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * •تم ازالة الرد المتعدد بنجاح* ',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if  Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
quschen = list[math.random(#list)]
send(msg_chat_id, msg_id,'['..quschen..']',"md",true)
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  •قائمه الردود المتعدده \n 𝘀𝗼𝘂𝗿𝗰𝗲 𝘀𝗲𝗹𝘃𝗮 🎀 \n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رساله}\n"
end
if #list == 0 then
text = "  •لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v..msg_chat_id)   
Redis:del(Fast..'List:array'..msg_chat_id)
end
send(msg_chat_id, msg_id," * •تم مسح الردود المتعدده*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد اضافتها",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end
]]
--=> multi reply
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
if text then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','')
Redis:set(Fast.."media:type:"..text, "text")
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)
end
if msg.content.sticker then
Redis:set(Fast.."media:type:"..msg.content.sticker.sticker.remote.id, "sticker")
Redis:sadd(Fast.."Add:Rd:array:Text"..test,msg.content.sticker.sticker.remote.id)
end   
if msg.content.voice_note then
Redis:set(Fast.."media:type:"..msg.content.voice_note.voice.remote.id, "voice_note")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.voice_note.voice.remote.id)
end
if msg.content.audio then
Redis:set(Fast.."media:type:"..msg.content.audio.audio.remote.id, "audio")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.audio.audio.remote.id)
end
if msg.content.document then
Redis:set(Fast.."media:type:"..msg.content.document.document.remote.id, "document")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.document.document.remote.id)
end
if msg.content.animation then
Redis:set(Fast.."media:type:"..msg.content.animation.animation.remote.id, "animation")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.animation.animation.remote.id)
end
if msg.content.video_note then
Redis:set(Fast.."media:type:"..msg.content.video_note.video.remote.id, "video_note")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.video_note.video.remote.id)
end
if msg.content.video then
Redis:set(Fast.."media:type:"..msg.content.video.video.remote.id, "video")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.video.video.remote.id)
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."media:type:"..idPhoto, "photo")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, idPhoto)
end
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * •تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل *',_key,msg_id)
return false  
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,' * •تم حذفه بنجاح .* ',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,' * •قم بارسال الرد الذي تريد حذفه منه* ',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'ارسل الرد الذي تريد اضافته',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * •تم ازالة الرد المتعدد بنجاح* ',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
local rd = list[math.random(#list)]
if Redis:get(Fast.."media:type:"..rd) == "text" then
send(msg_chat_id, msg_id,'['..rd..']',"md",true)
elseif Redis:get(Fast.."media:type:"..rd) == "sticker" then
bot.sendSticker(msg_chat_id, msg.id, rd)
elseif Redis:get(Fast.."media:type:"..rd) == "voice_note" then
bot.sendVoiceNote(msg_chat_id, msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "audio" then
bot.sendAudio(msg_chat_id, msg.id, rd, '', "md") 
elseif Redis:get(Fast.."media:type:"..rd) == "document" then
bot.sendDocument(msg_chat_id, msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "animation" then
bot.sendAnimation(msg_chat_id,msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "video_note" then
bot.sendVideoNote(msg_chat_id, msg.id, rd)
elseif Redis:get(Fast.."media:type:"..rd) == "video" then
bot.sendVideo(msg_chat_id, msg.id, rd, '', "md")
elseif Redis:get(Fast.."media:type:"..rd) == "photo" then
bot.sendPhoto(msg.chat_id, msg.id, rd,'')
end
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  •قائمه الردود المتعدده \n• ━━━━ s ━━━━━• \n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رساله}\n"
end
if #list == 0 then
text = "  •لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v)   
Redis:del(Fast..'List:array')
end
send(msg_chat_id, msg_id," * •تم مسح الردود المتعدده*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد اضافتها",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end
-- 7azer
if text == "حزر" then
if Redis:get(Fast..":7azer:"..msg_chat_id) then
local time = ctime(tonumber(Redis:ttl(Fast..":7azer:"..msg_chat_id)))
local Userid = tonumber(Redis:get(Fast..":7azer:"..msg_chat_id))
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'مسح اللعبه الجاريه ❌', data = Userid..'/del7azer'}, 
},
}
}
return send(msg_chat_id,msg_id,"• هناك لعبه جاريه\n• تنتهي في ( `"..time.."` ) 🕔","md",true,false,false,false,reply_markup)
end
Redis:setex(Fast..":7azer:"..msg_chat_id, 180, msg.sender_id.user_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'انضم ➕', data = msg.sender_id.user_id..'/add7azer'}, 
},
{
{text = '🙋🏼 اضغط هنا لارسال السؤال', url = 't.me/'..UserBot..'?start=7azer'..msg_chat_id..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id,"• اضغط انضمام للانضمام للعبه 👥","html",true,false,false,false,reply_markup) 
end

if text and text ~= "حزر" and Redis:get(Fast..":7azer:"..msg_chat_id) then
local ttl_time = tonumber(Redis:ttl(Fast..":7azer:"..msg_chat_id))
local time = ctime(ttl_time)
local Game_king = Redis:get(Fast..":7azer:"..msg_chat_id)
if Redis:sismember(Fast..":7azer:mem:"..msg_chat_id, msg.sender_id.user_id) then
local answer = Redis:get(Fast..":7azer:answer"..msg_chat_id)
if text == answer and tonumber(msg.sender_id.user_id) ~= tonumber(Game_king) then
Redis:del(Fast..":7azer:mem:"..msg_chat_id)
Redis:del(Fast..":7azer:"..msg_chat_id)
Redis:del(Fast..":7azer:chat_id"..Game_king)
Redis:del(Fast..":7azer:quiz"..msg_chat_id)
Redis:del(Fast..":7azer:answer"..msg_chat_id)
local time_answer = 180 - ttl_time
return send(msg.chat_id, msg.id,"• اجابه صحيحه ✅\n• استغرقت `"..time_answer.."` ثانيه للاجابه 🕔", 'md')
else
--send(msg.chat_id, msg.id,"• اجابه خاطئه ❌\n• باقي ( `"..time.."` ) 🕔", 'md')
end
end end
-- my rd
if text and Redis:get(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id) then
if Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) then
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• يوجد رد بهذا الاسم مسبقا يا ⦉ "..Text.." ⦊*"
return send(msg.chat_id, msg.id,Timo, 'md')
end
Redis:sadd(Fast..":My_Rd:text:"..msg.chat_id, text)
Redis:set(Fast..":My_Rd:"..text..":"..msg.chat_id, msg.sender_id.user_id)
Redis:incrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
Redis:del(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id)
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
local Timo = "*• تم اضافه الرد بنجاح يا ⦉ "..Text.." ⦊*"
return send(msg.chat_id, msg.id,Timo, 'md')
end

if text == "اضف ردي" then
if Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
send(msg_chat_id,msg_id,'*\n • اضف ردي معطله من قبل مالك الجروب *',"md",true)  
return false
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• انت مش ادمن في الجروب عشان اضفلك رد 🙄.* ',"md",true)  
end
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• ارسل الرد الان يا ⦉ "..Text.." ⦊*"
local Num = Redis:get(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id)
if tonumber(Num) == 2 then 
return send(msg.chat_id, msg.id, "*لديك ردين باسمك يرجي حذف واحد منهم .*", 'md')
end
Redis:set(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id, true)
return send(msg.chat_id, msg.id,Timo,"md",true)  
end

if text and Redis:get(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id) then
if not Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) then
return send(msg.chat_id, msg.id, "لايوجد ردود بهذا الاسم", 'md')
end
if not tonumber(Redis:get(Fast..":My_Rd:"..text..":"..msg.chat_id)) == tonumber(msg.sender_id.user_id) and not msg.Owners then
return send(msg.chat_id, msg.id, "هذا الرد لايخصك", 'md')
end
Redis:del(Fast..":My_Rd:"..text..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, text)
Redis:decrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
Redis:del(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id)
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "*• تم حذف ردك بنجاح يا ⦉ "..Text.." ⦊*"
send(msg.chat_id, msg.id,Timo, 'md')
end

if text == "حذف ردودي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
local deleted = 0
for k, v in pairs(list) do
local owner_id = Redis:get(Fast..":My_Rd:"..v..":"..msg.chat_id)
if tonumber(owner_id) == tonumber(msg.sender_id.user_id) then
Redis:del(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
Redis:decrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
deleted = deleted + 1
end
end
local user = bot.getUser(msg.sender_id.user_id)
local username = (user.username and '[@'..user.username..']') or 'لا يوجد'
local name = (user.first_name and '*['..user.first_name..'](tg://user?id='..user.id..')*') or 'لا يوجد'
local reply
if deleted > 0 then
reply = "*• تم حذف "..deleted.." من ردودك يا ⦉ "..name.." ⦊*"
else
reply = "*• لا يوجد لديك ردود لحذفها يا ⦉ "..name.." ⦊*"
end
return send(msg.chat_id, msg.id, reply, 'md')
end

if text == "ردوده" and msg.reply_to_message_id ~= 0 then
local reply_msg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if not reply_msg then
return send(msg.chat_id, msg.id, "*• لم أستطع الحصول على رسالة الرد*", "md")
end
local target_id = reply_msg.sender_id.user_id
local replies = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
local user_replies = {}
for _, key in pairs(replies) do
local owner_id = Redis:get(Fast..":My_Rd:"..key..":"..msg.chat_id)
if tonumber(owner_id) == tonumber(target_id) then
table.insert(user_replies, key)
end
end
if #user_replies == 0 then
return send(msg.chat_id, msg.id, "*• لا توجد ردود مسجلة لهذا المستخدم*", "md")
end
local text_reply = "*• ردود المستخدم:*\n\n"
for i, v in ipairs(user_replies) do
text_reply = text_reply .. i .. ". " .. v .. "\n"
end
send(msg.chat_id, msg.id, text_reply, "md")
end

if text == "حذف ردوده" and msg.reply_to_message_id ~= 0 then
if tonumber(msg.sender_id.user_id) ~= 6961465370 then
return send(msg.chat_id, msg.id, "*• هذا الأمر يخص المطور تيمو فقط*", "md")
end
local reply_msg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if not reply_msg then
return send(msg.chat_id, msg.id, "*• لم أستطع الحصول على رسالة الرد*", "md")
end
local target_id = reply_msg.sender_id.user_id
local user = bot.getUser(target_id)
local username = user.username and ("@" .. user.username) or "لا يوجد معرف"
local name_link = "[" .. (user.first_name or "لا يوجد اسم") .. "](tg://user?id=" .. target_id .. ")"
local replies = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
local deleted_count = 0
for _, key in pairs(replies) do
local owner_id = Redis:get(Fast..":My_Rd:"..key..":"..msg.chat_id)
if tonumber(owner_id) == tonumber(target_id) then
Redis:del(Fast..":My_Rd:"..key..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, key)
Redis:decrby(Fast..":My_Rd:num"..owner_id..":"..msg.chat_id, 1)
deleted_count = deleted_count + 1
end
end
if deleted_count > 0 then
return send(msg.chat_id, msg.id, "*• تم حذف ⦉ " .. deleted_count .. " ⦊ من ردود المستخدم*⦉ " .. name_link .. " ⦊", "md")
else
return send(msg.chat_id, msg.id, "*• لا توجد ردود لهذا المستخدم* ⦉ " .. name_link .. " ⦊", "md")
end
end

if text == "حذف قائمه الردود" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
for k,v in pairs(list) do
Redis:del(Fast..":My_Rd:"..v)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
local id = Redis:get(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:decrby(Fast..":My_Rd:num"..id..":"..msg.chat_id, 1)
end
return send(msg.chat_id, msg.id, "* تم مسح جميع الردود بنجاح*", 'md')
end

if text == "ردودي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
local replies = {}
local user = bot.getUser(msg.sender_id.user_id)
local name = (user.first_name and '*['..user.first_name..'](tg://user?id='..user.id..')*') or 'لا يوجد'
for k, v in pairs(list) do
local owner_id = Redis:get(Fast..":My_Rd:"..v..":"..msg.chat_id)
if tonumber(owner_id) == tonumber(msg.sender_id.user_id) then
table.insert(replies, v)
end
end
if #replies == 0 then
return send(msg.chat_id, msg.id, "*• لا يوجد لديك ردود مسجلة في هذا الجروب*","md")
else
local text = "*• ردودك المسجلة يا ⦉ "..name.." ⦊*\n"
for i, v in ipairs(replies) do
text = text .. i .. ". " .. v .. "\n"
end
return send(msg.chat_id, msg.id, text, "md")
end
end

if text == "حذف ردي" then
if Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
send(msg_chat_id,msg_id,'*\n • اضف ردي معطله من قبل مالك الجروب *',"md",true)  
return false
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• انت مش ادمن في الجروب عشان تحذف رد 🙄.* ',"md",true)  
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
local Timo = "*• ارسل الرد الان يا ⦉ "..Text.." ⦊*"
local Num = Redis:get(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id)
if not Num then 
return send(msg.chat_id, msg.id, "انت لا تمتلك ردود", 'md')
end
Redis:set(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id, true)
send(msg.chat_id, msg.id,Timo,'md')
end

if text and Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local ID = Redis:get(Fast..":My_Rd:"..text..":"..msg.chat_id)
local selva = ID 
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
local notify_text = "*〈 نداء اليك يا "..text.." 🥺♥ 〉\n\n" .. "• الاسم *⇇⦉ " .. linked_name .. " ⦊\n" .. "*• اليوزر ⇇ ⦉ " .. sender_username .. " ⦊*\n" .. "*• الايدي ⇇* ⦉ `" .. sender_id .. "` ⦊\n*• في جروب ⇇ *⦉ " ..linked_group.." ⦊ \n".."*• اليوم ⇇ ⦉ " .. day_of_week .. " ⦊\n".."• التاريخ ⇇ ⦉ " .. current_date .. " ⦊\n".."• الوقت ⇇ ⦉ " .. current_time .. " ⦊*"
local Timo_Selva = bot.replyMarkup{type = 'inline',data = {{{text = sender_name, url = sender_username_link},},
{{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, },}}
bot.sendText(selva,0,notify_text,"md",false, false, false, false, Timo_Selva)
local UserInfo = bot.getUser(ID)
local photo = bot.getUserProfilePhotos(ID)
local ban = bot.getUser(ID)
local bain = bot.getUser(ID)
if bain.username then
banusername = '@'..bain.username..' '
else
banusername = 'لا يوجد'
end
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Bio = FlterBio(getbio(ID))
local msg_text = "*〈 اليك "..text.." اج ــمـد الـج ـامدين 🧸♥️ 〉\n\n• اسمـه ⇇ ⦉ "..Text.." ⦊\n• آيديه ⇇ ⦉ "..ID.." ⦊\n• يـوزره ⇇ ⦉ "..banusername.." ⦊\n• الـبـايـو ⇇ ⦉ "..Bio.." ⦊ *"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = UserInfo.first_name , url = "t.me/"..(UserInfo.username or UserBot)},
},
}
}
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,msg_text,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return send(msg_chat_id,msg_id,msg_text,"md",false, false, false, false, reply_markup)
end
end
------ Enable & Disable
if text == "تفعيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:del(Fast..":My_Rd:lock:"..msg.chat_id)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر فعلت امر ردي").Lock,"md",true)  
end
if text == "تعطيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:set(Fast..":My_Rd:lock:"..msg.chat_id, true)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر عطلت امر ردي").Lock,"md",true)  
end
--
--=>
--=> Sections
if text == "حذف قسم" then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
  return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
   {
   {text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
  },
   }
  }
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true2")
  return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الاقسام","md",false, false, false, false, reply_markup)
  end 
  if text and text:match("^(.*)$") then
  if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
  Redis:del(Fast.."Add:Sections:Text:inline"..text)   
  Redis:del(Fast.."Sections:inline:text"..text)
  Redis:del(Fast.."Sections:inline:link"..text)
  Redis:del(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id.."")
  Redis:srem(Fast.."List:Sections:inline", text)
  send(msg_chat_id,msg_id,"• تم حذف القسم من الاقسام بنجاح","md",true)  
  return false
  end
  end
  if text == ("مسح الاقسام") then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
  return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
  local list = Redis:smembers(Fast.."List:Sections:inline")
  for k,v in pairs(list) do   
  Redis:del(Fast.."Add:Sections:Text:inline"..v)   
  Redis:del(Fast.."Sections:inline:v"..v)
  Redis:del(Fast.."Sections:inline:link"..v)
  end
  Redis:del(Fast.."List:Sections:inline")
  return send(msg_chat_id,msg_id,"• تم مسح قائمه الاقسام","md",true)  
  end
  if text == "اضف قسم" then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
  end
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,true)
  local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = {
      {
      {text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
      },
      }
      }
  return send(msg_chat_id,msg_id,"• ارسل الان اسم القسم","md",false, false, false, false, reply_markup)
  end

  if text and text:match("^(.*)$") and tonumber(msg.sender_id.user_id) ~= tonumber(Fast) then
  if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
  Redis:set(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, text)    
  Redis:del(Fast.."Add:Sections:Text:inline"..text)   
  Redis:del(Fast.."Sections:inline:text"..text)
  Redis:sadd(Fast.."List:Sections:inline", text)
  send(msg_chat_id,msg_id,[[
  •︙ارسل الان كليشه القسم
  •︙ارسل الان نص او ميديا وتحتها الكابشن
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  `#username` ↬ معرف المستخدم
  `#name` ↬ اسم المستخدم
  `#id` ↬ ايدي المستخدم
  `#stast` ↬ رتبة المستخدم
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  ملحوظه لو حطيت كليشه ميديا لازم الازرار تحتوي علي ميديا مينفعش نص ولو دخلت نص فقط هيتم تعديل كابشن الميدي فقط
  ]],"md",true)  
  return false
  end
  end
if text or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video or msg.content.photo then
if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" and tonumber(msg.sender_id.user_id) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"set_inline")
local TemSelva = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, text)
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "text")
elseif msg.content.audio then
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "audio")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..TemSelva, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "document")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, msg.content.document.document.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..TemSelva, msg.content.caption.text)
elseif msg.content.animation then
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "animation")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, msg.content.animation.animation.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..TemSelva, msg.content.caption.text)
elseif msg.content.video then
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "video")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..TemSelva, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Sections:Text:Type"..TemSelva, "photo")
Redis:set(Fast.."Add:Sections:Text:inline"..TemSelva, idPhoto)
Redis:set(Fast.."Add:Sections:Caption:inline"..TemSelva, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"• الان ارسل اسم الزر","md",true)
return false
end
end

if text and Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, "set_link")
Redis:del(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id)
local TemSelva = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:sadd(Fast.."Sections:inline:text"..TemSelva, text)
Redis:set(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"•︙ الان ارسل محتوي الزر \n•︙ارسل نص او ميديا او رابط فقط حيث يظر عند ضغط العضو عليه","md",true)  
return false  
end

if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_link" then
local TemSelva = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
local TemSelva_rand = math.random(1,999999999999)
local TemSelvas = Redis:get(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id)
local reply_markup = bot.replyMarkup{
        type = 'inline',
        data = {
        {
        {text = "انهاء" , data = msg.sender_id.user_id.."/cancelSection"},
        },
        }
        }
if msg.content.text and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) == "text" then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, text)
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "text")
elseif msg.content.audio and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "audio")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, msg.content.audio.audio.remote.id)
Redis:set(Fast.."/TemSelva/Caption"..TemSelva_rand, msg.content.caption.text)
elseif msg.content.document and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "document")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, msg.content.document.document.remote.id)
Redis:set(Fast.."/TemSelva/Caption"..TemSelva_rand, msg.content.caption.text)
elseif msg.content.animation and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "animation")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, msg.content.animation.animation.remote.id)
Redis:set(Fast.."/TemSelva/Caption"..TemSelva_rand, msg.content.caption.text)
elseif msg.content.video and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "video")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, msg.content.video.video.remote.id)
Redis:set(Fast.."/TemSelva/Caption"..TemSelva_rand, msg.content.caption.text)
elseif msg.content.photo and Redis:get(Fast.."Add:Sections:Text:Type"..TemSelva) ~= "text" then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Button:Sections:Text:Type"..TemSelva_rand, "photo")
Redis:set(Fast.."/TemSelva/"..TemSelva_rand, idPhoto)
Redis:set(Fast.."/TemSelva/Caption"..TemSelva_rand, msg.content.caption.text)
else
return send(msg_chat_id,msg_id,"• احنا قولنا هتحط ميديا يبقا كلو ميديا هتحط نص يبقا كلو نص","md")  
end
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, "set_inline")
Redis:set(Fast.."in_inline_button:"..TemSelvas, "/TemSelva/"..TemSelva_rand)
send(msg_chat_id,msg_id,"• تم اضافه الزر بنجاح\n• الان ارسل الكلام داخل الزر التالي \n• او انهاء لحفظ القسم","md",true, false, false, false, reply_markup)  
return false  
end
  
if text and Redis:get(Fast.."Add:Sections:Text:inline"..text) then
local button = Redis:smembers(Fast.."Sections:inline:text"..text)    
local inline_TemSelva = {data = {}}
for k,v in pairs(button) do
inline_TemSelva[k] = {{text = v , data = msg.sender_id.user_id..Redis:get(Fast.."in_inline_button:"..v).."&"..text}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = inline_TemSelva
}
if Redis:get(Fast.."Add:Sections:Text:Type"..text) == "text" then
local Texingt = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Status_Gps = msg.Name_Controller
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "audio" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendAudio(msg_chat_id, msg.id, media,caption, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "document" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendDocument(msg_chat_id, msg.id, media, caption, 'md',nil, nil, nil, nil,nil, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "animation" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendAnimation(msg_chat_id,msg.id, media, caption, 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "video" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendVideo(msg_chat_id, msg.id, media, caption, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "photo" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendPhoto(msg.chat_id, msg.id, media, caption,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
end
    
if text == ("الاقسام") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Sections:inline")
text = "• قائمه الاقسام \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
text = text..""..k.." » "..v.."\n"
end
if #list == 0 then
text = "• عذرا لا يوجد اقسام في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
--=> By TemSelva
if text == 'السيرفر' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
send(msg_chat_id,msg_id, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '• •⊱ { نظام التشغيل } ⊰• \n*»» '"$linux_version"'*' 
echo '*------------------------------\n*• •⊱ { الذاكره العشوائيه } ⊰• \n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*• •⊱ { وحـده الـتـخـزيـن } ⊰• \n*»» '"$HardDisk"'*'
echo '*------------------------------\n*• •⊱ { الـمــعــالــج } ⊰• \n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*• •⊱ { الــدخــول } ⊰• \n*»» '`whoami`'*'
echo '*------------------------------\n*• •⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰• \n*»» '"$uptime"'*'
]]):read('*all'),"md")
end
-----------------
if text and text:match('^التفاعل @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^التفاعل @(%S+)$') 
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
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"• التفاعل : "..TotalMsgT, "md")
end
if text == 'التفاعل' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"• التفاعل : "..TotalMsgT, "md")
end


if text and text:match('^رتبته @(%S+)$') then
local UserName = text:match('^رتبته @(%S+)$') 
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
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId_Info.id) or Controller(msg_chat_id,UserId_Info.id)
return send(msg_chat_id,msg_id,"• الرتبه : "..RinkBot, "md")
end
if text == 'رتبته' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..rep_idd) or Controller(msg_chat_id,rep_idd)
return send(msg_chat_id,msg_id,"• الرتبه : "..RinkBot, "md")
end
if text =='رقمي' then
local UserInfo = bot.getUser(senderr)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "• رقمك موضوع لجهات اتصالك فقط"
else
MyNumber = "*• رقمك ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text ==("رقمه") and msg.reply_to_message_id ~= 0 or text ==("رقمة") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n• عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*• رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text and (text:match('^رقمه (%d+)$') or text:match('^رقمة (%d+)$')) then
local UserId = (text:match('^رقمه (%d+)$') or text:match('^رقمة (%d+)$'))
local UserInfo = bot.getUser(UserId)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*• رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text and (text:match('^رقمه @(%S+)$') or text:match('^رقمة @(%S+)$')) then
local UserName = (text:match('^رقمه @(%S+)$') or text:match('^رقمة @(%S+)$'))
local UserId_Info = bot.searchPublicChat(UserName)
local UserInfo = bot.getUser(UserId_Info.id)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*• رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text == "اسم المجموعه" or text == "اسم المجموعة" then
Get_Chat = bot.getChat(msg.chat_id)
return send(msg_chat_id,msg_id,'• اسم المجموعه ⇞⇟\n〘 '..Get_Chat.title..' 〙', "html")
end
if text == "ايديي" then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = "ايديك ⋮ "..senderr, data = senderr.."/show_id"},}}}
return send(msg_chat_id, msg_id, "*• اضغط على الزر لنسخ ايديك ٫*", "md", false, false, false, false, reply_markup)
end
if text == "رقم اسكرين البوت" then 
return send(msg_chat_id,msg_id, ScreenBot, "md")
end
if text ==("ايدييه") and msg.reply_to_message_id ~= 0 or text ==("ايديه") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n• عذرا هذا المستخدم غير مدعوم *","md",true)  
end
return send(msg_chat_id,msg_id,'*• ايدييه ⇿*〘 `'..Message_Reply.sender_id.user_id..'` 〙', "md")
end
if text and (text:match('^ايدييه @(%S+)$') or text:match('^ايديه @(%S+)$')) then
local UserName = (text:match('^ايدييه @(%S+)$') or text:match('^ايديه @(%S+)$'))
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*\n•  عذرآ لا يوجد حساب بهذا المعرف *","md",true)  
end
return send(msg_chat_id,msg_id,'*\n• ايديه ⇿*〘 `'..UserId_Info.id..'` 〙', "md")
end
if text == "معرفي" or text == "يوزري" then
local UserInfo = bot.getUser(senderr)
text ='• معرفك ⇿〘 User 〙'
local text = text:gsub('User',('@'..UserInfo.username or ''))
bot.sendText(msg_chat_id, msg_id, text, 'html',true)
end
if text ==("معرفه") and msg.reply_to_message_id ~= 0 or text ==("معرفة") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n• عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return bot.sendText(msg_chat_id,msg_id,'*• معرفه ⇿〘 '..UserInfousername..' 〙*',"md",true) 
end
if text and (text:match('^معرفه (%d+)$') or text:match('^معرفة (%d+)$')) then
local UserId = (text:match('^معرفه (%d+)$') or text:match('^معرفة (%d+)$'))
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
return bot.sendText(msg_chat_id,msg_id,'*• معرفه ⇿〘 '..UserName..' 〙*',"md",true) 
end
if text == "ايدي" or text =='id' or text =='Id' or text == 'ID' and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⌔ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⌔ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Id"..msg_chat_id) then
send(msg_chat_id,msg_id,'*\n • الايدي معطل من قبل ادمنيه الجروب 🥹❤️ *',"md",true)  
return false
end
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
if not Redis:sismember(Fast.."like:user:", msg.sender_id.user_id) then
Redis:sadd(Fast.."like:user:", msg.sender_id.user_id)
end
local like_num = Redis:smembers(Fast.."like:users:"..msg.sender_id.user_id)
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '❤️'
Id_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = #like_num.." "..emo , data = msg.sender_id.user_id.."/likeId/"..#like_num}, 
},
{
{text = "◞المعجبين 💌٫", data = msg.sender_id.user_id.."/showLikers"},
},
}
}
Req_like = {
  {text = #like_num.." "..emo , callback_data = msg.sender_id.user_id.."/likeId/"..#like_num},
  {text = "◞المعجبين 💌٫", callback_data = msg.sender_id.user_id.."/showLikers"}
}
else
Req_like = nil
Id_markup = nil
end
local UserInfo = bot.getUser(senderr)
local Timo = bot.getUserFullInfo(senderr)
if Timo.bio then
Bio = Timo.bio
else
Bio = 'لا يوجد'
end
local nameuser = FlterBio(FlterBio(UserInfo.first_name))
local photo = bot.getUserProfilePhotos(senderr)
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك الجروب'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
StatusMemberChat = 'عضو في الجروب'
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr)
if StatusMember.status.custom_title ~= "" then
Lakb = StatusMember.status.custom_title
else
Lakb = 'مشرف'
end
if (StatusMember.status.Fastbots == "chatMemberStatusCreator") then
elseif StatusMember.status.Fastbots == "chatMemberStatusAdministrator" then
local Lakb = ' '..Lakb..' '
else
Lakb = 'لا يوجد لك لقب'
end
local UserId = senderr
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..senderr) or 0
local Text = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..senderr) or 0
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..senderr) or 0
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0
local Texting = {
"〈 جمالك ده طبيعي يولا 🙈💗 〉",
"〈 غير بقاا صورتك يا قمر 😻🤍 〉 ",
"〈 يخرشي علي العسل ده 🥺💔 〉",
"〈 صورتك ولا صورت القمر 🌙💕 〉",
"〈 صورتك عثل ينوحيي 🥺♥️ 〉",
"〈 يغتي قميله 🥺♥ 〉",
"〈 يتي عثل 🥺❤️ 〉",
"〈 شبيك لبيك على العسل 🧸♥️ 〉",
"〈 القمر طالع بالصوره 🥺❤️ 〉",
"〈 منين لك كل هاد الجمال 💗ˣ 〉",
"〈 اجمد جامد ف الجامدين 🥺♥ 〉"
}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(Fast.."Set:Id:Groups") or Redis:get(Fast.."Set:Id:Group"..msg_chat_id)
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#Name',nameuser) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Get_Is_Id, md, true, nil, nil, nil, nil, nil, nil, nil, nil, Id_markup, {has_spoiler=true})
else
return bot.sendText(msg_chat_id,msg_id,Get_Is_Id, "md",true, false, false, false, Id_markup) 
end
else
if photo.total_count > 0 then
local ban_ns = "*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮ "..nameuser.."\n"
.. "𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ "..UserInfousername.."\n"
.. "𝅄 𓏺 𝖨𝖣 ⋮ "..UserId.."\n"
.. "𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ "..TotalMsg.."\n"
.. "𝅄 𓏺 𝖡𝗈𝗍 𝖱𝖺𝗇𝗄 ⋮ "..RinkBot.."\n"
.. "𝅄 𓏺 𝖱𝗈𝗈𝗆 𝖱𝖺𝗇𝗄 ⋮ "..StatusMemberChat.."\n"
.. "𝅄 𓏺 𝖳𝗂𝗍𝗅𝖾 ⋮ "..Lakb.."\n"
.. "𝅄 𓏺 𝖯𝗁𝗈𝗍𝗈𝗌 ⋮ "..photo.total_count.."\n"
.. "𝅄 𓏺 𝖡𝗂𝗈 ⋮ "..Bio.."*"
data = {} 
data.inline_keyboard = {
Req_like
}
msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&has_spoiler=true &reply_markup="..JSON.encode(data))
else
local ban_ns = "*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮ "..nameuser.."\n"
.. "𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ "..UserInfousername.."\n"
.. "𝅄 𓏺 𝖨𝖣 ⋮ "..UserId.."\n"
.. "𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ "..TotalMsg.."\n"
.. "𝅄 𓏺 𝖡𝗈𝗍 𝖱𝖺𝗇𝗄 ⋮ "..RinkBot.."\n"
.. "𝅄 𓏺 𝖱𝗈𝗈𝗆 𝖱𝖺𝗇𝗄 ⋮ "..StatusMemberChat.."\n"
.. "𝅄 𓏺 𝖳𝗂𝗍𝗅𝖾 ⋮ "..Lakb.."\n"
.. "𝅄 𓏺 𝖯𝗁𝗈𝗍𝗈𝗌 ⋮ "..photo.total_count.."\n"
.. "𝅄 𓏺 𝖡𝗂𝗈 ⋮ "..Bio.."*"
data = {} 
data.inline_keyboard = {
Req_like
}
msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendMessage?chat_id=" .. msg_chat_id .. "&text=".. URL.escape(ban_ns).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#Name',nameuser) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
return bot.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']', "md",true, false, false, false, Id_markup) 
else
local ban_ns = "*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮ "..nameuser.."\n"
.. "𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ "..UserInfousername.."\n"
.. "𝅄 𓏺 𝖨𝖣 ⋮ "..UserId.."\n"
.. "𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ "..TotalMsg.."\n"
.. "𝅄 𓏺 𝖡𝗈𝗍 𝖱𝖺𝗇𝗄 ⋮ "..RinkBot.."\n"
.. "𝅄 𓏺 𝖱𝗈𝗈𝗆 𝖱𝖺𝗇𝗄 ⋮ "..StatusMemberChat.."\n"
.. "𝅄 𓏺 𝖳𝗂𝗍𝗅𝖾 ⋮ "..Lakb.."\n"
.. "𝅄 𓏺 𝖯𝗁𝗈𝗍𝗈𝗌 ⋮ "..photo.total_count.."\n"
.. "𝅄 𓏺 𝖡𝗂𝗈 ⋮ "..Bio.."*"
data = {} 
data.inline_keyboard = {
Req_like
}
msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendMessage?chat_id=" .. msg_chat_id .. "&text=".. URL.escape(ban_ns).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
end

if text and text:match('^تحكم @(%S+)$') then
local UserName = text:match('^تحكم @(%S+)$') 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,UserId_Info.id) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,UserId_Info.id)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,UserId_Info.id)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,UserId_Info.id)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,UserId_Info.id)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,UserId_Info.id)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,UserId_Info.id)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..UserId_Info.id},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..UserId_Info.id},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..UserId_Info.id},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..UserId_Info.id},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..UserId_Info.id},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..UserId_Info.id},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..UserId_Info.id},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..UserId_Info.id},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n• تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'تحكم' and msg.reply_to_message_id > 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,rep_idd) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,rep_idd)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,rep_idd)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,rep_idd)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,rep_idd)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,rep_idd)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,rep_idd)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..rep_idd},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..rep_idd},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..rep_idd},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..rep_idd},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..rep_idd},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..rep_idd},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..rep_idd},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..rep_idd},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n• تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'ايدي' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local InfoUser = bot.getUserFullInfo(rep_idd)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local Timo = 'بالرد علي الشخص'
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local RinkBot = Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'*\n╖ الاسم ⇇* '..Text..
'*\n╢ الايدي ⇇ '..UserId..
'\n╢ المعرف ⇇ '..UserInfousername..
'\n╢ الرتبه ⇇ '..RinkBot..
'\n╢ الرسائل ⇇ '..TotalMsg..
'\n╢ التعديلات ⇇ '..TotalEdit..
'\n╢ التفاعل ⇇ '..TotalMsgT..
'\n╢ نوع الايدي ⇇ '..Timo..
'*\n*╜ البايو ⇇ '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'*\n╖ الاسم ⇇* '..Text..
'*\n╢ الايدي ⇇ '..UserId..
'\n╢ المعرف ⇇ '..UserInfousername..
'\n╢ الرتبه ⇇ '..RinkBot..
'\n╢ الرسائل ⇇ '..TotalMsg..
'\n╢ التعديلات ⇇ '..TotalEdit..
'\n╢ التفاعل ⇇ '..TotalMsgT..
'\n╢ نوع الايدي ⇇ '..Timo..
'*\n*╜ البايو ⇇ '..FlterBio(getbio(rep_idd))..'*',"md",true) 
else
return send(msg_chat_id,msg_id,
'*\n╖ الاسم ⇇* '..Text..
'*\n╢ الايدي ⇇ '..UserId..
'\n╢ المعرف ⇇ '..UserInfousername..
'\n╢ الرتبه ⇇ '..RinkBot..
'\n╢ الرسائل ⇇ '..TotalMsg..
'\n╢ التعديلات ⇇ '..TotalEdit..
'\n╢ التفاعل ⇇ '..TotalMsgT..
'\n╢ نوع الايدي ⇇ '..Timo..
'*\n*╜ البايو ⇇ '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
else
return send(msg_chat_id,msg_id,
'*\n╖ الاسم ⇇* '..Text..
'*\n╢ الايدي ⇇ '..UserId..
'\n╢ المعرف ⇇ '..UserInfousername..
'\n╢ الرتبه ⇇ '..RinkBot..
'\n╢ الرسائل ⇇ '..TotalMsg..
'\n╢ التعديلات ⇇ '..TotalEdit..
'\n╢ التفاعل ⇇ '..TotalMsgT..
'\n╢ نوع الايدي ⇇ '..Timo..
'*\n*╜ البايو ⇇ '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
end

if text and text:match('^كشف (%d+)$') then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId = text:match('^كشف (%d+)$')
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
local Timo = 'كشف بالايدي'
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local Selva = ' '..UserInfo.first_name..' '
local RinkBot = Controller(msg_chat_id,UserId)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..UserId) or 0
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..UserId) or 0
if UserInfo.luatele  == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n • عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end 
local Timooo = {
"〈 اي جمدان حسابك دا 🙈💗 〉",
"〈 يخرشي علي العسل ده 🥺💔 〉",
"〈 يغتي قميله 🥺♥ 〉",
"〈 يتي عثل 🥺❤️ 〉",
"〈 شبيك لبيك على العسل 🧸♥️ 〉",
"〈 منين لك كل هاد الجمال 💗ˣ 〉",
"〈 اجمد جامد ف الجامدين 🥺♥ 〉"
}
local Selvaa = Timooo[math.random(#Timooo)]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Selva, url='http://t.me/'..UserInfo.username..''},
},
}
}
return send(msg_chat_id, msg_id,
'*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮* '..Text..'\n'
..'*𝅄 𓏺 𝖨𝖣 ⋮ '..UserId..'\n'
..'𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ '..UserName..'\n'
..'𝅄 𓏺 𝖱𝖺𝗇𝗄 ⋮ '..RinkBot..'\n'
..'𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ '..TotalMsg..'\n'
..'𝅄 𓏺 𝖤𝖽𝗂𝗍𝗌 ⋮ '..TotalEdit..'\n'
..'𝅄 𓏺 𝖨𝗇𝗍𝖾𝗋𝖺𝖼𝗍𝗂𝗈𝗇 ⋮ '..TotalMsgT..'\n'
..'𝅄 𓏺 𝖢𝗁𝖾𝖼𝗄 𝖳𝗒𝗉𝖾 ⋮ '..Timo..'\n'
..'𝅄 𓏺 𝖯𝗋𝗂𝖼𝖾 𝖮𝖥 𝖢𝗁𝖾𝖼𝗄 ('..math.random(1,100)..') 𝖤𝖦𝖯 🤑\n'
..'𝅄 𓏺 𝖡𝗂𝗈 ⋮ '..FlterBio(getbio(UserId))..'*',
"md", false, false, false, false, reply_markup)
end
if text == 'كشف'  and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local Selva = ' '..UserInfo.first_name..' '
local Timo = 'كشف بالرد'
local RinkBot = Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
local Timooo = {
"〈 اي جمدان حسابك دا 🙈💗 〉",
"〈 يخرشي علي العسل ده 🥺💔 〉",
"〈 يغتي قميله 🥺♥ 〉",
"〈 يتي عثل 🥺❤️ 〉",
"〈 شبيك لبيك على العسل 🧸♥️ 〉",
"〈 منين لك كل هاد الجمال 💗ˣ 〉",
"〈 اجمد جامد ف الجامدين 🥺♥ 〉"
}
local Selvaa = Timooo[math.random(#Timooo)]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Selva, url='http://t.me/'..UserInfo.username..''},
},
}
}
return send(msg_chat_id, msg_id,
'*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮* '..Text..'\n'
..'*𝅄 𓏺 𝖨𝖣 ⋮ '..UserId..'\n'
..'𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ '..UserInfousername..'\n'
..'𝅄 𓏺 𝖱𝖺𝗇𝗄 ⋮ '..RinkBot..'\n'
..'𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ '..TotalMsg..'\n'
..'𝅄 𓏺 𝖤𝖽𝗂𝗍𝗌 ⋮ '..TotalEdit..'\n'
..'𝅄 𓏺 𝖨𝗇𝗍𝖾𝗋𝖺𝖼𝗍𝗂𝗈𝗇 ⋮ '..TotalMsgT..'\n'
..'𝅄 𓏺 𝖢𝗁𝖾𝖼𝗄 𝖳𝗒𝗉𝖾 ⋮ '..Timo..'\n'
..'𝅄 𓏺 𝖯𝗋𝗂𝖼𝖾 𝖮𝖥 𝖢𝗁𝖾𝖼𝗄 ('..math.random(1,100)..') 𝖤𝖦𝖯 🤑*',
"md", false, false, false, false, reply_markup)
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*• عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local UserId = UserId_Info.id
local UserInfo = bot.getUser(UserId)
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local Selva = ' '..UserInfo.first_name..' '
local Timo = 'كشف بالمعرف'
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local Timooo = {
"〈 اي جمدان حسابك دا 🙈💗 〉",
"〈 يخرشي علي العسل ده 🥺💔 〉",
"〈 يغتي قميله 🥺♥ 〉",
"〈 يتي عثل 🥺❤️ 〉",
"〈 شبيك لبيك على العسل 🧸♥️ 〉",
"〈 منين لك كل هاد الجمال 💗ˣ 〉",
"〈 اجمد جامد ف الجامدين 🥺♥ 〉"
}
local Selvaa = Timooo[math.random(#Timooo)]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Selva, url='http://t.me/'..UserInfo.username..''},
},
}
}
return send(msg_chat_id, msg_id,
'*𝅄 𓏺 𝖭𝖺𝗆𝖾 ⋮* '..Text..'\n'
..'*𝅄 𓏺 𝖨𝖣 ⋮ '..UserId..'\n'
..'𝅄 𓏺 𝖴𝗌𝖾𝗋 ⋮ @'..UserName..'\n'
..'𝅄 𓏺 𝖱𝖺𝗇𝗄 ⋮ '..RinkBot..'\n'
..'𝅄 𓏺 𝖬𝖾𝗌𝗌𝖺𝗀𝖾𝗌 ⋮ '..TotalMsg..'\n'
..'𝅄 𓏺 𝖤𝖽𝗂𝗍𝗌 ⋮ '..TotalEdit..'\n'
..'𝅄 𓏺 𝖨𝗇𝗍𝖾𝗋𝖺𝖼𝗍𝗂𝗈𝗇 ⋮ '..TotalMsgT..'\n'
..'𝅄 𓏺 𝖢𝗁𝖾𝖼𝗄 𝖳𝗒𝗉𝖾 ⋮ '..Timo..'\n'
..'𝅄 𓏺 𝖯𝗋𝗂𝖼𝖾 𝖮𝖥 𝖢𝗁𝖾𝖼𝗄 ('..math.random(1,100)..') 𝖤𝖦𝖯 🤑*',
"md", false, false, false, false, reply_markup)
end

if text == "تفاعلي" then
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,'\n*• تفاعلك : '..TotalMsgT..'* ',"md",true)  
end
if text == 'فحص البوت' then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,'• البوت عضو في الجروب ',"md",true) 
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,Fast).status 
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
PermissionsUser = '*\n• صلاحيات البوت : مشرف في الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^حذف (%d+)$') and tonumber(senderr) == tonumber(6702141393) then
local NumMessage = tonumber(text:match('^حذف (%d+)$'))
local mm = msg.id/2097152/0.5
xxx = 0
for i = 1,NumMessage do
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..mm)
mm = mm - 1
xxx = xxx +1
end
send(msg_chat_id, msg_id, "• تم مسح "..xxx.. ' رساله', 'md')
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return send(msg_chat_id,msg_id,'\n*• العدد اكثر من 1000 لا تستطيع المسح',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = bot.deleteMessages(msg.chat_id,{[1]= Message})
Message = Message - 1048576
end
send(msg_chat_id, msg_id, "• تم مسح "..NumMessage.. ' رساله', 'md')
end


if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(Fast.."allM"..msg.chat_id, msg.id)
if Redis:get(Fast.."Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(Fast.."allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(Fast.."allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "• تم مسح "..k.." من الوسائط تلقائيا\n• يمكنك تعطيل الميزه باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
send(msg_chat_id,msg_id, t)
Redis:del(Fast.."allM"..msg.chat_id)
end
end
end
if text and text:match("^ضع عدد المسح (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع عدد المسح (%d+)$")
Redis:set(Fast.."allM:numdel"..msg.chat_id,Numbardel) 
send(msg_chat_id,msg_id, 'تم تعيين العدد  الى : '..Numbardel)
end
if text == "امسح" or text == "مسح الميديا" then
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
local list = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "• تم مسح "..k.." من الوسائط الموجوده"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."allM"..msg.chat_id)
end
end
if #list == 0 then
t = "• لا يوجد ميديا في الجروب"
end
 send(msg_chat_id,msg_id, t)
end
if text == ("الميديا") then
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
local gmria = Redis:scard(Fast.."allM"..msg.chat_id)  
 send(msg_chat_id,msg_id,"• عدد الميديا الموجود هو (* "..gmria.." *)","md")
end


if text == 'المالك' or text == 'المنشئ' or text == 'owner' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}}}}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*', "md", false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}}}}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*', "md", false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id, msg_id, "\n*• عذرًا، البوت ليس أدمن في الجروب. يرجى ترقيته وتفعيل الصلاحيات له.*", "md", true)
end
local chat_info = bot.getChat(msg_chat_id) 
local group_name = chat_info.title or "تيمو الخالدي هكر"
local group_id = msg_chat_id
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local timo = bot.getUser(v.member_id.user_id)
local qp = bot.getUser(v.member_id.user_id)
if timo.first_name == "" then
send(msg_chat_id, msg_id, "*• المالك حسابه محذوف\n√*", "md", true)
return false
end 
local InfoUser = bot.getUserFullInfo(v.member_id.user_id)
local Bio = InfoUser.bio or 'تيمو الخالدي هكر'
local photo = bot.getUserProfilePhotos(v.member_id.user_id)
local owner_id = timo.id
local owner_username = qp.username and "t.me/"..qp.username or "تيمو الخالدي هكر"
local owner_name = timo.first_name or "تيمو الخالدي هكر"
local T = "*𝅄 𓏺 𝖦𝗋𝗈𝗎𝗉 𝖮𝗐𝗇𝖾𝗋 𝖨𝗇𝖿𝗈𝗋𝗆𝖺𝗍𝗂𝗈𝗇*\n" ..
"*𝅄 𓏺 𝖮𝗐𝗇𝖾𝗋 𝖭𝖺𝗆𝖾 ⋮* ["..owner_name.."](tg://user?id="..owner_id..")\n" ..
"*𝅄 𓏺 𝖮𝗐𝗇𝖾𝗋 𝖨𝖣 ⋮* "..owner_id.."\n" ..
"*𝅄 𓏺 𝖮𝗐𝗇𝖾𝗋 𝖴𝗌𝖾𝗋 ⋮* "..owner_username.."\n" ..
"*𝅄 𓏺 𝖦𝗋𝗈𝗎𝗉 𝖭𝖺𝗆𝖾 ⋮* "..group_name.."\n" ..
"*𝅄 𓏺 𝖦𝗋𝗈𝗎𝗉 𝖨𝖣 ⋮* "..group_id.."\n" ..
"*𝅄 𓏺 𝖡𝗂𝗈 ⋮ "..Bio.."*"
local keyboard = {inline_keyboard = {{{text =owner_name, url = "https://t.me/"..(qp.username or "")}}}}
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local selva = owner_id
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
local notify_text = "*〈 نداء اليك يا مالك الجروب 🥺♥ 〉\n\n" .. "• الاسم *⇇⦉ " .. linked_name .. " ⦊\n" .. "*• اليوزر ⇇ ⦉ " .. sender_username .. " ⦊*\n" .. "*• الايدي ⇇* ⦉ `" .. sender_id .. "` ⦊\n*• في جروب ⇇ *⦉ " ..linked_group.." ⦊ \n".."*• اليوم ⇇ ⦉ " .. day_of_week .. " ⦊\n".."• التاريخ ⇇ ⦉ " .. current_date .. " ⦊\n".."• الوقت ⇇ ⦉ " .. current_time .. " ⦊*"
local Timo_Selva = bot.replyMarkup{type = 'inline',data = {{{text = sender_name, url = sender_username_link},},
{{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, },}}
bot.sendText(selva,0,notify_text,"md",false, false, false, false, Timo_Selva)
if photo.total_count > 0 then
local msgg = msg_id / 2097152 / 0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&has_spoiler=true&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg_chat_id, msg_id, T, "md", false, false, false, false, bot.replyMarkup{type = 'inline', data = keyboard.inline_keyboard})
end
end
end
end


if text == 'كشف البوتات' then
if not msg.Manger then
return send(msg_chat_id, msg_id, '*• انت لست مدير\n√*', "md", true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id, msg_id, "\n*• عذرًا، البوت ليس أدمن في الجروب، يرجى ترقيته وتفعيل الصلاحيات له *", "md", true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
local buttons = {}
local x = 0
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
local isAdmin = Info_Members.members[k].status.Fastbots == "chatMemberStatusAdministrator"
local botStatus
if isAdmin then
x = x + 1
botStatus = "⦉ ✅ ⦊"
else
botStatus = "⦉ ❌ ⦊"
end
table.insert(buttons, {
{text = UserInfo.first_name, url = "https://t.me/" .. UserInfo.username},
{text = botStatus, url = "https://t.me/" .. UserInfo.username},})
end
local reply_markup = bot.replyMarkup{type = 'inline',data = buttons}
local messageText = "*ꔹ━━━━━━━━━━ꔹ\n• قائمة البوتات الموجودة ⋮ ⦉ "..#List_Members.." ⦊\n• عدد البوتات التي هي أدمن ⋮ ⦉ "..x.." ⦊\n• علامه ⦉ ✅ ⦊ تعني ان البوت ادمن\n• علامه ⦉ ❌ ⦊ تعني ان البوت ليس ادمن*"
bot.sendText(msg_chat_id, msg_id, messageText, "md", false, false, false, false, reply_markup)  
end


 
if text == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*• عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
restricted = '\n* • قائمه المقيديين ↑↓\n ꔹ━━━━━━━━━━ꔹ*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." -> @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." -> *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
send(msg_chat_id,msg_id,restricted,"md",true)  
else
send(msg_chat_id,msg_id,'*• لا يوجد مقيدين\n√*',"md",true)  
end
end

if text then
if text == (Redis:get(Fast.."Name:Bot") or "[الخالدي]").."غـادر" or text == 'غادر' or text == 'بوت غادر' then
if not msg.Asasy then
return send(msg_chat_id, msg_id, '*• هذا الامر يخص المطور الاساسي*', "md", true)
end
local bain = bot.getUser(senderr)
local UserInfo = bot.getUser(Fast)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Name_User = UserInfo.first_name
local ttimo = "*• عزيزي ⋮ ⦉ "..Text.." ⦊ \n• هل تريد بوت ⋮ *⦉ ["..Name_User.."](t.me/"..UserInfo.username..") ⦊*\n• ان يغادر من المجموعه\n*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• نعم •', data = senderr..'/yesmogajder'},
},
{
{text = '• لا •', data = senderr..'/noomoghader'},
},
}
}
return send(msg_chat_id, msg_id, ttimo, "md", false, false, false, false, reply_markup)
end

end

if text == "قفل ارسال القناة" or text == "قفل القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:SenderChat"..msg_chat_id,true) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل ارسال القناة").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح ارسال القناة" or text == "فتح القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:SenderChat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح ارسال القناة").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:phshar"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفشار").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:phshar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفشار").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الكفر" or text == "قفل السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:alkfr"..msg_chat_id,true) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكفر").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح الكفر" or text == "فتح السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:alkfr"..msg_chat_id)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكفر").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الكفر للادمنيه" or text == "قفل السب للادمنيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:alkfr:admin"..msg_chat_id,true) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكفر").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح الكفر للادمنيه" or text == "فتح السب للادمنيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:alkfr:admin"..msg_chat_id)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكفر للادمنيه").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "تفعيل النداء" or text == "تفعيل الندا" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*•  هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:set(Fast..'tag_mem'..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n • تم تفعيل النداء')
end
if text == "تعطيل النداء" or text == "تفعيل الالنداء" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*•  هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:del(Fast..'tag_mem'..msg.chat_id)
send(msg.chat_id,msg.id,'\n • تم تعطيل النداء')
end
if text == "قفل الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:english"..msg_chat_id,true) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀??𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانكليزيه").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:english"..msg_chat_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الانكليزيه").unLock,"md",false, false, false, false, reply_markup)
return false
end 

if text == 'قناة السورس' or text == 'قناه السورس' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
return bot.sendText(msg.chat_id, msg.id, [[
𝗰𝗵𝗮𝗻𝗻𝗲𝗹 𝘀𝗼𝘂𝗿𝗰𝗲 .
]],"md",false, false, false, false, reply_markup)
end 

if text == 'مصنع' or text == 'صانع' or text == 'المصنع' then   
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اصنع بوتك الان •', url = "https://t.me/Hhhsgsggbot"}
},
}
}
return bot.sendText(msg.chat_id, msg.id, [[
↜( اضغط علي الزر لصنع بوتك )↝
]],"md",false, false, false, false, reply_markup)
end 
if text == 'رابط الحذف' or text == 'روابط الحذف' or text == 'رابط حذف' then   
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• ᴛᴇʟᴇɢʀᴀᴍ •',url="https://my.telegram.org/auth?to=delete"},
},
{
{text = '• ɪɴꜱᴛᴀɢʀᴀᴍ •',url="https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"},
},
{
{text = '• ꜱɴᴀᴘᴄʜᴀᴛ •',url="https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"},
},
}
}
return bot.sendText(msg.chat_id, msg.id, [[
╭──── • ◈ • ────╮
么 روابط حذف مواقع
╰──── • ◈ • ────╯
]],"md",false, false, false, false, reply_markup)
end 
if text == 'بوت حذف' or text == 'بوت الحذف' or text == 'حذف حسابي' then   
photo = "https://t.me/UOUSOU/26"
local T =[[
╭──── • ◈ • ────╮
么 بوت حذف حسابات
╰──── • ◈ • ────╯
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• ᴅᴇʟᴇᴛᴇ ᴛᴇʟᴇɢʀᴀᴍ •', url = 't.me/LC6BOT '}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--------------------------------------------------------------
if text and (text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$")) then
local UserId = Text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$") 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast..'SOFI:Channe:Vip'..senderr,UserId)
local Text = " • تم حفظ قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="• الغاء •",data="/DelChanneVip:"..senderr}},
{{text="• اخفاء •",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}}, 
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false   
end
if text == "حذف قناتي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if not Redis:get(Fast..'SOFI:Channe:Vip'..senderr) then
Text = " • انت لم تقم بوضع قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false
else
Redis:del(Fast..'SOFI:Channe:Vip'..senderr)
Text = " • تم حذف قناتك بنجاح"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false
end
end
if Redis:get(Fast..'SetChanneVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* • تم الغاء حفظ قناتك *',"md",true)  
Redis:del(Fast..'SetChanneVip'..senderr)
return false  
end 
Redis:del(Fast..'SetChanneVip'..senderr)
Redis:set(Fast..'SOFI:Channe:Vip'..senderr,text)
local text = "*• تم حفظ قناتك بنجاح ✅*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير قناتي",data="/ChangeChanneVip:"..senderr},{text="حذف قناتي",callback_data="/DelChanneVip:"..senderr}},
{{text="وضع بوتي",data="/ChangeBotVip:"..senderr}},{{text="وضع جروبي",data="/ChangeGroupVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع قناتي$") or text and text:match("^وضع قناتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*• حسنا ارسل لي قناتك الان*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelChanneVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetChanneVip'..senderr,true)
return false
end
if text and text:match("^قناتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if not Redis:get(Fast..'SOFI:Channe:Vip'..senderr) then
bot.sendText(msg_chat_id,msg_id, "* • لم تقم باضافة قناتك\n • قم بارسال وضع قناتي *","md",true)
else
local rules = Redis:get(Fast..'SOFI:Channe:Vip'..senderr)
bot.sendText(msg_chat_id,msg_id, rules,"html",true)
end
end
if Redis:get(Fast..'SetGroupVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* • تم الغاء حفظ جروبك *',"md",true)  
Redis:del(Fast..'SetGroupVip'..senderr)
return false  
end 
Redis:del(Fast..'SetGroupVip'..senderr)
Redis:set(Fast..'SOFI:Group:Vip'..senderr,text)
local text = "*• تم حفظ جروبك بنجاح ✅*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير جروبي",data="/ChangeGroupVip:"..senderr},{text="حذف جروبي",callback_data="/DelGroupVip:"..senderr}},
{{text="وضع بوتي",data="/ChangeBotVip:"..senderr}},{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideGroupVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع جروبي$") or text and text:match("^وضع جروبي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*• حسنا ارسل لي جروبك الان*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelGroupVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetGroupVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetnameVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* • تم الغاء حفظ اسمك 💥*',"md",true)  
Redis:del(Fast..'SetnameVip'..senderr)
return false  
end 
Redis:del(Fast..'SetnameVip'..senderr)
Redis:set(Fast..'Game:name'..senderr,text)
local text = "*• تم حفظ اسمك بنجاح 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير اسمي",data="/ChangenameVip:"..senderr},{text="حذف اسمي",callback_data="/DelnameVip:"..senderr}},
{{text="وضع سني",data="/ChangeSunniVip:"..senderr}},
{{text="اخفاء",data="/hidename:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع اسمي$") or text and text:match("^وضع اسمي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*• حسنا ارسل لي اسمك الان 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelnameVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetnameVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetSunniVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* • تم الغاء حفظ سنك ⏺️ *',"md",true)  
Redis:del(Fast..'SetSunniVip'..senderr)
return false  
end 
Redis:del(Fast..'SetSunniVip'..senderr)
Redis:set(Fast..'Game:Sunni'..senderr,text)
local text = "*• تم حفظ اسمك سنك ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سني",data="/ChangeSunniVip:"..senderr},{text="حذف سني",callback_data="/deleteSunni:"..senderr}},
{{text="وضع اسمي",data="/ChangenameVip:"..senderr}},
{{text="اخفاء",data="/hideSunni:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع سني$") or text and text:match("^وضع سني$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*• حسنا ارسل لي سنك الان ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelageVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetSunniVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetBotVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* • تم الغاء حفظ بوتك 🤖 *',"md",true)  
Redis:del(Fast..'SetBotVip'..senderr)
return false  
end 
Redis:del(Fast..'SetBotVip'..senderr)
Redis:set(Fast..'SOFI:Bot:Vip'..senderr,text)
local text = "*• تم حفظ بوتك بنجاح 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير بوتي",data="/ChangeBotVip:"..senderr},{text="حذف بوتي",callback_data="/DelBotVip:"..senderr}},
{{text="وضع جروبي",data="/ChangeGroupVip:"..senderr}},{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideBotVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع بوتي$") or text and text:match("^وضع بوتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n • عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*• حسنا ارسل لي بوتك الان 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelBotVip:"..senderr}},
{{text='⌁ قناة السورس •',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetBotVip'..senderr,true)
return false
end
if text == 'مسح اسمي' or text == 'حذف اسمي' then
Redis:del(Fast..'Game:name'..senderr)
send(msg.chat_id,msg.id, "*• تم مسح اسمك بنجاح ✅*","md",true)
end
if text == 'مسح سني' or text == 'حذف سني' then
Redis:del(Fast..'Game:Sunni'..senderr)
send(msg.chat_id,msg.id, "*• تم مسح سنك بنجاح ✅*","md",true)
end
if text == "قفل التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:tphlesh"..msg_chat_id,true) 
Redis:del(Fast.."Status:IdPhoto"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التفليش").Lock,"md",true)  
return false
end 
if text == "فتح التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tphlesh"..msg_chat_id)  
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التفليش").unLock,"md",true)  
return false
end 
if text == "قفل الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:farsia"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفارسيه").Lock,"md",true)  
return false
end 
if text == "فتح الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:farsia"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفارسيه").unLock,"md",true)  
return false
end 

if text == "قفل الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:text"..msg_chat_id,true) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الدردشه").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:AddMempar"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Join"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservr"..msg_chat_id,true)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."lockpin"..msg_chat_id,(bot.getChatPinnedMessage(msg_chat_id).id or true)) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..msg_chat_id,"del")    
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الاوامر").Lock,"md",false, false, false, false, reply_markup)
return false
end 

if text == "قفل وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:AlUasat"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الوسائط المميزين").Lock,"md",true)  
return false
end 
if text == "فتح وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AlUasat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الوسائط المميزين").unLock,"md",true)  
return false
end 

if text == "قفل الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الوسائط").Lock,"md",true)  
return false
end 
if text == "فتح الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الوسائط").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AddMempar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:text"..msg_chat_id)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼??𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الدردشه").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "فتح الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Join"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:del(Fast.."Lock:tagservr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."lockpin"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" or text == "فتح تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..msg_chat_id)    
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الاوامر").unLock,"md",false, false, false, false, reply_markup)
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
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
{text = '• لكل المستخدمين •', data = senderr..'/rabet_mos'}, 
},
{
{text = '• للاعضاء فقط •', data = senderr..'/rabet_kol'}, 
},
}
}
send(msg_chat_id,msg_id,"*• بواسطه ⦉ "..Text.." ⦊\n• تم قفل الروابط 🌿❤️.\n• حدد نوع حذف الروابط من الاسفل 🌿❤️.*","md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الروابط بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Link"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:User:Name"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:hashtak"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Cmd"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"del")  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").Lock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الالعاب بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:geam"..msg_chat_id)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url='http://t.me/'..chsource..''},
},
}
}
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الالعاب").unLock,"md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Keyboard"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
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
{text = '• حدد العقوبه •', data = senderr..'/mlsk_kol'}, 
},
}
}
send(msg_chat_id,msg_id,"*• بواسطه ⦉ "..Text.." ⦊\n• تم قفل الملصقات 🌿❤️.\n• حدد نوع حذف الملصقات من الاسفل 🌿❤️.*","md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل الملصقات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
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
{text = '• لكل المستخدمين •', data = senderr..'/forward_mos'}, 
},
{
{text = '• للاعضاء فقط •', data = senderr..'/forward_kol'}, 
},
}
}
send(msg_chat_id,msg_id,"*• بواسطه ⦉ "..Text.." ⦊\n• تم قفل التوجيه 🌿❤️.\n• حدد نوع حذف التوجيه من الاسفل 🌿❤️.*","md",false, false, false, false, reply_markup)
return false
end 
if text == "قفل التوجيه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:forward"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Document"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Unsupported"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Markdaun"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Contact"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Spam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Inlen"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Link"..msg_chat_id..""..senderr,120,true) 
return send(msg_chat_id,msg_id,"• ارسل رابط الجروب او رابط قناة الجروب","md",true)  
end
if text == "مسح الرابط" or text == "مسح الرابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Link"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(Fast.."Status:Link"..msg_chat_id) then
return send(msg_chat_id,msg_id,"• تم تعطيل الرابط من قبل الادارة","md",true)
end 
local Get_Chat = bot.getChat(msg_chat_id)
local GetLink = Redis:get(Fast.."Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return send(msg_chat_id, msg_id, "• Link Group : \n["..GetLink.."]", 'md', true, false, false, false, reply_markup)
else
return send(msg_chat_id, msg_id, "• لا يوجد رابط ارسل انشاء رابط", 'md', true, false, false, false, reply_markup)
end
end
if text == "انشاء رابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'abbas',tonumber(msg.date+864000),100,false)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"• لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup.invite_link) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return send(msg_chat_id, msg_id, "• Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end
----------------------------------------------

if text and Redis:get(Fast.."Lock:Link"..msg_chat_id) == "del" then
if text:match("https?://") or text:match("www%.") then
if msg.Dev or msg.Admin then
return false
end
local UserInfo = bot.getUser(senderr)
local UserName = UserInfo.first_name or "مجهول"
local UserMention = "["..UserName.."](tg://user?id="..senderr..")"
bot.deleteMessages(msg.chat_id, {[1] = msg.id})
send(msg_chat_id, msg_id, "*• عزيزي* ⦉ "..UserMention.." ⦊\n*• ممنوع ارسال الروابط هنا\n√*", "md", true)
return false
end
end

----------------------------------------------

if msg.forward_info and Redis:get(Fast.."Lock:forward"..msg_chat_id) == "del" then
if msg.Dev or msg.Admin then
return false
end
local UserInfo = bot.getUser(senderr)
local UserName = UserInfo.first_name or "مجهول"
local UserMention = "["..UserName.."](tg://user?id="..senderr..")"
bot.deleteMessages(msg.chat_id, {[1] = msg.id}) 
send(msg_chat_id, msg_id, "*• عزيزي* ⦉ "..UserMention.." ⦊\n*• ممنوع إرسال التوجيه هنا\n√*", "md", true)
return false
end

if msg.forward_info and Redis:get(Fast.."Lock:foww"..msg_chat_id) == "del" then
local UserInfo = bot.getUser(senderr)
local UserName = UserInfo.first_name or "مجهول"
local UserMention = "["..UserName.."](tg://user?id="..senderr..")"
bot.deleteMessages(msg.chat_id, {[1] = msg.id}) 
send(msg_chat_id, msg_id, "*• عزيزي* ⦉ "..UserMention.." ⦊\n*• ممنوع إرسال التوجيه هنا\n√*", "md", true)
return false
end

----------------------------------------------

if Redis:get(Fast.."Lock:all"..msg_chat_id) == "del" then
if msg.text or msg.photo or msg.video or msg.animation 
or msg.audio or msg.voice_note or msg.document 
or msg.sticker or msg.contact or msg.forward_info then
local UserInfo = bot.getUser(senderr)
local UserName = UserInfo.first_name or "مجهول"
local UserMention = "["..UserName.."](tg://user?id="..senderr..")"
bot.deleteMessages(msg.chat_id, {[1] = msg.id})
send(msg_chat_id, msg_id, "*• عزيزي* ⦉ "..UserMention.." ⦊\n*• ممنوع إرسال هذا النوع من الرسائل هنا\n√*", "md", true)
return false
end
end

----------------------------------------------

if msg.content.sticker and Redis:get(Fast.."Lock:Sticker"..msg_chat_id) == "del" then
if msg.Dev or msg.Admin then
return false
end
local UserInfo = bot.getUser(senderr)
local UserName = UserInfo.first_name or "مجهول"
local UserMention = "["..UserName.."](tg://user?id="..senderr..")"
bot.deleteMessages(msg.chat_id, {[1] = msg.id})
send(msg_chat_id, msg_id, "*• عزيزي* ⦉ "..UserMention.." ⦊\n*• ممنوع إرسال الملصقات هنا\n√*", "md", true)
return false
end 

----------------------------------------------

if text == "ضع الترحيب عام" or text == "وضع الترحيب عام" then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
• ارسل لي الترحيب عام الان
• تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Welcome = Redis:get(Fast.."Welcome:Groups")
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب عام","md",true)   
end 
end
if text == "مسح الترحيب عام" or text == "مسح الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Groups") 
return send(msg_chat_id,msg_id,"• تم ازالة الترحيب العام في المجموعات","md",true)   
end

if Redis:get(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr) then 
if text == "الغاء" then 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
return send(msg_chat_id,msg_id,"• تم الغاء حفظ الترحيب عام","md",true)   
end 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
Redis:set(Fast.."Welcome:Groups",text) 
return send(msg_chat_id,msg_id,"• تم حفظ الترحيب العام للمجموعات","md",true)     
end



if text == "ضع الترحيب" or text == "وضع الترحيب" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
• ارسل لي الترحيب الان
• تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
return send(msg_chat_id,msg_id,"• تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب للجروب","md",true)   
end 
end
if text == "مسح الترحيب" or text == "مسح الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم ازالة ترحيب الجروب","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"• ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "مسح القوانين" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Rules"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم ازالة قوانين الجروب","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(Fast.."Group:Rules" .. msg_chat_id)   
if Rules then     
return send(msg_chat_id,msg_id,Rules,"md",true)     
else      
return send(msg_chat_id,msg_id,"• لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:setex(Fast.."Set:Description:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"• ارسل لي وصف الجروب الان","md",true)  
end
if text == "مسح الوصف" or text == "مسح الوصف" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatDescription(msg_chat_id, '') 
return send(msg_chat_id,msg_id,"• تم ازالة قوانين الجروب","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatTitle(msg_chat_id,NameChat)
return send(msg_chat_id,msg_id,"• تم تغيير اسم الجروب الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") or text == ("وضع صوره") then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:set(Fast.."Chat:Photo"..msg_chat_id..":"..senderr,true) 
return send(msg_chat_id,msg_id,"• ارسل الصوره لوضعها للجروب","md",true)    
end
-----
if text == "اضف امر عام" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
Redis:set(Fast.."All:Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
return send(msg_chat_id,msg_id,"•الان ارسل لي الامر القديم ...","md",true)
end
if text == "حذف امر عام" or text == "مسح امر عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
return send(msg_chat_id,msg_id,"• ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه العامه" or text == "مسح الاوامر المضافه العامه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
for k,v in pairs(list) do
Redis:del(Fast.."All:Get:Reides:Commands:Group"..v)
Redis:del(Fast.."All:Command:List:Group")
end
return send(msg_chat_id,msg_id,"• تم مسح جميع الاوامر التي تم اضافتها في العام","md",true)
end
if text == "الاوامر المضافه العامه" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
Command = "• قائمه الاوامر المضافه العامه  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."All:Get:Reides:Commands:Group"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ⇇ {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "• لا توجد اوامر اضافيه عامه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end
-----
if text == "اضف امر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• الان ارسل لي الامر القديم ...", 'md', false, false, false, false, reply_markup)
end
if text == "مسح امر" or text == "مسح امر" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الامر الذي قمت بوضعه مكان الامر القديم", 'md', false, false, false, false, reply_markup)
end
if text == "مسح الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(Fast.."Command:List:Group"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id.."")
Command = "• قائمه الاوامر المضافه  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ⇇ {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "• لا توجد اوامر مضافه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم تثبيت الرساله","md",true)
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = bot.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم الغاء تثبيت الرساله","md",true)
bot.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if not bot.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = senderr..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = senderr..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = senderr..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = senderr..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = senderr..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = senderr..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = senderr..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = senderr..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = senderr..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = senderr..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = senderr..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = senderr..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = senderr..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = senderr..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = senderr..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = senderr..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = senderr..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = senderr..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = senderr..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = senderr..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = senderr..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = senderr..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = senderr..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = senderr..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = senderr..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = senderr..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = senderr..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = senderr..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = senderr..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = senderr..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = senderr..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = senderr..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = senderr..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = senderr..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = senderr..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = senderr..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = senderr..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = senderr..'/'.. 'mute_namemy'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, '• اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Link"..msg.chat_id) then
Statuslink = '✅' else Statuslink = '❌'
end
if Redis:get(Fast.."Status:Welcome"..msg.chat_id) then
StatusWelcome = '✅' else StatusWelcome = '❌'
end
if Redis:get(Fast.."Status:Id"..msg.chat_id) then
StatusId = '✅' else StatusId = '❌'
end
if Redis:get(Fast.."Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '✅' else StatusIdPhoto = '❌'
end
if Redis:get(Fast.."Status:Reply"..msg.chat_id) then
StatusReply = '✅' else StatusReply = '❌'
end
if Redis:get(Fast.."Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '✅' else StatusReplySudo = '❌'
end
if Redis:get(Fast.."Status:BanId"..msg.chat_id)  then
StatusBanId = '✅' else StatusBanId = '❌'
end
if Redis:get(Fast.."Status:SetId"..msg.chat_id) then
StatusSetId = '✅' else StatusSetId = '❌'
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
StatusGames = '✅' else StatusGames = '❌'
end
if Redis:get(Fast.."Status:KickMe"..msg.chat_id) then
Statuskickme = '✅' else Statuskickme = '❌'
end
if Redis:get(Fast.."Status:AddMe"..msg.chat_id) then
StatusAddme = '✅' else StatusAddme = '❌'
end
local protectionGroup = '\n*• اعدادات حمايه الجروب\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n• جلب الرابط ➥ '..Statuslink
..'\n• جلب الترحيب ➥ '..StatusWelcome
..'\n• الايدي ➥ '..StatusId
..'\n• الايدي بالصوره ➥ '..StatusIdPhoto
..'\n• الردود ➥ '..StatusReply
..'\n• الردود العامه ➥ '..StatusReplySudo
..'\n• الرفع ➥ '..StatusSetId
..'\n• الحظر - الطرد ➥ '..StatusBanId
..'\n• الالعاب ➥ '..StatusGames
..'\n• امر اطردني ➥ '..Statuskickme..'*\n\n.'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n• اعدادات الجروب ".."\n• علامة ال (✅) تعني مقفول".."\n• علامة ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =senderr..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =senderr..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =senderr..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =senderr..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =senderr..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =senderr..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =senderr..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =senderr..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =senderr..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =senderr..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =senderr..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =senderr..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(msg_chat_id).farsia, data = '&'},{text = 'الفارسيه : ', data =senderr..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(msg_chat_id).tphlesh, data = '&'},{text = 'التفليش : ', data =senderr..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(msg_chat_id).alkfr, data = '&'},{text = 'الكفر : ', data =senderr..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(msg_chat_id).alphsar, data = '&'},{text = 'الفشار : ', data =senderr..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =senderr..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  

if text == "تعديل الجروب" or text == "تعديل المجموعه" or text == "تعديل المجموعة" or text == "تعديل البار" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'* • البوت ليس لديه صلاحيه تغيير المعلومات\n√*',"md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
zh = https.request('http://api.telegram.org/bot'..Token..'/Get_Chat?chat_id='..msg_chat_id..'')
zx = JSON.decode(zh)
local txt = '*\n〈 عدل معلـومات جـروبك 🥺♥ 〉\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉┉ ┉ ┉ '..' \n• اسم الجروب : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭\n• عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n• عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n• عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n• عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n• الايدي : ❬ *`'..msg.chat_id..'`* ❭*\n'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'وضع ترحيب', data = senderr..'/welcome'},{text = 'وضع قوانين', data = senderr..'/Laws'}},
{{text = 'وضــع بـايـو', data = senderr..'/Description'},{text = 'وضع صوره', data = senderr..'/picture'}},
}
}
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,txt, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return send(msg_chat_id,msg_id, txt,"md",true)  
end
end
if text == 'الجروب' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end
local permissions = '*\n• صلاحيات الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• ارسال الويب : '..web..'\n• تغيير معلومات الجروب : '..info..'\n• اضافه مستخدمين : '..invite..'\n• تثبيت الرسائل : '..pin..'\n• ارسال الميديا : '..media..'\n• ارسال الرسائل : '..messges..'\n• اضافه البوتات : '..other..'\n• ارسال استفتاء : '..polls..'*\n\n'
local TextChat = '*\n• معلومات الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n• اسم الجروب : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭\n• عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n• عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n• عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n• عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n• الايدي : ❬ *`'..msg.chat_id..'`* ❭*\n'
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,TextChat..permissions, "md")
else
return send(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
end


if text == 'صلاحيات الجروب' then 
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = senderr..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data =senderr..  '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data =senderr..  '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data =senderr..  '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data =senderr..  '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data =senderr..  '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data =senderr..  '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data =senderr.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, "• الصلاحيات - ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, rep_idd) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, rep_idd) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, rep_idd) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, rep_idd) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(rep_idd) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",rep_idd)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",rep_idd)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, rep_idd) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, rep_idd) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, rep_idd) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, rep_idd) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) == false then
return send(msg_chat_id,msg_id,"\n*• ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",rep_idd)
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
end
return send(msg_chat_id,msg_id,"\n*• تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return send(msg_chat_id,msg_id,"\n*• ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",UserId_Info.id)
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
end
return send(msg_chat_id,msg_id,"\n*• تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end
if text == "تنزيل جميع الرتب" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Ownerss then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(8)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id)
Redis:del(Fast.."Creator:Group"..msg_chat_id)
Redis:del(Fast.."Manger:Group"..msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id)
--Redis:del(Fast.."Special:Group"..msg_chat_id)
return send(msg_chat_id,msg_id,'\n*• تم تنزيل جميع رتب الجروب { المنشئين الاساسسين , المنشئين , المدراء , الادمنيه  }* ',"md",true)  
end

if text and text:match('ضع لقب (.*)') and msg.reply_to_message_id ~= 0 then
local CustomTitle = text:match('ضع لقب (.*)')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..rep_idd.."&custom_title="..CustomTitle)
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"• تم وضع له لقب : "..CustomTitle).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n• عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end
if text and text:match('^ضع لقب @(%S+) (.*)$') then
local UserName = {text:match('^ضع لقب @(%S+) (.*)$')}
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..UserId_Info.id.."&custom_title="..UserName[2])
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم وضع له لقب : "..UserName[2]).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n• عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end 
if text and text:match("^ضع التكرار (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع التكرار (%d+)$")
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Num:Spam",Numbardel)  
send(msg_chat_id,msg_id, 'تم تعيين عدد التكرار الى  : '..Numbardel)
end
if text == ('رفــــع مـشـرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id, msg_id, '\n*• هذا الأمر يخص { '..Controller_Num(4)..' }* ', "md", true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}},}}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*', "md", false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}},}}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*', "md", false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id, msg_id, "\n*• عذرًا، البوت ليس أدمن في الجروب، يرجى ترقيته وتفعيل الصلاحيات له *", "md", true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id, msg_id, '\n*• البوت ليس لديه صلاحية إضافة مشرفين* ', "md", true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id, msg_id, "\n• عذرًا، يمكنك فقط استخدام الأمر على المستخدمين", "md", true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id, msg_id, "*• عذرًا، لا يمكنك استخدام الأمر على البوت\n√*", "md", true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id, rep_idd, 'administrator', {1,1,0,0,0,0,0,0,0,0,0,0,''})
if SetAdmin.code == 3 then
return send(msg_chat_id, msg_id, "\n*• لا يمكنني رفعه، ليس لدي صلاحيات *", "md", true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" .. rep_idd .. "&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '• تعديل الصلاحيات •', data = senderr..'/groupNumseteng//'..rep_idd}}}}
local Timo = "["..UserInfo.first_name.."](tg://user?id="..rep_idd..")"
return send(msg_chat_id, msg_id, "*• تم ترقيه *⦉ " .. Timo .. " ⦊\n*• مشرف في الجروب بنجاح*", 'md', false, false, false, false, reply_markup)
end 
if text and text:match('^رفــــع مـشـرف @(%S+)$') then
local UserName = text:match('^رفــــع مـشـرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
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
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..UserId_Info.id.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '• تعديل الصلاحيات • ', data = senderr..'/groupNumseteng//'..UserId_Info.id}, },}}
return send(msg_chat_id, msg_id, "*• تم رفع المستخدم مشرف في الجروب*", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*• لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
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
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*• لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح تعديلاتي' or text == 'مسح تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Add:Memp'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد رسائلك هنا *~ '..(Redis:get(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) or 1)..'*',"md",true)  
elseif text == 'تعديلاتي' or text == 'تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد التعديلات هنا *~ '..(Redis:get(Fast..'Num:Message:Edit'..msg.chat_id..senderr) or 0)..'*',"md",true)  
elseif text == 'جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد جهاتك المضافه هنا *~ '..(Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0)..'*',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Admin then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
bot.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
end

if text == 'تفاعل الجروب' and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message = msg.id/2097152/0.5
local MsgText = ''  

if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 6702141393 then 
MsgText = 'ملك التلكرام 💖'  
end 
return send(msg_chat_id,msg_id,"• تفاعل الجروب : "..MsgText, "md")
end
if text == "مين انا" then
local reply_text = ""
local reply_markup = nil
local user_id = msg.sender_id.user_id 
if user_id == tonumber(6702141393) then
reply_text = "*انت المبرمج تـيـمو يا قلبي 🌿❤️*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت المبرمج تـيـمو", url = "tg://user?id=" .. user_id},}}}
elseif user_id == tonumber(000000000) then
elseif user_id == tonumber(Sudo_Id) then
reply_text = "*• انت المطور الاساسي يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت المطور الاساسي", url = "tg://user?id=" .. user_id},}}}
elseif msg.Devss then
reply_text = "*• انت مطوري نور عيني🙄♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت مطوري نور عيني", url = "tg://user?id=" .. user_id},}}}
elseif msg.Dev then
reply_text = "*• انت مطوري نور عيني🙄♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت مطوري نور عيني", url = "tg://user?id=" .. user_id},}}}
elseif msg.Owners then
reply_text = "*• انت مالك الجروب يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت مالك الجروب", url = "tg://user?id=" .. user_id},}}}
elseif msg.Supcreator then
reply_text = "*• انت منشئ اساسي يقلبي ♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت منشئ اساسي", url = "tg://user?id=" .. user_id},}}}
elseif msg.Creator then
reply_text = "*• انت هنا منشئ يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت هنا منشئ", url = "tg://user?id=" .. user_id},}}}
elseif msg.Manger then
reply_text = "*• انت هنا مدير يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت هنا مدير", url = "tg://user?id=" .. user_id},}}}
elseif msg.Admin then
reply_text = "*• انت هنا ادمن يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت هنا ادمن", url = "tg://user?id=" .. user_id},}}}
elseif msg.Special then
reply_text = "*• انت هنا مميز يقلبي🌚♥*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "انت هنا مميز", url = "tg://user?id=" .. user_id},}}}
else
reply_text = "*• مجرد عضو هنا*"
reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = "مجرد عضو هنا", url = "tg://user?id=" .. user_id},}}}
end
send(msg_chat_id, msg_id, reply_text, "md", true, false, false, false, reply_markup)
end
if text == 'تعيين الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Group"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد التعديلات
• `#game` » عدد النقاط
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصوره
• `#Bio` » البايو.
]],"md",true)    
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Group"..msg.chat_id)
return send(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
List = {
  [[
    ↫ #Description
    ℘︙معرفك ~⪼ #username
    ℘︙ايديك ~⪼ #id
    ℘︙رتبتك ~⪼ #stast
    ℘︙تفاعلك ~⪼ #auto
    ℘︙رسائلك ~⪼ #msgs
    ℘︙تعديلاتك ~⪼ #edit
    ℘︙نقاطك ~⪼ #game
    ℘︙البايو ~⪼ #Bio
  ]],
  
  [[
    ↫ #Description
    ⌁︙ايديك↫ #id
    ⌁︙معرفك↫ #username
    ⌁︙رتبتك↫ #stast
    ⌁︙تفاعلك↫ #auto
    ⌁︙رسائلك↫ #msgs
    ⌁︙تعديلاتك↫ #edit
    ⌁︙نقاطك↫ #game
  ]],
  
  [[
    ↫ #Description
    ⌁︙ايديك↫ #id
    ⌁︙معرفك↫ #username
    ⌁︙رتبتك↫ #stast
    ⌁︙تفاعلك↫ #auto
    ⌁︙رسائلك↫ #msgs
    ⌁︙تعديلاتك↫ #edit
    ⌁︙نقاطك↫ #game
    ⌁︙البايو↫ #Bio
  ]],
  
  [[
    • #Description
    • ايديـك ❪ #id ❫
    • معرفـك ❪ #username ❫
    • رتبتـك ❪ #stast ❫
    • تفاعلك ❪ #auto ❫
    • رسائلك ❪ #msgs ❫
    • تعديلاتـك ❪ #edit ❫
    • نقاطك ❪ #game ❫
  ]],
  
  [[
    ゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 . 
    ゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 . 
    ゠𝚂𝚃𝙰 𖨈 #stast 𖥲 . 
    ゠𝙸𝙳 𖨈 #id 𖥲 . 
  ]],
  
  [[
    • ᴜѕᴇʀɴᴀᴍᴇ ➥• #username . 
    • ᴍѕɢѕ ➥• #msgs . 
    • ѕᴛᴀᴛѕ ➥• #stast . 
    • ʏᴏᴜʀ ɪᴅ ➥• #id  . 
    • ᴇᴅɪᴛ ᴍsɢ ➥• #edit . 
    • ᴅᴇᴛᴀɪʟs ➥• #auto .  
    • ɢᴀᴍᴇ ➥• #game . 
  ]],
  
  [[
    ➭- 𝒔𝒕𝒂𓂅 #stast ??. 💕 
    ➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕 
    ➭- 𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕 
    ➭- 𝒅 𓂅 #id 𓍯. 💕 
  ]],
  
  [[
    ⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝒐 𝑮𝒓𝒐𝒖𝒑 •
    • 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚ 
    • 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂ 
    • 🖤 | 𝑰𝑫 : #id ‌‌‏♕ 
    • 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊 
  ]],
  
  [[
    ┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 . 
    ├ 𝐌??𝐆 𖤱 #msgs 𖦴 . 
    ├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 . 
    └ 𝐈𝐃 𖤱 #id 𖦴 . 
  ]],
  
  [[
    𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 :#username  
    𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 :#stast  
    𓄼🇮🇶 𝒊𝒅 :#id  
    𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 :#game  
    𓄼🇮🇶 ??𝒔𝒈𝒔 :#msgs 
  ]],
  
  [[
    ➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞. 
    ➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞. 
    ➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞. 
    ➞: 𝒊𝒅 𓂅 #id 𓍯➸💞. 
  ]],
  
  [[
    ☆• 𝐮𝐬𝐞𝐫 : #username 𖣬   
    ☆• 𝐦𝐬𝐠  : #msgs 𖣬  
    ☆• 𝐬𝐭𝐚 : #stast 𖣬  
    ☆• 𝐢𝐝  : #id 𖣬 
  ]],
  
  [[
    - 𓏬 𝐔𝑆𝐸𝑅 : #username 𓂅 . 
    - 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 . 
    - 𓏬 𝐒𝐭𝐴 : #stast 𓂅 . 
    - 𓏬 𝐈𝐃 : #id 𓂅 . 
  ]],
  
  [[
    .• 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username   
    .• 𝙨𝙩𝙖𝙨𝙩 , #stast   
    .• 𝙡𝘿 , #id   
    .• 𝙂𝙖𝙢𝙚 , #game  
    .• 𝙢𝙨𝙜𝙨 , #msgs 
  ]]}
local Text_Rand = List[math.random(#List)] 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,Text_Rand)
return send(msg_chat_id,msg_id, '• تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'مسح الايدي عام' or text == 'مسح الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Groups")
return send(msg_chat_id,msg_id, '• تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تعيين الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Groups"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد التعديلات
• `#game` » عدد النقاط
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصوره
• `#Bio` » البايو.
]],"md",true)    
end 

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين ثانوين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(3)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Memberss = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Memberss == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد المالكين حاليا , ","md",true)  
end
Redis:del(Fast.."Ownerss:Group"..msg_chat_id) 
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Memberss.."} من مالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(8)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(Fast.."Creator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(Fast.."Manger:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*• لا يوجد ادمنيه حاليا ,*","md",true)  
end
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(Fast.."Special:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(Fast.."BanGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين *","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(Fast.."SilentGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المكتومين *","md",true)
end
if text == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.Fastbots == "chatMemberStatusRestricted" then
bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"*• تم مسح {"..x.."} من المقيديين *","md",true)
else
send(msg_chat_id,msg_id,'• لا يوجد مقيدين ',"md",true)  
end
end
if text == 'البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.Fastbots == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*• عدد البوتات الموجوده : "..#List_Members.."\n• تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if text == 'المطرودين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local y = false
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.Fastbots == "ok" then
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• عدد المطرودين في الموجوده : "..#List_Members.."\n• تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد مطرودين ',"md",true)  
end
end
if text == 'المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.Fastbots == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.Fastbots == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد محذوفين ',"md",true)  
end
end
end
if text == 'طرد المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.Fastbots == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.Fastbots == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد محذوفين ',"md",true)  
end
end
if text == 'طرد البوتات' then
if not msg.Manger then
return send(msg_chat_id, msg_id, '*• انت لست مدير\n√*', "md", true)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id, msg_id, "\n*• عذرًا، البوت ليس أدمن في الجروب، يرجى ترقيته وتفعيل الصلاحيات له *", "md", true)
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id, msg_id, '\n*• البوت ليس لديه صلاحية حظر المستخدمين* ', "md", true)
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
local buttons = {}
local x, y = 0, 0 
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
local isAdmin = Info_Members.members[k].status.Fastbots == "chatMemberStatusAdministrator"
local botStatus, actionText
if isAdmin then
x = x + 1
botStatus = "⦉ ✅ مشرف ⦊"
else
local Ban_Bot = bot.setChatMemberStatus(msg_chat_id, v.member_id.user_id, 'banned', 0)
if Ban_Bot.Fastbots == "ok" then
y = y + 1
botStatus = "⦉ ❌ تم طرده ⦊"
end
end
table.insert(buttons, {
{text = UserInfo.first_name, url = "https://t.me/" .. (UserInfo.username or "nil")},
{text = botStatus, url = "https://t.me/" .. (UserInfo.username or "nil")},})
end
local reply_markup = bot.replyMarkup{type = 'inline', data = buttons}
local messageText = "*ꔹ━━━━━━━━━━ꔹ\n• عدد البوتات الكلي ⋮ ⦉ " .. #List_Members .. " ⦊\n• البوتات المشرفين ⋮ ⦉ " .. x .. " ⦊\n• البوتات المطرودة ⋮ ⦉ " .. y .. " ⦊\n• ⦉ ✅ مشرف ⦊ ⋮ البوت مشرف\n• ⦉ ❌ تم طرده ⦊ ⋮ البوت ليس مشرف وتم طرده تلقائيًا*"
bot.sendText(msg_chat_id, msg_id, messageText, "md", false, false, false, false, reply_markup)
end
--رفع مشرف تلقائي--
function PromoteNewAdmins(msg)
local Info_Members = bot.getSupergroupMembers(msg.chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
local y = 0 
for k, v in pairs(List_Members) do
if v.bot_info == nil and v.status.Fastbots ~= "chatMemberStatusCreator" then
local user_id = v.member_id.user_id
if not Redis:sismember(Fast.."Admin:Group"..msg.chat_id, user_id) then
Redis:sadd(Fast.."Admin:Group"..msg.chat_id, user_id)
y = y + 1
end
end
end
if y > 0 then
send(msg.chat_id, 0, '\n*• تم العثور علي ( '..y..' ) تم رفعه مشرف في الجروب\n• وتم رفعه ادمن في البوت تلقائي\n√*', "md", true)
end
end
if msg and msg.chat_id then
PromoteNewAdmins(msg)
end
-- تنزيل المشرف تلقائي--
function CheckAndRemoveAdmins(msg)
local Info_Members = bot.getSupergroupMembers(msg.chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
local Current_Admins = Redis:smembers(Fast.."Admin:Group"..msg.chat_id)
local removed_count = 0  
for _, admin_id in ipairs(Current_Admins) do
local found = false
for _, v in pairs(List_Members) do
if v.member_id.user_id == tonumber(admin_id) then
found = true
break
end
end
if not found then
Redis:srem(Fast.."Admin:Group"..msg.chat_id, admin_id)
removed_count = removed_count + 1 
end
end
if removed_count > 0 then
send(msg.chat_id, 0, "*• تم العثور علي ( ".. removed_count .." ) تم تنزيله من اشراف المجموعه\n• وتم ازالته من قائمه ادمنيه البوت تلقائي\n• وتنزيله من الرتبه الخاصه به\n√*", "md", true)
end
end
function UpdateAdminList(msg)
local Info_Members = bot.getSupergroupMembers(msg.chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for _, v in pairs(List_Members) do
if v.bot_info == nil and v.status.Fastbots ~= "chatMemberStatusCreator" then
local user_id = v.member_id.user_id
if not Redis:sismember(Fast.."Admin:Group"..msg.chat_id, user_id) then
Redis:sadd(Fast.."Admin:Group"..msg.chat_id, user_id)
end
end
end
end
if msg and msg.chat_id then
UpdateAdminList(msg)  
CheckAndRemoveAdmins(msg) 
end

---------------
if text == ("مسح الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(Fast.."List:Manager"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
text = "• قائمه الردود \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو ??"
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود مضافه في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لاضافته في الردود ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,"true2")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لمسحه من الردود", 'md', false, false, false, false, reply_markup)
end
if text == ("مسح الردود العامه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,"• تم مسح الردود العامه","md",true)  
end
if text == ("الردود العامه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لاضافته في الردود العامه ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لمسحها من الردود العامه", 'md', false, false, false, false, reply_markup)
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n*• عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*• معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
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
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*• معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*• عذرآ لا تستطيع استخدام الامر على البوت\n√* ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*• تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
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
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*• تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'ضع كليشه المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'• ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'• تم مسح كليشه المطور')
end
---استبدال كلمه--
if text == "استبدال كلمه" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast..msg.chat_id..senderr.."replace",true)
return bot.sendText(msg_chat_id,msg_id,'\n• ارسل الكلمه القديمه ليتم استبدالها',"md",true)  
end
if text == "مسح الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
for k,v in pairs(list) do
Redis:del(Fast.."Word:Replace"..v)
end
Redis:del(Fast.."Words:r")
send(msg_chat_id,msg_id,"• تم مسح الكلمات المستبدله")
end
if text == "الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد كلمات مستبدله")
end
local txx = " قائمه الكلمات المستبدله \n"
for k,v in pairs(list) do 
cmdd = Redis:get(Fast.."Word:Replace"..v)
txx = txx..k.." - "..v.." »» "..cmdd.."\n"
end
bot.sendText(msg_chat_id,msg_id,txx)
end
----
if text == ("مسح الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(Fast.."List:Manager:inline"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين","md",true)
end
if text == "اضف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"• تم حذف الرد من الردود الانلاين ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local TemSelva = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline"..TemSelva..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline"..TemSelva..msg_chat_id, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline"..TemSelva..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline"..TemSelva..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline"..TemSelva..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline"..TemSelva..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline"..TemSelva..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline"..TemSelva..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline"..TemSelva..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline"..TemSelva..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline"..TemSelva..msg_chat_id, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline"..TemSelva..msg_chat_id, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"• الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_link")
local TemSelva = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:text"..TemSelva..msg_chat_id, text)
Redis:set(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"• الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_link" then
local TemSelva = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
local TemSelva2 = Redis:get(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:link:"..TemSelva2..":"..msg_chat_id..":"..TemSelva, text)
Redis:del(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح\n• ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local inline_TemSelva = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:link:"..v..":"..msg_chat_id..":"..text)
inline_TemSelva[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_TemSelva
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
text = "• قائمه الردود الانلاين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رساله •"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صوره •"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود انلاين في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
---------
if text == ("مسح الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:v"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..v)
Redis:del(Fast.."List:Manager:inline:sudo")
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين عام","md",true)
end
if text == "اضف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:sadd(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,"• تم حذف الرد من الردود الانلاين عام ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local TemSelva = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline:sudo"..TemSelva, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..TemSelva, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline:sudo"..TemSelva, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline:sudo"..TemSelva, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..TemSelva, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline:sudo"..TemSelva, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline:sudo"..TemSelva, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline:sudo"..TemSelva, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline:sudo"..TemSelva, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..TemSelva, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline:sudo"..TemSelva, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..TemSelva, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"• الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_link")
local TemSelva = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:sudo:text"..TemSelva, text)
Redis:set(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"• الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_link" then
local TemSelva = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
local TemSelva2 = Redis:get(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:sudo:link:"..TemSelva2..":"..TemSelva, text)
Redis:del(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح\n• ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline:sudo"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:sudo:text"..text)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
local inline_TemSelva = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:sudo:link:"..v..":"..text)
inline_TemSelva[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_TemSelva
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود الانلاين عام","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
text = "• قائمه الردود الانلاين عام \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) then
db = "متحركه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) then
db = "رساله •"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v) then
db = "صوره •"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..v) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود انلاين عام في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
--------------

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo and senderr ~= Fast then
local test = Redis:get(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:mz:Text"..test, text)  
elseif msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:mz:stekr"..test, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:mz:vico"..test, msg.content.voice_note.voice.remote.id)  
elseif msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:mz:Gif"..test, msg.content.animation.animation.remote.id)  
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:mz:Audio"..test, msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Audioc"..test, msg.content.caption.text)  
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:mz:File"..test, msg.content.document.document.remote.id)  
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:mz:Video"..test, msg.content.video.video.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Videoc"..test, msg.content.caption.text)  
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:mz:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:mz:Photo"..test, idPhoto)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Photoc"..test, msg.content.caption.text)  
end
send(msg_chat_id,msg_id,"• تم حفظ الرد \n• ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo:mz", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On:mz"..senderr..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:mz:video_note","Add:Rd:Sudo:mz:Audio","Add:Rd:Sudo:mz:Audioc","Add:Rd:Sudo:mz:File","Add:Rd:Sudo:mz:Video","Add:Rd:Sudo:mz:Videoc","Add:Rd:Sudo:mz:Photo","Add:Rd:Sudo:mz:Photoc","Add:Rd:Sudo:mz:Text","Add:Rd:Sudo:mz:stekr","Add:Rd:Sudo:mz:vico","Add:Rd:Sudo:mz:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On:mz"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo:mz", text)
return send(msg_chat_id,msg_id,"• تم حذف الرد من الردود العامه","md",true)  
end
end

if text and text ~= "حذف رد مميز" and text ~= "اضف رد مميز" and text ~= "مسح الردود المميزه" then
local listmz = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(listmz) do
i ,j  = string.find(text, v)
if j and i then
local x = string.sub(text, i,j)

if x then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..x)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..x)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..x)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..x)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..x)
local photoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Photoc"..x)
local video = Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..x)
local videoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Videoc"..x)
local document = Redis:get(Fast.."Add:Rd:Sudo:mz:File"..x)
local audio = Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..x)
local audioc = Redis:get(Fast.."Add:Rd:Sudo:mz:Audioc"..x)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..x)
if Text then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',senderr)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Text..']',"md",true)  
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md")
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md") 
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
end
end
end
end
if text == "اضف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود المميزه ","md",false, false, false, false, reply_markup)
end 
if text == "حذف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود المميزه","md",false, false, false, false, reply_markup)
end 
if text and not Redis:sismember(Fast.."Spam:Group"..senderr,text) then
Redis:del(Fast.."Spam:Group"..senderr) 
end
if text == "مسح الردود المميزه" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:mz:Gif"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:vico"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:stekr"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Text"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Videoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audioc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo:mz")
end
send(msg_chat_id,msg_id,"• تم مسح قائمه الردود المميزه","md",true)  
end
if text == ("الردود المميزه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
text = "\n• قائمة الردود المميزه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "متحركه •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "رساله •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "صوره •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود مميزه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
---------

if text == 'وش يقول' or text == "بيقول اي" or text == "??" or text == "؟؟" then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = http.request("http://159.65.198.148/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"• "..json.text)
else
return send(msg.chat_id,msg.id,"• تعذر التعرف علي الصوت")
end
end
end
end
if text == 'xt' then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = https.request("https://fastbotss.herokuapp.com/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"• "..json.text)
else
return send(msg.chat_id,msg.id,"• تعذر التعرف علي الصوت")
end
end
end
end
if text and text:match("^احسب (.*)$") then
local m = text:gsub("احسب ","")
local math = calc(m)
if math == "" then
results = "• ارسل الصيغه بشكل صحيح"
else 
results = "• ناتج "..m.." هو \n "..math
end
send(msg.chat_id,msg.id,results)
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" then
  Redis:del(Fast..senderr..msg.chat_id.."num")
  start_mrkup = bot.replyMarkup{
    type = 'inline',
    data = {
      {
        {text = '✴️ ON', data = senderr..'ON'},
        {text = '🗑 DEL', data = senderr..'DEL'},
        {text = '🧹 AC', data = senderr..'rest'},
        {text = '❌ OFF', data = senderr..'OFF'},
      },
      {
        {text = '^', data = senderr..'calc&^'},
        {text = '√', data = senderr..'calc&√'},
        {text = '(', data = senderr..'calc&('},
        {text = ')', data = senderr..'calc&)'},
      },
      {
        {text = '7', data = senderr..'calc&7'},
        {text = '8', data = senderr..'calc&8'},
        {text = '9', data = senderr..'calc&9'},
        {text = '÷', data = senderr..'calc&/'},
      },
      {
        {text = '4', data = senderr..'calc&4'},
        {text = '5', data = senderr..'calc&5'},
        {text = '6', data = senderr..'calc&6'},
        {text = 'x', data = senderr..'calc&*'},
      },
      {
        {text = '1', data = senderr..'calc&1'},
        {text = '2', data = senderr..'calc&2'},
        {text = '3', data = senderr..'calc&3'},
        {text = '-', data = senderr..'calc&-'},
      },
      {
        {text = '0', data = senderr..'calc&0'},
        {text = '.', data = senderr..'calc&.'},
        {text = '+', data = senderr..'calc&+'},
        {text = '=', data = senderr..'equal'},
      },
      {
        {text = '👨‍💻 مطور السورس', url = 'http://t.me/Di_il'},
      },
    }
  }
  send(msg.chat_id, msg.id, "*✨ • اهلا بك في بوت الحاسبه \n🧮 • welcome to calculator*", "md", true, false, false, true, start_mrkup)
  return false 
end

if text == "تفعيل الهمسه" or text == "تفعيل همسه" or text == "فتح الهمسه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص 〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."hansa:bot"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n • تم تفعيل امر همسه *',"md",true)  
end
if text == "تعطيل همسه" or text == "تعطيل الهمسه" or text == "قفل الهمسه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."hansa:bot"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n • تم تعطيل امر همسه *',"md",true)  
end

if text == "اهمس" or text == "همسة" or text == "همسه" then
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and Message_Reply.sender_id.user_id then
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
local Selva = "*• الهمسه معطله يا "..Text.."\n√*"
if Redis:get(Fast.."hansa:bot"..msg.chat_id) then
return send(msg_chat_id, msg_id, Selva, "md", true) 
end
local testhms = math.random(1,9999999999999)
local User = bot.getUser(Message_Reply.sender_id.user_id)
local Selva = User.first_name or "تيمو هقر"
local UserLink = "["..Selva.."](tg://user?id="..Message_Reply.sender_id.user_id..")"
local Timo = "*💌 | اضغط لإرسال همسة إلى*\n ⦉ ".. UserLink.." ⦊ "
Redis:set(Fast.."hms:"..testhms.."chat_id", msg_chat_id)
Redis:set(Fast.."hms:"..testhms.."to", Message_Reply.sender_id.user_id)
Redis:set(Fast.."hms:"..testhms.."msg_id", msg.reply_to_message_id)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'اضغط هنا لإرسال الهمسة 📩', url = 't.me/'..UserBot..'?start=hms'..testhms..'from_id'..msg.sender_id.user_id},},}}
return send(msg_chat_id, msg_id, Timo, "md", true, false, false, false, reply_markup)
end
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

if text == 'الروليت' or text == "روليت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat.id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local timo = '*اهلا بك في لعبه الروليت يمكنك الانضمام من خلال الزر في الاسفل*'
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• اضغط للانضمام الي اللعبه •', data = '/joinerolet'},},}}
Redis:set(Fast.."rolet:owner:"..msg.chat_id, msg.sender_id.user_id)
Redis:del(Fast..'rolet:list'..msg.chat_id)
send(msg.chat_id,msg.id,timo,"md",false, false, false, false, reply_markup)
end

-----
if text == "انشاء رابط خاص" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'TemSelva',tonumber(msg.date+864000),nil,true)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"• لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
Redis:set(Fast.."PV:invite_link:"..msg.chat_id, LinkGroup.invite_link)
return send(msg_chat_id, msg_id, "• Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end
--- سي في 
jobs_ = {
  "ظابط",
  "حرامي"
}
personal_ = {
  "فخامه",
  "عنيف"
}
if text == "مسح كليشه سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Fast..":CV:Text:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n• تم مسح كليشه السي في',"md",true)  
end

if text == "مسح سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n• لا يوجد سي في باسمك',"md",true)  
end
Redis:del(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n• تم مسح السي في',"md",true)  
end

if text == "اضف سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n• انت تمتلك سي في باسمك اكتب ( `عرض سي في` ) لتتمكن من رؤيه السي في',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Name")
return send(msg_chat_id,msg_id,'\n• مرحبا بك في السجل المدني الخاص بسورس الخالدي \nاكتب اسمك الان :',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Name" then 
local name = FlterBio(text)
Redis:set(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id, name)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Jobs")
return send(msg_chat_id,msg_id,'\n• تم حفظ اسمك بنجاح\nاكتب وظيفتك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Jobs" then 
local name = FlterBio(text)
Redis:set(Fast..":CV:Jobs:"..msg.sender_id.user_id..":"..msg.chat_id, name)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Age")
return send(msg_chat_id,msg_id,'\n• تم حفظ اسمك بنجاح\nاكتب عمرك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Age" then 
if not text:match('(%d+)') then 
return send(msg_chat_id,msg_id,'\n• ادخل عمرك بالارقام لو سمحت',"md",true)
end
Redis:set(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Address")
return send(msg_chat_id,msg_id,'\n• تم حفظ عمرك بنجاح\nاكتب عنوانك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Address" then 
local address = FlterBio(text)
Redis:set(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id, address)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n• تم حفظ السي في بنجاح\nاكتب عرض سي في لرؤيه ملفك الشخصي',"md",true)
end

if msg.reply_to_message_id ~= 0 and text then
if (text:match('(.*)سي في(.*)') or text:match('(.*)سيفي(.*)') or text == "سي في") then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "• الاسم : #Name \n• العمر : #Age \n• الاقامه : #Address \n• الوظيفه : #Jobs \n• شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address)
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end
end
end

if text == "عرض سي في" then 
if msg.reply_to_message_id ~= 0 then -- if rep
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if not Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n• لا يمتلك سي في',"md",true)
end
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "• الاسم : #Name \n• العمر : #Age \n• الاقامه : #Address \n• الوظيفه : #Jobs \n• شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end --  end if rep
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then -- if not rep
return send(msg_chat_id,msg_id,'\n• انت لا تمتلك سي في باسمك اكتب ( `اضف سي في` ) لتتمكن من اضافه السي في',"md",true)  
end -- end if not rep
local name = Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..msg.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "• الاسم : #Name \n• العمر : #Age \n• الاقامه : #Address \n• الوظيفه : #Jobs \n• شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end

if text == "ضع كليشه سي في" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Text")
return send(msg_chat_id,msg_id,'\n• ارسل الكلياشه الان :\n• مع استبدال \nالاسم = `#Name`\nالعمر = `#Age`\nالعنوان = `#Address`\nالوظيفه = `#Jobs`\nالشخصيه = `#Personal`\n \n•اضغط علي الداله للنسخ',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Text" then
Redis:set(Fast..":CV:Text:"..msg.chat_id, text)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,"• تم وضع كليشه السي في","md",true)  
end
---
if text == "اضف سؤال" then
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
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == "مسح سؤال" then
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
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == 'الاسئله المضافه' then
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
local list = Redis:smembers(Fast.."gamebot:new1")
t = "• الاسئله المضافه : \n ـــــــــــــــــــــــــــــــــــــــــــــــ\n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,"md")
end

if text == 'مسح الاسئله المضافه' then
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
Redis:del(Fast.."gamebot:new1")
return send(msg_chat_id,msg_id,"تم مسح الاسئله","md")
end

if text == 'اسالني' or text == "اسألني" then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{
{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}
}}
}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*', "md", false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{
{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}
}}
}
return send(msg.chat_id, msg.id, '*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*', "md", false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local questions = {
{"ما هو عاصمة مصر؟", "القاهرة", {"الإسكندرية", "الجيزة", "الأقصر"}},
{"ما هو أكبر كوكب في النظام الشمسي؟", "المشتري", {"الزهرة", "المريخ", "الأرض"}},
{"من هو مخترع الهاتف؟", "ألكسندر جراهام بيل", {"توماس إديسون", "ماركوني", "إسحاق نيوتن"}},
{"ما هي أكبر قارة في العالم؟", "آسيا", {"أفريقيا", "أوروبا", "أمريكا الجنوبية"}},
{"ما هو أطول نهر في العالم؟", "نهر النيل", {"الأمازون", "اليانغتسي", "الكونغو"}},
{"ما هي أكبر دولة في العالم من حيث المساحة؟", "روسيا", {"كندا", "الصين", "الولايات المتحدة"}},
{"من هو مؤسس شركة مايكروسوفت؟", "بيل غيتس", {"ستيف جوبز", "مارك زوكربيرغ", "إيلون ماسك"}},
{"ما هي اللغة الأكثر تحدثًا في العالم؟", "الإنجليزية", {"الصينية", "الإسبانية", "الهندية"}},
{"ما هو أكبر محيط في العالم؟", "المحيط الهادئ", {"المحيط الأطلسي", "المحيط الهندي", "المحيط المتجمد الشمالي"}},
{"من هو أول رئيس للولايات المتحدة؟", "جورج واشنطن", {"توماس جيفرسون", "إبراهام لينكولن", "جون آدامز"}},
{"كم عدد ألوان قوس قزح؟", "7", {"6", "8", "5"}},
{"ما هي عاصمة فرنسا؟", "باريس", {"ليون", "مرسيليا", "نيس"}},
{"من هو أول من وصل إلى القمر؟", "نيل أرمسترونغ", {"يوري جاجارين", "باز ألدرين", "مايكل كولينز"}},
{"ما هي أكبر مدينة في العالم من حيث عدد السكان؟", "طوكيو", {"شنغهاي", "مومباي", "نيويورك"}},
{"ما هو نوع الشجرة المستخدمة في الأثاث؟", "البلوط", {"الصنوبر", "الزان", "السرو"}},
{"ما هي أكبر دولة في أفريقيا؟", "الجزائر", {"السودان", "ليبيا", "مصر"}},
{"ما هو أسرع حيوان بري؟", "الفهد", {"الأسد", "الغزال", "الكلب البري"}},
{"كم عدد كواكب النظام الشمسي؟", "8", {"9", "7", "6"}},
{"من هو مكتشف الجاذبية؟", "إسحاق نيوتن", {"غاليلو", "أينشتاين", "كوبرنيكوس"}},
{"ما هو أطول جسر في العالم؟", "جسر دانيانغ", {"جسر بانبو", "جسر البوابة الذهبية", "جسر تشانغهوا"}},
{"ما هي أكبر جزيرة؟", "غرينلاند", {"مدغشقر", "بورنيو", "أستراليا"}},
{"ما هي عاصمة اليابان؟", "طوكيو", {"كيوتو", "أوساكا", "هيروشيما"}},
{"من هو صاحب نظرية النسبية؟", "أينشتاين", {"نيوتن", "ماكسويل", "هايزنبرغ"}},
{"ما هو الكوكب الأحمر؟", "المريخ", {"الزهرة", "عطارد", "المشتري"}},
{"من هو مكتشف الكهرباء؟", "توماس إديسون", {"نيكولا تسلا", "فاراداي", "فرانكلين"}},
{"ما هي أقدم حضارة؟", "الحضارة المصرية القديمة", {"الرافدين", "الصينية", "الإغريقية"}},
{"ما هو أسرع طائر؟", "الصقر", {"النسر", "السنونو", "الحمامة"}},
{"ما هو أشهر جبل؟", "إيفرست", {"كيليمانجارو", "مونت بلانك", "جبال الألب"}},
{"من هو أول من عبر الأطلسي؟", "شارلز ليندبرغ", {"الأخوين رايت", "نيلسون", "أميليا إيرهارت"}},
{"ما هي أكبر صحراء؟", "الصحراء الكبرى", {"صحراء أريزونا", "صحراء غوبي", "صحراء فيكتوريا"}},
{"من هو مؤلف 1984؟", "جورج أورويل", {"ألدوس هكسلي", "تولستوي", "فرانز كافكا"}},
{"ما هو العنصر الذي رمزه O؟", "الأوكسجين", {"الهيدروجين", "النيتروجين", "الهيليوم"}}
}

local q = questions[math.random(#questions)]
local all_answers = {q[2], q[3][1], q[3][2], q[3][3]}
for i = #all_answers, 2, -1 do
local j = math.random(i)
all_answers[i], all_answers[j] = all_answers[j], all_answers[i]
end
local correct = q[2]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = all_answers[1], data = (all_answers[1] == correct and 'صحيح' or 'غلط')},
{text = all_answers[2], data = (all_answers[2] == correct and 'صحيح' or 'غلط')}},
{{text = all_answers[3], data = (all_answers[3] == correct and 'صحيح' or 'غلط')},
{text = all_answers[4], data = (all_answers[4] == correct and 'صحيح' or 'غلط')}}
}
}
send(msg.chat_id, msg.id,"*"..q[1].."*", "md", false, false, false, false, reply_markup)
end
end
if text == "صحيح" or text == "غلط" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local answer_data = text == "صحيح" and 'true' or 'false'
local question_id = tonumber(text)
local correct_answer = Redis:get(Fast.."gamebot:newqus:as4"..question_id)
if answer_data == correct_answer then
Redis:incrby(Fast.."gamebot:score"..msg.sender_id, 1)
send(msg.chat_id, msg.id, "• إجابتك صحيحة! تم إضافة نقطة.", "md")
else
send(msg.chat_id, msg.id, "• إجابتك خاطئة!", "md")
end
end
end
if text == "اضف لغز" then
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
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == "مسح لغز" then
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
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == 'الالغاز' then
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
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
t = "• الالغاز : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد الغازمضافه"
end
return send(msg_chat_id,msg_id,t)
end
if text == 'مسح الالغاز' then
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
Redis:del(Fast.."lkz:gamebot:new1")
return send(msg_chat_id,msg_id,'تم مسح الالغاز جميعا ')
end

if text == 'لغز' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}},
}}
return send(msg.chat_id, msg.id, '\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر', "md", false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}},
}}
return send(msg.chat_id, msg.id, '\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر', "md", false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local riddles = {
{"ما الشيء الذي كلما زاد نقص؟", "العمر", {"الوزن", "المال", "الوقت"}},
{"له أسنان ولا يعض، ما هو؟", "المشط", {"الفرشاة", "السكين", "المنشار"}},
{"ما هو الشيء الذي يتكلم جميع لغات العالم؟", "الصدى", {"الإنترنت", "الهاتف", "الراديو"}},
{"له رقبة وليس له رأس، ما هو؟", "الزجاجة", {"القارورة", "الأنبوبة", "الإناء"}},
{"ما هو الشيء الذي لا يمشي إلا بالضرب؟", "المسمار", {"الوتد", "الدبوس", "المطرقة"}},
{"شيء كلما أخذت منه يكبر؟", "الحفرة", {"الثقب", "الفراغ", "الهواء"}},
{"له وجه وليس له لسان، يدل الناس على الزمان؟", "الساعة", {"التقويم", "التاريخ", "الرزنامة"}},
{"شيء يجري ولا يمشي؟", "الزمن", {"النهر", "الدم", "الهواء"}},
{"بيت لا أبواب له ولا نوافذ؟", "البيت الشعري", {"الكهف", "الخيمة", "العلبة"}},
{"شيء تذبحه وتبكي عليه؟", "البصل", {"الثوم", "الفلفل", "الجزر"}},
{"يرى كل شيء وليس له عيون؟", "المرآة", {"الكاميرا", "الرادار", "الشاشة"}},
{"له أربع أرجل ولا يمشي؟", "الكرسي", {"الطاولة", "السرير", "الصندوق"}},
{"ما هو الشيء الذي إذا وضع في الثلاجة لا يبرد؟", "الفلفل الحار", {"الملح", "السكر", "الزيت"}},
{"ما هو الشيء الذي يكتب ولا يقرأ؟", "القلم", {"الآلة", "الكمبيوتر", "الطابعة"}},
{"ما هو الشيء الذي يكسر دون أن يُلمس؟", "الوعد", {"القلب", "الصوت", "الأمل"}},
{"ما هو الشيء الذي إذا دخل الماء لا يبتل؟", "الظل", {"الضوء", "الهواء", "الدخان"}},
{"ما هو الشيء الذي ينام مرتديًا حذاءه؟", "الحصان", {"الجمل", "الحمار", "البغل"}},
{"ما هو الباب الذي لا يمكن فتحه؟", "الباب المفتوح", {"باب الأمل", "باب السماء", "باب الجنة"}},
{"ما هو الشيء الذي يسمع بلا أذن ويتكلم بلا لسان؟", "الهاتف", {"الروبوت", "الصدى", "الراديو"}},
{"ما هو الشيء الذي لا يُؤكل في الفطور؟", "الغداء", {"العشاء", "الحلوى", "اللحم"}},
{"شيء يكتب ولا يقرأ؟", "القلم", {"الطابعة", "الحاسوب", "المسطرة"}},
{"ما هو الشيء الذي لديه يد ولا يستطيع التصفيق؟", "الساعة", {"الكرسي", "الدُمية", "البراد"}},
{"ما هو الشيء الذي ينبض بلا قلب؟", "الساعة", {"المؤقت", "البوصلة", "الجهاز"}},
{"ما هو الشيء الذي لا يمكن كسره؟", "المبتدأ", {"الوعد", "الزجاجة", "العهد"}},
{"شيء كلما وقفت أمامه لا تراه؟", "الهواء", {"الظل", "الضوء", "المرآة"}},
{"شيء كلما ركضت خلفه يبتعد؟", "الظل", {"السراب", "الريح", "الماء"}},
{"شيء يمكنك رؤيته لكن لا يمكنك لمسه؟", "الخيال", {"الضوء", "الظل", "الصوت"}},
{"ما هو الشيء الذي يمكن أن يمتلئ ولا يفيض؟", "العقل", {"القلب", "الوعاء", "الدفتر"}},
{"له قلب ولا ينبض؟", "الخس", {"الملفوف", "الكمثرى", "الطماطم"}},
{"ما هو الشيء الذي يملك مفتاحًا ولا يفتح؟", "البيانو", {"الكمان", "الجيتار", "المفتاح الموسيقي"}},
{"ما هو الشيء الذي إذا لمسته صرخ؟", "الجرس", {"الصفارة", "الهاتف", "الآلة"}}
}
local selected = riddles[math.random(#riddles)]
local question = selected[1]
local correct = selected[2]
local others = selected[3]
local answers = {correct, table.unpack(others)}
for i = #answers, 2, -1 do
local j = math.random(i)
answers[i], answers[j] = answers[j], answers[i]
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = answers[1], data = (answers[1] == correct and 'صحيح1' or 'غلط1')}},
{{text = answers[2], data = (answers[2] == correct and 'صحيح1' or 'غلط1')}},
{{text = answers[3], data = (answers[3] == correct and 'صحيح1' or 'غلط1')}},
{{text = answers[4], data = (answers[4] == correct and 'صحيح1' or 'غلط1')}},
}
}
send(msg.chat_id, msg.id, "*"..question.."*", "md", false, false, false, false, reply_markup)
end
end

if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نسبه الغباء" or text == "نسبه الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الذكاء" or text == "نسبه الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '• الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الرجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text and text:match("^برج (.*)$") and Redis:get(Fast.."brj_Bots"..msg.chat_id) == "open" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg_chat_id,msg_id, br.ok.hso)
end
--==> By TemSelva
if text == "الاحكام المضافه" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local ahkam = Redis:smembers(Fast.."Ahkam_list:")
local list = "• قائمه الاحكام :\n"
for k,v in pairs(Redis:smembers(Fast.."Ahkam_list:")) do
list = list..k.." - "..v.."\n"
end
if #ahkam == 0 then
list = "• لا توجد احكام"
end
send(msg_chat_id,msg_id,list)
end
if text == "حذف الاحكام" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast.."Ahkam_list:")
send(msg_chat_id,msg_id,"• تم حذف قائمه الاحكام بنجاح")
end

if text and Redis:get(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id) then
if not Redis:sismember(Fast.."Ahkam_list:", text) then
return send(msg_chat_id,msg_id,"• لا يوجد حكم هكذا")
end
Redis:srem(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"• تم حذف الحكم بنجاح")
end

if text == "حذف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"• ارسل الحكم الان")
end

if text and Redis:get(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id) then
Redis:sadd(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"• تم حفظ الحكم بنجاح")
end

if text == "اضف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"• ارسل الحكم الان")
end
Ahkam_list = {
  "احذف حسابك",
  "اشتم نفسك",
  "صور نفسك وانت بتلعب 20 ضغط",
   "قولي نفسي اتجوز تيمو الخالدي",
     "قولي بحب تيمو الخالدي 5 مرات",
  "قول انا مرا",
}
if text == "احكام" then 
local TemSelva = math.random(99999999999999)
Redis:sadd(Fast.."Ahkam:"..TemSelva..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
Redis:set(Fast.."in_game:"..msg.sender_id.user_id, TemSelva)
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {{text = "انضم" , data = "Ahkam/"..TemSelva}}
  }
}
return send(msg_chat_id, msg_id, "اهلا بك في لعبه الاحكام\nللانضمام اضغط انضم واستحمل بقا وهيتم تشغيل اللعبه عند الوصول ل10 افراد او عند موافقه كل اعضاء اللعبه ع البدء عن طريق ( بدء )\n============\nاللاعبين :\n- ["..bot.getUser(msg.sender_id.user_id).first_name.."](tg://user?id="..msg.sender_id.user_id..")","md",false, false, false, false, reply_markup)
end
if text == "بدء" then 
if Redis:get(Fast.."in_game:"..msg.sender_id.user_id) then
local TemSelva = Redis:get(Fast.."in_game:"..msg.sender_id.user_id)
local numR = Redis:smembers(Fast.."Ahkam_ready:"..TemSelva..":chat_id:"..msg_chat_id)
local numN = Redis:smembers(Fast.."Ahkam:"..TemSelva..":chat_id:"..msg_chat_id)
if #numR < #numN  then -- check on players no.
Redis:sadd(Fast.."Ahkam_ready:"..TemSelva..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
send(msg_chat_id, msg_id , "انت مستعد استنا بقا زمايلك لما يكتبو بدء او العدد يكتمل\n\nعدد اللاعبين : "..#numN.."\nعدد المستعدين : "..(#numR + 1 ))
end -- end check
if (#numR + 1) == (#numN) and #numN > 1 then -- players no. complete
local Ahkam = {}
for k,v in pairs(Ahkam_list) do
table.insert(Ahkam, v)
end
local Redis_Ahkam = Redis:smembers(Fast.."Ahkam_list:")
for k,v in pairs(Redis_Ahkam) do
table.insert(Ahkam, v)
end
local loser_id = numN[math.random(#numN)]
local loser_tag = "["..bot.getUser(loser_id).first_name.."](tg://user?id="..loser_id..")"
return send(msg_chat_id, 0, loser_tag.."\n محكوم عليك بـ ".. Ahkam[math.random(#Ahkam)],"md")
end -- done
end
end 

if text == "ثنائي اليوم" then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members)
local NumRand2 = math.random(1, #List_Members)
while NumRand2 == NumRand1 do
NumRand2 = math.random(1, #List_Members)
end
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local Timo = "*• الـيـك ثـنـائـي الـيـوم 🥺♥.*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = UserInfo.first_name, url = 'tg://user?id='..UserInfo.id},
},
{
{text = UserInfoo.first_name, url = 'tg://user?id='..UserInfoo.id},
},
}
}
return bot.sendText(msg_chat_id, msg_id, Timo, 'md', false, false, false, false, reply_markup)
end
------------------
if Redis:ttl(Fast.."tag_mem:"..msg_chat_id) < 1 then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local Timoo = {"〈 مشرفنا بحضورك 🙈💗 〉","〈 اصحي كدا نايم لي 😻🤍 〉 ","〈 منورنا يروحي 🥺❤️ 〉","〈 منور الجروب يقمر 🌙​​​​​​​​​​​​💕 〉",}
local Selvaa = Timoo[math.random(#Timoo)]
local Timo = {"〈 والله منور الجروب 🙈💗 〉","〈 مشرفنا بحضروك يروحي 😻🤍 〉 ","〈 العسل ال منو الجروب 🥺❤️ 〉","〈 احلي قمر في الجروب 🌙​​​​​​​​​​​​💕 〉","〈 جمال مغطي علي كلو 🥺♥️ 〉",}
local Selva = Timo[math.random(#Timo)]
local TimoSelva = "*"..Selvaa.."*\n\nـ ⦉ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ⦊"
Redis:setex(Fast.."tag_mem:"..msg_chat_id,5400,true)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{ 
{text = FlterBio(UserInfo.first_name), url = 'tg://user?id='..UserInfo.id}
},
}
}
return send(msg.chat_id,0,TimoSelva,"md",false, false, false, false, reply_markup)
end 
if text == "نداء" then
if not Redis:get(Fast.."tag_mem"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id,"* النداء معطل*","md",true)  
end
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members)
local NumRand2 = math.random(1, #List_Members)
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local Timoo = {"〈 مشرفنا بحضورك 🙈💗 〉","〈 اصحي كدا نايم لي 😻🤍 〉 ","〈 منورنا يروحي 🥺❤️ 〉","〈 منور الجروب يقمر 🌙​​​​​​​​​​​​💕 〉"}
local Selvaa = Timoo[math.random(#Timoo)]
local Timo = {"〈 والله منور الجروب 🙈💗 〉","〈 مشرفنا بحضروك يروحي 😻🤍 〉 ","〈 العسل ال منو الجروب 🥺❤️ 〉","〈 احلي قمر في الجروب 🌙​​​​​​​​​​​​💕 〉","〈 جمال مغطي علي كلو 🥺♥️ 〉"}
local Selva = Timo[math.random(#Timo)]
local TimoSelva = "*"..Selvaa.."*\n\nـ ⦉ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ⦊\n\nـ ⦉ ["..FlterBio(UserInfoo.first_name).."](tg://user?id="..UserInfoo.id..") ⦊"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{ 
{text = FlterBio(UserInfo.first_name), url = 'tg://user?id='..UserInfo.id}
},
{ 
{text = FlterBio(UserInfoo.first_name), url = 'tg://user?id='..UserInfoo.id}
},
}
}
return send(msg.chat_id, 0, TimoSelva, "md", false, false, false, false, reply_markup)
end
--------------------------------- 
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
if text == "تعطيل انطق" then
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
if Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر انطق مسبقا\n ✓',"md")
else
Redis:set(Fast.."intg"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر انطق\n ✓',"md")
end
end
if text == "تفعيل انطق" then
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
if not Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر انطق مسبقا\n ✓',"md")
else
Redis:del(Fast.."intg"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر انطق\n ✓',"md")
end
end
if text == "تعطيل غنيلي" then
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
if Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:set(Fast.."knele"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر غنيلي\n ✓',"md")
end
end
if text == "تفعيل غنيلي" then
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
if not Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:del(Fast.."knele"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر غنيلي\n ✓',"md")
end
end



if text == "تعطيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل معنى اسم مسبقا\n ✓',"md")
else
Redis:set(Fast.."mynames"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل معنى اسم\n ✓',"md")
end
end
if text == "تفعيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل معنى اسم مسبقا\n ✓',"md")
else
Redis:del(Fast.."mynames"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل معنى اسم\n ✓',"md")
end
end
if text == "تعطيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل قول مسبقا\n ✓',"md")
else
Redis:del(Fast.."kolklma"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تعطيل قول\n ✓',"md")
end
end
if text == "تفعيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل قول مسبقا\n ✓',"md")
else
Redis:set(Fast.."kolklma"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تفعيل قول\n ✓',"md")
end
end
if text and text:match("^قول (.*)$") and Redis:get(Fast..'kolklma'..msg.chat_id) then
local txt = {string.match(text, "^(قول) (.*)$")}
return send(msg_chat_id,msg_id, txt[2], 'md')
end

if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.fastbots.ml/apies/playstore.php?q="..URL.escape(q))
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

if text and text:match("^انطق (.*)$") or text:match("^انطقي (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return send(msg_chat_id,msg_id,'*• امر انطق معطل من قبل الادمنيه*', 'md')
end 
Text = text:match("^انطق (.*)$") or text:match("^انطقي (.*)$")
msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..
"/sendaudio?chat_id="..msg.chat_id.."&caption=الكلمة "..
URL.escape(Text).."&audio=http://"..
URL.escape('translate.google.com/translate_tts?q='..Text..
'&tl=ar&client=duncan3dc-speaker')..
"&reply_to_message_id="..msg_id..
"&disable_web_page_preview=true")
end
if text:match("^انطق (.*)$") or text:match("^انطقي (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^انطق (.*)$") or text:match("^انطقي (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@Sudanese_56")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end
---@Di_il---
if text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Timo = "*• تم تحديث ملفات سورس الخالدي\n• رقم الاصدار ⋮ 1.0.0.1*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = "• قناه السورس •", url = "https://t.me/Sudanese_56"},
},
}
}
bot.sendText(msg_chat_id,msg_id,Timo,"md",false, false, false, false, reply_markup)
dofile('Fast.lua')  
end
if text == 'اصدار السورس' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "• الاصدار : 2.12.1 AN","md",true)
end
  ----
if text == 'تنظيف المشتركين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n• تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• لا توجد مجموعات وهميه*',"md")
end
end

if text == "مسح القوائم" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=senderr..'/redis:Devall'},
},
{
{text="المكتومين عام",data=senderr..'/KtmAll'},{text="المحظورين عام",data=senderr..'/BanAll'},
},
{
{text="المطورين الثانويين",data=senderr..'/Devss'},{text="المطورين",data=senderr..'/Dev'},
},
{
{text="المالكين",data=senderr..'/Ownerss'},{text="المنشئين الاساسيين",data=senderr..'/SuperCreator'},
},
{
{text="المنشئين",data=senderr..'/Creator'},{text="المدراء",data=senderr..'/Manger'},
},
{
{text="الادمنيه",data=senderr..'/Admin'},{text="المميزين",data=senderr..'/DelSpecial'},
},
{
{text="المكتومين",data=senderr..'/SilentGroupGroup'},{text="المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*•︙اختر احدى القوائم لمسحها*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..senderr)
return send(msg_chat_id,msg_id, "• تم مسح نقاطك","md",true)  
end

end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات •' or text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

send(msg_chat_id,msg_id, "• تم تحديث الملفات ♻","md",true)
dofile('Fast.lua')  
end

-- 7azer pv
if text and text:match("/start 7azer(.*)from_id(%d+)") then
local TemSelva = {text:match("/start 7azer(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(TemSelva[2]) then
send(msg_user_send_id,msg_id,'• هذا الامر لا يخصك',"md",true)  
else
if tonumber(msg.sender_id.user_id) ~= tonumber(Redis:get(Fast..":7azer:"..TemSelva[1])) then
return send(msg_user_send_id,msg_id,'• هذا الامر لا يخصك',"md",true) 
end
local mem_num = Redis:smembers(Fast..":7azer:mem:"..TemSelva[1])
if #mem_num == 0 then
return send(msg_user_send_id,msg_id,'• انتظر حتي انضمام لاعب واحد علي الاقل',"md",true) 
end
Redis:set(Fast..":7azer:chat_id"..msg_user_send_id, TemSelva[1])
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'quiz')
return send(msg_user_send_id,msg_id,'• ارسل السؤال الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'quiz' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
Redis:set(Fast..":7azer:quiz"..chat, text)
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'answer')
return send(msg_chat_id,msg_id,"• ارسل الاجابه بدون علامات مميزه","md",true,false,false,false)
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'answer' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
local quiz = Redis:get(Fast..":7azer:quiz"..chat)
Redis:set(Fast..":7azer:answer"..chat, text)
Redis:del(Fast..":7azer:state"..msg_user_send_id)
send(chat,0,"• السؤال :\n- "..quiz.."\n\n• معكم ( `"..ctime(180).."` ) لحل السؤال","md",true,false,false,false)
Redis:setex(Fast..":7azer:"..chat, 180, msg.sender_id.user_id)
Redis:del(Fast..":7azer:quiz"..chat)
return send(msg_chat_id,msg_id,"• تم ارسال اسؤال بنجاح","md",true,false,false,false)
end

if text and text:match("/start hms(.*)from_id(%d+)") then
local testhms = {text:match("/start hms(.*)from_id(%d+)")}
if msg_user_send_id ~= tonumber(testhms[2]) then
send(msg_user_send_id,msg_id,"⚠️ | هذا الأمر لا يخصك!","md",true)  
else
Redis:set(Fast.."hms:"..msg_user_send_id,testhms[1])
return send(msg_user_send_id,msg_id,"✉️ | أرسل الهمسة الآن:","md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast.."hms:"..msg_user_send_id) then
local testhms = Redis:get(Fast.."hms:"..msg_user_send_id)
local Sender = bot.getUser(msg_user_send_id)
local SenderName = Sender.first_name or "تيمو هقر"
local SenderLink = "["..SenderName.."](tg://user?id="..msg_user_send_id..")"
local ReceiverId = Redis:get(Fast.."hms:"..testhms.."to")
local Receiver = bot.getUser(ReceiverId)
local ReceiverName = Receiver.first_name or "تيمو هقر"
local ReceiverLink = "["..ReceiverName.."](tg://user?id="..ReceiverId..")"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = "✅ نعم", data = msg_user_send_id.."hms"..testhms},{text = "❌ لا", data = msg_user_send_id.."nn_hnss"..testhms},
},
}
}
Redis:set(Fast.."hms:"..testhms.."text:",text)
local MessageText = "📩 | **هل أنت متأكد من إرسال الهمسة؟**\n👤 | المرسل: "..SenderLink.."\n🎯 | المستلم: "..ReceiverLink
return send(msg_chat_id,msg_id,MessageText,"md",true,false,false,false,reply_markup)
end
--------------------------------------------------------------
if text and Redis:get(Fast.."set:chsource"..senderr) then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:chsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:chsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'chsource',chsource)
send(msg_chat_id,msg_id,'\n• تم حفظ قناه السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n• ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين قناه السورس •" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:chsource"..senderr,true)
send(msg_chat_id,msg_id,'• ارسل الان معرف قناه السورس ',"md",true)  
end
if text and Redis:get(Fast.."set:devsource"..senderr) then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:devsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:devsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'devsource',chsource)
send(msg_chat_id,msg_id,'\n• تم حفظ مطور السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n• ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين مطور السورس •" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:devsource"..senderr,true)
send(msg_chat_id,msg_id,'• ارسل الان معرف مطور السورس ',"md",true)  
end
if Redis:get(Fast.."set:rmz"..senderr) then
if text then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:rmz"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
Redis:set(Fast..'rmzsource',text)
Redis:del(Fast.."set:rmz"..senderr)
send(msg_chat_id,msg_id,'تم حفظ رمز السورس ',"md",true)  
dofile('Fast.lua')  
end
end
if text == "تعيين رمز السورس •" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:rmz"..senderr,true)
return send(msg_chat_id,msg_id,'ارسل رمز بدل من { •}',"md",true)  
end
if text == "حذف رمز السورس •" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."rmzsource","• ")
return send(msg_chat_id,msg_id,'تم ارجاع رمز السورس الي  { •}',"md",true)  
end
if text == "تفعيل البوت بصوره •" then
  if not msg.Asasy then
  bot.sendText(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
  end
  Redis:set(Fast.."name bot type : ", "photo")
  bot.sendText(msg_chat_id,msg_id,'\n*• تم تفعيل رد البوت بصوره * ',"md",true)  
  end
if text == "تعطيل البوت بصوره •" then
if not msg.Asasy then
bot.sendText(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."name bot type : ", "text")
bot.sendText(msg_chat_id,msg_id,'\n*• تم تعطيل رد البوت بصوره * ',"md",true)  
end
if text == 'تنظيف المشتركين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n• تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير كليشه ستارت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Start:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"• ارسل لي كليشه Start الان ","md",true)  
end
if text == 'مسح كليشه ستارت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Start:Bot") 
return send(msg_chat_id,msg_id,"• تم مسح كليشه Start ","md",true)   
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
end
if text == 'اضف رد عام •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == 'مسح رد عام •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لمسحها من الردود العامه","md",true)  
end

if text == ("الردود العامه •") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو ??"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامه •") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
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
return send(msg_chat_id,msg_id,"• تم مسح الردود العامه","md",true)  
end
if text == 'مسح المطورين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح قائمه العام •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id,"• تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه المحظورين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)

if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.Asasy then
if Redis:get(Fast.."TwaslBot") and not Redis:sismember(Fast.."BaN:In:Tuasl",senderr) then
local ListGet = {Sudo_Id,senderr}
local IdSudo = bot.getChat(ListGet[1]).id
local IdUser = bot.getChat(ListGet[2]).id
local FedMsg = bot.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.Fastbots == "messageSticker" then
send(IdSudo,0,Reply_Status(IdUser,'• قام بارسال الملصق').Reply,"md",true)  
end
return send(IdUser,msg_id,Reply_Status(IdUser,'• تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = bot.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
send(msg_chat_id,msg_id,Reply_Status(Info_User,'• قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
bot.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
bot.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
bot.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
bot.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
bot.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
bot.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
bot.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
bot.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
send(Info_User,0,text,"md",true)
end 
send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 


end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت 
RunCallBack(data)
end


Redis:sadd(Fast.."eza3a",Token.."&"..Fast)
Redis:set("@"..UserBot,Fast.."&".."@"..UserBot.."$@"..UserSudo.."+"..Token)
Fx.Fastbots.run(CallBackLua)
