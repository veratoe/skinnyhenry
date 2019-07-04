# skinnyhenry
Skinny Henry

<img src="https://github.com/veratoe/skinnyhenry/blob/master/bg.gif" width="50">


# Belangrijkste scripts:
  - initializePlayer
  - initializeGameController
  
  In deze files staan variabelen:
  
  ## initializePlayer
  | Naam | omschrijving | huidige waarde |
  |-----|--------|--------|
  | jumpSpeed | springkracht |  24|
  | maxSpeedX | snelheid van poppetje (geen versnelling of vertraging voor nu) | 6 |
  |gForce     | zwaartekracht (gravity werkt (nog) niet lekker, is intern GML woord)  | 1.27 |
  
  ## initializeGameController
    
  | Naam | omschrijving | huidige waarde |
  |-----|--------|--------|
  | buildingWidth| moet voor nu nog even precies overeenkomen met collision mask van sprite van gebouw, later dynamisch | 415|| 
| spaceBetweenBuildings | ruimte /gat tussen opvolgende gebouwen, in pixels | 150 |
| buildingY | start Y gebouw |  400 |
| buildingMaxY| max Y coordinaat van een gebouw | 600 |
| buildingMinY | min Y coordinaat van gebowu | 300 |
|buildingYDifference |  minimale stap verschil, uiteiundelijk verschil is een random waarde tussen -5 en +5 maal deze waarde| 20|
  
