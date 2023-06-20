export enum BestillingsFormat {
  MANUELT = 'Manuelt',
  ELEKTRONISK = 'Elektronisk'
}

export enum Feilkode {
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
  salgsmeldingfullfort = 'salgsmeldingfullfort',
  feil = 'feil'
}

export enum SalgsmeldingForhandsutlysing {
  ikke_forhandsutlysing = 'ikke_forhandsutlysing',
  med_interessenter = 'med_interessenter',
  uten_interessenter = 'uten_interessenter'
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
  }
  klient?: Klient
  levert?: string
  referanse?: string
  eierform?: string
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
    intern?: boolean
    bestillingsformat?: BestillingsFormat
  }
  styregodkjenning: {
    pakrevd: boolean
    bestillingsformat?: BestillingsFormat
  }
  salgsmelding: {
    bestillingsformat: BestillingsFormat
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

export interface SalgsmeldingStyregodkjenning {
  pakrevd?: boolean
  initiertDato?: string
  meldefrist?: string
  status?: string
  andreHensyn?: string
}

export interface SalgsmeldingForkjopsrett {
  status: string
  andreHensyn?: string
  kjopere: Kontakt[]
}

export interface SalgsmeldingAvklaring {
  harForkjopsrett: boolean
  type: string
  statusForhandsutlysing: SalgsmeldingForhandsutlysing 
  utlysingsdato?: string
  utlysingssted?: string
  meldefrist?: string
}

export interface SalgsmeldingMottatt extends Callback {
  type: CallbackType.salgsmeldingmottatt
  avklaring: SalgsmeldingAvklaring
  styregodkjenning: SalgsmeldingStyregodkjenning
  tilknyttetLag: boolean
}

export interface SalgsmeldingFullfort extends Callback {
  type: CallbackType.salgsmeldingfullfort
  styregodkjenning: SalgsmeldingStyregodkjenning
  forkjopsrett: SalgsmeldingForkjopsrett
}

export type CallbackEvent = Boliginformasjon | ForhandsutlysingTidlig | ForhandsutlysingUtsatt |
ForhandsutlysingSen | ForhandsutlysingUtlopt | SalgsmeldingMottatt | SalgsmeldingFullfort | Feil
