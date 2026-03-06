create DATABASE hom;
USE hom;

		# --- OVERALL KPIs --- #
# Total Production 
select sum(ProductionUnits) as total_production 
from helix_operations_manufacturing;

#Average Production Per Hour 
select 
avg(ProductionUnits) as avg_hourly_production
from helix_operations_manufacturing;
 
 # defect rate analysis 
select Plant, sum(DefectCount)*1.0/sum(ProductionUnits) as defect_rate 
from helix_operations_manufacturing 
group by Plant 
order by defect_rate desc;

# energy efficiency 
select 
MachineID, sum(ProductionUnits)*1.0/sum(EnergyConsumption) as energy_efficiency 
from helix_operations_manufacturing 
group by MachineID 
order by energy_efficiency;

			# ---- Performance Analysis ---- #

# Which plant is worst Performer
select Plant, avg(ProductionUnits) as avg_production 
from helix_operations_manufacturing
group by Plant 
order by avg_production asc;

# machine level throughput ranking 
select MachineID, avg(ProductionUnits) as avg_hourly_production 
from helix_operations_manufacturing 
group by MachineID
order by avg_hourly_production asc;

#Capacity Drag Analysis 
select MachineID, 
max(ProductionUnits) as max_output,
avg(ProductionUnits) as avg_output,
(max(ProductionUnits)-avg(ProductionUnits))*1.0/max(ProductionUnits) as capacity_drag
from helix_operations_manufacturing 
group by MachineID 
order by capacity_drag desc 
limit 10;

		#-----Operational Pattern -----#

# Worst Hours of the Day
select 
extract(hour from Timestamp) as Hour, 
avg(ProductionUnits) as avg_production 
from helix_operations_manufacturing 
group by Hour 
order by avg_production asc;

 #Daily Production Trend 
 select date(timestamp) as production_date, 
 sum(ProductionUnits) as total_daily_production 
 from helix_operations_manufacturing 
 group by date(timestamp) 
 order by production_date;

		#-----Root cause Analysis---#

#Maintenance Impact Analysis 
select MaintenanceFlag, 
avg(ProductionUnits) as avg_production 
from helix_operations_manufacturing 
group by MaintenanceFlag;

#Defect Impact on Production 
select 
	case when DefectCount = 0 then 'No Defect' 
    when DefectCount between 1 and 3 then 'Low Defect'
    else 'High Defect' 
end as defect_category,
avg(ProductionUnits) as avg_production 
from helix_operations_manufacturing 
group by defect_category
order by avg_production desc;

#Temperature Impact 
select floor(Temperature/5)*5 as temp_range, 
avg(ProductionUnits) as avg_production 
from helix_operations_manufacturing 
group by temp_range 
order by temp_range;

 #vibration impact 
 select floor(Vibration) as vibration_range, 
 avg(ProductionUnits) as avg_production 
 from helix_operations_manufacturing 
 group by vibration_range 
 order by vibration_range;

 #Pressure impact
 select floor(Pressure/5)*5 as pressure_range, 
 avg(ProductionUnits) as avg_production 
 from helix_operations_manufacturing 
 group by pressure_range 
 order by pressure_range;
 
#Combined Root Causes 
 select MachineID, 
 avg(Temperature) as avg_temp, 
 avg(Vibration) as avg_vibration, 
 avg(ProductionUnits) as avg_production 
 from helix_operations_manufacturing 
 group by MachineID 
 order by avg_production asc 
 limit 5;
 
 #Energy Inefficient Machines
 select 
 MachineID, avg(EnergyConsumption / ProductionUnits) as Energy_Per_Unit 
 from helix_operations_manufacturing 
 group by MachineID 
 order by Energy_Per_Unit desc;
 
#High Defect Machines 
 select MachineID, avg(DefectCount) as avg_defects 
 from helix_operations_manufacturing 
 group by MachineID 
 order by avg_defects DESC
 limit 5;

	# ----- Risk Detection ---#

# low output event detection 
select date(Timestamp) as day, 
count(*) as low_output_events 
from helix_operations_manufacturing 
where ProductionUnits<(
	select avg(ProductionUnits)*0.7 from helix_operations_manufacturing 
) 
group by date(Timestamp)
order by low_output_events desc;

#Early Warning Signals 
select Timestamp, MachineID, ProductionUnits, Temperature, Vibration
from helix_operations_manufacturing 
where Temperature>(
	select avg(Temperature)+stddev(Temperature)
    from helix_operations_manufacturing 
) 
or Vibration>(
	select avg(Vibration)+stddev(Vibration)
    from helix_operations_manufacturing
)
order by Timestamp;
