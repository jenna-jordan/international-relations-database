# international-relations-database

SourceData contains the csv and pdf files downloaded from the Correlates of War website. In some cases these files have been re-saved with UTF-8 encoding, and in a few cases data-entry errors have been hand-corrected. All changes have been documented in the relevant Jupyter notebook.

FinalData contains the csv files that have been transformed and are ready to be inserted into the database. Each filename corresponds to the name of the table it should be inserted into.

Database Design contains the files related to the design of the database, as well as the SQL script for creating the database.

There are 5 Jupyter notebooks which correspond to the 5 main entities of the database - State, Territory, IGO, Alliance, and War. The code for the data transformation for each entity is contained in these notebooks.

The general Data Transformation notebook contains the code for all transformations in condensed form.
