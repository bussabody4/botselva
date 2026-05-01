function porn_d(msg)
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

local socket_http = require("socket.http")
local ltn12 = require("ltn12")


local api_user = "1331139608"  
local api_secret = "3MUBGiW7msJ4KrcY9vhH6paxe8Kr5fSd"


bot = bot or {}
bot.id = tonumber(7327280824)  


if (msg.content.photo or msg.content.sticker or msg.content.animation or msg.content.video) then
  local result = msg
  local num = tostring(math.random(99999))
  local idPhoto, idd, typeee

  if result.content.photo then 
    if result.content.photo.sizes[3] then
      idPhoto = result.content.photo.sizes[3].photo.remote.id
      idd =  result.content.photo.sizes[3].photo.id
    elseif result.content.photo.sizes[2] then
      idPhoto = result.content.photo.sizes[2].photo.remote.id
      idd =  result.content.photo.sizes[2].photo.id
    elseif result.content.photo.sizes[1] then
      idPhoto = result.content.photo.sizes[1].photo.remote.id
      idd = result.content.photo.sizes[1].photo.id
    end
    typeee = "jpg"
  elseif result.content.sticker then
    idPhoto = result.content.sticker.sticker.remote.id
    idd = msg.content.sticker.sticker.id
    typeee = "webp"
  elseif result.content.animation then
    idPhoto = result.content.animation.animation.remote.id
    idd = msg.content.animation.animation.id
    typeee = "mp4"
  elseif msg.content.video then
    idPhoto = result.content.video.video.remote.id
    idd = msg.content.video.video.id
    typeee = "mp4"
  end


  if Redis:sismember("sex_ids",idd) then
    return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
  end
  if Redis:sismember("not_sex_ids",idd) then
    return false
  end

  local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..idPhoto)) 
  local file_path = File.result.file_path
  local download_url = 'https://api.telegram.org/file/bot'..Token..'/'..file_path

  local local_file = num.."."..typeee

  local dw = download(download_url, local_file)


  if typeee == "webp" then
    local converted_file = num..".jpg"
    os.execute("dwebp " .. local_file .. " -o " .. converted_file)
    os.remove(local_file)
    local_file = converted_file
    typeee = "jpg"
  end

  local image_file = io.open(local_file, "rb")
  if not image_file then
    return false
  end
  local image_data = image_file:read("*all")
  image_file:close()

  local boundary = "----BOTBOUNDARY12345"
  local body = "--"..boundary.."\r\n"
    ..'Content-Disposition: form-data; name="media"; filename="image.jpg"\r\n'
    .."Content-Type: image/jpeg\r\n\r\n"
    ..image_data.."\r\n"
    .."--"..boundary.."--\r\n"

  local response = {}
  local res, code = socket_http.request{
    url = "https://api.sightengine.com/1.0/check.json?models=nudity&api_user="..api_user.."&api_secret="..api_secret,
    method = "POST",
    headers = {
      ["Content-Type"] = "multipart/form-data; boundary="..boundary,
      ["Content-Length"] = tostring(#body)
    },
    source = ltn12.source.string(body),
    sink = ltn12.sink.table(response)
  }

  local res_text = table.concat(response)
  local result_api = JSON.decode(res_text)

  if result_api and result_api.nudity and result_api.nudity.raw then
    local nudity_score = tonumber(result_api.nudity.raw)
    if nudity_score > 0.5 then
      Redis:sadd("sex_ids", idd)
      os.remove(local_file)
      bot.deleteMessages(msg.chat_id,{[1]= msg.id})
      if msg.sender_user_id == bot.id then
        print("تم حذف صورة اباحية من البوت نفسه")
      end
      return send(msg.chat_id, msg.id, "*• تم حذف محتوى غير لائق تلقائياً*", "md", true)
    else
      Redis:sadd("not_sex_ids", idd)
      os.remove(local_file)
      return false
    end
  else
    os.remove(local_file)
    return false
  end
end





end
return {Fast = porn_d}