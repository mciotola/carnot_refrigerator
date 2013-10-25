# Simulation Banner
puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# CARNOT HEAT ENGINE version 01.05                                            #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-13 by Mark Ciotola; available for use under GNU license      #"
puts "# Last revised on 25 October 2013                                             #" 
puts "# Website: http://www.fastentropy.com                                         #"
puts "# Source site: github                                                         #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Description:                                                                #"
puts "# Simulates a Carnot refrigerator operating across a thermal difference       #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

###############################################################################
#                                                                             #
# Developed with Ruby 1.9.2                                                   #
# Takes the following parameters: temperature of reservoirs                   #
#                                                                             #
###############################################################################


  puts "======================== Background ========================\n\n"
  
  puts " A refrigerator moves heat from a cooler reservoir to a warmer one."
  puts " A Carnot refrigerator doe so at maximum possible efficiency as "
  puts " constrained by the Second Law of Thermodynamics. "
  puts "\n"
  puts " dQ/dt = (k A ) (d T / d L) \n"  
  puts " k = thermal conductivity of material \n"  
  puts "\n\n"
  
# Include the Math library
  include Math  
  
  
# Initialize simulation parameters

  warmertemp = 50.0 # in C; decimal point added to tell Ruby to allow floating point calculations
  coolertemp = 30.0 # C
  material = 'copper' #'iron'
  thermalconductivity = 80.0 # for iron
  area = 1.0
  length = 1.0
  

# Display the parameters 

  puts "======================== Parameters ========================\n\n"

  puts sprintf "  Warmer temp (in C): \t\t %7.3f " , warmertemp.to_s
  puts sprintf "  Cooler temp (in C): \t\t %7.3f " , coolertemp.to_s
  puts sprintf "  Thermal conductivity: \t %7.3f " , thermalconductivity.to_s
  puts sprintf "  Area (in m^2): \t\t %7.3f " , area.to_s
  puts sprintf "  Length (in m): \t\t %7.3f " , length.to_s
  puts sprintf "  Material: \t\t\t %7s " , material
  puts "\n\n"  

# Run the simulation 

  if material == 'iron'
	thermalconductivity = 80.0
  elsif material == 'copper'
    thermalconductivity = 400.0
  elsif material == 'wood'
    thermalconductivity = 0.08
  end

  tempdiff = warmertemp - coolertemp
  heatenergyflow = ( (area * thermalconductivity) / length) * tempdiff  # is this appropriate?
  # need different heat flows for hot and cold reservoirs
  
  cop = 1.0 / (  ( warmertemp/coolertemp ) - 1.0  ) # coefficient of performance
  
  # efficiency = 1.0 - (coolertemp/warmertemp)
  workused = heatenergyflow / cop
  
  entropyincrease = (heatenergyflow/coolertemp) - (heatenergyflow/warmertemp)

# Display the output 

  puts "========================== Output ==========================\n\n"
  puts sprintf "  Thermal Conductivity of %s %s %4.3f", material, "is", thermalconductivity	
  puts sprintf "  Temp diff (in degrees C): \t %10.3f " , tempdiff.to_s	
  puts sprintf "  Heat Energy Flow (J/s): \t %10.3f " , heatenergyflow.to_s  
  puts sprintf "  COP (x 100 %%): \t\t %10.3f " , cop.to_s
  puts sprintf "  Work used (in J/s): \t\t %10.3f " , workused.to_s
  puts sprintf "  Entropy Increase (in J/K/s): \t %10.3f " , entropyincrease.to_s


  puts "\n\n"

  puts "========================= Units Key =========================\n\n"
  puts "  Abbreviation \t\t\t Unit"
  puts "  C \t\t\t\t degrees Celsius, a unit of temperature"
  puts "  J \t\t\t\t Joules, a unit of energy"
  puts "  m \t\t\t\t meters, a unit of length"
  puts "\n\n"

  puts "========================= Reference =========================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""
  puts "\n\n"


# Table of thermal conductivities (watts/meter/kelvin)
# Material	Thermal Conductivity
# air				  0.026
# wood				  0.08
# water				  0.6
# iron				 80
# copper			400


########################### UNUSED CODE THAT MIGHT BE NEEDED LATER ###############################

#      engine.efficiency = exp( - 6 * ((bubble.period - 1)/periods.to_f ) )

