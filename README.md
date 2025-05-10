# Garima x Good Enough Lab

## What this project is for

- We want to help you with `the code bit` so you can focus on important science; that means making it easier for you to answer scientific questions. 
- We will not share any data or code until you decide what to publish. 
- The Lab manage your projects and support needs by [issues](https://github.com/softloud/gg/issues), where you can comment and oversee, if you want to look into what we are working on.   

## Structure of this project

```sh
.
├── fair-data-entity.html
├── fair-data-entity.Rmd
├── local-data
│   ├── sdg (all 17).png
│   └── SDGPreferences_Arunachal.xlsx
└── README.md

2 directories, 5 files
```

### Local data 

1. Create local-data  in this repository.

2. Copy and paste your data to `local-data`.

Your data is secure. The `.gitignore` setting will prevent this data from being sent to the cloud repository. 

```sh
.
├── sdg (all 17).png
└── SDGPreferences_Arunachal.xlsx

1 directory, 2 files

```

## Get started

These steps will help you get the project running on your local Windows machine.

### 1. Install R and RStudio

- Install R: [https://cran.r-project.org](https://cran.r-project.org)
- Install RStudio (free version): [https://posit.co/download/rstudio-desktop](https://posit.co/download/rstudio-desktop)

### 2. Get the project

You can either:

- **Option A: Clone the repo**
  1. Install [Git for Windows](https://git-scm.com/)
  2. Open Git Bash or the RStudio terminal, then run:
     ```bash
     git clone https://github.com/softloud/gg.git
     ```

- **Option B: Download as ZIP**
  1. Click “Code” → “Download ZIP” on the GitHub repo
  2. Extract the ZIP file to your preferred folder

### 3. Open the project

- Open RStudio
- Click “File” → “Open Project…” and select the `.Rproj` file in the folder

### 4. Load your data

- Create a folder called `local-data` inside the project
- Save your data files into that folder. It is already `.gitignore`d, so your data will stay private

### 5. Restore the environment with `renv`

This project uses [`renv`](https://rstudio.github.io/renv/) to manage packages.

In the RStudio Console, run:

```r
install.packages("renv")
renv::restore()
```