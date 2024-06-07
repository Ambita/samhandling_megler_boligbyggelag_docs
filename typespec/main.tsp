import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

// REQUEST DATA
alias requests = "boliginformasjon" | "forhandsutlysing" | "salgsmelding" 
| "endringoverdragelse" | "endringkjopere" | "restanse";

alias registerenhettype = "matrikkel" | "borettsandel" | "aksjeandel" | "obligasjonsandel";

@pattern("^[0-9]{4}-[0-9]{2}-[0-9]{2}$", "Must be a date on SQL format (YYYY-MM-DD)")
scalar date extends string;

@pattern("^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}[+-][0-9]{2}:[0-9]{2}$", "Must be a date on ISO 8601 format (YYYY-MM-DDTHH:MM:SS+HH:MM)")
scalar datetimeoffset extends string;

model Salg {
  kjopesum: integer;
  datoAkseptBud: date;
  datoOverdragelse: date;
  forbeholdBud?: boolean;
}

model Bolig {
  prom?: integer;
  promBeskrivelse?: string;
  bra?: integer;
  bta?: integer;
  antallRom?: integer;
  antallSoverom?: integer;
  energibokstav?: string;
  energifargekode?: string;
  heis?: boolean;
  veranda?: boolean;
  parkering?: string;
  oppvarming?: string;
  adresse?: Adresse;
  leilighetsnummer?: string;
}

model Registerenhet {
  type: registerenhettype;
  ident: string;
}

model Kontaktinfo {
  id: string;
  navn: string;
  epost: string;
  telefon?: string;
}

model Meglerkontor {
  orgnr: string;
  avdelingsnr: string;
  navn: string;
  adresse: Adresse;
  telefon: string;
}

/**
 * Common request type for all product types
 */
model BasicProduct {
  ordreId: string;
  oppdragsnummer?: string;
  registerenhet: Registerenhet;
  bestiller: Kontaktinfo;
  meglerkontor: Meglerkontor;
  kontaktperson: Kontaktinfo;
}

/**
 * Boliginfo
 * Order information about a property
 */
model Boliginfo extends BasicProduct {
  type: "boliginformasjon";
}

/**
 * Forhandsutlysing
 * Order a clarification
 */
model Forhandsutlysing extends BasicProduct {
  type: "forhandsutlysing";
  bolig: Bolig;
  selgere: Kontakt[];
  finnkode?: string;
  prisantydning?: integer;
}

/**
 * Salgsmelding
 * Trigger the change of ownership
 */
model Salgsmelding extends BasicProduct {
  type: "salgsmelding";
  kjopere: Kontakt[];
  selgere: Kontakt[];
  eiere?: Kontakt[];
  finnkode?: string;
  salg: Salg;
  bolig: Bolig;
}

/**
 * EndringOverdragelse
 * Notify about change of transfer date
 */
model EndringOverdragelse extends BasicProduct {
  type: "endringoverdragelse";
  salgsmeldingOrdreId: string;
  datoOverdragelse: date;
}

/**
 * EndringKjopere
 * Notify about change of buyers/owners
 */
model EndringKjopere extends BasicProduct {
  type: "endringkjopere";
  kjopere: Kontakt[];
}

/**
 * Restanse
 * Order and handle arrears - not yet designed
 */
model Restanse extends BasicProduct {
  type: "restanse"
}

// RESPONSE DATA
alias callbacks = "boliginformasjon" | "forhandsutlysingtidlig" | "forhandsutlysingutsatt" 
  | "forhandsutlysingsen" | "forhandsutlysingutlopt" | "salgsmeldingmottatt" 
  | "salgsmeldingoppdatering" | "salgsmeldingfullfort" | "endringoverdragelse"
  | "endringkjoperemottatt" | "endringkjoperefullfort" | "feil";

alias bestillingsformat = "Manuelt" | "Elektronisk";

alias bestillingsmottakerType = "forretningsforer" | "lag";

alias feilkode = "eierskifteAlleredeOpprettet" | "forhandsutlysningStottesIkke"
  | "tilknyttetAnnetBoligbyggelag" | "forhandIkkeUtloptSjekkStatus" | "forhandIkkeUtloptKontaktForrForer";

model Adresse {
  gateadresse: string;
  postnummer: string;
  poststed: string;
}

model Forretningsforer {
  navn: string;
  adresse: Adresse;
  epost?: string;
  epostRestanse?: string;
}

model Styreleder {
  navn: string;
  epost?: string;
  telefonnr?: string;
}

model Klient {
  klienttype: string;
  organisasjonsnavn: string;
  organisasjonsnummer: string;
  epost?: string;
  nettside?: string;
  styreleder?: Styreleder;
}

model Eierbrok {
  teller: integer;
  nevner: integer;
}

model Kontakt {
  id: string;
  fornavn?: string;
  etternavn?: string;
  organisasjonsnavn?: string;
  kontaktperson?: string;
  adresse: Adresse;
  epost: string;
  telefon: string;
  eierbrok: Eierbrok; 
}

model Callback {
  type: callbacks;
  ordreId: string;
  forretningsforer: Forretningsforer;
  klient?: Klient;
  levert?: string;
  referanse?: string;
  eierform?: "Aksjonær" | "Andelseier" | "Sameier" | "Seksjonseier";
  ordreMottatt?: datetimeoffset;
}

/**
 * Feil
 * optional - used to report errors
  */
model Feil extends Callback {
  type: "feil";
  feilmelding: string;
  feilkode?: feilkode;
  tidspunkt: string;
  kansellert?: boolean;
}

/**
 * Boliginformasjon
 * required - used to report information on requested property
  */
model Boliginformasjon extends Callback {
  type: "boliginformasjon";
  forkjopsrett: {
    harForkjopsrett: boolean;
    kanForhandsutlyses: boolean;
    intern?: boolean;
    bestillingsformat?: bestillingsformat;
    mottakerType?: bestillingsmottakerType;
    gebyr?: integer;
  },
  styregodkjenning: {
    pakrevd: boolean;
    bestillingsformat?: bestillingsformat;
    mottakerType?: bestillingsmottakerType;
  },
  salgsmelding: {
    bestillingsformat: bestillingsformat;
    gebyr?: integer;
  },
  restanse: {
    bestillingsformat: bestillingsformat;
  },
  andreHensyn?: string
}

/**
 * ForhandsutlysingTidlig
 * required - used to report announcement data
 */
model ForhandsutlysingTidlig extends Callback {
  type: "forhandsutlysingtidlig";
  utlysingssted: string;
  utlysingsdato: datetimeoffset;
  meldefrist: datetimeoffset;
}

/**
 * ForhandsutlysingUtsatt
 * required - used to report announcement postponed
 */
model ForhandsutlysingUtsatt extends Callback {
  type: "forhandsutlysingutsatt";
  utlysingssted: string;
  utlysingsdato: datetimeoffset;
  meldefrist: datetimeoffset;
}

/**
 * ForhandsutlysingSen
 * required - used to report announcement completed
 */
model ForhandsutlysingSen extends Callback {
  type: "forhandsutlysingutsatt";
  utlysingssted: string;
  utlysingsdato: datetimeoffset;
  meldefrist: datetimeoffset;
  antallInteressenter: integer;
  varighetForkjopsrett: datetimeoffset;
}

/**
 * ForhandsutlysingUtlopt
 * required - used to report announcement expired
 */
model ForhandsutlysingUtlopt extends Callback {
  type: "forhandsutlysingutlopt";
}

model Styregodkjenning {
  handteresAvForretningsforer: boolean;
  initiertDato?: datetimeoffset;
  meldefrist?: datetimeoffset;
}

model StyregodkjenningFullfort extends Styregodkjenning {
  statusStyregodkjenning?: "godkjent_av_styret" | "godkjent_av_bbl" | "avvist_av_styret" | "avvist_av_bbl" | "frist_utlopt";
  andreHensyn?: string;
}

model SalgsmeldingForkjopsrett {
  typeAvklaring: "fastpris" | "forhandsutlysing";
  statusForhandsutlysing: "ikke_forhandsutlysing" | "med_interessenter" | "uten_interessenter" | "forkjop_ikke_benyttet";
  utlysingsdato: datetimeoffset;
  utlysingssted: string;
  meldefrist: datetimeoffset;
}

model SalgsmeldingForkjopsrettFullfort extends SalgsmeldingForkjopsrett {
  statusForkjopsrett: "ikke_benyttet" | "benyttet";
  andreHensyn?: string;
}

/**
 * SalgsmeldingMottatt
 * optional - clarifies process, can be omitted if no process is needed
 */
model SalgsmeldingMottatt extends Callback {
  type: "salgsmeldingmottatt";
  harForkjopsrett: boolean;
  forkjopsrett?: SalgsmeldingForkjopsrett;
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: Styregodkjenning;
  tilknyttetLag: boolean;
}

/**
 * SalgsmeldingOppdatering
 * optional - can be sent before board approval process completed
 */
model SalgsmeldingOppdatering extends Callback {
  type: "salgsmeldingoppdatering";
  harForkjopsrett: boolean;
  forkjopsrett?: SalgsmeldingForkjopsrettFullfort;
  styregodkjenningPakrevd: boolean;
  kjopere: Kontakt[];
  tilknyttetLag: boolean;
}

/**
 * SalgsmeldingFullfort
 * required - expected at the end of the process - marks sale process completed
 */
model SalgsmeldingFullfort extends Callback {
  type: "salgsmeldingfullfort";
  harForkjopsrett: boolean;
  forkjopsrett?: SalgsmeldingForkjopsrettFullfort;
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: StyregodkjenningFullfort;
  kjopere: Kontakt[];
  tilknyttetLag: boolean;
}

/**
 * EndringOverdragelse
 * required - Respond if the requested transfer date was accepted
 */
model EndringOverdragelseBehandlet extends Callback {
  type: "endringoverdragelse";
  datoEndret: boolean;
  avvisningsarsak?: string;
}

/**
 * EierskifteMottatt
 * optional - to be used if updates trigger new board approval
 */
model EndringKjopereMottatt extends Callback {
  type: "endringkjoperemottatt";
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: Styregodkjenning;
}

/**
 * EierskifteFullfort
 * required - confirms process completed
 */
model EndringKjopereFullfort extends Callback {
  type: "endringkjoperefullfort";
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: StyregodkjenningFullfort;
}

alias CallbackEvent = Boliginformasjon | Feil |
  ForhandsutlysingTidlig | ForhandsutlysingUtsatt | ForhandsutlysingSen | ForhandsutlysingUtlopt | EndringOverdragelseBehandlet |
  SalgsmeldingMottatt | SalgsmeldingOppdatering | SalgsmeldingFullfort | EndringKjopereMottatt | EndringKjopereFullfort;
