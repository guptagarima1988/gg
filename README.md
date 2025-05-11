# Garima x Good Enough Lab

## What this project is for

- We want to help you with `the code bit` so you can focus on important science; that means making it easier for you to answer scientific questions. 
- We will not share any data or code until you decide what to publish. 
- The Lab manage your projects and support needs by [issues](https://github.com/softloud/gg/issues), where you can comment and oversee, if you want to look into what we are working on.   

## Structure of this project

```sh
.
├── fair-analysis-migration.Rmd
├── fair-data-entity.Rmd
├── fair-data-validation.Rmd
├── fair-staging.Rmd
├── local-data --> not sent to cloud 
├── R
├── README.md
├── renv
└── renv.lock

2 directories, 5 files
```

### Directories & Files

Our priority is to make the analysis FAIR to Garima, while also helping with the `the code bit`: findable, accessible, interoperable, reusable. There's lots of detail on the website, but I tend to find that people pile so much complexity on the analysis downstream, the architecture is always on fire, and thus we do not ever achieve bare minimum FAIR for the analyst who matters the most. 

Hence I am running with the loosest definitions of FAIR here, just the words themselves, not all the subprotocols. Garima must be able to find, access, interoperate, and reuse analysis components. Garima is always invited to request we fulfill one of the requirements as a priority, otherwise we mosey toward  being truly FAIR. Gotta start somewhere.  

Now Garima will need to publish her analysis as FAIR at publication, so we can then develop these analyses into front-facing later on, and reduce an unnecessary skill demand of Garima, an ecologist. 

file name | description | input | output | observer
--- | --- | --- | --- | ---
`fair-data-entity.Rmd` | FAIR data entity test (QAO paper), unique & not null on a single row of one table. | One table copied into `local-data/`. | No output. | Garima  
`fair-data-validation.Rmd` | Our shared assumptions and confirmations about data. | All source tables provided. | No output. | Garima
`fair-staging.Rmd` | FAIR staging | raw files as provided | `local-data/staging_*.csv` tables. | Garima 
`fair-semantic-transformation.Rmd` | FAIR transformation | fair-staging output as computational objects | tables whose rows are uniquely identified by semantic identities (SDG, responses, respondents, geographic metadata) `local-data/entity_*.csv` | Garima 
`fair-analytical-observations.Rmd` | FAIR analytical observation: plot-specific tables | fair-semantic-transformation output | Tables for specific analyses, `local-data/ao_*.csv`| Garima 
R | A place to document data sets in `roxygen` and store helper functions. | None. | Source functions, and the basis of a packaged analysis with data in R. |  Lab

This is also a sketch of a living analysis pipeline design, so we can aggregate Garima's knowledge base for her down the line. Yeah, I will totally spin up a DBT architecture for this soon enough. We will migrate from the .Rmd scripts to helpers as needed. 

### Known problem

`fair-staging.Rmd` is a hack based on transformed data, with geographic marker simulated. 

Data extraction requires geographic entities. 

Kobo extraction refactoring will make this much easier to tweak. This is the first big issue to solve. 

### FAIR data entity test

`fair-data-entity.Rmd` is a FAIR data entity test; this serves a few functions, the most of important of which is ensuring you can run and extend scripts the Lab writes for you in a way that makes sense to you and isn't too annoying at your end. 

### Migration of existing project

Once we have a FAIR data entity test working at your end, we migrate an existing project--probably one of the bar plots. 

### Local data 

Your data is secure. The `.gitignore` setting will prevent this data from being sent to the cloud repository. 

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