use "C:\Documents and Settings\005141290\My Documents\My Research\Regional Corruption\Data\State cross-section data 75-00 final.dta", clear

/* drop DC */
drop if fips == 11


/* SUMMARY STATS */

sum grrgsp invshgsp10 pccpop10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 residencycount campfull constinception north ncent south



/* GROWTH REGRESSIONS -- OLS */

reg grrgsp pccpop10 lcaplf70 north ncent south, robust
reg grrgsp pccpop10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south, robust

/* GROWTH REGRESSIONS -- 2SLS */

ivregress 2sls grrgsp lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), first small
estat firststage 
estat overid
estat endogenous
ivregress 2sls grrgsp lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), first small 
estat firststage 
estat overid
estat endogenous

/* GROWTH REGRESSIONS -- CLR with 2SLS */

condivreg grrgsp lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), 2sls level(95)
condivreg grrgsp lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), 2sls level(95)

/* GROWTH REGRESSIONS -- LIML */

ivregress liml grrgsp lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), first
estat firststage 
estat overid
ivregress liml grrgsp lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), first
estat firststage 
estat overid

/* GROWTH REGRESSIONS -- CLR with LIML */

condivreg grrgsp lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), liml level(95)
condivreg grrgsp lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), liml level(95)


/* INVESTMENT REGRESSIONS -- OLS */

reg invshgsp10 pccpop10 lcaplf70 north ncent south, robust
reg invshgsp10 pccpop10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south, robust

/* INVESTMENT REGRESSIONS -- 2SLS */

ivregress 2sls invshgsp10 lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), first small 
estat firststage 
estat overid
estat endogenous
ivregress 2sls invshgsp10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), first small 
estat firststage 
estat overid
estat endogenous

/* INVESTMENT REGRESSIONS -- CLR for 2SLS */

condivreg invshgsp10 lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), 2sls level(95)
condivreg invshgsp10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), 2sls level(95)

/* INVESTMENT REGRESSIONS -- LIML */

ivregress liml invshgsp10 lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), first
estat firststage 
estat overid
ivregress liml invshgsp10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), first
estat firststage 
estat overid

/* INVESTMENT REGRESSIONS -- CLR for LIML */

condivreg invshgsp10 lcaplf70 north ncent south (pccpop10 = residencycount campfull constinception), liml level(95)
condivreg invshgsp10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south (pccpop10 = residencycount campfull constinception), liml level(95)



/* THESE REGRESSIONS SHOW THAT THE INSTRUMENTS DON'T BELONG IN THE SECOND STAGE */

reg invshgsp10 pccpop10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south residencycount campfull constinception, robust
reg grrgsp pccpop10 lcaplf70 sch0_1270 lpop70 grpop7000 govcon10 govcap0 taxburden0 north ncent south residencycount campfull constinception, robust

log close
