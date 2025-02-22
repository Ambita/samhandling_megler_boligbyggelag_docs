import {ISODateTime} from "./callbackTypes";

export interface Salg {
  kjopesum: number
  datoAkseptBud: ISODateTime
  datoOverdragelse: ISODateTime
  forbeholdBud?: boolean
}

export interface Bolig {
  prom?: number
  srom?: number
  bra?: number
  braI?: number
  braE?: number
  braB?: number
  braS?: number
  tba?: number
  bta?: number
  antallRom?: number
  antallSoverom?: number
  energibokstav?: string
  energifargekode?: string
  heis?: boolean
  veranda?: boolean
  parkering?: string
  oppvarming?: string
  adresse?: Adresse
  leilighetsnummer?: string
}

export enum RegisterenhetType {
  matrikkel = 'matrikkel',
  borettsandel = 'borettsandel',
  aksjeandel = 'aksjeandel',
  obligasjonsandel = 'obligasjonsandel'
}

export interface Registerenhet {
  type: RegisterenhetType
  ident: string
}

export interface Kontaktinfo {
  id: string
  navn: string
  epost: string
  telefon?: string
}

export interface Adresse {
  gateadresse: string
  postnummer: string
  poststed: string
}

export interface Meglerkontor {
  orgnr: string
  avdelingsnr: string
  navn: string
  adresse: Adresse
  telefon?: string
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
  adresse?: Adresse
  epost?: string
  telefon?: string
  eierbrok?: Eierbrok
}

// Common request type :
export interface BasicProduct {
  ordreId: string
  oppdragsnummer?: string
  registerenhet: Registerenhet
  bestiller: Kontaktinfo
  meglerkontor: Meglerkontor
  kontaktperson: Kontaktinfo
}

/**
 * Boliginfo
 * Order information about a property
 */
export interface Boliginfo extends BasicProduct {
  type: 'boliginformasjon'
}

/**
 * Forhandsutlysing
 * Order a clarification
 */
export interface Forhandsutlysing extends BasicProduct {
  type: 'forhandsutlysing'
  bolig: Bolig
  selgere: Kontakt[]
  eiere?: Kontakt[]
  omsetningstype?: 'salg' | 'tvangssalg' | 'utleie' | 'verdivurdering' | 'oppgjorsoppdrag'
  finnkode?: string
  prisantydning?: number
}

/**
 * Salgsmelding
 * Trigger the change of ownership
 */
export interface Salgsmelding extends BasicProduct {
  type: 'salgsmelding'
  kjopere: Kontakt[]
  selgere: Kontakt[]
  eiere?: Kontakt[]
  omsetningstype?: 'salg' | 'tvangssalg' | 'utleie' | 'verdivurdering' | 'oppgjorsoppdrag'
  finnkode?: string
  salg: Salg
  bolig: Bolig
}

/**
 * EndringOverdragelse
 * Notify about change of transfer date
 */
export interface EndringOverdragelse extends BasicProduct {
  type: 'endringoverdragelse',
  salgsmeldingOrdreId: string
  datoOverdragelse: ISODateTime
}

/**
 * EndringKjopere
 * Notify about change of buyers/owners
 */
export interface EndringKjopere extends BasicProduct {
  type: 'endringkjopere',
  kjopere: Kontakt[],
}

/**
 * Sluttbrev
 * Sent when the ownership transfer is completed
 */
export interface Sluttbrev extends BasicProduct {
  type: 'sluttbrev'
  tinglysteEiere?: Kontakt[]
  registerforteEiere?: Kontakt[]
  datoOverdragelse: string
  forkjopsrettAvklart?: boolean
  styregodkjenningAvklart?: boolean
}

/**
 * Restanse
 * Order and handle arrears - not yet designed
 */
export interface Restanse extends BasicProduct {
  type: 'restanse'
}

/**
 * SumGjeld
 * Order and handle total debt
 */
export interface SumGjeld extends BasicProduct {
  type: 'sumgjeld'
}

/**
 * SumFelleskostnader
 * Order and handle total common costs
 */
export interface SumFelleskostnader extends BasicProduct {
  type: 'sumfelleskostnader'
}
