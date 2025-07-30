# CLGS Geothermal Simulation

This repository contains MATLAB 2025 code for simulating **Closed-Loop Geothermal Systems (CLGS)**, incorporating subsurface heat transfer, fluid flow, and surface-level Organic Rankine Cycle (ORC) analysis.

## 🔧 How to Run

Use the main script:

```
CLGS_Run.m
```

This script initializes the simulation, calls key modules, and outputs performance metrics for the entire CLGS process.

## 📂 Code Structure

The main driver (`CLGS_Run.m`) sequentially calls several modular functions, each responsible for a distinct physical process:

- **Subsurface heat transfer**  
- **Geofluid dynamics in underground loops**  
- **Surface-level ORC performance analysis**

Each module is designed to be independent and modular for clarity and adaptability.

## 🧪 Customization

All key physical parameters (e.g., **geothermal formation properties**, **geofluid properties**) are clearly labeled and well-organized within the input section of `CLGS_Run.m` or associated functions. Users can easily modify these parameters to explore different geological settings or working fluids.

## 🖥 Requirements

- MATLAB 2025  
- Note: This code requires MATLAB 2025 to run. Users must have their own valid MATLAB license.


## 📄 License

MIT

## 📫 Contact

For questions, suggestions, or collaboration, please contact [Your Name] at [your.email@domain.com].
