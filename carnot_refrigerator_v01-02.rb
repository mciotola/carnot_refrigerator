# Simulation Banner
puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# CARNOT REFRIGERATOR version 01.02                                           #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-13 by Mark Ciotola; available for use under GNU license      #"
puts "# Last revised on 25 Oct 2013                                                 #" 
puts "# Website: http://www.heatsuite.com                                           #"
puts "# Source site: https://github.com/mciotola/carnot_refrigerator                #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Simulates a Carnot refrigerator operating across a thermal difference.      #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

      ###############################################################################
      #                                                                             #
      # Developed with Ruby 1.9.2                                                   #
      # Takes the following parameters: temperature of thermal reservoirs           #
      #                                 energy flow to warmer reservoir             #
      #                                                                             #
      ###############################################################################

puts "================================== Background =================================\n\n"
  
puts " A refrigerator moves heat from a cooler reservoir to a warmer one."
puts " A Carnot refrigerator doe so at maximum possible efficiency as "
puts " constrained by the Second Law of Thermodynamics. "
puts "\n\n"
puts " Coefficient of performance (COP) efficiency = 1 - (T cold/T hot), where T is temperature. \n\n"  
puts " Work = Carnot efficiency * heat energy flow from warmer reservoir.  \n"  
puts "\n"
puts " All temperatures should be units of Kelvin (or K), which is the "
puts " temperature in Celsius + 273.15. 0K is absolute zero. \n"  
puts "\n"
puts " In this simulation, the magnitude of the thermal difference is fixed.\n"  
puts "\n\n"  
  

# Include the Math library
  include Math  
  
  
# Initialize simulation parameters.
 
  # You can adjust them, as long as both temperatures are positive. A decimal point 
  # must be added to tell Ruby to allow floating point calculations.

  warmertemp = 500.0  # in K
  coolertemp = 300.0  # K
  flowtowarmresv = 100.0  # J/s
  

# Display the parameters 

  puts "================================== Parameters =================================\n\n"

  puts sprintf "                  Warmer temp: \t %7.3f %s", warmertemp.to_s, " K"
  puts sprintf "                  Cooler temp: \t %7.3f %s", coolertemp.to_s, " K"
  puts sprintf "     Heat energy flow to warm: \t %7.3f %s", flowtowarmresv.to_s, " J/s"
  puts "\n\n"  

# Run the simulation 

  tempdiff = warmertemp - coolertemp
  
  coefficientofperformance = coolertemp/(warmertemp - coolertemp)
  


  
  coefficientpercent = coefficientofperformance * 100.0
  workneeded = coefficientofperformance/flowtowarmresv
  flowfromcoolresv = flowtowarmresv - workneeded
  
  entropychangehot = (flowtowarmresv/warmertemp)
  entropychangecool = - (flowfromcoolresv/coolertemp)
  entropyincrease = entropychangehot + entropychangecool

# Display the output 

  puts "==================================== Output ===================================\n\n"

  puts sprintf "                    Temp diff: \t %7.3f %s" , tempdiff.to_s,  " K"	
  puts sprintf "   Coefficient of Performance: \t %7.3f %s" , coefficientpercent.to_s,  " %"
  puts sprintf "                  Work Needed: \t%7.3f %s" , workneeded.to_s, " J/s"
  puts sprintf "               Flow from cool: \t %7.3f %s" , flowtowarmresv.to_s, " J/s"
  puts sprintf "    Entropy removed from warm: \t %7.3f %s" , entropychangehot.to_s, " J/K/s"
  puts sprintf "        Entropy added to cool: \t %7.3f %s" , entropychangecool.to_s, " J/K/s"
  puts sprintf "     Entropy change of system: \t %7.3f %s" , entropyincrease.to_s, " J/K/s"


  puts "\n\n"

  puts "================================== Units Key ==================================\n\n"
  puts "  Abbreviation: \t\t Unit:"
  puts "\n"
  puts "       J \t\t\t Joules, a unit of energy"
  puts "       K \t\t\t Kelvin, a unit of temperature"
  puts "       s \t\t\t seconds, a unit of time"
  puts "\n\n"


  puts "================================== Reference ==================================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""





