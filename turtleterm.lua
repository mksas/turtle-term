--Turtle Term (System)
--Lizenz: The BSD 3-Clause License

terminalZeichen = "# "

function help(seite)
 if seite == 1 then
  print("help: Hilfe\nexit: Programm beenden\nclear: Cleart den Bildschirm\nw: Turtle - Nach vorne gehen") --Muss noch gemacht werden
 end
end

function tunnel()
 io.write("Wie viele Blöcke? "..terminalZeichen)
 blocks = io.read()
 blocks = blocks + 0
 if blocks > 0 then
  for block = 0, blocks do
   if turtle.detectDown() ~= true then turtle.placeDown() end
   if turtle.detectUp() == true then turtle.digUp() end
   if turtle.getFuelLevel == 0 then
    print("Ich brauche Fuel!")
    break
   end
   if turtle.detect() then turtle.dig() end
   if turtle.detect() == false and turtle.detectUp() == false then
    turtle.forward()
   else
    print("Fehler: Kann nicht abbauen.")
   end
  end
  print("Fertig!")
 end
end

shell.run("clear")
print("Turtle Term (Beta)")
print("Licensed under The BSD 3-Clause License")

--while true Loop
while true do
  io.write(terminalZeichen)
  --Get Input
  input = io.read()
  --Actions von Input
  if input == "exit" then break
  elseif input == "help" then
   seite = io.write("Welche Seite? ")
   help(seite)
  elseif input == "clear" then shell.run("clear")
  elseif input == "w" or input == "W" then turtle.forward()
  elseif input == "a" or input == "A" then turtle.turnLeft()
  elseif input == "s" or input == "S" then turtle.back()
  elseif input == "d" or input == "D" then turtle.turnRight()
  elseif input == "up" then turtle.up()
  elseif input == "down" then turtle.down()
  elseif input == "dig" or input == "dig" then turtle.dig()
  elseif input == "dig w" or input == "dig W" then turtle.digUp()
  elseif input == "dig s" or input == "dig S" then turtle.digDown()
  elseif input == "tunnel" or input == "gang" then tunnel()
  elseif input == "place" then turtle.place()
  elseif input == "place s" or input == "place S" then turtle.placeDown()
  elseif input == "place w" or input == "place W" then turtle.placeUp()
  elseif input == "refuel" or input  == "load" then turtle.refuel()
  elseif input == "refuel all" or input == "refuel ALL" then turtle.refuelAll()
  elseif input == "fuel" then print(turtle.getFuelLevel())
  elseif input == "reboot" or input == "restart" then shell.run("reboot")
  elseif input == "shutdown" or input == "halt" then shell.run("shutdown")
  else print("Ungültiger Befehl")
  end
end
