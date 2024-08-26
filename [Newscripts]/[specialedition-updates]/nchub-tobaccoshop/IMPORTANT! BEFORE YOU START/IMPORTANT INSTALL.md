## INSTALL

Add the item images to your inventory script

-	[qb] > qb-inventory > html > images

    
## QBShared Items

[qb] > qb-core > shared > items.lua

```
    --nchub-tobaccoshop
    ['tobacco_leaf'] 		 		= {['name'] = 'tobacco_leaf',       		    ['label'] = 'Tobacco Leaf',	 		   ['weight'] = 100, 		  ['type'] = 'item', 		 ['image'] = 'tobacco_leaf.png', 			['unique'] = false, 	    ['useable'] = false, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Leaf'},
    ['crolling_paper']              = {['name'] = 'crolling_paper',                 ['label'] = 'Rolling Paper',           ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'rolling_paper.png',           ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['cubancigar']                  = {['name'] = 'cubancigar',                     ['label'] = 'Cuban Cigar',             ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'cubancigar.png',              ['unique'] = false,         ['useable'] = true,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['amoniagas']                   = {['name'] = 'amoniagas',                      ['label'] = 'Amonia Gas',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'amoniagas.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['morecigar']                   = {['name'] = 'morecigar',                      ['label'] = 'More Cigar',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'morecigar.png',              ['unique'] = false,         ['useable'] = true,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['cubanbox']                   = {['name'] = 'cubanbox',                      ['label'] = 'Cuban Box',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'cubanbox.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['morebox']                   = {['name'] = 'morebox',                      ['label'] = 'More Box',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'morebox.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},

```
[qb] > qb-core > shared > jobs.lua
```
	['cigar'] = {
		label = 'Tobacco Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Sales', payment = 50 },
            ['1'] = { name = 'Manager', isboss = true, payment = 500 },
        },
	},
```
