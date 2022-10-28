export enum RequestType {
  boliginformasjon = 'boliginformasjon',
  forhandsutlysing = 'forhandsutlysing',
  salgsmelding = 'salgsmelding',
  restanse = 'restanse'
}

export interface Salg {
  kjopesum: number
  datoAkseptBud: string
  datoOverdragelse: string
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

export interface Lag {
  navn: string
  orgnr: string
}

export interface Bestiller {
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
  navn: string
  kontaktperson?: string
  adresse?: Adresse
  epost?: string
  telefon?: string
  eierbrok?: Eierbrok
}

// Common request type :
export interface USBLBasicProduct {
  ordreId: string
  lag: Lag
  registerenhet: Registerenhet
  bestiller: Bestiller
  meglerkontor: Meglerkontor
}

// Request types :
export interface Boliginfo extends USBLBasicProduct {
  type: RequestType.boliginformasjon
}

export interface Forhandsutlysing extends USBLBasicProduct {
  type: RequestType.forhandsutlysing
}

export interface Restanse extends USBLBasicProduct {
  type: RequestType.restanse
}

export interface Salgsmelding extends USBLBasicProduct {
  type: RequestType.salgsmelding
  kjopere: Kontakt[]
  selgere: Kontakt[]
  salg: Salg
  bolig: Bolig
}
