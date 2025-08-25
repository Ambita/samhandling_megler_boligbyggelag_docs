

# CallbackEvent

## anyOf schemas
* [BoliginformasjonResponse](BoliginformasjonResponse.md)
* [EndringKjopereFullfort](EndringKjopereFullfort.md)
* [EndringKjopereMottatt](EndringKjopereMottatt.md)
* [EndringOverdragelseBehandlet](EndringOverdragelseBehandlet.md)
* [Feil](Feil.md)
* [ForhandsutlysingSen](ForhandsutlysingSen.md)
* [ForhandsutlysingTidlig](ForhandsutlysingTidlig.md)
* [ForhandsutlysingUtlopt](ForhandsutlysingUtlopt.md)
* [ForhandsutlysingUtsatt](ForhandsutlysingUtsatt.md)
* [SalgsmeldingFullfort](SalgsmeldingFullfort.md)
* [SalgsmeldingMottatt](SalgsmeldingMottatt.md)
* [SalgsmeldingOppdatering](SalgsmeldingOppdatering.md)
* [SluttbrevAkseptert](SluttbrevAkseptert.md)
* [SumFelleskostnaderSvar](SumFelleskostnaderSvar.md)
* [SumGjeldSvar](SumGjeldSvar.md)

## Example
```java
// Import classes:
import org.openapitools.client.model.CallbackEvent;
import org.openapitools.client.model.BoliginformasjonResponse;
import org.openapitools.client.model.EndringKjopereFullfort;
import org.openapitools.client.model.EndringKjopereMottatt;
import org.openapitools.client.model.EndringOverdragelseBehandlet;
import org.openapitools.client.model.Feil;
import org.openapitools.client.model.ForhandsutlysingSen;
import org.openapitools.client.model.ForhandsutlysingTidlig;
import org.openapitools.client.model.ForhandsutlysingUtlopt;
import org.openapitools.client.model.ForhandsutlysingUtsatt;
import org.openapitools.client.model.SalgsmeldingFullfort;
import org.openapitools.client.model.SalgsmeldingMottatt;
import org.openapitools.client.model.SalgsmeldingOppdatering;
import org.openapitools.client.model.SluttbrevAkseptert;
import org.openapitools.client.model.SumFelleskostnaderSvar;
import org.openapitools.client.model.SumGjeldSvar;

public class Example {
    public static void main(String[] args) {
        CallbackEvent exampleCallbackEvent = new CallbackEvent();

        // create a new BoliginformasjonResponse
        BoliginformasjonResponse exampleBoliginformasjonResponse = new BoliginformasjonResponse();
        // set CallbackEvent to BoliginformasjonResponse
        exampleCallbackEvent.setActualInstance(exampleBoliginformasjonResponse);
        // to get back the BoliginformasjonResponse set earlier
        BoliginformasjonResponse testBoliginformasjonResponse = (BoliginformasjonResponse) exampleCallbackEvent.getActualInstance();

        // create a new EndringKjopereFullfort
        EndringKjopereFullfort exampleEndringKjopereFullfort = new EndringKjopereFullfort();
        // set CallbackEvent to EndringKjopereFullfort
        exampleCallbackEvent.setActualInstance(exampleEndringKjopereFullfort);
        // to get back the EndringKjopereFullfort set earlier
        EndringKjopereFullfort testEndringKjopereFullfort = (EndringKjopereFullfort) exampleCallbackEvent.getActualInstance();

        // create a new EndringKjopereMottatt
        EndringKjopereMottatt exampleEndringKjopereMottatt = new EndringKjopereMottatt();
        // set CallbackEvent to EndringKjopereMottatt
        exampleCallbackEvent.setActualInstance(exampleEndringKjopereMottatt);
        // to get back the EndringKjopereMottatt set earlier
        EndringKjopereMottatt testEndringKjopereMottatt = (EndringKjopereMottatt) exampleCallbackEvent.getActualInstance();

        // create a new EndringOverdragelseBehandlet
        EndringOverdragelseBehandlet exampleEndringOverdragelseBehandlet = new EndringOverdragelseBehandlet();
        // set CallbackEvent to EndringOverdragelseBehandlet
        exampleCallbackEvent.setActualInstance(exampleEndringOverdragelseBehandlet);
        // to get back the EndringOverdragelseBehandlet set earlier
        EndringOverdragelseBehandlet testEndringOverdragelseBehandlet = (EndringOverdragelseBehandlet) exampleCallbackEvent.getActualInstance();

        // create a new Feil
        Feil exampleFeil = new Feil();
        // set CallbackEvent to Feil
        exampleCallbackEvent.setActualInstance(exampleFeil);
        // to get back the Feil set earlier
        Feil testFeil = (Feil) exampleCallbackEvent.getActualInstance();

        // create a new ForhandsutlysingSen
        ForhandsutlysingSen exampleForhandsutlysingSen = new ForhandsutlysingSen();
        // set CallbackEvent to ForhandsutlysingSen
        exampleCallbackEvent.setActualInstance(exampleForhandsutlysingSen);
        // to get back the ForhandsutlysingSen set earlier
        ForhandsutlysingSen testForhandsutlysingSen = (ForhandsutlysingSen) exampleCallbackEvent.getActualInstance();

        // create a new ForhandsutlysingTidlig
        ForhandsutlysingTidlig exampleForhandsutlysingTidlig = new ForhandsutlysingTidlig();
        // set CallbackEvent to ForhandsutlysingTidlig
        exampleCallbackEvent.setActualInstance(exampleForhandsutlysingTidlig);
        // to get back the ForhandsutlysingTidlig set earlier
        ForhandsutlysingTidlig testForhandsutlysingTidlig = (ForhandsutlysingTidlig) exampleCallbackEvent.getActualInstance();

        // create a new ForhandsutlysingUtlopt
        ForhandsutlysingUtlopt exampleForhandsutlysingUtlopt = new ForhandsutlysingUtlopt();
        // set CallbackEvent to ForhandsutlysingUtlopt
        exampleCallbackEvent.setActualInstance(exampleForhandsutlysingUtlopt);
        // to get back the ForhandsutlysingUtlopt set earlier
        ForhandsutlysingUtlopt testForhandsutlysingUtlopt = (ForhandsutlysingUtlopt) exampleCallbackEvent.getActualInstance();

        // create a new ForhandsutlysingUtsatt
        ForhandsutlysingUtsatt exampleForhandsutlysingUtsatt = new ForhandsutlysingUtsatt();
        // set CallbackEvent to ForhandsutlysingUtsatt
        exampleCallbackEvent.setActualInstance(exampleForhandsutlysingUtsatt);
        // to get back the ForhandsutlysingUtsatt set earlier
        ForhandsutlysingUtsatt testForhandsutlysingUtsatt = (ForhandsutlysingUtsatt) exampleCallbackEvent.getActualInstance();

        // create a new SalgsmeldingFullfort
        SalgsmeldingFullfort exampleSalgsmeldingFullfort = new SalgsmeldingFullfort();
        // set CallbackEvent to SalgsmeldingFullfort
        exampleCallbackEvent.setActualInstance(exampleSalgsmeldingFullfort);
        // to get back the SalgsmeldingFullfort set earlier
        SalgsmeldingFullfort testSalgsmeldingFullfort = (SalgsmeldingFullfort) exampleCallbackEvent.getActualInstance();

        // create a new SalgsmeldingMottatt
        SalgsmeldingMottatt exampleSalgsmeldingMottatt = new SalgsmeldingMottatt();
        // set CallbackEvent to SalgsmeldingMottatt
        exampleCallbackEvent.setActualInstance(exampleSalgsmeldingMottatt);
        // to get back the SalgsmeldingMottatt set earlier
        SalgsmeldingMottatt testSalgsmeldingMottatt = (SalgsmeldingMottatt) exampleCallbackEvent.getActualInstance();

        // create a new SalgsmeldingOppdatering
        SalgsmeldingOppdatering exampleSalgsmeldingOppdatering = new SalgsmeldingOppdatering();
        // set CallbackEvent to SalgsmeldingOppdatering
        exampleCallbackEvent.setActualInstance(exampleSalgsmeldingOppdatering);
        // to get back the SalgsmeldingOppdatering set earlier
        SalgsmeldingOppdatering testSalgsmeldingOppdatering = (SalgsmeldingOppdatering) exampleCallbackEvent.getActualInstance();

        // create a new SluttbrevAkseptert
        SluttbrevAkseptert exampleSluttbrevAkseptert = new SluttbrevAkseptert();
        // set CallbackEvent to SluttbrevAkseptert
        exampleCallbackEvent.setActualInstance(exampleSluttbrevAkseptert);
        // to get back the SluttbrevAkseptert set earlier
        SluttbrevAkseptert testSluttbrevAkseptert = (SluttbrevAkseptert) exampleCallbackEvent.getActualInstance();

        // create a new SumFelleskostnaderSvar
        SumFelleskostnaderSvar exampleSumFelleskostnaderSvar = new SumFelleskostnaderSvar();
        // set CallbackEvent to SumFelleskostnaderSvar
        exampleCallbackEvent.setActualInstance(exampleSumFelleskostnaderSvar);
        // to get back the SumFelleskostnaderSvar set earlier
        SumFelleskostnaderSvar testSumFelleskostnaderSvar = (SumFelleskostnaderSvar) exampleCallbackEvent.getActualInstance();

        // create a new SumGjeldSvar
        SumGjeldSvar exampleSumGjeldSvar = new SumGjeldSvar();
        // set CallbackEvent to SumGjeldSvar
        exampleCallbackEvent.setActualInstance(exampleSumGjeldSvar);
        // to get back the SumGjeldSvar set earlier
        SumGjeldSvar testSumGjeldSvar = (SumGjeldSvar) exampleCallbackEvent.getActualInstance();
    }
}
```


