-- Zodiac Ring Check
				if spell.element == world.day_element and (player.inventory["Zodiac Ring"] or player.wardrobe["Zodiac Ring"]) then
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory Checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- yes ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke, {waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								end
							else
							-- yes ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
								end
							end
						else
							-- yes ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.inventory["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape",rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								end
							else
							-- yes ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
								end
							end							
						end
					else
					-- yes ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
						end
					end	
				-- Day Match No Ring 
				elseif spell.element == world.day_element then
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- no ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
								end
							else
						-- no ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
								end
							end
						else
							-- no ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.inventory["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
								end
							else
							-- no ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke)
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
								end
							end							
						end
					-- No Weather Match
					else
					-- no ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke)
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
						end
					end				
				-- NO Day Match and no Ring 
				else
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- no ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
								end
							else
						-- no ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
								end
							end
						else
							-- no ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
								end
							else
							-- no ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke)
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
								end
							end							
						end
					else
					-- no ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke)
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
						end
					end				
				end
			