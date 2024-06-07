import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

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
  ordreMottatt?: offsetDateTime;
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
  utlysingsdato: offsetDateTime;
  meldefrist: offsetDateTime;
}

/**
 * ForhandsutlysingUtsatt
 * required - used to report announcement postponed
 */
model ForhandsutlysingUtsatt extends Callback {
  type: "forhandsutlysingutsatt";
  utlysingssted: string;
  utlysingsdato: offsetDateTime;
  meldefrist: offsetDateTime;
}

/**
 * ForhandsutlysingSen
 * required - used to report announcement completed
 */
model ForhandsutlysingSen extends Callback {
  type: "forhandsutlysingutsatt";
  utlysingssted: string;
  utlysingsdato: offsetDateTime;
  meldefrist: offsetDateTime;
  antallInteressenter: integer;
  varighetForkjopsrett: offsetDateTime;
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
  initiertDato?: offsetDateTime;
  meldefrist?: offsetDateTime;
}

model StyregodkjenningFullfort extends Styregodkjenning {
  statusStyregodkjenning?: "godkjent_av_styret" | "godkjent_av_bbl" | "avvist_av_styret" | "avvist_av_bbl" | "frist_utlopt";
  andreHensyn?: string;
}

model SalgsmeldingForkjopsrett {
  typeAvklaring: "fastpris" | "forhandsutlysing";
  statusForhandsutlysing: "ikke_forhandsutlysing" | "med_interessenter" | "uten_interessenter" | "forkjop_ikke_benyttet";
  utlysingsdato: offsetDateTime;
  utlysingssted: string;
  meldefrist: offsetDateTime;
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
