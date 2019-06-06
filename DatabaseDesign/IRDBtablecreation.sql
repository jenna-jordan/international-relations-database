CREATE TABLE POLITY
  ( PolityID	    NUMBER(5) NOT NULL,
    PolityName	  VARCHAR2(100),
    PolityType    VARCHAR2(30) CHECK (PolityType IN('State', 'Territory', 'NonState Group', 'International Organization')),
    StateAbbr	    VARCHAR2(3),
  CONSTRAINT POLITY_PK PRIMARY KEY (PolityID)
  );

CREATE TABLE STATE_DATES
  ( StateID	    NUMBER(5) NOT NULL,
    StartDate	  DATE NOT NULL,
    EndDate	    DATE,
    StartYear	  NUMBER(4),
    StartMonth	NUMBER(2),
    StartDay	  NUMBER(2),
    EndYear	    NUMBER(4),
    EndMonth	  NUMBER(2),
    EndDay	    NUMBER(2),
  CONSTRAINT STATE_DATES_PK PRIMARY KEY (StateID, StartDate),
  CONSTRAINT STATEDATES_TO_POLITY FOREIGN KEY (StateID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE STATE_CONTIGUITY
  ( StateA	    NUMBER(5) NOT NULL,
    StateB	    NUMBER(5) NOT NULL,
    StartDate	  DATE NOT NULL,
    EndDate	    DATE,
    StartYear	  NUMBER(4),
    StartMonth	NUMBER(2),
    EndYear	    NUMBER(4),
    EndMonth	  NUMBER(2),
    Type	      NUMBER(1) CHECK (Type IN(1, 2, 3, 4, 5)),
    Notes	      VARCHAR2(200),
  CONSTRAINT STATE_CONTIGUITY_PK PRIMARY KEY (StateA, StateB, StartDate),
  CONSTRAINT STATECONTA_TO_POLITY FOREIGN KEY (StateA)
    REFERENCES POLITY (PolityID),
  CONSTRAINT STATECONTB_TO_POLITY FOREIGN KEY (StateB)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE TERRITORY_DATES
  ( TerritoryID	       NUMBER(5) NOT NULL,
    StartYear          NUMBER(4) NOT NULL,
    EndYear            NUMBER(4) NOT NULL,
    EndingStatus       VARCHAR2(100) NOT NULL,
    ReferencedPolityID NUMBER(5),
  CONSTRAINT TERRITORY_PK PRIMARY KEY (TerritoryID, StartYear, EndYear, ReferencedPolityID),
  CONSTRAINT TERRDATESTERR_TO_POLITY FOREIGN KEY (TerritoryID)
    REFERENCES POLITY (PolityID),
  CONSTRAINT TERRDATESPOL_TO_POLITY FOREIGN KEY (ReferencedPolityID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE TERRITORIALCHANGE
  ( TerritorialChangeID	NUMBER(3) NOT NULL,
    Gainer	            NUMBER(5),
    Loser	              NUMBER(5),
    TransferDate	      DATE,
    Year	              NUMBER(4),
    Month	              NUMBER(2),
    Procedure	          NUMBER(1) CHECK (Procedure IN(1, 2, 3, 4, 5, 6)),
    TerritoryID	        NUMBER(5),
    TerritoryArea	      NUMBER,
    TerritoryPopulation	NUMBER,
    IsWholeTerritory	  NUMBER(1) CHECK (IsWholeTerritory IN(0, 1)),
    IsMilConflict	      NUMBER(1) CHECK (IsMilConflict IN(0, 1)),
    IsIndependence	    NUMBER(1) CHECK (IsIndependence IN (0, 1)),
    GainerIsCont	      NUMBER(1) CHECK (GainerIsCont IN (0, 1)),
    LoserIsCont	        NUMBER(1) CHECK (LoserIsCont IN (0, 1)),
    IsGainerHomeland	  NUMBER(1) CHECK (IsGainerHomeland IN (0, 1)),
    IsLoserHomeland	    NUMBER(1) CHECK (IsLoserHomeland IN (0, 1)),
    IsSystemEntry	      NUMBER(1) CHECK (IsSystemEntry IN (0, 1)),
    IsSystemExit	      NUMBER(1) CHECK (IsSystemExit IN (0, 1)),
  CONSTRAINT TERRITORIALCHANGE_PK PRIMARY KEY (TerritorialChangeID),
  CONSTRAINT TERRGAINER_TO_POLITY FOREIGN KEY (Gainer)
    REFERENCES POLITY (PolityID),
  CONSTRAINT TERRLOSER_TO_POLITY FOREIGN KEY (Loser)
    REFERENCES POLITY (PolityID),
  CONSTRAINT TERR_TO_POLITY FOREIGN KEY (TerritoryID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE STATE_RESOURCE
  ( StateID	    NUMBER(5) NOT NULL,
    Year	      NUMBER(4) NOT NULL,
    ResourceID	VARCHAR2(10) NOT NULL,
    Amount	    NUMBER,
    Source	    VARCHAR2(250),
    Note	      VARCHAR2(250),
    QualityCode	VARCHAR2(1),
    AnomalyCode	VARCHAR2(1),
  CONSTRAINT STATE_RESOURCE_PK PRIMARY KEY (StateID, Year, ResourceID),
  CONSTRAINT RESOURCE_TO_POLITY FOREIGN KEY (StateID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE IGO
  ( igoID	        NUMBER(4) NOT NULL,
    igoAbbr	      VARCHAR2(15),
    igoShortName	VARCHAR2(75),
    igoLongName	  VARCHAR2(85),
    StartYear	    NUMBER(4),
    EndYear	      NUMBER(4),
    EndReason	    VARCHAR2(10),
    Notes	        VARCHAR2(500),
  CONSTRAINT IGO_PK PRIMARY KEY (igoID)
  );

CREATE TABLE IGO_MEMBERSHIP
  ( igoID	    NUMBER(4) NOT NULL,
    StateID	  NUMBER(5) NOT NULL,
    JoinYear	NUMBER(4) NOT NULL,
    LeaveYear	NUMBER(4),
  CONSTRAINT  IGO_MEMBERSHIP_PK PRIMARY KEY (igoID, StateID, JoinYear),
  CONSTRAINT IGOMEM_TO_IGO FOREIGN KEY (igoID)
    REFERENCES IGO (igoID),
  CONSTRAINT IGOMEM_TO_POLITY FOREIGN KEY (StateID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE STATE_ALLIANCE
  ( AllianceID	  NUMBER(3) NOT NULL,
    AllianceType  VARCHAR2(30),
    StartDate	    DATE,
    EndDate	      DATE,
    StartYear	    NUMBER(4),
    StartMonth	  NUMBER(2),
    StartDay	    NUMBER(2),
    EndYear	      NUMBER(4),
    EndMonth	    NUMBER(2),
    EndDay	      NUMBER(2),
  CONSTRAINT STATE_ALLIANCE_PK PRIMARY KEY (AllianceID)
  );

CREATE TABLE ALLIANCE_MEMBERSHIP
  ( AllianceID	NUMBER(3) NOT NULL,
    StateID	    NUMBER(5) NOT NULL,
    StartDate	  DATE NOT NULL,
    EndDate	    DATE,
    StartYear	  NUMBER(4),
    StartMonth	NUMBER(2),
    StartDay	  NUMBER(2),
    EndYear	    NUMBER(4),
    EndMonth	  NUMBER(2),
    EndDay	    NUMBER(2),
  CONSTRAINT ALLIANCE_MEMBERSHIP_PK PRIMARY KEY (AllianceID, StateID, StartDate),
  CONSTRAINT ALLIANCEMEM_TO_ALLIANCE FOREIGN KEY (AllianceID)
    REFERENCES STATE_ALLIANCE (AllianceID),
  CONSTRAINT ALLIANCEMEM_TO_POLITY FOREIGN KEY (StateID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE ALLIANCE_TRAITS
  ( AllianceID	NUMBER(3) NOT NULL,
    StateID	    NUMBER(5) NOT NULL,
    StartDate	  DATE NOT NULL,
    Trait	      VARCHAR2(15) CHECK (Trait IN('defense', 'neutrality', 'nonaggression', 'entente')) NOT NULL,
  CONSTRAINT ALLIANCE_TRAITS_PK PRIMARY KEY (AllianceID, StateID, StartDate, Trait),
  CONSTRAINT ALLIANCETRAITS_TO_ALLIANCE FOREIGN KEY (AllianceID)
    REFERENCES STATE_ALLIANCE (AllianceID),
  CONSTRAINT ALLIANCETRAITS_TO_POLITY FOREIGN KEY (StateID)
    REFERENCES POLITY (PolityID),
  CONSTRAINT ALLIANCETRAITS_TO_ALLIANCEMEM FOREIGN KEY (AllianceID, StateID, StartDate)
    REFERENCES ALLIANCE_MEMBERSHIP (AllianceID, StateID, StartDate)
  );

CREATE TABLE WAR
  ( WarID	          NUMBER(4) NOT NULL,
    WarShortName	  VARCHAR2(50),
    WarLongName     VARCHAR2(75),
    WarType	        NUMBER(1) CHECK (WarType IN(1, 2, 3, 4, 5, 6, 7, 8, 9)),
    WarTypeName     VARCHAR2(16) CHECK (WarTypeName IN('Intra-State War', 'Extra-State War', 'Inter-State War', 'Non-State War')),
    IsIntervention	NUMBER(1) CHECK (IsIntervention IN(0, 1)),
    IsInternational	NUMBER(1) CHECK (IsInternational IN(0, 1)),
  CONSTRAINT WAR_PK PRIMARY KEY (WarID)
  );

CREATE TABLE WAR_LOCATIONS
  ( WarID	  NUMBER(4) NOT NULL,
    Region	VARCHAR2(15) NOT NULL,
  CONSTRAINT WAR_LOCATION_PK PRIMARY KEY (WarID, Region),
  CONSTRAINT WARLOC_TO_WAR FOREIGN KEY (WarID)
    REFERENCES WAR (WarID)
  );

CREATE TABLE WAR_PARTICIPANTS
  ( WarID	      NUMBER(4) NOT NULL,
    PolityID	  NUMBER(5) NOT NULL,
    StartDate	  DATE NOT NULL,
    EndDate	    DATE,
    StartYear	  NUMBER(4),
    StartMonth	NUMBER(2),
    StartDay	  NUMBER(2),
    EndYear	    NUMBER(4),
    EndMonth	  NUMBER(2),
    EndDay	    NUMBER(2),
    Side	      VARCHAR2(1),
    IsInitiator	NUMBER(1) CHECK (IsInitiator IN (0, 1)),
    Outcome	    NUMBER(1) CHECK (Outcome IN (1, 2, 3, 4, 5, 6, 7, 8)),
    Deaths	    NUMBER,
  CONSTRAINT WAR_PARTICIPANTS_PK PRIMARY KEY (WarID, PolityID, StartDate),
  CONSTRAINT WARPAR_TO_WAR FOREIGN KEY (WarID)
    REFERENCES WAR (WarID),
  CONSTRAINT WARPAR_TO_POLITY FOREIGN KEY (PolityID)
    REFERENCES POLITY (PolityID)
  );

CREATE TABLE WAR_TRANSITIONS
  ( FromWar	      NUMBER(4) NOT NULL,
    ToWar	        NUMBER(4) NOT NULL,
  CONSTRAINT WAR_TRANSITIONS_PK PRIMARY KEY (FromWar, ToWar),
  CONSTRAINT WARTRANFROM_TO_WAR FOREIGN KEY (FromWar)
    REFERENCES WAR (WarID),
  CONSTRAINT WARTRANTO_TO_WAR FOREIGN KEY (ToWar)
    REFERENCES WAR (WarID)
  );
