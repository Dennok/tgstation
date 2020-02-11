/**********************Unloading unit**************************/


/obj/machinery/mineral/unloading_machine
	name = "unloading machine"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "unloader"
	density = TRUE
	input_dir = WEST
	output_dir = EAST
	needs_item_input = TRUE
	processing_flags = NEVER_PROCESS

/obj/machinery/mineral/unloading_machine/pickup_items()
	if(input_turf)
		var/limit
		for(var/obj/structure/ore_box/B in input_turf)
			for(var/obj/item/stack/ore/O in B)
				B.contents -= O
				unload_mineral(O)
				limit++
				if (limit>=10)
					return
				CHECK_TICK
			CHECK_TICK
		for(var/obj/item/I in input_turf)
			unload_mineral(I)
			limit++
			if (limit>=10)
				return
			CHECK_TICK
