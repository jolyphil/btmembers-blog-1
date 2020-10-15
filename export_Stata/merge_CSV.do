cd "<path_to_repo>/btmembers-blog-1"

********************************************************************************

import delimited "temp/members2.csv", bindquote(strict) varnames(1) encoding(utf8) colrange(1:4) maxquotedrows(1000) clear 

tostring id, replace

save "temp/members2.dta", replace

use "temp/members1.dta", clear

merge m:1 id wp using "temp/members2.dta", nogen

order vita_kurz, after(beruf)
order veroeffentlichungspflichtiges, after(vita_kurz)

label variable vita_kurz "Kurzbiografie des Abgeordneten (nur aktuelle Wahlperiode)"
label variable veroeffentlichungspflichtiges "Veröffentlichungspflichtige Angaben (nur aktuelle Wahlperiode)"

save "temp/members.dta", replace
