--1--------------------------------------------------------------------------------------------
--- EN: At the beggining of the file after `local rclient_menus = {}`
--- RO: La începutul fișierului după `local rclient_menus = {}`
--- PT: Cole no comeco do arquivo depois de `local rclient_menus = {}`
local seq_in = {
  {"cellphone@","cellphone_text_in",1},
  {"cellphone@","cellphone_text_read_base",1}
}
local seq_out = {
  {"cellphone@","cellphone_text_out",1}
}
local phoneAnim = {}
AddEventHandler("vRP:playerLeave", function(user_id, source)
  if phoneAnim[source] then
	  TriggerClientEvent("deletePhone", source)
	  vRPclient.playAnim(source,{true,seq_out,false})
    phoneAnim[source] = false
  end
end)
function case(pattern)
  local p = pattern:gsub("(%%?)(.)", function(percent, letter)
    if percent ~= "" or not letter:match("%a") then
      return percent .. letter
    else
      return string.format("%s%s", letter:lower(), letter:upper())
    end
  end)
  return p
end
local menus = {"Main Menu"}
--2--------------------------------------------------------------------------------------------
--- EN: At the beggining of the function "vRP.openMenu"
--- RO: La începutul funcției "vRP.openMenu"
--- PT: Cole no comeco da funcao "vRP.openMenu"
  for i, v in pairs(menus) do
    if case(menudef.name) == case(v) then
      if not phoneAnim[source] then
        TriggerClientEvent("createPhone", source)
        vRPclient.playAnim(source,{true,seq_in,true})
      end
      phoneAnim[source] = true
    end
  end
--3--------------------------------------------------------------------------------------------  
--- EN: In first "if" from function "tvRP.closeMenu"
--- RO: La primul "if" al funcției "tvRP.closeMenu"
--- PT: Cole no primeiro "if" da funcao "tvRP.closeMenu"
    if phoneAnim[source] == true then
      TriggerClientEvent("deletePhone", source)
      vRPclient.playAnim(source,{true,seq_out,false})
      phoneAnim[source] = false
    end
