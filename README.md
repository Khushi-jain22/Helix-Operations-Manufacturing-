# Helix-Operations-Manufacturing
Manufacturing capacity stability and machine throughput analysis using Excel,SQL,Python, and PowerBI

## Project Overview
This project focuses on analysing manufacturing machine performance and production stability across multiple plants.
The objective of this analysis is to understand why production output is inconsistent even when sufficient capacity is installed and to identify machines that are underperforming or unstable.

In this project, production and operational data were analysed using SQL, Excel, Python, and Power BI to build an end-to-end analytics solution that identifies bottlenecks, production variability, and operational risks.

## Company Overview
Helix Operations Manufacturing is a multi-plant manufacturing organisation operating in a high-volume production environment. The company supplies time-critical components to global facilities where meeting daily production targets is critical.

Even small fluctuations in production output can create supply chain disruptions and revenue loss.

## Operations Overview
The company runs continuous and batch-based production lines across multiple shifts.

Each machine records operational data including:
• Hourly production output  
• Temperature, vibration, and pressure readings  
• Energy consumption  
• Maintenance events  
• Defect counts  

Operations teams focus on improving machine utilisation, maintaining stable output, and reducing performance variability across plants.

## Business Problem

Despite having sufficient installed capacity, the organisation has been experiencing several operational challenges:
• Inconsistent production output  
• Missed daily production targets  
• Underutilised machines in certain plants  

At a high level, total production appears acceptable. However, deeper analysis reveals:
• Significant hour-to-hour and day-to-day output variation  
• Machines with consistently low throughput  
• Possible relationships between maintenance events, defects, and production instability  

Current reporting mainly focuses on total daily production, which hides machine-level bottlenecks and capacity instability.

Operations managers lack visibility into:
• Peak vs low production periods  
• Machines causing capacity drag  
• Early warning signals for upcoming production drops  

To address these challenges, a **Capacity Stability and Throughput Optimisation initiative** was launched.

This project analyses historical production and sensor data to build insights that support better operational decision-making.

## Dataset Description
The dataset contains machine-level operational data with the following columns:
• TimeStamp  
• MachineID  
• Plant  
• Temperature  
• Vibration  
• Pressure  
• EnergyConsumption  
• ProductionUnits  
• DefectCount  
• MaintenanceFlag  

The data is recorded at an **hourly level**, enabling both hourly and daily production analysis.

## Tools Used

**Excel**  
Used for initial data exploration, pivot tables, and production trend analysis.

**SQL**  
Used for production performance analysis, KPI calculations, and identifying low-performing machines.

**Python**  
Used to analyse relationships between sensor readings, defects, and production instability through data analysis and visualization.

**Power BI**  
Used to build interactive dashboards for operational insights and machine-level performance monitoring.


## Project Workflow

1. SQL was used to analyse machine production performance, defect rates, maintenance impact, and operational efficiency.

2. Excel was used for exploratory analysis and quick pattern identification using pivot tables.

3. Python analysis was performed to study correlations between sensor readings and production performance.

4. An interactive Power BI dashboard was built to visualise insights and support operational decision-making.

## Power BI Dashboard Structure
The dashboard includes multiple analytical views:

**Executive Stability Overview**  
High-level KPIs and plant-level performance metrics.

**Machine Throughput Performance**  
Machine comparison to identify low-output and high capacity drag machines.

**Sensor Risk and Predictive Signals**  
Analysis of sensor readings to identify patterns linked to production instability.

**Machine Deep Dive**  
Drill-through analysis for detailed machine-level performance insights.

## Key Insights

• Some machines consistently produce lower average output compared to others.

• Production drops often occur near maintenance events and periods with higher defect counts.

• Higher vibration and temperature readings are associated with unstable production output.

• Certain machines show higher energy consumption per production unit.

• Daily production totals can hide machine-level instability which becomes visible through deeper analysis.

## Project Structure
helix-operations-manufacturing
│
├── 1_Excel
│ └── Excel exploration and pivot analysis

├── 2_SQL
│ └── sql queries used for producion analysis

├── 3_Python
│ └── Python analysis and visualizations

├── 4_PowerBI
│ └── Interactive manufacturing dashboard


## Conclusion

This project demonstrates how data analytics can help improve manufacturing operations by identifying unstable machines, analysing sensor behaviour, and providing actionable insights to operations teams.

The analysis supports better capacity planning, operational stability, and proactive maintenance decisions.

Thank you for reviewing this project.
