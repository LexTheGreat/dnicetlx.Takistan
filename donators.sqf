private["_uid"];
_uid = getPlayerUID player;

// Remember the Array format! No comma on last item in array!

// Donated $10
donators1 	  = [
					"76561198092270541", //SAMbro
					"245528838", //[TGS] Joes
					"76561198100072934", //NESKOVICH
					"76561198136955920", //Justin //add as mod
					"76561198125066778",//hunterwilcox
					"76561198085973711", //Savage
					"76561198130424832", //Aidan //ad as mod
					"76561198115199296", //Cpl. Applejack
					"76561198115328844", //Creational
					"76561198094031702", //Mystic.EXE
					"76561198071463315", //Lontra Atomica
					"76561198084473560",//death terrorist/grille
					"76561198069905879", //Swift
					"76561198097975603", //Nightshade
					"76561198043681651", //Mez
					"76561198152562567", // XxNickxX
					"76561198074221979", //DJ-Recon
					"76561198099263770", //illfingas
					"76561198095522901", //Richard Powers
					"76561198051253668", //GusLeah
					"76561198134860865", //Pitiedowl123
					"76561198130908059", //TAG Maggie
					"76561198156256043", //Mbition
					"76561198055843650", //Christian
					"76561198072956372", //TylerDurden
					"76561198013686582", //Hototuken
					"76561198040226209", //Cam
					"76561198020680293", //Petey
					"76561198089358305", //Duffman224
					"76561198126903119", //youmadornah?
					"76561198025752140", //Rehlief
					"76561198135961670", //kalashnikov
					"76561198101357588", //preznixon
					"76561198090128310", //ForFkSake
					"76561198115442699", //ItsRafi
					"76561198107430506", //faded
					"76561198045163743", //little tawd
					"76561198053191860", //Satpayev
					"76561198094519741", //DjangoFreeman
					"76561198123411634", //Joseph Vultaggio
					"76561198089072949", //Kyle
					"76561198047199328", //Zeds dead baby
					"76561198022516829", //Abu Jasem
					"76561198074236542", //Walker
					"76561198086547444", //FriarTuck
					"76561198162164745", //CHRONICxKNIGHT
					"76561198062792993", //Pat-tar
					"76561198155295570", //deancooper
					"76561198056676644", //hellman4
					"76561198114788756", //Fluskies
					"76561198121446470", //SIR
					"76561198152442647", //IIBARRICADEII
					"76561198147080989", //travis00
					"76561198055871342", //Sgt Brown
					"76561198057784032", //Hodor
					"76561198135298995", //Muhammad Ahmed
					"76561198055608411", //Nova
					"76561198083884755", //Nick
					"76561198093915329", //Niko
					"76561198069165434", //Tengum Val Gold
					"76561198143189534", //SHERMAN Isaiah Calhoun
					"76561198077959418", //dylanlind
					"76561198089530624", //Dan
					"76561198079616759", //Jordan Delonge
					"76561198077891995", //Sniper Fi
					"76561198092203299", //ReaperTurtleJ
					"76561198115897849", //Devinator13
					"76561198150547076", //D4N
					"76561198097364044", //Sheriff Mccgringleberry
					"76561198069463118", //Micha001
					"76561198080659117", //KrissKross
					"76561198117227598", //Larry
					"76561198062300840", //Jacob1
					"76561198045776002", //Sea Soul
					"76561198128197416", //Sun Enjin
					"76561198075310773", //SnipeyJones Enjin
					"76561198170609449", //Ryguy6006 / Ryan
					"76561198006670783", //Tony Molnar / Bruin
					"76561198059290772", //Mexistache
					"76561198114597817", //Mr. Baggles Enjin
					"76561198095689472", //kyle mendes achmed
					"76561198042587584", //Chives Enjin
					"76561198088178208", //Cooleo579 enjin
					"76561198128628252", //Wolf Riedel
					"76561198061794142", //Krang Enjin
					"76561198145572160", //Cameron Enjin
					"76561198069216575", //Exodus
					"76561198083260170", //[SS]Axel Foley
					"76561198133611332", //Emilio
					"76561198076366678", //Clamton
					"76561198137727916", //Caden
					"76561198157763939", //Inf4mousEnergy
					"76561198059193897", //Justin Blake
					"76561198082805000", //Russian Bear
					"76561198110469807", //Mason Fox
					"76561198050730382", //Austin Jumper
					"76561198144636471" //Sw!tch $15
		    ];

// Remember the Array format! No comma on last item in array!

// Donated $25
donators2 	  = [
					"76561198124725504", //KillaCali3
					"76561198062863149",//Spencer (donated by wade)
					"76561198054194000", //S. Wade //add as mod
					"76561198064255265",//DaveHoboMofo
					"76561198086016923", //BaconWarrior
					"76561198075424014", //LeHazy
					"76561198040908402", //MattMax509
					"76561198045152287", //[DNICE] Yousef Wendy
					"76561198049714505", //Laptopwarrior/GriswoldLog
					"76561198093692248", //Oooohkillem
					"76561198107780908", //Chris/Psycho
					"76561198011846083", //TheArtOfBalance
					"76561198077387199", //Billyjeanismydad
					"76561198003510822", //ShangorPanetta
					"76561197978480837", //knarf84
					"76561198143315314", //Token
					"76561197993946192", //danile666
					"76561197974886424", //Kuro5hin420
					"76561198119475641", //Le Fother
					"76561198145327197", //Alpha2O
					"76561198105395558", //Collin
					"76561198101119702", //Tyler MegaquartzMC
					"76561198059792896", //Ben brenn
					"76561198091781267", //PotatoPalsAlec
					"76561198155990670", //Littlepip
					"76561198151598894", //Allyson
					"76561197983640194", //Timothy
					"76561197971835255", //Johan
					"76561198013397706", //Geebly
					"76561198042877676", //Bananainyourear
					"76561198061766345", //PotSmokingHippie
					"76561198022259983", //LPK Solitude
					"76561197985471552", //Bismarck
					"76561198026224873", //Dalton
					"76561198069889962", //oshit
					"76561198058459273", //Bashir Zayz
					"76561198153831221", //rhotis
					"76561198148463580", //dillan225
					"76561198166236290", //CandyMan
					"76561198079217419", //Jonathanbucy
					"76561198063890424", //Brendan Donahue
					"76561198139855195", //Murphy
					"76561198006806376", //TonyMontana
					"76561198137657512", //Pak X Ehm
					"76561198153442863", //Hudson Riggs	
					"76561198026872762", //Danny
					"76561198080526121", //ExoticAnus
					"76561198132886280", //Ice Mummy
					"76561198083087001", //DizzyOreo
					"76561198050430232", //HardLike
					"76561197984064803", //BeardedDeath Tim gib
					"76561198092417819", //Scorches
					"76561198102125657", //Edward UnknowingFrk Martinz
					"76561198132242997", //MPxLuna $25 possible scammer
					"76561198065361202", //LifeShifter
					"76561198096275577", //Henry Hill Liz Beckett 
					"76561198112412098", //Sgt Dragon
					"76561197974500553", //HarvisTraley
					"76561198059732869", //Pvt. Reggie
					"76561198122297063", //Dowables
					"76561198069677444", //Jawn
					"76561198129102813", //Nick Norman
					"76561198105821449", //Derpy Herpy derpderp75
					"76561198097070500", //Mythic
					"76561198080009724", //Bonenberger13
					"76561198083602285", //Pimp God Tyrone
					"76561198068098093", //Explosiveman Enjin
					"76561198090767260", //Zaar Enjin
					"76561198093686268", //James Washcloth
					"76561198102207968", //Abel Ortega
					"76561198001534106", //Beau
					"76561198085563991", //Masuk Hussein Crow
					"76561198146770526", //Agent Gaming
					"76561198077835165", //CanMan 179 //$30
					"76561198039594808", //Emanuel
					"76561198168912341", //Kiwiwonder
					"76561198140314791", //Imran Zakhaev
					"76561198018600234", //JORDAN Beck
					"76561198162808465", //Visual Enjin
					"76561198067620373", //Snowman
					"76561198133152953", //Lemmings
					"76561198124176578", //Lt Monkey
					"76561198119216004", //Heaven
					"76561198055310671", //Elgin Terry
					"76561198122666011", //cyka blyat
					"76561197990568150", //Grismer
					"76561198114549420" //RageCometz
			];

// Remember the Array format! No comma on last item in array!

// Donated $50
donators3  	  = [
				"76561198087246280", //Steve briton
				"76561198056520395", //TMJ0523
				"76561198059512364", //ethan smith(nice guy)
				"76561198085473116", //CPT. RUSSELL
				"76561198062448514", //Abu Nazzir (Sion)
				"76561198071466491", //|KINGZ|MAC
				"76561198078405272",  //Henrik $40
				"76561198062759694", //MaikelHawk
				"76561198015154477", //leadmagnet
				"76561197983195053", //Eric
				"76561197970974783", //Zanec321
				"76561198071964800", //GavinTankGaming
				"76561198133658655", //Roque
				"76561198158227283", //Gnome
				"76561198103350780", //Ryguy
				"76561198089667130", //Facundo
				"76561198115818821​", //CaseTheSlayer
				"76561198017822314", //Morvistic
				"76561198119279822", //Mr. Penguin
				"76561198101924418", //Lex_Dev
				"76561198019703127", //walker
				"76561198071078533", //Lucid Hysteria
				"76561198087009530", //Leiwyn
				"76561198021622967", //Trooper1030
				"76561198081149300", //blazn 20M purchse
				"76561198091256187", //Robb Stark
				"76561198135614824", //Weeaboo effecting team
				"76561198098170503" //King Akbur	
			];

// Remember the Array format! No comma on last item in array!

// Donated $75
donators4  	  = [
				"76561198111424831", //TiLTDRAMZ
				"76561198045721518" //Burty

];

// Remember the Array format! No comma on last item in array!

// Donated VIP $100+
donatorsVIP     = [
				"245049094", // Fyodor
				"76561198106962111", // Wilson (Vukan)
				"76561198018896118", // 72nd Talfi/Willigsire
				"247857670", // LIL PWMZORER
				"76561198068079024", //SolidSnake
				"76561198131604780", //GREASY
				"76561198046673227", //SAM1
				"76561198072033337", //Jarhead
				//"76561198132242997", //MPxLuna $120
				"76561198154237291", //Sgt. E Garcia
				"76561198045285643", //EdwardThronedBoar
				"76561197969949094", //Mmetully
				"76561198056078549", //SAM ITALY $15 $50 $75
				"76561198079002512", //Reckerog
				"76561198080206289", //Cole
				"76561198055764826", //weston5430
				"76561198081926401", //UKKarma
				"76561198000426604", //Boozehammer John Biden
				"76561198132373007", //FBI
				"76561198141964948", //Dreams zach
				"76561198152269779", //Turtle-_-Island
				"76561198093831210",//Turtles
				"76561198005220301", //XxUnturendMasterxX
				"76561198093287676", //Joshua Jay
				"76561198087624037", //Helix
				"76561198078305491", //William
				"76561198135899866", //bakedpotato
				"76561198143786261", //Rivers
				"76561198153761197", //FalconLover
				"76561198114718805", //Nosce
				"76561198054899491", //Progaming/CyanCod_Player
				"76561198053580599", //MartinAleksander
				"76561198074036407", //Mr.Dexter Santiago
				"76561198030119519", //Diarmada
				"76561198155614911", //Alex Mason
				"76561198139401322", //Mu'tasim Asadullah
				"76561198118377646", //ShawnMoody
				"76561198021990722", //Mushroombat
				"76561198134427407"//Ja
				//"76561198100072934" //NESKOVICH

			];

