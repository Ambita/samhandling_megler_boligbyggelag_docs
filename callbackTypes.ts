export enum BestillingsFormat {
  MANUELT = 'Manuelt',
  ELEKTRONISK = 'Elektronisk'
}

export enum CallbackType {
  boliginformasjon = 'boliginformasjon',
  forhandsutlysingtidlig = 'forhandsutlysingtidlig',
  forhandsutlysingsen = 'forhandsutlysingsen',
  forhandsutlysingutlopt = 'forhandsutlysingutlopt',
  salgsmeldingmottatt = 'salgsmeldingmottatt',
  salgsmeldingfullfort = 'salgsmeldingfullfort',
  feil = 'feil'
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
  navn: string
  kontaktperson?: string
  adresse: Adresse
  epost: string
  telefon: string
  eierbrok: Eierbrok
}

export interface USBLCallback {
  type: CallbackType
  ordreId: string
  ordreMottatt: string
  forretningsforer: {
    navn: string
    adresse: Adresse
    epost: string
  }
  klient: Klient
  levert?: string
  referanse?: string
  eierform?: string
}

export interface Feil extends USBLCallback {
  type: CallbackType.feil
  feilmelding: string
  feilkode?: number
  tidspunkt: string
  kansellert?: boolean
}

// Callback types
export interface Boliginformasjon extends USBLCallback {
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

export interface ForhandsutlysingTidlig extends USBLCallback {
  type: CallbackType.forhandsutlysingtidlig
  utlysingssted: string
  utlysingsdato: string
  meldefrist: string
}

export interface ForhandsutlysingSen extends USBLCallback {
  type: CallbackType.forhandsutlysingsen
  utlysingssted: string
  utlysingsdato: string
  meldefrist: string
  antallInteressenter: number
  varighetForkjopsrett: string
}

export interface ForhandsutlysingUtlopt extends USBLCallback {
  type: CallbackType.forhandsutlysingutlopt
}

interface SalgsmeldingStyregodkjenning {
  pakrevd?: boolean
  initiertDato?: string
  meldefrist?: string
  status?: string
  andreHensyn?: string
}

interface SalgsmeldingForkjopsrett {
  status: string
  andreHensyn?: string
  kjopere: Kontakt[]
}

interface SalgsmeldingAvklaring {
  harForkjopsrett: boolean
  type: string
  utlysingsdato?: string
  utlysingssted?: string
  meldefrist?: string
}
export interface SalgsmeldingMottatt extends USBLCallback {
  type: CallbackType.salgsmeldingmottatt
  avklaring: SalgsmeldingAvklaring
  styregodkjenning: SalgsmeldingStyregodkjenning
  tilknyttetLag: boolean
}

export interface SalgsmeldingFullfort extends USBLCallback {
  type: CallbackType.salgsmeldingfullfort
  styregodkjenning: SalgsmeldingStyregodkjenning
  forkjopsrett: SalgsmeldingForkjopsrett
}

export type CallbackEvent = Boliginformasjon | ForhandsutlysingTidlig | ForhandsutlysingSen |
ForhandsutlysingUtlopt | SalgsmeldingMottatt | SalgsmeldingFullfort | Feil
