--[[
لــ تــيــــمو ســيـلــفــا
]] 
function sala(msg)
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

if Redis:ttl(Fast.."sa_la:"..msg_chat_id) < 1 then
local zz = {
'صلي علي النبي وتبسم ♥️✨',
'اللهم صلِّ على نبينا محمد 🤎',
'صلي علي اشرف الخلق محمد ﷺ',
'صـلـو ؏ـلـى مـن بـڪى شـوقـا لـرؤيـتـنـا 🩶.',
'- صلِي على اشرف الخلق سيدنا محمد صلى الله عليه وسلم .',
'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا ❤️.',
}
local Selvaa = zz[math.random(#zz)]
local ss = "*"..Selvaa.."*"
Redis:setex(Fast.."sa_la:"..msg_chat_id,7200,true)
send(msg.chat_id,0,ss,"md",true)
end 

end
return {Fast = sala}