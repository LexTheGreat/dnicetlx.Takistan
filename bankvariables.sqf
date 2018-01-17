
robb_timeSperre              = 2400;
local_useBankPossible        = true;
maxinsafe                    = 3000000;
BankRaubKontoverlust         = 40000;
ShopRaubKontovershop         = 0;
ShopRaubProzentVershop       = 0;
rblock                       = 0;
stolencash                   = 0;
Maxbankrobpercentlost        = 0.01;
MaxbankrobpercentlostA       = 0.02;
MaxbankrobpercentlostB       = 0.03;
bank_tax                  = 10;
zinsen_prozent               = 1;
zinsen_dauer                 = 1200;
robenable                    = true;

shopflagarray            = [shop1,shop2,shop3,shop4];
bankflagarray            = [mainbank, copbank, atm1, atm2, atm3, atm4, atm5, atm6, atm8, atm11, atm12, atmpf, atmins, pmcatm, adminbank,vipatm,vipatm_1, civsupporteratm, copsupporteratm, opfsupporteratm, indsupporteratm,atmnews];
carshoparray             = [carshop1, carshop2, carshop3, carshop4, carshop5, carshop6, carshop7, carshop8];
speedcamarray            = [speed1,speed2,speed3,speed4,speed5];
drugsellarray            = [mdrugsell,cdrugsell,ldrugsell,hdrugsell];
GasStationArray          =
[
    copfuel,
    (nearestobject[getpos fuelshop1,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop2,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop3,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop4,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop5,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop6,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop7,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop8,"Land_Ind_FuelStation_Feed_Ep1"]),
    (nearestobject[getpos fuelshop9,"Land_Ind_FuelStation_Feed_Ep1"])
];