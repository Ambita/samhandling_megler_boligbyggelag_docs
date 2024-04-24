export enum BestillingsFormat {
  MANUELT = 'Manuelt',
  ELEKTRONISK = 'Elektronisk'
}

export type BestillingsmottakerType = 'forretningsforer' | 'lag'

export enum Feilkode {
  eierskifteAlleredeOpprettet = 2,
  forhandsutlysningStottesIkke = 4,
  tilknyttetAnnetBoligbyggelag = 6, // behandles av annet boligbyggelag
  forhandIkkeUtloptSjekkStatus = 31, // ny ordre på samme objekt fra samme megler
  forhandIkkeUtloptKontaktForrForer = 32, // ny ordre på samme objekt fra annen megler
}

export enum CallbackType {
  boliginformasjon = 'boliginformasjon',
  forhandsutlysingtidlig = 'forhandsutlysingtidlig',
  forhandsutlysingutsatt = 'forhandsutlysingutsatt',
  forhandsutlysingsen = 'forhandsutlysingsen',
  forhandsutlysingutlopt = 'forhandsutlysingutlopt',
  salgsmeldingmottatt = 'salgsmeldingmottatt',
  salgsmeldingoppdatering = 'salgsmeldingoppdatering',
  salgsmeldingfullfort = 'salgsmeldingfullfort',
  endringoverdragelse = 'endringoverdragelse',
  endringkjoperemottatt = 'endringkjoperemottatt',
  endringkjoperefullfort = 'endringkjoperefullfort',
  feil = 'feil'
}

export enum SalgsmeldingForhandsutlysing {
  ikke_forhandsutlysing = 'ikke_forhandsutlysing',
  med_interessenter = 'med_interessenter',
  uten_interessenter = 'uten_interessenter',
  ikke_vist_interesse = 'ikke_vist_interesse'
}

export interface Styreleder {
  navn: string
  epost?: string
  telefonnr?: string
}

export interface Klient {
  klienttype: string
  organisasjonsnavn: string
  organisasjonsnummer: string
  epost?: string
  nettside?: string
  styreleder?: Styreleder
}

export interface Adresse {
  gateadresse: string
  postnummer: string
  poststed: string
}

export interface Eierbrok {
  teller: number
  nevner: number
}

export interface Kontakt {
  id: string
  fornavn?: string
  etternavn?: string
  organisasjonsnavn?: string
  kontaktperson?: string
  adresse: Adresse
  epost: string
  telefon: string
  eierbrok: Eierbrok
}

export interface Callback {
  type: CallbackType
  ordreId: string
  forretningsforer: {
    navn: string
    adresse: Adresse
    epost: string
    epostRestanse?: string
  }
  klient?: Klient
  levert?: string
  referanse?: string
  eierform?: 'Aksjonær' | 'Andelseier' | 'Sameier' | 'Seksjonseier'
}

export interface Feil extends Callback {
  type: CallbackType.feil
  feilmelding: string
  feilkode?: Feilkode
  tidspunkt: string
  kansellert?: boolean
}

// Callback types
export interface Boliginformasjon extends Callback {
  type: CallbackType.boliginformasjon
  forkjopsrett: {
    harForkjopsrett: boolean
    kanForhandsutlyses: boolean
    intern?: boolean
    bestillingsformat?: BestillingsFormat
    mottakerType?: BestillingsmottakerType
    gebyr?: number
  }
  styregodkjenning: {
    pakrevd: boolean
    bestillingsformat?: BestillingsFormat
    mottakerType?: BestillingsmottakerType
  }
  salgsmelding: {
    bestillingsformat: BestillingsFormat
    gebyr?: number
  }
  restanse: {
    bestillingsformat: BestillingsFormat
  }
  andreHensyn?: string
}

export interface ForhandsutlysingTidlig extends Callback {
  type: CallbackType.forhandsutlysingtidlig
  ordreMottatt: string
  utlysingssted: string
  utlysingsdato: string
  meldefrist: string
}

export interface ForhandsutlysingUtsatt extends Callback {
  type: CallbackType.forhandsutlysingutsatt
  ordreMottatt: string
  utlysingssted: string
  utlysingsdato: string
  meldefrist: string
}

export interface ForhandsutlysingSen extends Callback {
  type: CallbackType.forhandsutlysingsen
  ordreMottatt: string
  utlysingssted: string
  utlysingsdato: string
  meldefrist: string
  antallInteressenter: number
  varighetForkjopsrett: string
}

export interface ForhandsutlysingUtlopt extends Callback {
  type: CallbackType.forhandsutlysingutlopt
}

export interface Styregodkjenning {
  handteresAvForretningsforer?: boolean
  initiertDato?: string
  meldefrist?: string
}

export interface StyregodkjenningFullfort extends Styregodkjenning {
  statusStyregodkjenning?: 'godkjent_av_styret' | 'godkjent_av_bbl' | 'avvist_av_styret' | 'avvist_av_bbl' | 'frist_utlopt'
  andreHensyn?: string
}

export interface SalgsmeldingForkjopsrett {
  typeAvklaring: 'fastpris' | 'forhandsutlysing'
  statusForhandsutlysing: 'ikke_forhandsutlysing' | 'med_interessenter' | 'uten_interessenter' | 'forkjop_ikke_benyttet'
  utlysingsdato: string
  utlysingssted: string
  meldefrist: string
}

export interface SalgsmeldingForkjopsrettFullfort extends SalgsmeldingForkjopsrett {
  statusForkjopsrett: 'ikke_benyttet' | 'benyttet'
  andreHensyn?: string
}

/**
 * SalgsmeldingMottatt
 * optional - clarifies process, can be omitted if no process is needed
 */
export interface SalgsmeldingMottatt extends Callback {
  type: CallbackType.salgsmeldingmottatt
  ordreMottatt: string
  harForkjopsrett: boolean
  forkjopsrett?: SalgsmeldingForkjopsrett
  styregodkjenningPakrevd: boolean
  styregodkjenning?: Styregodkjenning
  tilknyttetLag: boolean
}

/**
 * SalgsmeldingOppdatering
 * optional - can be sent before board approval process completed
 */
export interface SalgsmeldingOppdatering extends Callback {
  type: CallbackType.salgsmeldingoppdatering
  ordreMottatt: string
  harForkjopsrett: boolean
  forkjopsrett?: SalgsmeldingForkjopsrettFullfort
  styregodkjenningPakrevd: boolean
  kjopere: Kontakt[]
  tilknyttetLag: boolean
}

/**
 * SalgsmeldingFullfort
 * required - expected at the end of the process - marks sale process completed
 */
export interface SalgsmeldingFullfort extends Callback {
  type: CallbackType.salgsmeldingfullfort
  ordreMottatt: string
  harForkjopsrett: boolean
  forkjopsrett?: SalgsmeldingForkjopsrettFullfort
  styregodkjenningPakrevd: boolean
  styregodkjenning?: StyregodkjenningFullfort
  kjopere: Kontakt[]
  tilknyttetLag: boolean
}

/**
 * EndringOverdragelse
 * required - Respond if the requested transfer date was accepted
 */
export interface EndringOverdragelseBehandlet extends Callback {
  type: CallbackType.endringoverdragelse
  ordreMottatt: string
  datoEndret: boolean
}

/**
 * EierskifteMottatt
 * optional - to be used if updates trigger new board approval
 */
export interface EndringKjopereMottatt extends Callback {
  type: CallbackType.endringkjoperemottatt
  ordreMottatt: string
  styregodkjenningPakrevd: boolean
  styregodkjenning?: Styregodkjenning
}

/**
 * EierskifteFullfort
 * required - confirms process completed
 */
export interface EndringKjopereFullfort extends Callback {
  type: CallbackType.endringkjoperefullfort
  ordreMottatt: string
  styregodkjenningPakrevd: boolean
  styregodkjenning?: StyregodkjenningFullfort
}

export type CallbackEvent = Boliginformasjon | Feil |
  ForhandsutlysingTidlig | ForhandsutlysingUtsatt | ForhandsutlysingSen | ForhandsutlysingUtlopt | EndringOverdragelseBehandlet |
  SalgsmeldingMottatt | SalgsmeldingOppdatering | SalgsmeldingFullfort | EndringKjopereMottatt | EndringKjopereFullfort
