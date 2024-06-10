export enum RequestType {
  boliginformasjon = 'boliginformasjon',
  forhandsutlysing = 'forhandsutlysing',
  salgsmelding = 'salgsmelding',
  endringoverdragelse = 'endringoverdragelse',
  endringkjopere = 'endringkjopere',
  restanse = 'restanse'
}

export interface Salg {
  kjopesum: number
  datoAkseptBud: string
  datoOverdragelse: string
  forbeholdBud?: boolean
}

export interface Bolig {
  prom?: number
  promBeskrivelse?: string
  bra?: number
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
  telefon: string
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
  type: RequestType.boliginformasjon
}

/**
 * Forhandsutlysing
 * Order a clarification
 */
export interface Forhandsutlysing extends BasicProduct {
  type: RequestType.forhandsutlysing
  bolig: Bolig
  selgere: Kontakt[]
  omsetningstype?: 'salg' | 'tvangssalg' | 'utleie' | 'verdivurdering' | 'oppgjorsoppdrag'
  finnkode?: string
  prisantydning?: number
}

/**
 * Salgsmelding
 * Trigger the change of ownership
 */
export interface Salgsmelding extends BasicProduct {
  type: RequestType.salgsmelding
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
  type: RequestType.endringoverdragelse,
  salgsmeldingOrdreId: string
  datoOverdragelse: string
}

/**
 * EndringKjopere
 * Notify about change of buyers/owners
 */
export interface EndringKjopere extends BasicProduct {
  type: RequestType.endringkjopere,
  kjopere: Kontakt[],
}

/**
 * Restanse
 * Order and handle arrears - not yet designed
 */
export interface Restanse extends BasicProduct {
  type: RequestType.restanse
}
