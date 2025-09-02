
# Local Power BI Governance & Impact Analysis Solution

*This is the local Report/Model Version. If looking for the version that leverages the Power BI Service and REST API across all Workspaces, check out: https://github.com/chris1642/Power-BI-Backup-Impact-Analysis-Governance-Solution*

- All computer requirements are at the user level and do not require admin privileges.
- There are ZERO pre-reqs. It's as simple as downloading this repo into C:\Power BI Backups, placing your local files in the dedicated folder, opening Powershell, and running the included 'Final PS Script'

## What It Does
This provides a quick and automated way to identify where and how specific fields, measures, and tables are used across your local Power BI reports by analyzing the visual object layer. It also breaks down the details of your models and report for easy review, including full measure lineage, giving you an all-in-one **Power BI Governance** solution.

### Key Features:
- **Impact Analysis**: Fully understand the downstream impact of data model changes, ensuring you don’t accidentally break visuals or dashboards—especially when reports connected to a model span multiple workspaces.
- **Used and Unused Objects**: Identify which tables, columns, and measures are actively used and where. Equally as important, see what isn't used and can be safely removed from your model to save space and complexity.
- **User-Friendly Output**: Results are presented in a Power BI model, making them easy to explore, analyze, and share with your team.

     .

     .

## 🚀 Quick Start Instructions  

You’ve got **two ways** to get started:  

---

### 🟢 Option 1 — One-Click Auto Run (Recommended)  
Always up-to-date and the easiest way to get started.  

➡️ [**Download & Run One-Click Auto Run**](https://github.com/chris1642/Local-Power-BI-Impact-Analysis-Governance/releases/download/v1.0/LocalPowerBIGovernanceAutoInstallandRun.bat)

This automatically:  
1. Pulls the latest repo from GitHub
2. Places it into `C:\Power BI Backups`
3. Runs the **Local Final PS Script**  
4. Opens the **Local Power BI Governance Model** at the end  

> 💡 **Tip:** Once downloaded, simply re-run this locally anytime to keep your **governance details up-to-date** *and* take advantage of the **newest features**.  

> ⚠️ If security policies block the batch file, follow the manual steps below instead.


📂 **All outputs and the final Local Power BI Governance Model will be saved to:** `C:\Power BI Backups`


---


### 🟡 Option 2 — Manual Setup  

#### ✅ Step 1: Create Folder
> Make a folder at `C:\Power BI Backups`

#### ✅ Step 2: Download Repo files
> Place all repo files into the created folder  

#### ✅ Step 3: Add your Reports/Models to 'Local Reports and Models' folder  
> Place all the reports/models you're looking to analyze within the 'Local Reports and Models' folder.  

#### ✅ Step 4: Run Script — open PowerShell and run the Final PS Script  
> You can:  
> - Copy/paste the full script  
> - Or rename it from `.txt` to `.ps1` and run it directly  

#### ✅ Step 5: Open the Power BI File — let it refresh, then save as `.pbix`  
> Open: `Local Power BI Governance Model.pbit`  

---

🎉 That’s it — enjoy! 🎉  






---

### ℹ️ Additional Notes

> ⚙️ *PowerShell may prompt to install required modules.*  
> No admin access is needed — they install at the user level.

> 🧰 *This setup uses the portable version of Tabular Editor 2 (v2.26.0).*  
> You don't need it preinstalled. It runs locally from the folder with no differences.  
> https://github.com/TabularEditor/TabularEditor _(MIT License)_

> 🧠 *Model are extracted from the PBIX using pbi-tools*  
> Includes `pbi-tools v1.2`: https://github.com/pbi-tools/pbi-tools _(AGPL 3.0 License)_

> 🚨 *Using Tabular Editor 3?*  
> Tabular Editor 2 is still included and required for this because TE3 doesn't support command line execution.

> 🧩 *Model refresh error in Power BI Desktop?*  
> If you see:  
> _**"Query XXXXXX references other queries or steps..."**_
> 
> Update your Power BI Desktop privacy settings:  
> **File → Options and settings → Options → Privacy**  
> Then select either:  
> - “Combine data according to each file's Privacy Level settings”  
>   **or**  
> - “Always ignore Privacy Level settings”

## Features

### ✨ Recently Added Features

- **Unused Model Objects** → Identify model fields/measures not used in any visuals, measures, or relationships.  
- **Broken Visuals** → See all broken visuals/filters.  
- **Report-Level Measures Inventory** → Surface report-only measures with full DAX and usage details.
  
---

### 1. Model Metadata Extract - Measure Lineage, Used/Unused Objects
- Saves exported models in a structured folder hierarchy based on model names.
- Leverages Tabular Editor 2 and C# to extract the metadata and output within an Excel File.

### 2. Report Metadata Extract - Impact Analysis, Objects Usage - Where and How Often
- Leverages Tabular Editor 2 and C# to extract the Visual Object Layer metadata and output within an Excel File (credit to @m-kovalsky for initial work on this)

### 4. Final Power BI Governance Model
- Combines extracts into a Semantic Model to allow easy exploring, impact analysis, and governance of all Power BI Reports and Models.
- Works for anyone who runs the script and has at least 1 model and report.
- Public example (limited due to no filter pane): https://app.powerbi.com/view?r=eyJrIjoiMTA4YzFjYjctYjJjZC00Yjk5LWEwNGItODY4MjNlYTUyNWQwIiwidCI6ImUyY2Y4N2QyLTYxMjktNGExYS1iZTczLTEzOGQyY2Y5OGJlMiJ9

## Screenshots of Final Output
..
..

<img width="1235" alt="image" src="https://github.com/user-attachments/assets/cd3d736d-a56b-4ff0-a1af-475ac149bc79">
<img width="1259" alt="image" src="https://github.com/user-attachments/assets/89749b7a-a62a-4f89-94a9-2f922e66e47d">
<img width="1259" alt="image" src="https://github.com/user-attachments/assets/d015863b-3136-4caa-85ae-1026d90ef338">
<img width="1221" alt="image" src="https://github.com/user-attachments/assets/e683f8ec-2341-46d5-a93b-5511ec8bfb17">
<img width="1221" alt="image" src="https://github.com/user-attachments/assets/db909853-4d5c-4024-82dc-b9552a82082a">
