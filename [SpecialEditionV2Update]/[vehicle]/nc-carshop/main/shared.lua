Config = {}

Config.Framework = "QBCore" -- QBCore or ESX or OLDQBCore -- NewESX

function GetFramework()
    local Get = nil
    if Config.Framework == "ESX" then
        while Get == nil do
            TriggerEvent('esx:getSharedObject', function(Set) Get = Set end)
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "NewESX" then
        Get = exports['es_extended']:getSharedObject()
    end
    if Config.Framework == "QBCore" then
        Get = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "OldQBCore" then
        while Get == nil do
            TriggerEvent('QBCore:GetObject', function(Set) Get = Set end)
            Citizen.Wait(200)
        end
    end
    return Get
 end

Config.Vehicles = {
    ['vehicles'] = {
          {model='gauntlet4', label='Gauntlet4', price=1600, category='LUXURY'},
          {model='hermes', label='Hermes', price=2600, category='LUXURY'},
          {model='kuruma2', label='Kuruma2', price=3600, category='LUXURY'},
          {model='specter2', label='Specter2', price=4600, category='LUXURY'},
          {model='jester2', label='Jester2', price=7600, category='LUXURY'},
          {model='ninef2', label='Ninef2', price=6600, category='LUXURY'},
          {model='schafter2', label='Schafter2', price=5600, category='LUXURY'},
          
          {model='serrano', label='Serrano', price=1600, category='JEEPS'},
          {model='xls2', label='XLS2', price=2600, category='JEEPS'},
          {model='toros', label='Toros', price=3600, category='JEEPS'},
          {model='seminole2', label='Seminole2', price=4600, category='JEEPS'},
          {model='patriot', label='Patriot', price=7600, category='JEEPS'},
          {model='dubsta2', label='Dubsta2', price=6600, category='JEEPS'},
          {model='baller4', label='Baller4', price=5600, category='JEEPS'},
      
          {model='cypher', label='Cypher', price=1600, category='SPORTS'},
          {model='jester4', label='Jester4', price=2600, category='SPORTS'},
          {model='comet6', label='Comet6', price=3600, category='SPORTS'},
          {model='vectre', label='Vectre', price=4600, category='SPORTS'},
          {model='zr350', label='ZR 350', price=7600, category='SPORTS'},
          {model='tampa2', label='Tampa2', price=6600, category='SPORTS'},
          {model='seven70', label='Seven70', price=5600, category='SPORTS'},
      
      
          {model='speedo4', label='Speedo4', price=1600, category='VANS'},
          {model='youga3', label='Youga3', price=2600, category='VANS'},
          {model='sadler', label='Sadler', price=3600, category='VANS'},
          {model='tailgater2', label='Tailgater2', price=4600, category='VANS'},
          {model='towtruck2', label='Towtruck2', price=7600, category='VANS'},
          {model='utillitruck3', label='Utillitruck3', price=6600, category='VANS'},
          {model='surfer', label='Surfer', price=5600, category='VANS'},
    
    
          {model='vindicator', label='Vindicator', price=2000, category='MOTOS'},
          {model='nightblade', label='Nightblade', price=2500, category='MOTOS'},
          {model='defiler', label='Defiler', price=2800, category='MOTOS'},
          {model='hakuchou', label='Hakuchou', price=3000, category='MOTOS'},
          {model='sanchez', label='Sanchez', price=1500, category='MOTOS'},
    
          {model='phantom', label='Phantom', price=8000, category='Trucks'},
          {model='hauler', label='Hauler', price=10000, category='Trucks'},
          {model='packer', label='Packer', price=12000, category='Trucks'},
          {model='benson', label='Benson', price=6000, category='Trucks'},
          {model='mule', label='Mule', price=5000, category='Trucks'},
        
          {model='dune', label='Dune', price=7000, category='OFF-ROAD'},
          {model='bifta', label='Bifta', price=5500, category='OFF-ROAD'},
          {model='blazer', label='Blazer', price=3500, category='OFF-ROAD'},
          {model='trophytruck', label='Trophy Truck', price=9500, category='OFF-ROAD'},
          {model='kalahari', label='Kalahari', price=4500, category='OFF-ROAD'},
        
          {model='tornado', label='Tornado', price=6000, category='Classic'},
          {model='peyote', label='Peyote', price=6500, category='Classic'},
          {model='stinger', label='Stinger', price=7000, category='Classic'},
          {model='monroe', label='Monroe', price=7500, category='Classic'},
          {model='ztype', label='Z-Type', price=8000, category='Classic'},
    
    
          {model='sabregt', label='Sabre GT', price=5000, category='MUSCLE'},
          {model='dominator', label='Dominator', price=7000, category='MUSCLE'},
          {model='dukes', label='Dukes', price=6000, category='MUSCLE'},
          {model='gauntlet', label='Gauntlet', price=8000, category='MUSCLE'},
          {model='ellie', label='Ellie', price=6500, category='MUSCLE'},
          
          {model='schafter6', label='Schafter', price=6000, category='SEDANES'},
          {model='superd', label='Super Diamond', price=7000, category='SEDANES'},
          {model='tailgater', label='Tailgater', price=5000, category='SEDANES'},
          {model='warrener', label='Warrener', price=4000, category='SEDANES'},
          {model='washington', label='Washington', price=4500, category='SEDANES'},
          
          {model='blista', label='Blista', price=3000, category='Compact'},
          {model='dilettante', label='Dilettante', price=3500, category='Compact'},
          {model='issi2', label='Issi', price=4000, category='Compact'},
          {model='panto', label='Panto', price=2500, category='Compact'},
          {model='prairie', label='Prairie', price=3500, category='Compact'},
          
          {model='bulldozer', label='Bulldozer', price=12000, category='Industrial'},
          {model='dump', label='Dump', price=25000, category='Industrial'},
          {model='mixer2', label='Mixer', price=14000, category='Industrial'},
          {model='rubble', label='Rubble', price=10000, category='Industrial'},
          {model='tiptruck', label='Tip Truck', price=9000, category='Industrial'},
    },

    ['aircraft'] = {
        {model='luxor', label='Luxor', price=50000, category='JETS'},
        {model='luxor2', label='Luxor Deluxe', price=150000, category='JETS'},
        {model='nimbus', label='Nimbus', price=200000, category='JETS'},
        {model='buzzard2', label='Buzzard Attack Chopper', price=25000, category='HELICOPTERS'},
        {model='cargobob', label='Cargobob', price=120000, category='HELICOPTERS'},
        {model='dodo', label='Dodo', price=25000, category='SMALL PLANES'},
        {model='mammatus', label='Mammatus', price=30000, category='SMALL PLANES'},
        {model='titan', label='Titan', price=2000000, category='CARGO PLANES'},
        {model='cuban800', label='Cuban 800', price=240000, category='CARGO PLANES'},
        {model='lazer', label='P-996 LAZER', price=6500000, category='MILITARY'},
        {model='hydra', label='Hydra', price=3000000, category='MILITARY'},
        {model='seabreeze', label='Seabreeze', price=850000, category='SEAPLANES'},
        {model='tula', label='Tula', price=5000000, category='SEAPLANES'},
        {model='shamal', label='Shamal', price=1150000, category='VIP JETS'},
        {model='miljet', label='Miljet', price=1700000, category='VIP JETS'},
        {model='frogger', label='Frogger', price=1300000, category='RESCUE'},
        {model='maverick', label='Maverick', price=780000, category='RESCUE'},
        {model='besra', label='Besra', price=1150000, category='FIGHTER JETS'},
        {model='molotok', label='V-65 Molotok', price=4500000, category='FIGHTER JETS'},
        {model='volatol', label='Volatol', price=3500000, category='BOMBERS'},
        {model='avenger', label='Avenger', price=3750000, category='BOMBERS'},
        {model='blazer5', label='Blazer Aqua', price=1600000, category='GLIDERS'}, 
        {model='hotairballoon01', label='Hot Air Balloon', price=20000, category='AIR BALLOONS'},
        {model='drone', label='Drone', price=10000, category='DRONES'},
    },

    ['boat'] = {
        {model='Dinghy', label='Dinghy', price=25000, category='MOTORBOATS'},
        {model='Jetmax', label='Jetmax', price=35000, category='MOTORBOATS'},
        {model='Marquis', label='Marquis', price=500000, category='YACHTS'},
        {model='Toro', label='Toro', price=1000000, category='YACHTS'},
        {model='Tropic', label='Tropic', price=70000, category='SAILBOATS'},
        {model='Marquis', label='Marquis', price=150000, category='SAILBOATS'},
        {model='Seashark', label='Seashark', price=30000, category='SPEEDBOATS'},
        {model='Speeder', label='Speeder', price=45000, category='SPEEDBOATS'},
        {model='Seashark3', label='Seashark3', price=20000, category='FISHING BOATS'},
        {model='Dinghy2', label='Dinghy2', price=30000, category='FISHING BOATS'},
        {model='Tug', label='Tug', price=100000, category='PONTOON BOATS'},
        {model='Dinghy4', label='Dinghy4', price=50000, category='PONTOON BOATS'},
        {model='Seashark', label='Seashark', price=25000, category='JET SKIS'},
        {model='Speeder', label='Speeder', price=35000, category='JET SKIS'},
        {model='Dinghy3', label='Dinghy3', price=40000, category='CATAMARANS'},
        {model='Tropic2', label='Tropic2', price=60000, category='CATAMARANS'},
        {model='Suntrap', label='Suntrap', price=50000, category='CABIN CRUISERS'},
        {model='Marquis', label='Marquis', price=70000, category='CABIN CRUISERS'},
        {model='Tug', label='Tug', price=150000, category='TUGBOATS'},
        {model='Freighter', label='Freighter', price=200000, category='TUGBOATS'},
        {model='Ferry', label='Ferry', price=200000, category='FERRIES'},
        {model='Ferry2', label='Ferry2', price=250000, category='FERRIES'},
        {model='Barge', label='Barge', price=100000, category='BARGE'},
        {model='Barge2', label='Barge2', price=120000, category='BARGE'},
    },

    ['showroom'] = {
        {model='gauntlet4', label='Gauntlet4', price=1600, category='LUXURY'},
        {model='hermes', label='Hermes', price=2600, category='LUXURY'},
        {model='kuruma2', label='Kuruma2', price=3600, category='LUXURY'},
        {model='specter2', label='Specter2', price=4600, category='LUXURY'},
        {model='jester2', label='Jester2', price=7600, category='LUXURY'},
        {model='ninef2', label='Ninef2', price=6600, category='LUXURY'},
        {model='schafter2', label='Schafter2', price=5600, category='LUXURY'},
        
        {model='serrano', label='Serrano', price=1600, category='JEEPS'},
        {model='xls2', label='XLS2', price=2600, category='JEEPS'},
        {model='toros', label='Toros', price=3600, category='JEEPS'},
        {model='seminole2', label='Seminole2', price=4600, category='JEEPS'},
        {model='patriot', label='Patriot', price=7600, category='JEEPS'},
        {model='dubsta2', label='Dubsta2', price=6600, category='JEEPS'},
        {model='baller4', label='Baller4', price=5600, category='JEEPS'},
    
        {model='cypher', label='Cypher', price=1600, category='SPORTS'},
        {model='jester4', label='Jester4', price=2600, category='SPORTS'},
        {model='comet6', label='Comet6', price=3600, category='SPORTS'},
        {model='vectre', label='Vectre', price=4600, category='SPORTS'},
        {model='zr350', label='ZR 350', price=7600, category='SPORTS'},
        {model='tampa2', label='Tampa2', price=6600, category='SPORTS'},
        {model='seven70', label='Seven70', price=5600, category='SPORTS'},
    
    
        {model='speedo4', label='Speedo4', price=1600, category='VANS'},
        {model='youga3', label='Youga3', price=2600, category='VANS'},
        {model='sadler', label='Sadler', price=3600, category='VANS'},
        {model='tailgater2', label='Tailgater2', price=4600, category='VANS'},
        {model='towtruck2', label='Towtruck2', price=7600, category='VANS'},
        {model='utillitruck3', label='Utillitruck3', price=6600, category='VANS'},
        {model='surfer', label='Surfer', price=5600, category='VANS'},
  
  
        {model='vindicator', label='Vindicator', price=2000, category='MOTOS'},
        {model='nightblade', label='Nightblade', price=2500, category='MOTOS'},
        {model='defiler', label='Defiler', price=2800, category='MOTOS'},
        {model='hakuchou', label='Hakuchou', price=3000, category='MOTOS'},
        {model='sanchez', label='Sanchez', price=1500, category='MOTOS'},
  
        {model='phantom', label='Phantom', price=8000, category='Trucks'},
        {model='hauler', label='Hauler', price=10000, category='Trucks'},
        {model='packer', label='Packer', price=12000, category='Trucks'},
        {model='benson', label='Benson', price=6000, category='Trucks'},
        {model='mule', label='Mule', price=5000, category='Trucks'},
      
        {model='dune', label='Dune', price=7000, category='OFF-ROAD'},
        {model='bifta', label='Bifta', price=5500, category='OFF-ROAD'},
        {model='blazer', label='Blazer', price=3500, category='OFF-ROAD'},
        {model='trophytruck', label='Trophy Truck', price=9500, category='OFF-ROAD'},
        {model='kalahari', label='Kalahari', price=4500, category='OFF-ROAD'},
      
        {model='tornado', label='Tornado', price=6000, category='Classic'},
        {model='peyote', label='Peyote', price=6500, category='Classic'},
        {model='stinger', label='Stinger', price=7000, category='Classic'},
        {model='monroe', label='Monroe', price=7500, category='Classic'},
        {model='ztype', label='Z-Type', price=8000, category='Classic'},
  
  
        {model='sabregt', label='Sabre GT', price=5000, category='MUSCLE'},
        {model='dominator', label='Dominator', price=7000, category='MUSCLE'},
        {model='dukes', label='Dukes', price=6000, category='MUSCLE'},
        {model='gauntlet', label='Gauntlet', price=8000, category='MUSCLE'},
        {model='ellie', label='Ellie', price=6500, category='MUSCLE'},
        
        {model='schafter6', label='Schafter', price=6000, category='SEDANES'},
        {model='superd', label='Super Diamond', price=7000, category='SEDANES'},
        {model='tailgater', label='Tailgater', price=5000, category='SEDANES'},
        {model='warrener', label='Warrener', price=4000, category='SEDANES'},
        {model='washington', label='Washington', price=4500, category='SEDANES'},
        
        {model='blista', label='Blista', price=3000, category='Compact'},
        {model='dilettante', label='Dilettante', price=3500, category='Compact'},
        {model='issi2', label='Issi', price=4000, category='Compact'},
        {model='panto', label='Panto', price=2500, category='Compact'},
        {model='prairie', label='Prairie', price=3500, category='Compact'},
        
        {model='bulldozer', label='Bulldozer', price=12000, category='Industrial'},
        {model='dump', label='Dump', price=25000, category='Industrial'},
        {model='mixer2', label='Mixer', price=14000, category='Industrial'},
        {model='rubble', label='Rubble', price=10000, category='Industrial'},
        {model='tiptruck', label='Tip Truck', price=9000, category='Industrial'},
  },

    
     
}
  


Config.Category = {

    ['showroom'] = {
        {
            label='LUXURY',
            text="Luxury Vehicles!",
            description="Explore our selection of top-of-the-line luxury vehicles, combining the pinnacle of style and comfort with satisfyingly balanced performance. Perfect for making a statement.",
            capacity=55
         },
          
         {
            label='JEEPS',
            text="Check out the mountain beasts!", 
            description="Discover our range of 4x4s and Jeeps, designed to conquer any terrain. These robust and reliable vehicles are your perfect companions for off-road adventures and mountain explorations.",
            capacity=85
          },
          
          {
            label='SPORTS',
            text="Fast and non-stop vehicle1", 
            description="Welcome to our sport vehicles section where speed meets style. From sleek designs to powerful engines, these vehicles are built to thrill and offer an exhilarating driving experience.",
            capacity=30
          },
          {
            label='VANS',
            text="Panel vans are available here!", 
            description="Browse our selection of panel vans, designed with high traction and ample storage space. They're the perfect solution for your transportation and delivery needs.",
            capacity=100
          },
          
          {
            label='MOTORCYCLES',
            text="Fast and furious motorcycles!", 
            description="Step into the world of high-speed, high-adrenaline motorbikes. Ideal for those who crave the thrill of speed and the wind in their face, these motorcycles promise an unforgettable ride.",
            capacity=20
          },
          {
            label='TRUCKS',
            text="Big and powerful trucks!", 
            description="Discover our collection of robust and reliable trucks. Built to handle heavy duty and large loads, these vehicles are a dependable choice for all your transportation needs.",
            capacity=100
          },
          {
            label='OFF-ROAD',
            text="Tough off-road vehicles!", 
            description="Explore our collection of rugged off-road vehicles, specifically designed to tackle any terrain. Whether it's rocky roads or muddy trails, these vehicles are ready for the challenge.",
            capacity=70
          },
          {
            label='CLASSICS',
            text="Elegant and stylish classic cars!", 
            description="Step back in time with our selection of classic cars. Offering timeless style, sophistication, and charm, these vehicles are a testament to the golden age of automobile design.",
            capacity=50
          },
          {
            label='MUSCLE',
            text="Powerful and fast muscle cars!", 
            description="Get your adrenaline pumping with our range of muscle cars. Famed for their raw power and high performance, these vehicles offer a driving experience like no other.",
            capacity=40
          },
          {
            label='SEDANS',
            text="Elegant and comfortable sedans!", 
            description="Check out our selection of sedans that effortlessly blend comfort, style, and performance. They are perfect for long journeys, offering a smooth ride and plenty of space for passengers and luggage.",
            capacity=60
          },
          {
            label='COMPACT',
            text="Practical and economical compact cars!", 
            description="Explore our range of compact cars, designed with practicality and economy in mind. They're ideal for city driving, offering excellent fuel efficiency and easy maneuverability.",
            capacity=30
          },
          {
            label='INDUSTRIAL',
            text="Heavy duty industrial vehicles!", 
            description="Meet our range of industrial vehicles, built to handle the toughest of tasks. Whether it's construction, mining, or heavy transportation, we've got the right vehicle for the job.",
            capacity=120
          },
    },

    ['vehicles'] = {
        {
            label='LUXURY', 
            text="Luxury Vehicles!", 
            description="Explore our selection of top-of-the-line luxury vehicles, combining the pinnacle of style and comfort with satisfyingly balanced performance. Perfect for making a statement.", 
            capacity=55
          },
          
          {
            label='JEEPS',
            text="Check out the mountain beasts!", 
            description="Discover our range of 4x4s and Jeeps, designed to conquer any terrain. These robust and reliable vehicles are your perfect companions for off-road adventures and mountain explorations.",
            capacity=85
          },
          
          {
            label='SPORTS',
            text="Fast and non-stop vehicle1", 
            description="Welcome to our sport vehicles section where speed meets style. From sleek designs to powerful engines, these vehicles are built to thrill and offer an exhilarating driving experience.",
            capacity=30
          },
          {
            label='VANS',
            text="Panel vans are available here!", 
            description="Browse our selection of panel vans, designed with high traction and ample storage space. They're the perfect solution for your transportation and delivery needs.",
            capacity=100
          },
          
          {
            label='MOTOS',
            text="Fast and furious motorcycles!", 
            description="Step into the world of high-speed, high-adrenaline motorbikes. Ideal for those who crave the thrill of speed and the wind in their face, these motorcycles promise an unforgettable ride.",
            capacity=20
          },
          {
            label='Trucks',
            text="Big and powerful trucks!", 
            description="Discover our collection of robust and reliable trucks. Built to handle heavy duty and large loads, these vehicles are a dependable choice for all your transportation needs.",
            capacity=100
          },
          {
            label='OFF-ROAD',
            text="Tough off-road vehicles!", 
            description="Explore our collection of rugged off-road vehicles, specifically designed to tackle any terrain. Whether it's rocky roads or muddy trails, these vehicles are ready for the challenge.",
            capacity=70
          },
          {
            label='Classic',
            text="Elegant and stylish classic cars!", 
            description="Step back in time with our selection of classic cars. Offering timeless style, sophistication, and charm, these vehicles are a testament to the golden age of automobile design.",
            capacity=50
          },
          {
            label='MUSCLE',
            text="Powerful and fast muscle cars!", 
            description="Get your adrenaline pumping with our range of muscle cars. Famed for their raw power and high performance, these vehicles offer a driving experience like no other.",
            capacity=40
          },
          {
            label='SEDANES',
            text="Elegant and comfortable sedans!", 
            description="Check out our selection of sedans that effortlessly blend comfort, style, and performance. They are perfect for long journeys, offering a smooth ride and plenty of space for passengers and luggage.",
            capacity=60
          },
          {
            label='Compact',
            text="Practical and economical compact cars!", 
            description="Explore our range of compact cars, designed with practicality and economy in mind. They're ideal for city driving, offering excellent fuel efficiency and easy maneuverability.",
            capacity=30
          },
          {
            label='Industrial',
            text="Heavy duty industrial vehicles!", 
            description="Meet our range of industrial vehicles, built to handle the toughest of tasks. Whether it's construction, mining, or heavy transportation, we've got the right vehicle for the job.",
            capacity=120
          },
    },

    ['aircraft'] = {
        {
            label='JETS', 
            text="High Speed Jets!", 
            description="Explore our range of high-speed jets, perfect for those who crave speed and efficiency. These are the epitome of luxury and performance in the sky.", 
            capacity=10,
          },
          
          {
            label='HELICOPTERS',
            text="Versatile Helicopters!", 
            description="Discover our versatile helicopters, perfect for navigating through the city or accessing hard-to-reach locations. These aircraft are essential for any serious business or adventure.",
            capacity=15,
          },
          

          {
            label='SMALL PLANES',
            text="Reliable Small Planes!", 
            description="Browse our reliable small planes. They are perfect for short trips or scenic flights. Experience the joy of flying at your own pace with these wonderful aircraft.",
            capacity=5,            
          },

          {
            label='CARGO PLANES',
            text="Heavy-Duty Cargo Planes!",
            description="Check out our range of heavy-duty cargo planes, designed for long-distance hauls and large cargo. These giants of the sky are perfect for any serious transportation business.",
            capacity=20,
        },

        {
            label='MILITARY',
            text="Military Grade Aircrafts!",
            description="Discover our selection of military-grade aircraft. From fighters to bombers, these planes are equipped for any combat scenario. Experience the thrill of piloting these high-tech machines.",
            capacity=10,
        },

        {
            label='SEAPLANES',
            text="Adaptable Seaplanes!",
            description="Browse our range of seaplanes, perfect for water take-offs and landings. These versatile aircraft are perfect for island hopping or accessing remote locations.",
            capacity=5,
        },

        {
            label='VIP JETS',
            text="Luxury VIP Jets!",
            description="Experience the luxury of our VIP jets, providing the ultimate comfort and style for high-altitude travel. These planes are ideal for long-distance, premium-class flights.",
            capacity=8,
        },

        {
            label='RESCUE',
            text="Reliable Rescue Helicopters!",
            description="Explore our range of reliable rescue helicopters, essential for emergency services and medical evacuations. These helicopters are equipped for urgent, life-saving operations.",
            capacity=4,
        },

        {
            label='FIGHTER JETS',
            text="High-Tech Fighter Jets!",
            description="Discover our selection of high-tech fighter jets. With state-of-the-art avionics and agile maneuverability, these aircraft are designed for air-to-air combat scenarios.",
            capacity=1,
        },

        {
            label='BOMBERS',
            text="Powerful Bombers!",
            description="Check out our powerful bombers, perfect for delivering a high payload. These planes are suitable for heavy-duty, strategic operations.",
            capacity=2,
        },

        {
            label='GLIDERS',
            text="Quiet and Calm Gliders!",
            description="Browse our quiet and calm gliders. Perfect for leisurely, scenic flights and silent aerial exploration.",
            capacity=1,
        },

        {
            label='AIR BALLOONS',
            text="Colorful Air Balloons!",
            description="Experience the joy of flight with our colorful air balloons. Ideal for calm, leisurely journeys across the sky.",
            capacity=2,
        },

        {
            label='DRONES',
            text="Compact and Versatile Drones!",
            description="Discover our range of compact and versatile drones. Perfect for aerial photography, surveillance, or simply for fun.",
            capacity=0,            
        },

    },

    ['boat'] = {
        {
            label='MOTORBOATS',
            text="Versatile Motorboats!", 
            description="Explore our range of motorboats, perfect for a day of fishing or cruising around the lake. With options that cater to both speed enthusiasts and leisure lovers, you'll find the perfect boat for your next nautical adventure.", 
            capacity=4,
        },
        {
            label='YACHTS',
            text="Luxury Yachts!", 
            description="Step aboard our luxury yachts and enjoy the perfect blend of comfort and style. These yachts are designed to offer a smooth sailing experience, making them ideal for longer voyages and luxury cruises.", 
            capacity=20,
        },
        {
            label='SAILBOATS',
            text="Graceful Sailboats!", 
            description="Discover the joy of sailing with our range of sailboats. Enjoy the tranquil experience of cruising along with the wind. These boats provide a fantastic balance of relaxation and hands-on sailing.", 
            capacity=6,
        },
        {
            label='SPEEDBOATS',
            text="Thrilling Speedboats!",
            description="Feel the adrenaline rush with our collection of speedboats. These boats are built for speed, perfect for those looking for excitement and thrill on the water. Whether you are racing or just enjoying a fast ride, our speedboats are the perfect choice.", 
            capacity=2,
        },
        {
            label='FISHING BOATS',
            text="Dependable Fishing Boats!", 
            description="Designed specifically for the angler in mind, our fishing boats provide the stability and versatility needed for a day out on the water. These boats are perfect for casting a line and enjoying a day of fishing.", 
            capacity=4,
        },
        {
            label='PONTOON BOATS',
            text="Relaxing Pontoon Boats!",
            description="Pontoon boats are the perfect choice for a day out with family or friends. With spacious decks and comfortable seating, they are ideal for leisurely cruising, sunbathing, or even a picnic on the water.", 
            capacity=10,
        },
        {
            label='JET SKIS',
            text="Exciting Jet Skis!", 
            description="Feel the wind in your hair and the spray of the sea in your face with our exhilarating jet skis. Perfect for those who crave speed and excitement on the water.", 
            capacity=1,
        },
        {
            label='CATAMARANS',
            text="Stable Catamarans!",
            description="Discover the stable and efficient world of catamarans. With dual hulls providing balance, these boats are perfect for leisurely sailing or exhilarating racing across the waves.", 
            capacity=8,
        },
        {
            label='CABIN CRUISERS',
            text="Comfortable Cabin Cruisers!", 
            description="Enjoy a home away from home with our range of cabin cruisers. These boats come equipped with living facilities for a comfortable journey on the water.", 
            capacity=6,
        },
        {
            label='TUGBOATS',
            text="Powerful Tugboats!",
            description="Experience the might of the sea with our tugboats. These powerful boats are designed to pull or push other boats in harbors, over the open sea, or through rivers and canals.", 
            capacity=4,
        },
        {
            label='FERRIES',
            text="Spacious Ferries!", 
            description="Whether for a short trip across the river or a longer journey across the sea, our ferries offer comfortable and efficient transportation. They are designed to transport large numbers of passengers, and often vehicles and cargo as well.", 
            capacity=50,
        },
        {
            label='BARGE',
            text="Reliable Barges!", 
            description="Barges are flat-bottomed boats, built mainly for river and canal transport of heavy goods. They are capable of transporting extremely heavy goods that might be difficult to transport via road.", 
            capacity=2,
        },
    }
      

}



CustomizeCamera = function(self)
    isOpen = not self
    print(isOpen)
    DisplayHud(isOpen)
    -- DisplayRadar(isOpen)
end

Config.GetVehFuel = function(Veh)
    return GetVehicleFuelLevel(Veh)-- exports["LegacyFuel"]:GetFuel(Veh)
end

Config.Carkeys = function(Plate)
    local vehicle = GetVehiclePedIsTryingToEnter(PlayerPedId())
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
end

CustomizePlate = function()
    return string.upper(randomNumber(2) .. randomCharacter(3) .. randomNumber(3))
end

Config.Locations = {
    { 
        class = 'vehicles',
        coords = vector3(-337.831, -1370.078, 31.870519),
        heading = 170.00,
        marker = "CARSHOP",
        blip = {
            ["active"] = false,
            ["name"] = "Car Shop",
            ["colour"] = 4,
            ["id"] = 56
        },
        NuiCarViewSpawnPosition = vector4(-73.5, -822.0, 284.8, 201.5),
        NuiCarViewCameraPosition = {
            posX = -67.5,
            posY = -824.5,
            posZ = 285.5,
            rotX = -9.0,
            rotY = 0,
            rotZ = 70.0,
            fov = 45.00
        },
        TestDriveTime = 30,
        TestDriveSpawnPosition = vector4(-296.8324, -1369.969, 30.909612, 268.77697),
        BuyCarSpawnPositions = {
            [1] = vector4(-301.4053, -1380.687, 30.899948, 88.097862),
            [2] = vector4(-301.3645, -1385.162, 30.901428, 88.375473)
        },
    }, 

    -- { 
    --     class = 'aircraft',
    --     coords = vector3(-941.98, -2957.04, 13.0),
    --     heading = 170.00,
    --     marker = "Aircraft SHOP",
    --     blip = {
    --         ["active"] = true,
    --         ["name"] = "Aircraft Shop",
    --         ["colour"] = 4,
    --         ["id"] = 64
    --     },
    --     NuiCarViewSpawnPosition = vector4(-965.59, -2991.88, 13.95, 301.36),
    --     NuiCarViewCameraPosition = {
    --         posX = -966.19,
    --         posY = -2945.10,
    --         posZ = 22.10,
    --         rotX = -13.0,
    --         rotY = 0,
    --         rotZ = 183.2,
    --         fov = 30.00
    --     },
    --     TestDriveTime = 60,
    --     TestDriveSpawnPosition = vector4(-874.34, -3230.6, 13.22, 60.82),
    --     BuyCarSpawnPositions = {
    --         [1] = vector4(-10.6716, -1096.76, 26.183, 100.5),
    --         [2] = vector4(-11.4883, -1099.59, 26.180, 100.5),
    --         [3] = vector4(-12.4124, -1102.35, 26.183, 100.5),
    --         [4] = vector4(-13.0040, -1105.23, 26.179, 100.5),
    --         [5] = vector4(-14.5665, -1108.37, 26.183, 100.5)
    --     },
    -- }, 

    { 
        class = 'boat',
        coords = vector3(396.78778, -1177.311, 29.397884),
        heading = 170.00,
        marker = "BOAT SHOP",
        blip = {
            ["active"] = true,
            ["name"] = "Boat Shop",
            ["colour"] = 27,
            ["id"] = 427
        },
        NuiCarViewSpawnPosition = vector4(-716.794, -1344.95, 0.1710, 201.5),
        NuiCarViewCameraPosition = {
            posX = -725.602, -- -725.602, -1358.61, 0.1185
            posY = -1358.61,
            posZ = 7.0,
            rotX = -16.0,
            rotY = 0,
            rotZ = -35.0,
            fov = 45.00
        },
        TestDriveTime = 60,
        TestDriveSpawnPosition = vector4(-912.642, -1455.92, 0.1226, 60.82),
        BuyCarSpawnPositions = {
            [1] = vector4(-787.5606, -1501.973, 0.1197923, 109.80004)
        },
    }, 

--     { 
--         class = 'showroom',
--         coords = vector3(vector3(-50.29, -1089.3, 25.42)),
--         heading = 170.00,
--         marker = "SHOWROOM",
--         blip = {
--             ["active"] = true,
--             ["name"] = "Car Showroom",
--             ["colour"] = 4,
--             ["id"] = 427
--         },
--         NuiCarViewSpawnPosition = vector4(-47.777, -1097.021, 22.422, 0.0), -- Araç 5 birim öne taşındı
--         NuiCarViewCameraPosition = {
--             posX = -45.777,
--             posY = -1102.021 + 10, -- Kamera pozisyonu aynı kaldı
--             posZ = 25.422 + 2,
--             rotX = -20.0, 
--             rotY = 0,
--             rotZ = 160.0, 
--             fov = 60.00 
--         },
        
        
        
        
        
        
--         TestDriveTime = 60,
--         TestDriveSpawnPosition = vector4(-874.34, -3230.6, 13.22, 60.82),
--         BuyCarSpawnPositions = nil;
--     }, 

}


EYES = {}
EYES.Functions = {
    CreateBlips = function()
        for k,v in pairs(Config.Locations) do 
            if v.blip["active"] then 
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, v.blip["id"])
            SetBlipScale(blip, 0.8)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.blip["colour"])
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip["name"])
            EndTextCommandSetBlipName(blip)
            end
        end
    end
}







