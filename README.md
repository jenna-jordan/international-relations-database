# Correlates of War Database

## Project Guide
SourceData contains the csv and pdf files downloaded from the [Correlates of War website](http://www.correlatesofwar.org/data-sets). In some cases these files have been re-saved with UTF-8 encoding, and in a few cases data-entry errors have been hand-corrected. All changes have been documented in the relevant Jupyter notebook.

FinalData contains the csv files that have been transformed via python scripts and are ready to be inserted into the database. Each filename corresponds to the name of the table it should be inserted into.

DatabaseDesign contains the files related to the design of the database, as well as the SQL script for creating the database.

DatabaseCreation contains the python script for creating the database file (including loading the tables from FinalData) and the outputted .db file.

DataTransformation containst the Jupyter notebooks with the code for transforming the files from SourceData into the files in FinalData. There are 5 Jupyter notebooks which correspond to the 5 main entities of the database - State, Territory, IGO, Alliance, and War. The code for the data transformation for each entity is contained in these notebooks.

## Data Sources: Citations

- [COW Country Codes](http://www.correlatesofwar.org/data-sets/cow-country-codes)

- [State System Membership v2016](http://www.correlatesofwar.org/data-sets/state-system-membership)

Correlates of War Project. 2017. "State System Membership List, v2016." Online, http://correlatesofwar.org

- [COW War Data v4.0](http://www.correlatesofwar.org/data-sets/COW-war)

Sarkees, Meredith Reid and Frank Wayman (2010). Resort to War: 1816 - 2007. Washington DC: CQ Press.

- [National Material Capabilities v5.0](http://www.correlatesofwar.org/data-sets/national-material-capabilities)

Singer, J. David, Stuart Bremer, and John Stuckey. (1972). "Capability Distribution, Uncertainty, and Major Power War, 1820-1965." in Bruce Russett (ed) Peace, War, and Numbers, Beverly Hills: Sage, 19-48.

Singer, J. David. 1987. "Reconstructing the Correlates of War Dataset on Material Capabilities of States, 1816-1985" International Interactions, 14: 115-32.

- [Formal Alliances v4.1](http://www.correlatesofwar.org/data-sets/formal-alliances)

Gibler, Douglas M. 2009. International military alliances, 1648-2008. CQ Press.

Singer, J. David, and Melvin Small. 1966. "Formal Alliances, 1815-1939." Journal of Peace Research 3:1-31.

Small, Melvin, and J. David Singer. 1969. "Formal Alliances, 1815-1965: An Extension of the Basic Data." Journal of Peace Research 6:257-282.

- [Territorial Change v5](http://www.correlatesofwar.org/data-sets/territorial-change)

Tir, Jaroslav, Philip Schafer, Paul Diehl, and Gary Goertz. 1998. "Territorial Changes, 1816-1996: Procedures and Data"Conflict Management and Peace Science 16:89-97.

- [Direct Contiguity v3.2](http://www.correlatesofwar.org/data-sets/direct-contiguity)

Correlates of War Project. Direct Contiguity Data, 1816-2016. Version 3.2. 

Stinnett, Douglas M., Jaroslav Tir, Philip Schafer, Paul F. Diehl, and Charles Gochman. 2002. "The Correlates of War Project Direct Contiguity Data, Version 3." Conflict Management and Peace Science 19(2):58-66.

Charles S. Gochman, 1991, "Interstate Metrics: Conceptualizing, Operationalizing, and Measuring the Geographic Proximity of States since the Congress of Vienna," International Interactions 17(1): 93-112. 

- [Intergovernmental Organizations v2.3](http://www.correlatesofwar.org/data-sets/IGOs)

Pevehouse, Jon C., Timothy Nordstrom, and Kevin Warnke. 2004. "The COW-2 International Organizations Dataset Version 2.0," Conflict Management and Peace Science 21:101-119.

Wallace, Michael, and J. David Singer. 1970. "International Governmental Organization in the Global System, 1815-1964." International Organization 24: 239-87. 
