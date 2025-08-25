import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/json-schema";

using TypeSpec.Http;
using TypeSpec.JsonSchema;

// SCALARS
@pattern("^[0-9]{4}-[0-9]{2}-[0-9]{2}$", "Must be a date on SQL format (YYYY-MM-DD)")
scalar ISODate extends string;

@pattern("^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(Z|[+-][0-9]{2}:[0-9]{2})$", "Must be a date on ISO 8601 format with timezone")
scalar ISODateTime extends string;

// ENUMS
enum RegisterenhetType {
  matrikkel,
  borettsandel,
  aksjeandel,
  obligasjonsandel
}

enum BestillingsFormat {
  Manuelt: "Manuelt",
  Elektronisk: "Elektronisk"
}

enum BestillingsmottakerType {
  forretningsforer: "forretningsforer",
  lag: "lag"
}

enum Feilkode {
  forhandsutlysingAlleredeOpprettet: 1,
  eierskifteAlleredeOpprettet: 2,
  forhandsutlysningStottesIkke: 4,
  tilknyttetAnnetBoligbyggelag: 6,
  tilknyttetAnnenForretningsforer: 8,
  eiendomIkkeFunnet: 11,
  salgsmeldingOrdreIkkeFunnet: 12,
  forhandIkkeUtloptSjekkStatus: 31,
  forhandIkkeUtloptKontaktForrForer: 32,
  manuellBehandling: 33,
  sakstypeForKlientIkkeFunnet: 34,
  salgsmeldingKanIkkeLeveresDigital: 39
}

// REQUEST DATA
alias RequestTypes = "boliginformasjon" | "forhandsutlysing" | "salgsmelding" | "endringoverdragelse" | "endringkjopere" | "restanse" | "sluttbrev" | "sumgjeld" | "sumfelleskostnader";

model Salg {
  kjopesum: integer;
  datoAkseptBud: ISODateTime;
  datoOverdragelse: ISODateTime;
  forbeholdBud?: boolean;
}

model Bolig {
  prom?: integer;
  srom?: integer;
  bra?: integer;
  braI?: integer;
  braE?: integer;
  braB?: integer;
  braS?: integer;
  tba?: integer;
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
  type: RegisterenhetType;
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
model BasicRequest {
  ordreId: string;
  estateId?: string;
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
@jsonSchema
model BoliginformasjonOrdre extends BasicRequest {
  type: "boliginformasjon";
}

/**
 * Forhandsutlysing
 * Order a clarification
 */
model ForhandsutlysingOrdre extends BasicRequest {
  type: "forhandsutlysing";
  bolig: Bolig;
  selgere: Kontakt[];
  omsetningstype?: "salg" | "tvangssalg" | "utleie" | "verdivurdering" | "oppgjorsoppdrag";
  finnkode?: string;
  prisantydning?: integer;
}

/**
 * Salgsmelding
 * Trigger the change of ownership
 */
@jsonSchema
model SalgsmeldingOrdre extends BasicRequest {
  type: "salgsmelding";
  kjopere: Kontakt[];
  selgere: Kontakt[];
  eiere?: Kontakt[];
  omsetningstype?: "salg" | "tvangssalg" | "utleie" | "verdivurdering" | "oppgjorsoppdrag";
  finnkode?: string;
  salg: Salg;
  bolig: Bolig;
}

/**
 * EndringOverdragelse
 * Notify about change of transfer date
 */
model EndringOverdragelseOrdre extends BasicRequest {
  type: "endringoverdragelse";
  salgsmeldingOrdreId: string;
  datoOverdragelse: ISODateTime;
}

/**
 * EndringKjopere
 * Notify about change of buyers/owners
 */
model EndringKjopereOrdre extends BasicRequest {
  type: "endringkjopere";
  kjopere: Kontakt[];
}

/**
 * Sluttbrev
 * Sent when the ownership transfer is completed
 */
model SluttbrevOrdre extends BasicRequest {
  type: "sluttbrev";
  tinglysteEiere?: Kontakt[];
  registerforteEiere?: Kontakt[];
  datoOverdragelse: string;
  forkjopsrettAvklart?: boolean;
  styregodkjenningAvklart?: boolean;
}

/**
 * Restanse
 * Order and handle arrears - not yet designed
 */
model RestanseOrdre extends BasicRequest {
  type: "restanse";
}

/**
 * SumGjeld
 * Order and handle total debt
 */
model SumGjeldOrdre extends BasicRequest {
  type: "sumgjeld";
}

/**
 * SumFelleskostnader
 * Order and handle total common costs
 */
model SumFelleskostnaderOrdre extends BasicRequest {
  type: "sumfelleskostnader";
}

// RESPONSE DATA
alias CallbackTypes = "boliginformasjon" | "forhandsutlysingtidlig" | "forhandsutlysingutsatt" 
  | "forhandsutlysingsen" | "forhandsutlysingutlopt" | "salgsmeldingmottatt" 
  | "salgsmeldingoppdatering" | "salgsmeldingfullfort" | "endringoverdragelse"
  | "endringkjoperemottatt" | "endringkjoperefullfort" | "sluttbrevakseptert"
  | "sumgjeld" | "sumfelleskostnader" | "feil";

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

model BasicResponse {
  type: CallbackTypes;
  ordreId: string;
  forretningsforer: Forretningsforer;
  klient?: Klient;
  levert?: ISODateTime;
  referanse?: string;
  eierform?: "Aksjonär" | "Andelseier" | "Sameier" | "Seksjonseier";
}

/**
 * Feil
 * optional - used to report errors
  */
model Feil extends BasicResponse {
  type: "feil";
  feilmelding: string;
  feilkode?: Feilkode;
  tidspunkt: ISODateTime;
  kansellert?: boolean;
}

/**
 * Boliginformasjon
 * required - used to report information on requested property
  */
model BoliginformasjonResponse extends BasicResponse {
  type: "boliginformasjon";
  forkjopsrett: {
    harForkjopsrett: boolean;
    kanForhandsutlyses?: boolean;
    intern?: boolean;
    bestillingsformat?: BestillingsFormat;
    mottakerType?: BestillingsmottakerType;
    gebyr?: integer;
  },
  styregodkjenning: {
    pakrevd: boolean;
    bestillingsformat?: BestillingsFormat;
    mottakerType?: BestillingsmottakerType;
  },
  salgsmelding: {
    bestillingsformat: BestillingsFormat;
    gebyr?: integer;
  },
  restanse: {
    bestillingsformat: BestillingsFormat;
  },
  andreHensyn?: string
}

/**
 * ForhandsutlysingTidlig
 * required - used to report announcement data
 */
model ForhandsutlysingTidlig extends BasicResponse {
  type: "forhandsutlysingtidlig";
  ordreMottatt: ISODateTime;
  utlysingssted: string;
  utlysingsdato: ISODate;
  meldefrist: ISODateTime;
}

/**
 * ForhandsutlysingUtsatt
 * required - used to report announcement postponed
 */
model ForhandsutlysingUtsatt extends BasicResponse {
  type: "forhandsutlysingutsatt";
  ordreMottatt: ISODateTime;
  utlysingssted: string;
  utlysingsdato: ISODate;
  meldefrist: ISODateTime;
}

/**
 * ForhandsutlysingSen
 * required - used to report announcement completed
 */
model ForhandsutlysingSen extends BasicResponse {
  type: "forhandsutlysingsen";
  ordreMottatt: ISODateTime;
  utlysingssted: string;
  utlysingsdato: ISODate;
  meldefrist: ISODateTime;
  antallInteressenter: integer;
  varighetForkjopsrett: ISODate;
}

/**
 * ForhandsutlysingUtlopt
 * required - used to report announcement expired
 */
model ForhandsutlysingUtlopt extends BasicResponse {
  type: "forhandsutlysingutlopt";
}

model Styregodkjenning {
  handteresAvForretningsforer: boolean;
  initiertDato?: ISODate;
  meldefrist?: ISODateTime;
}

model StyregodkjenningFullfort extends Styregodkjenning {
  statusStyregodkjenning?: "godkjent_av_styret" | "godkjent_av_bbl" | "avvist_av_styret" | "avvist_av_bbl" | "frist_utlopt";
  andreHensyn?: string;
}

model SalgsmeldingForkjopsrett {
  typeAvklaring: "fastpris" | "forhandsutlysing";
  statusForhandsutlysing: "ikke_forhandsutlysing" | "med_interessenter" | "uten_interessenter" | "forkjop_ikke_benyttet" | "ikke_avklart";
  utlysingsdato: ISODate;
  utlysingssted: string;
  meldefrist: ISODateTime;
}

model SalgsmeldingForkjopsrettFullfort extends SalgsmeldingForkjopsrett {
  statusForkjopsrett: "ikke_benyttet" | "benyttet";
  andreHensyn?: string;
}

/**
 * SalgsmeldingMottatt
 * optional - clarifies process, can be omitted if no process is needed
 */
model SalgsmeldingMottatt extends BasicResponse {
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
model SalgsmeldingOppdatering extends BasicResponse {
  type: "salgsmeldingoppdatering";
  harForkjopsrett: boolean;
  forkjopsrett?: SalgsmeldingForkjopsrettFullfort;
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: Styregodkjenning;
  kjopere: Kontakt[];
  tilknyttetLag: boolean;
}

/**
 * SalgsmeldingFullfort
 * required - expected at the end of the process - marks sale process completed
 */
model SalgsmeldingFullfort extends BasicResponse {
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
model EndringOverdragelseBehandlet extends BasicResponse {
  type: "endringoverdragelse";
  datoEndret: boolean;
  avvisningsarsak?: string;
}

/**
 * EierskifteMottatt
 * optional - to be used if updates trigger new board approval
 */
model EndringKjopereMottatt extends BasicResponse {
  type: "endringkjoperemottatt";
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: Styregodkjenning;
}

/**
 * EierskifteFullfort
 * required - confirms process completed
 */
model EndringKjopereFullfort extends BasicResponse {
  type: "endringkjoperefullfort";
  styregodkjenningPakrevd: boolean;
  styregodkjenning?: StyregodkjenningFullfort;
}

/**
 * SluttbrevAkseptert
 * required - confirms process completed
 */
model SluttbrevAkseptert extends BasicResponse {
  type: "sluttbrevakseptert";
}

/**
 * SumGjeldSvar
 * required - returns the total debt
 */
model SumGjeldSvar extends BasicResponse {
  type: "sumgjeld";
  sumGjeld: integer;
}

/**
 * SumFelleskostnaderSvar
 * required - returns the total common costs
 */
model SumFelleskostnaderSvar extends BasicResponse {
  type: "sumfelleskostnader";
  sumFelleskostnader: integer;
}

union CallbackEvent {
  BoliginformasjonResponse,
  Feil,
  ForhandsutlysingTidlig,
  ForhandsutlysingUtsatt,
  ForhandsutlysingSen,
  ForhandsutlysingUtlopt,
  EndringOverdragelseBehandlet,
  SalgsmeldingMottatt,
  SalgsmeldingOppdatering,
  SalgsmeldingFullfort,
  EndringKjopereMottatt,
  EndringKjopereFullfort,
  SluttbrevAkseptert,
  SumGjeldSvar,
  SumFelleskostnaderSvar
}

model GenericResponse {
}

// PATHS FOR ORDERING
@route("/boliginformasjon")
interface Boliginformasjon {
  order(@body req: BoliginformasjonOrdre): GenericResponse;
}

@route("/forhandsutlysing")
interface Forhandsutlysing {
  order(@body req: ForhandsutlysingOrdre): GenericResponse;
}

@route("/salgsmelding")
interface Salgsmelding {
  order(@body req: SalgsmeldingOrdre): GenericResponse;
}

@route("/endringoverdragelse")
interface EndringOverdragelse {
  order(@body req: EndringOverdragelseOrdre): GenericResponse;
}

@route("/endringkjopere")
interface EndringKjopere {
  order(@body req: EndringKjopereOrdre): GenericResponse;
}

@route("/restanse")
interface Restanse {
  order(@body req: RestanseOrdre): GenericResponse;
}

@route("/sluttbrev")
interface Sluttbrev {
  order(@body req: SluttbrevOrdre): GenericResponse;
}

@route("/sumgjeld")
interface SumGjeld {
  order(@body req: SumGjeldOrdre): GenericResponse;
}

@route("/sumfelleskostnader")
interface SumFelleskostnader {
  order(@body req: SumFelleskostnaderOrdre): GenericResponse;
}

// PATHS FOR CALLBACKS
@route("/callback")
interface Callback {
  receive(@body req: CallbackEvent): GenericResponse;
}
